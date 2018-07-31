<?php

namespace Icontrole\Library\Payment\PagSeguro\Notification;

use Icontrole\Library\Payment\PagSeguro\Config\PagSeguroConfig;
use Icontrole\Models\Configpagamento;
use Icontrole\Models\Pedidos;
use PagSeguro\Configuration\Configure;
use PagSeguro\Helpers\Xhr;
use PagSeguro\Parsers\Transaction\Response;

class Notification{

    /**
     * @var bool $canSendEmail
     */
    private $canSendEmail = false;

    /**
     * @var \stdClass $response
     */
    private $response;

    /**
     * @var Configpagamento $config
     */
    private $config;

    /**
     * @var PagSeguroConfig $initialize
     */
    private $initialize;

    /**
     * Notification constructor.
     */
    public function __construct(){

        /**
         * Pega as configuraões de pagamento
         */
        $this->config = Configpagamento::findFirst();

        /**
         * Inicializa o PagSeguro
         */
        $this->initialize = new PagSeguroConfig(
            ($this->config->getParametros())["email"],
            ($this->config->getParametros())["token"]
        );

        /**
         * Checa se existe um $_POST
         */
        if(Xhr::hasPost()){

            try {
                /**
                 * Pega o código da notificação e envia o pedido para receber
                 * as informações
                 * @var Response $response
                 */
                $response = \PagSeguro\Services\Transactions\Notification::check(
                    Configure::getAccountCredentials()
                );

                /**
                 * @var Pedidos $pedido
                 */
                $pedido = Pedidos::findFirst([
                    [
                        "referencia" => $response->getReference()
                    ]
                ]);

                /**
                 * Caso encontre o pedido
                 */
                if($pedido){

                    /**
                     * Cria um novo objeto para armazenar o status do pedido
                     */
                    $newstatus = new \stdClass();

                    /**
                     * Armazena o status do pagamento
                     */
                    $newstatus->pagamento = $response->getStatus();

                    /**
                     * Armazena o status da loja
                     */
                    $newstatus->loja = "";

                    /**
                     * Guarda o status no pedido
                     */
                    $pedido->setStatus( $newstatus );

                    /**
                     * Tenta salvar o pedido
                     */
                    if($pedido->save()){

                        /**
                         * Define que pode enviar o email para o usuário
                         * informando a atualização de status
                         */
                        $this->setCanSendEmail(true);

                        /**
                         * Cria um objeto para passar algumas informações
                         * quando for enviar o email
                         */
                        $rep = new \stdClass();

                        /**
                         * Pega o email do cliente que fez o pedido
                         */
                        $rep->email = explode("@",$pedido->getCliente()->email)[0]."@sandbox.pagseguro.com.br";

                        /**
                         * Pega o novo status do pedido
                         */
                        $rep->status = $this->formatStatus( $response->getStatus() );

                        /**
                         * PEga a referência do pedido
                         */
                        $rep->referencia = $pedido->getReferencia();

                        /**
                         * Pega o id do pedido
                         */
                        $rep->id = $pedido->getId();

                        /**
                         * Armazena o retorno em um objeto
                         */
                        $this->setResponse($rep);

                    }

                    /**
                     * Caso não conseguiu salvar as informações do pedido
                     */
                    else{

                        /**
                         * Define que não pode enviar email para o usuário
                         */
                        $this->setCanSendEmail(false);

                        /**
                         * Cria um novo objeto para armazenar o motivo
                         */
                        $rep = new \stdClass();

                        /**
                         * Define o motivo
                         */
                        $rep->status = "Error at switch order status";

                        /**
                         * Salva em um objeto
                         */
                        $this->setResponse($rep);

                        /**
                         * Retorna uma mensagem que servirá como log no PagSeguro
                         */
                        die("Error at switch order status");

                    }

                }

                /**
                 * Caso não encontrou o pedido
                 */
                else{

                    /**
                     * Define que não pode enviar email para o usuário
                     */
                    $this->setCanSendEmail(false);

                    /**
                     * Cria um novo objeto para armazenar o motivo
                     */
                    $rep = new \stdClass();

                    /**
                     * Define o motivo
                     */
                    $rep->status = "Order not found";

                    /**
                     * Salva em um objeto
                     */
                    $this->setResponse($rep);

                    /**
                     * Retorna uma mensagem que servirá como log no PagSeguro
                     */
                    die("Order not found");

                }

            } catch (\Exception $e) {
                echo $e->getMessage();
            }

        }

    }

    /**
     * @return bool
     */
    public function isCanSendEmail(): bool
    {
        return $this->canSendEmail;
    }

    /**
     * @param bool $canSendEmail
     */
    public function setCanSendEmail(bool $canSendEmail)
    {
        $this->canSendEmail = $canSendEmail;
    }

    /**
     * @return \stdClass
     */
    public function getResponse(): \stdClass
    {
        return $this->response;
    }

    /**
     * @param \stdClass $response
     */
    public function setResponse(\stdClass $response)
    {
        $this->response = $response;
    }

    public function formatStatus($status){
        switch ( intval($status) ){
            case 1:
                return 'Aguardando pagamento';
            case 2:
                return 'Em análise';
            case 3:
                return 'Paga';
            case 4:
                return 'Disponível';
            case 5:
                return 'Em disputa';
            case 6:
                return 'Devolvido';
            case 7:
                return 'Cancelado';
            case 8:
                return 'Debitado';
            case 9:
                return 'Retenção temporária';
            default:
                return 'Desconhecido';
        }
    }

}