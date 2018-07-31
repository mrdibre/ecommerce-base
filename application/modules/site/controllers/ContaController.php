<?php

namespace Icontrole\Site\Controllers;

use Icontrole\Models\Clientes;
use Icontrole\Models\Pedidos;

class ContaController extends BaseController {

    public function initialize(){
        parent::initialize();

        if($this->session->has("usuario")){
            $this->view->usuario = Clientes::find([["email" => $this->session->get("usuario")]])[0];
            $this->assets->addJs("js/custom/conta_detalhes.js");
        }
        else
            $this->response->redirect("autenticacao");

    }

    public function indexAction(){}

    public function pedidosAction(){

        $this->assets->addJs("js/custom/pedidos.js");

        $email = explode("@",$this->session->get("usuario"))[0]."@sandbox.pagseguro.com.br";

        $pedidos = Pedidos::find(
            [
                [
                    "cliente.email" =>  $email
                ]
            ]
        );

        if($pedidos){
            $this->view->pedidos = $pedidos;
            $this->view->sempedidos = false;
        }
        else{
            $this->view->sempedidos = true;
        }

    }

    public function detalhesAction(){}

    public function pedidoAction($id){

        $this->assets->addJs("js/custom/pedido.js");

        $this->view->pedido = Pedidos::findById($id);
    }

    public function logoutAction(){
        $this->session->remove("usuario");
        $this->response->redirect("/");
    }

    public function updatemaininfoAction(){

        $data = $this->request->getJsonRawBody();

        $documento = new \stdClass();
        $documento->tipo = "CPF";
        $documento->valor = $data->document;

        $contato = new \stdClass();
        $contato->ddd = $data->ddd;
        $contato->telefone = $data->telefone;

        /**
         * @var Clientes $cliente
         */
        $cliente = Clientes::find([["email" => $this->session->get("usuario")]])[0];

        $cliente->setNome( $data->firstname );
        $cliente->setSobrenome( $data->lastname );
        $cliente->setNascimento( $data->birthday );
        $cliente->setDocumento($documento);
        $cliente->setContato($contato);

        if($cliente->save()){
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
                        "reason" => $cliente->getMessages()
                    ]
                )
            );
        }

    }

    public function updateaddressAction(){

        $data = $this->request->getJsonRawBody();

        $endereco = new \stdClass();
        $endereco->bairro = $data->bairro;
        $endereco->cep = $data->cep;
        $endereco->complemento = $data->complemento;
        $endereco->cidade = $data->localidade;
        $endereco->numero = $data->numero;
        $endereco->rua = $data->rua;
        $endereco->estado = $data->uf;
        $endereco->pais = "BRA";

        /**
         * @var Clientes $cliente
         */
        $cliente = Clientes::find([["email" => $this->session->get("usuario")]])[0];

        $cliente->setEndereco( $endereco );

        if($cliente->save()){
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
                    "reason" => $cliente->getMessages()
                ]
            )
            );
        }

    }

    public function updatepasswordAction(){
        $data = $this->request->getJsonRawBody();

        /**
         * @var Clientes $cliente
         */
        $cliente = Clientes::find([["email" => $this->session->get("usuario")]])[0];

        $hash = $cliente->senha;

        if($this->security->checkHash($data->current,$hash)){
            $cliente->setSenha( $this->security->hash($data->newp) );

            if($cliente->save()){
                $this->session->destroy("usuario");
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
                        "reason" => $cliente->getMessages()
                    ]
                )
                );
            }

        }
        else{
            die(
                json_encode(
                    [
                        "status" => "error",
                        "reason" => "Senha atual inválida"
                    ]
                )
            );
        }

    }

}