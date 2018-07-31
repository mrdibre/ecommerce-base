<?php

namespace Icontrole\Site\Controllers;

use Icontrole\Models\Clientes;
use Icontrole\Models\Departamentos;
use Icontrole\Models\Produtos;
use Icontrole\Models\Seo;
use Phalcon\Mvc\Controller;

class BaseController extends Controller {

    /**
     * @var Clientes $cliente
     */
    public $cliente;

    public function initialize(){

        $this->view->seo = Seo::findFirst();

        if($this->session->has("usuario")){
            $this->cliente = Clientes::find([["email" => $this->session->get("usuario")]])[0];
            $this->view->username = $this->cliente->getNome();
            $this->view->carrinho = $this->getProductsFromCart( $this->cliente->getCarrinho() );
            $this->view->totalcarrinho = $this->getTotalCarrinho( $this->cliente->getCarrinho() );
        }

        $this->view->departamentos = Departamentos::find();
        $this->assets->addJs("js/custom/main.js");

    }

    /**
     * Função responsável por retornar o valor atual do carrinho
     * @param $carrinho
     * @return \stdClass
     */
    function getTotalCarrinho($carrinho){

        $total = 0;
        $itens = 0;

        foreach ($carrinho as $item){
            $total += ($item["preco"] * $item["quantity"]);
            $itens +=  $item["quantity"];
        }

        $ret = new \stdClass();
        $ret->total = $total;
        $ret->itens = $itens;

        return $ret;

    }

    /**
     * Função responsável por verificar se o usuário que está logado
     * preencheu todos os campos requeridos para fazer uma compra
     */
    protected function checkIfUserIsComplete(){

        if(!$this->session->has("usuario")){
            $this->response->redirect("autenticacao");
        }
        else{

            $email = $this->session->get("usuario");

            /**
             * @var Clientes $cliente
             */
            $cliente = Clientes::find(
                [
                    [
                        "email" => $email
                    ]
                ]
            )[0];

            if($cliente){

                if( empty($cliente->getNome()) || empty($cliente->getSobrenome()) || empty($cliente->getNascimento()) || empty($cliente->getContato()) || empty($cliente->getEndereco()) || empty($cliente->getDocumento()) ){
                    $this->flashSession->message("info","Por favor preencha os dados adicionais para continuar comprando.");
                    $this->response->redirect("conta/detalhes");
                }
            }
            else{
                $this->response->redirect("autenticacao");
            }

        }

    }

    protected function getProductsFromCart(array $cart){

        $products = [];

        foreach ($cart as $item){

            $item = (object) $item;

            /**
             * @var Produtos $product
             */
            $product = Produtos::findById($item->_id);

            $products[] = [
                "nome" => $item->nome,
                "preco" => $item->preco,
                "imagem" => isset($product->getImagens()[0]) ? $product->getImagens()[0] : 'sem-foto.gif',
                "quantity" => $item->quantity,
                "_id" => $item->_id
            ];

        }

        return $products;

    }

}