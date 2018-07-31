<?php

namespace Icontrole\Site\Controllers;

use Icontrole\Library\Email\Sender\Sender;
use Icontrole\Models\Clientes;

class AutenticacaoController extends BaseController {

    /**
     * Função Responsável por definir o js da página e verificar
     * se o usuário já está logado
     */
    public function indexAction(){

        $this->assets->addJs("js/custom/autenticacao.js");

        if($this->session->has("usuario")){

            $this->response->redirect("conta");

        }

    }

    /**
     * Função responsável por tentar fazer o login
     */
    public function loginAction(){

        /**
         * Pega os dados que foram passados pelo front-end
         * {email: "email", password: "senha"}
         */
        $user = ($this->request->getJsonRawBody());

        /**
         * Procura um usuário com o mesmo email que foi informado
         */
        if( Clientes::find([["email" => $user->email]]) ){

            /**
             * Pega o usuário com o email informado
             * @var Clientes $client
             */
            $client = Clientes::find([["email"=>$user->email]])[0];

            /**
             * Checa se a senha informada é igual a senha que está
             * no banco de dados
             */
            if($this->security->checkHash($user->password, $client->senha)){

                /**
                 * Cria a sessão do usuário
                 */
                $this->session->set("usuario",$user->email);

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
             * Caso a senha informada não seja
             * igual a que está salva no banco
             */
            else{

                /**
                 * Retorna uma mensagem para o front-end
                 */
                die(
                    json_encode(
                        [
                            "status" => "error",
                            "reason" => "Senha incorreta"
                        ]
                    )
                );
            }
        }

        /**
         * Caso não tenha encontrado o email retorna
         * um erro para o front-end
         */
        else{
            die(
                json_encode(
                    [
                        "status" => "error",
                        "reason" => "Email não encontrado"
                    ]
                )
            );

        }
    }

    /**
     * Função responsável por registrar o usuário
     */
    public function registerAction(){

        /**
         * Pega os dados que foram passados como parâmetro
         */
        $user = ($this->request->getJsonRawBody());

        /**
         * Checa se o email informado já não
         * está sendo utilizado
         */
        if( Clientes::find([["email" => $user->email]]) ){

            /**
             * Retorna um objeto para o front-end
             */
            die(
                json_encode(
                    [
                        "status" => "error",
                        "reason" => "Email em uso"
                    ]
                )
            );
        }

        /**
         * Caso o email esteja disponível para
         * ser utilizado
         */
        else{

            /**
             * Cria um novo objeto para o Cliente
             * @var Clientes $client
             */
            $client = new Clientes();

            /**
             * Seta o email do novo Cliente
             */
            $client->setEmail($user->email);

            /**
             * Seta a senha do novo Cliente
             */
            $client->setSenha( $this->security->hash($user->password) );

            /**
             * Seta o carrinho do novo Cliente
             */
            $client->setCarrinho([]);

            $client->setNome("");
            $client->setSobrenome("");
            $client->setNascimento("");
            $client->setDocumento(new \stdClass());
            $client->setContato(new \stdClass());

            $endereco = new \stdClass();
            $endereco->rua = "";
            $endereco->cep = "";
            $endereco->bairro = "";
            $endereco->cidade = "";
            $endereco->estado = "";
            $endereco->numero = "";
            $endereco->complemento = "";

            $client->setEndereco($endereco);

            /**
             * Verifica se houve um erro ao
             * criar o usuário
             */
            if(!$client->create()){

                /**
                 * Retorna um objecto para o front-end
                 */
                die(
                    json_encode(
                        [
                            "status" => "error",
                            "reason" => $client->getMessages()
                        ]
                    )
                );
            }

            /**
             * Cria uma sessão para o usuário
             */
            $this->session->set("usuario",$user->email);

            /**
             * Cria uma mensagem para o usuário
             */
            $this->flashSession->message("info","Conta críada com sucesso\nPor favor preencha os dados adicionais para continuar comprando.");

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

    }

}