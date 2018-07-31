<?php

namespace Icontrole\Site\Controllers;

use FlyingLuscas\Correios\Client;
use FlyingLuscas\Correios\Service;
use Icontrole\Models\Produtos;

class CarrinhoController extends BaseController {

    /**
     * @var Client $frete
     */
    private $frete;

    public function initialize(){
        parent::initialize();

        parent::checkIfUserIsComplete();

        $this->assets->addJs("js/custom/carrinho.js");
        $this->frete = new Client();

    }

    public function indexAction(){

        /**
         * Verifica se o usuário não está logado
         */
        if(!$this->session->has("usuario")){

            /**
             * Redireciona para a página de autenticação
             */
            $this->response->redirect("autenticacao");
        }

        /**
         * Caso o usuário esteja logado calcula o frete
         */
        if( $this->cliente && ( count( $this->cliente->getCarrinho() ) > 0 ) )
            $this->view->frete = $frete = $this->calcFrete("38414-490", $this->cliente->endereco["cep"], $this->cliente->getCarrinho());
        else
            $this->response->redirect("/");

    }

    public function paymentAction(){}

    /**
     * @param string $origin
     * @param string $destination
     * @param array $items
     * @return array
     */
    public function calcFrete(string $origin, string $destination, array $items){

        $this->frete->freight()->origin($origin)->destination($destination)->services(Service::SEDEX, Service::PAC);

        foreach ($items as $item){

            /**
             * @var Produtos $product
             */
            $product = Produtos::findById($item["_id"]);

            $this->frete->freight()->item(16,16,16,.3,$item["quantity"]);

        }

        return $this->frete->freight()->calculate();

    }

}