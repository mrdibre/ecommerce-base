<?php

namespace Icontrole\Site\Controllers;

use Icontrole\Models\Produtos;

class ProdutoController extends BaseController {

    public function indexAction(){}

    public function visualizacaoAction($id){

        $this->assets->addJs("js/custom/visualizacao.js");

        $this->view->produto = $produto = Produtos::findById($id);

        if(!$produto->ativo){
            $this->response->redirect("/");
        }

        $vinculados = [];

        foreach ($produto->vinculados["produtos"] as $id){

            /**
             * @var Produtos $p;
             */
            $p = Produtos::findById($id);

            $vinculado = new \stdClass();
            $vinculado->id = $p->getId();
            $vinculado->nome = $p->nome;
            $vinculado->preco = "R$".number_format($p->preco,2,'.','');
            $vinculado->imagem = isset($p->imagens[0]) ? $p->imagens[0] : 'http://www.portoalegrow.com.br/Content/Images/sem-foto.gif';

            $vinculados[] = $vinculado;

        }

        $this->view->vinculados = [
            "produtos" => $vinculados,
            "preco"   => number_format($produto->vinculados["preco"],2,'.','')
        ];

    }

}