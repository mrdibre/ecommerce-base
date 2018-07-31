<?php

namespace Icontrole\Site\Controllers;

use FlyingLuscas\Correios\Client;
use FlyingLuscas\Correios\Service;
use MongoDB\BSON\Regex;
use Icontrole\Models\Produtos;

class FnController extends BaseController {

    /**
     * Função responsável por retornar alguns produtos com base
     * no que o usuário digitar no campo "Procurar produtos..."
     */
    public function autocompleteAction(){

        /**
         * Pega o que foi digitado pelo usuário
         */
        $search = ($this->request->getJsonRawBody())->search;

        /**
         * Converte para um regex
         */
        $search = new Regex($search,"i");

        /**
         * Busca pelos produtos
         * @var \MongoDB\Driver\Cursor @produtos
         */
        $produtos = Produtos::aggregate(
            [
                [
                    '$match' => [
                        '$or' => [
                            [
                                "nome" => $search
                            ],
                            [
                                "descricao" => $search
                            ],
                            [
                                "departamento.nome" => $search
                            ],
                            [
                                "departamento.categoria.nome" => $search
                            ],
                            [
                                "departamento.categoria.subcategoria" => $search
                            ],
                        ]
                    ]
                ],
                [
                    '$limit' => 10
                ]
            ]
        );

        /**
         * Transforma de Mongo\Cursor para Array
         */
        $produtos = $produtos->toArray();

        /**
         * Retorna um array de produtos caso ache algum
         * Ou então retorna vazio
         */
        $produtos ? die( json_encode( $produtos ) ) : die("vazio");

    }

    /**
     * Seta o total da compra
     */
    public function settotalAction(){

        /**
         * Pega o total que foi passado pelo front-end
         */
        $total = ($this->request->getJsonRawBody())->total;

        /**
         * Salva em uma sessão
         */
        $this->session->set("totalpurcharse",$total);

        /**
         * Retorna um objeto para o front-end
         */
        die(
        json_encode(
            [
                "status" => "success"
            ]
        )
        );

    }

    /**
     * Função responsável por adicionar items ao carrinho
     * @throws \Phalcon\Mvc\Collection\Exception
     */
    public function addtocartAction(){

        /**
         * Pega os parâmetros que foi passado pelo XHR
         * @var \stdClass $data
         */
        $data = $this->request->getJsonRawBody();

        /**
         * Verifica se existe a quantidade de produtos é maior que zero
         * E se o id não está vazio
         */
        if( ($data->quantity > 0) && !empty($data->id) ){

            /**
             * Verifica se a sessão do usuário não expirou
             */
            if($this->session->has("usuario")){

                /**
                 * Responsável por verificar se é um novo produto a ser
                 * adicionado no carrinho ou se é apenas para incrementar
                 * a quantidade
                 * @var bool $newitem
                 */
                $newitem = true;

                /**
                 * Pega o carrinho atual do usuário
                 * @var array $currentcart
                 */
                $currentcart = $this->cliente->getCarrinho();

                /**
                 *  TODO: Lembrar oq isso faz
                 */
                $index = 0;

                /**
                 * Percorre todos os elementos do carrinho
                 */
                foreach ($currentcart as $key => $item) {

                    /**
                     * Verifica se o id do produto atual é igual
                     * o que foi passado como parâmetro
                     */
                    if ($item["_id"] === $data->id) {

                        /**
                         * Incrementa a quantidade do produto atual
                         */
                        $currentcart[$index]["quantity"] += $data->quantity;

                        /**
                         * Define que não é um novo produto a ser adicionado ao carrinho
                         */
                        $newitem = false;

                        /**
                         * Para o loop
                         */
                        break;
                    }

                    $index++;
                }

                /**
                 * Caso seja um novo produto adiciona
                 */
                if($newitem){

                    /**
                     * Procura pelo produto a ser adicionado
                     * @var Produtos $product
                     */
                    $product = Produtos::findById($data->id);

                    /**
                     * Cria um novo object
                     */
                    $newincart = new \stdClass();

                    /**
                     * Define o nome
                     */
                    $newincart->nome = $product->getNome();

                    /**
                     * Define o preço
                     */
                    $newincart->preco = $product->getPreco();

                    /**
                     * Define a quantidade
                     */
                    $newincart->quantity = $data->quantity;

                    /**
                     * Define a imagem
                     */
                    $newincart->imagem = isset($data->imagens[0]) ? $data->imagens[0] : 'http://www.portoalegrow.com.br/Content/Images/sem-foto.gif';

                    /**
                     * Define o id
                     */
                    $newincart->_id = $data->id;

                    /**
                     * Adiciona no array do carrinho o novo objeto
                     */
                    $currentcart[] = $newincart;
                }

                /**
                 * Seta o novo carrinho na conta do usuário
                 */
                $this->cliente->setCarrinho($currentcart);

                /**
                 * Tenta salvar as informações
                 */
                if($this->cliente->save()){

                    /**
                     * Retorna um objeto para o front-end
                     */
                    die(
                    json_encode(
                        [
                            "status" => "success"
                        ]
                    )
                    );
                }
                /**
                 * Caso não tenha conseguido salvar
                 */
                else{

                    /**
                     * Retorna um object para o front-end
                     */
                    die(
                    json_encode(
                        [
                            "status" => "error",
                            "reason" => $this->cliente->getMessages()
                        ]
                    )
                    );
                }

            }

            /**
             * Retorna um erro caso a sessão tenha expirado
             */
            die("Usuário não logado");

        }

        /**
         * Retorna um erro caso os parâmetros estejam inválidos
         */
        die("Params inválido");

    }

    /**
     * Função responsável por remover items do carrinho
     * @throws \Phalcon\Mvc\Collection\Exception
     */
    public function removefromcartAction(){

        /**
         * Pega os parâmetros passados pelo front-end
         */
        $data = $this->request->getJsonRawBody();

        /**
         * Checa se o id não está vazio
         */
        if( !empty($data->id) ){

            /**
             * Checa se a sessão não expirou
             */
            if($this->session->has("usuario")){

                /**
                 * Pega o carrinho atual do usuário
                 */
                $currentcart = $this->cliente->getCarrinho();

                /**
                 * Percorre todos os produtos
                 */
                foreach ($currentcart as $index => $cart){

                    /**
                     * Checa se o id do produto atual é igual o que
                     * foi passado pelo front-end
                     */
                    if($cart["_id"] === $data->id){

                        if( (isset($data->quantity) && ($data->quantity > 0)) && $currentcart[$index]["quantity"] > 1 ){

                            /**
                             * Incrementa a quantidade do produto atual
                             */
                            $currentcart[$index]["quantity"] -= $data->quantity;

                        }
                        else{

                            /**
                             * Remove esse item do carrinho
                             */
                            unset($currentcart[$index]);

                            /**
                             * Redefine todas as chaves do array
                             */
                            $currentcart = $this->redefineKeys($currentcart,$index);

                        }

                    }
                }

                /**
                 * Percorre todos os produtos do carrinho
                 * e transforma cada um em um objeto
                 */
                foreach($currentcart as $index => $item){
                    $currentcart[$index] = (object) $item;
                }

                /**
                 * Seta o novo carrinho na conta do usuário
                 */
                $this->cliente->setCarrinho( $currentcart );

                /**
                 * Tenta salvar as informações
                 */
                if($this->cliente->save()){

                    /**
                     * Retorna um objeto para o front-end
                     */
                    die(
                    json_encode(
                        [
                            "status" => "success"
                        ]
                    )
                    );
                }
                else{

                    /**
                     * Retorna um objeto para o front-end
                     */
                    die(
                    json_encode(
                        [
                            "status" => "error",
                            "reason" => $this->cliente->getMessages()
                        ]
                    )
                    );
                }

            }

            /**
             * Retorna um erro caso o usuário não esteja logado
             */
            die("Usuário não logado");

        }

        /**
         * Retorna um erro caso os parâmetros sejam inválidos
         */
        die("Params inválido");

    }

    public function calcularfreteAction(){
        $params = $this->request->getJsonRawBody();

        /**
         * @var Produtos $product
         */
        $product = Produtos::findById($params->id);
        $dimensoes = $product->getDimensoes();
        $peso = $product->getPeso() || 1;

        $calc = $this->calcFrete("38414564",$params->cep,$dimensoes,$peso,$params->quantity);

        $frete = [];

        foreach ($calc as $item){
            if( count($item["error"]) == 0 ){
                $frete[] = $item;
            }
        }

        die(
            json_encode(
                [
                    "fretes" => $frete
                ]
            )
        );

    }

    /**
     * Função responsável por redefinir todas os indexes do array
     * @param array $array
     * @param int $start
     * @return mixed
     * Ex.
     * [
     *      0: stdClass,
     *      1: stdClass,
     *      2: stdClass - Foi removido,
     *      3: stdClass
     * ]
     *
     * Esse array ficará assim
     * [
     *      0: stdClass,
     *      1: stdClass,
     *      3: stdClass
     * ]
     * A função redefine para
     * [
     *      0: stdClass,
     *      1: stdClass,
     *      2: stdClass,
     * ]
     */
    private function redefineKeys($array, $start){

        /**
         *  Percorre todos os items do array
         */
        foreach($array as $index => $item){

            /**
             * Caso a posição atual do array seja maior que o $start(posição que foi removida)
             */
            if($index > $start){

                /**
                 * Pega o item atual
                 */
                $pos = $item;

                /**
                 * Apaga o item da posição atual
                 */
                unset($array[$index]);

                /**
                 * Adiciona o item na posição anterior
                 */
                $array[$index-1] = $pos;
            }
        }

        /**
         * Retorna o array com todas as chaves redefinidas
         */
        return $array;

    }

    /**
     * @param string $origin
     * @param string $destination
     * @param \stdClass $dimensions
     * @param float $peso
     * @param int $quantity
     * @return mixed
     */
    public function calcFrete(string $origin, string $destination, array $dimensions, float $peso, int $quantity){

        $frete = new Client();

        $frete
            ->freight()
            ->origin($origin)
            ->destination($destination)
            ->services(Service::SEDEX_CONTRATO, Service::PAC_CONTRATO)
            ->package(1)
            ->credentials("18188613","f4V07");

        $frete->freight()->item(
            $dimensions["largura"],
            $dimensions["altura"],
            $dimensions["comprimento"],
            $peso,
            $quantity
        );

        return $frete->freight()->calculate();

    }

}