<?php

namespace Icontrole\Icontrole\Controllers;
use Icontrole\Models\Departamentos;
use Icontrole\Models\Produtos;
use Icontrole\Models\Tags;
use Icontrole\Models\Variacao;

class ProdutosController extends BaseController{

    public function initialize(){
        parent::initialize();
        $this->tag->setTitle("Produtos");
    }

    public function indexAction(){

        if($this->request->isGet()){
            $this->assets->addJs("icontrole/produtos.bundle.js");
        }
        else if($this->request->isPost()){

            die(
                json_encode(
                    [
                        "produtos"      => Produtos::aggregate([['$sort' => ["ativo" => -1]]])->toArray(),
                        "tags"          => Tags::find(),
                        "departamentos" => Departamentos::find(),
                        "variacoes"     => Variacao::find()
                    ]
                )
            );
        }
    }

    public function deleteAction($id){
        $product = Produtos::findById($id);
        if($product->delete()){
            die(json_encode(["status"=>"success"]));
        }
        else{
            die(
                json_encode(
                    [
                        "status"=>"error",
                        "messages"=>$product->getMessages()
                    ]
                )
            );
        }
    }

    public function editAction(){

        $produto = $this->request->getPost()["product"];
        $produto = json_decode($produto);

        $images = [];

        foreach ($this->request->getUploadedFiles() as $file){

            $name = uniqid(md5(rand(0,1000000)),true)."_".$file->getName();

            if( $file->moveTo( ROOT_PATH."/public/assets/uploads/produtos/".$name ) ){
                $images[] = $name;
            }

        }

        /**
         * @var Produtos $model;
         */
        $model = Produtos::findById($produto->_id->{'$oid'});

        $imgs = $model->getImagens();

        $oldimgs = [];

        foreach ($produto->imagens as $imagem){
            if( gettype($imagem) === "string" ){
                $oldimgs[] = $imagem;
            }
        }

        $diff = array_diff($imgs,$oldimgs);

        if( count($diff) > 0 ){
            foreach ($diff as $key => $item){
                unset($imgs[$key]);
            }
        }

        $model->setNome($produto->nome);
        $model->setAtivo( $produto->ativo);
        $model->setPreco( (float) number_format($produto->preco,2,'.','') );
        $model->setDescricao($produto->descricao);
        $model->setEstoque($produto->estoque);
        $model->setAvaliacao($produto->avaliacao);
        $model->setDimensoes([
            "largura"        => $produto->dimensoes->largura,
            "altura"         => $produto->dimensoes->altura,
            "comprimento"    => $produto->dimensoes->comprimento
        ]);
        $model->setPeso($produto->peso);
        $model->setMarca($produto->marca);
        $model->setImagens($produto->imagens);
        $model->setDepartamento($produto->departamento);
        $model->setTags($produto->tags);
        $model->setVariacoes( (array) $produto->variacoes);
        $model->setVinculados($produto->vinculados);
        $model->setFichatecnica( (array) $produto->fichatecnica);
        $model->setImagens( array_merge($imgs,$images) );

        if($model->save()) {
            die(
            json_encode(
                [
                    "status" => "success"
                ]
            )
            );
        }
        else{
            die(
            json_encode(
                [
                    "status" => "error",
                    "message" => $model->getMessages()
                ]
            )
            );
        }

    }

    public function importAction(){

        $count = 1;
        $this->view->disable();

        $continue = true;

        echo "<pre>";

        while($continue) {

            try {
                $produtos = (json_decode($this->bling->getProdutos($count)))->retorno->produtos;

                if( (gettype($produtos) === "array") && ( count($produtos) > 0 ) ){
                    foreach ($produtos as $produto) {
                        $produto = $produto->produto;


                        $productInDb = Produtos::find(
                            [
                                [
                                    "nome" => $produto->descricao
                                ]
                            ]
                        );

                        if (isset($productInDb[0]) && ($productInDb[0]->nome === $produto->descricao)) {

                            /**
                             * @var Produtos $model
                             */
                            $model = $productInDb[0];
                            $model->setPreco((float)number_format($produto->preco, 2, '.', ''));
                            $model->setDescricao($produto->descricaoCurta);
                            $model->setEstoque($produto->estoqueAtual);
                            $model->setDimensoes([
                                "largura" => $produto->larguraProduto,
                                "altura" => $produto->alturaProduto,
                                "comprimento" => $produto->profundidadeProduto
                            ]);
                            $model->setPeso($produto->pesoBruto);
                            $model->setMarca($produto->marca);

                            if($model->save()){
                                echo "imported<br>";
                            }
                            else{
                                $continue = false;
                            }

                            unset($model);

                        } else {

                            //Produto não existe

                            $model = new Produtos();
                            $model->setNome($produto->descricao);
                            $model->setAtivo(false);
                            $model->setPreco((float)number_format($produto->preco, 2, '.', ''));
                            $model->setDescricao($produto->descricaoCurta);
                            $model->setEstoque($produto->estoqueAtual);
                            $model->setAvaliacao(0);
                            $model->setDimensoes([
                                "largura" => $produto->larguraProduto,
                                "altura" => $produto->alturaProduto,
                                "comprimento" => $produto->profundidadeProduto
                            ]);
                            $model->setPeso($produto->pesoBruto);
                            $model->setMarca($produto->marca);
                            $model->setImagens($produto->imagem);
                            $model->setDepartamento(new \stdClass());
                            $model->setTags([]);
                            $model->setVariacoes([]);
                            $model->setVinculados(new \stdClass());
                            $model->setFichatecnica([]);

                            if($model->create()){
                                echo "created<br>";
                            }
                            else{
                                $continue = false;
                            }

                            unset($model);

                        }

                    }
                }
                else{
                    $continue = false;
                }

            } catch (\Exception $e) {
                $continue = false;
            }

            $count++;

        }

        echo "Finalizado";
        die();

    }

    public function variacaoAction(){
        if($this->request->isGet()){
            $this->assets->addJs("icontrole/variacao.bundle.js");
            $this->tag->setTitle("Variação");
        }
        else if($this->request->isPost()) {

            $handler = $this->dispatcher->getParams();

            if(count($handler) === 0){
                die(
                json_encode(
                    [
                        "variacoes" => Variacao::find()
                    ]
                )
                );
            }

            $data = $this->request->getJsonRawBody();

            if( in_array("savevariation",$handler) ){
                $this->saveVariation($data->item);
            }
            else if( in_array("deletevariation",$handler) ){
                $this->deleteVariation($data->id);
            }
            else if( in_array("editvariation",$handler) ){
                $this->editVariation($data->item);
            }
        }
    }

    public function saveVariation( \stdClass $payload){

        $variation = new Variacao();
        $variation->setNome($payload->nome);
        $variation->setVariacoes($payload->variacoes);

        if($variation->create()){
            die(
            json_encode(
                [
                    "status"  => "success",
                    "id" => $variation->getId()
                ]
            )
            );
        }
        else{
            die(
            json_encode(
                [
                    "status"  => "error",
                    "message" => $variation->getMessages()
                ]
            )
            );
        }
    }

    public function editVariation( \stdClass $payload){

        /**
         * @var Variacao $variation
         */
        $variation = Variacao::findById($payload->_id->{'$oid'});
        $variation->setNome($payload->nome);
        $variation->setVariacoes($payload->variacoes);

        if($variation->save()){
            die(
            json_encode(
                [
                    "status"  => "success"
                ]
            )
            );
        }
        else{
            die(
            json_encode(
                [
                    "status"  => "error",
                    "message" => $variation->getMessages()
                ]
            )
            );
        }
    }

    public function deleteVariation(string $id){

        /**
         * @var Variacao $variation
         */
        $variation = Variacao::findById($id);

        if($variation->delete()){
            die(
            json_encode(
                [
                    "status" => "success"
                ]
            )
            );
        }
        else{
            die(
            json_encode(
                [
                    "status" => "error",
                    "reason" => $variation->getMessages()
                ]
            )
            );
        }

    }

}