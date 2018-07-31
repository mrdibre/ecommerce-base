<?php

namespace Icontrole\Icontrole\Controllers;

use Icontrole\Library\Payment\PagSeguro\Payment\CreatePayment;
use Icontrole\Models\Configpagamento;
use Icontrole\Models\Produtos;

class PagamentoController extends BaseController
{

    public function indexAction()
    {
        $this->tag->setTitle("Pagamentos");
        $this->assets->addJs("icontrole/pagamento.bundle.js");


    }

    public function getconfigAction(){
        die(
            json_encode(
                Configpagamento::find()
            )
        );
    }

    public function setapiAction(string $api)
    {

        if( Configpagamento::find(["api"=>$api]) ){
            $pagamento = Configpagamento::findFirst(["api"=>$api]);
            $pagamento->api = $api;

            if($pagamento->save()){
                die(
                json_encode([
                    "error" => false
                ])
                );
            }
            else{
                die(
                json_encode([
                    "error" => true,
                    "messages" => $pagamento->getMessages()
                ])
                );
            }

        }
        else{
            $pagamento = new Configpagamento();
            $pagamento->setApi($api);

            if($pagamento->create()){
                die(
                    json_encode([
                        "error" => false
                    ])
                );
            }
            else{
                die(
                    json_encode([
                        "error" => true,
                        "messages" => $pagamento->getMessages()
                    ])
                );
            }

        }

    }

    public function setconfigAction(){

        $config = $this->request->getJsonRawBody();

        if( Configpagamento::findFirst(["api" => $config->api]) ){

            $conf = Configpagamento::findFirst(["api" => $config->api]);
            $conf->parametros = [
              "email" => $config->email,
              "token" => $config->token
            ];

            if($conf->save()){
                die(
                json_encode([
                    "error" => false
                ])
                );
            }
            else{
                die(
                json_encode([
                    "error" => true,
                    "messages" => $conf->getMessages()
                ])
                );
            }

        }
        else{
            $conf = new Configpagamento();
            $conf->setApi($config->api);
            $conf->setParametros([
                "email" => $config->email,
                "token" => $config->token
            ]);

            if($conf->create()){
                die(
                json_encode([
                    "error" => false
                ])
                );
            }
            else{
                die(
                json_encode([
                    "error" => true,
                    "messages" => $conf->getMessages()
                ])
                );
            }
        }

    }

    public function setmethodsAction(){
        $config = $this->request->getJsonRawBody();

        if( Configpagamento::findFirst(["api" => $config->api]) ){

            $conf = Configpagamento::findFirst(["api" => $config->api]);
            $conf->metodos = $config->methods;

            if($conf->save()){
                die(
                json_encode([
                    "error" => false
                ])
                );
            }
            else{
                die(
                json_encode([
                    "error" => true,
                    "messages" => $conf->getMessages()
                ])
                );
            }

        }
        else{
            $conf = new Configpagamento();
            $conf->setApi($config->api);
            $conf->setMetodos($config->methods);

            if($conf->create()){
                die(
                json_encode([
                    "error" => false
                ])
                );
            }
            else{
                die(
                json_encode([
                    "error" => true,
                    "messages" => $conf->getMessages()
                ])
                );
            }
        }
    }

    public function setoptionsAction(){
        $config = $this->request->getJsonRawBody();

        if( Configpagamento::findFirst(["api" => $config->api]) ){

            $conf = Configpagamento::findFirst(["api" => $config->api]);
            $conf->opcoes = $config->options;

            if($conf->save()){
                die(
                json_encode([
                    "error" => false
                ])
                );
            }
            else{
                die(
                json_encode([
                    "error" => true,
                    "messages" => $conf->getMessages()
                ])
                );
            }

        }
        else{
            $conf = new Configpagamento();
            $conf->setApi($config->api);
            $conf->setOpcoes($config->options);

            if($conf->create()){
                die(
                json_encode([
                    "error" => false
                ])
                );
            }
            else{
                die(
                json_encode([
                    "error" => true,
                    "messages" => $conf->getMessages()
                ])
                );
            }
        }
    }

}