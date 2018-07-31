<?php

namespace Icontrole\Library\Payment\PagSeguro\Payment\Options;

use Icontrole\Library\Payment\PagSeguro\Config\PagSeguroConfig;
use Icontrole\Library\Payment\PagSeguro\Payment\Payment;
use Icontrole\Library\Payment\PagSeguro\Sender\Sender;
use Icontrole\Models\Configpagamento;
use PagSeguro\Configuration\Configure;

class Boleto implements Payment {

    /**
     * @var \PagSeguro\Domains\Requests\DirectPayment\CreditCard $instance
     *
     */
    public $instance;

    /**
     * @return \PagSeguro\Domains\Requests\DirectPayment\CreditCard
     */
    public function getInstance(): \PagSeguro\Domains\Requests\DirectPayment\CreditCard
    {
        return $this->instance;
    }

    /**
     * @param \PagSeguro\Domains\Requests\DirectPayment\CreditCard $instance
     */
    public function setInstance(\PagSeguro\Domains\Requests\DirectPayment\CreditCard $instance)
    {
        $this->instance = $instance;
    }

    /**
     * CreditCard constructor.
     * @param array $items
     * Ex.:
     * [
     *      {
     *          "id"         => ObjectId(),
     *          "nome"       => produto 1,
     *          "preco"      => 10.00,
     *          "quantidade" => 5
     *      },
     *      ...
     * ]
     *
     * @param string $hash
     * Ex.: d94d002b6998ca9cd69092746518e50aded5a54aef64c4877ccea02573694986
     *
     * @param \stdClass $comprador
     * Ex.:
     * {
     *      "email"       => example@example.com,
     *      "nome"        => Exemplo Comprador,
     *      "ddd"         => 34,
     *      "telefone"    => 99999999,
     *      "nascimento"  => 01/01/2000,
     *      "documento"   =>
     *      {
     *          "tipo"    => "CPF,
     *          "valor"   => número de CPF válido
     *      }
     * }
     *
     *
     * @param \stdClass $urls
     * Ex.:
     * {
     *      "redirecionamento" => site.com.br/comprafinalizada,
     *      "notificacao"      => site.com.br/notificacao
     * }
     *
     * @param \stdClass $frete
     * Ex.:
     * {
     *      "tipo" => SEDEX,
     *      "valor" => 50.00
     * }
     *
     * @param int $extra = 0
     *
     */
    public function __construct(array $items, string $hash, \stdClass $comprador, \stdClass $urls, \stdClass $frete , int $extra = 0){

        $this->instance = new \PagSeguro\Domains\Requests\DirectPayment\Boleto();

        $this->instance->setReceiverEmail('cesar@webearte.com.br');

        $this->Referencia( md5( uniqid( "REF", true ) ) );
        $this->Moeda("BRL");
        $this->AdicionarItems($items);
        $this->Comprador( new Sender($comprador) );
        $this->Hash($hash);
        $this->ValorExtra($extra);
        $this->Redirecionamento( $urls->redirecionamento );
        $this->Notificacao( $urls->notificacao );

    }

    public function Hash(string $hash){
        $this->instance->setSender()->setHash($hash);
    }

    public function AdicionarItems(array $items){

        if( count( $items ) > 0 ){
            foreach ($items as $item){
                $this->instance->addItems()->withParameters(
                    $item->id,
                    $item->nome,
                    $item->qtd,
                    number_format($item->preco,2,'.','')
                );
            }
        }
        else{
            try{
                throw new \Exception("Nenhum produto passado como argumento");
            }
            catch (\Exception $exception){
                $error = "<span>Erro em {$exception->getFile()}, linha {$exception->getLine()} <br><br> Erro: <b>{$exception->getMessage()}</b></span>";
                die($error);
            }
        }
    }

    public function Moeda(string $moeda)
    {
        if( gettype($moeda) !== "string" ){
            try{
                throw new \Exception("Tipo inválido para moeda");
            }
            catch (\Exception $exception){
                $error = "<span>Erro em {$exception->getFile()}, linha {$exception->getLine()} <br><br> Erro: <b>{$exception->getMessage()}</b></span>";
                die($error);
            }
        }
        else{

            $this->instance->setCurrency($moeda);

        }
    }

    public function ValorExtra(float $extra){
        $this->instance->setExtraAmount($extra);
    }

    public function Referencia(string $referencia)
    {
        $this->instance->setReference($referencia);
    }

    public function Redirecionamento(string $redirecionamento)
    {
        $this->instance->setRedirectUrl($redirecionamento);
    }

    public function Notificacao(string $notificacao)
    {
        $this->instance->setNotificationUrl($notificacao);
    }

    public function Frete(\stdClass $frete)
    {
        switch ($frete->tipo){
            case "PAC":
                $frete->tipo = 1;
                break;
            case "SEDEX":
                $frete->tipo = 2;
                break;
            default:
                $frete->tipo = 3;
        }

        $this->instance->setShipping()->setCost()->withParameters($frete->valor);
        $this->instance->setShipping()->setType()->withParameters($frete->tipo);
    }

    public function Comprador(Sender $comprador){

        $this->instance->setSender()->setName($comprador->nome);
        $this->instance->setSender()->setEmail($comprador->email);
        $this->instance->setSender()->setPhone()->withParameters($comprador->contato->ddd,$comprador->contato->telefone);
        $this->instance->setSender()->setDocument()->withParameters($comprador->documento->tipo,$comprador->documento->valor);

        $this->instance->setShipping()->setAddress()->withParameters(
            $comprador->endereco->rua,
            $comprador->endereco->numero,
            $comprador->endereco->bairro,
            $comprador->endereco->cep,
            $comprador->endereco->cidade,
            $comprador->endereco->estado,
            $comprador->endereco->pais,
            $comprador->endereco->complemento
        );

    }

    public function Pagamento(){

        $config = Configpagamento::findFirst();
        $params = $config->getParametros();

        $cred = new PagSeguroConfig($params["email"],$params["token"]);

        try{

            $this->instance->setMode('DEFAULT');

            return $this->instance->register(
                Configure::getAccountCredentials()
            );
        } catch (\Exception $e) {
            return $e->getMessage();
        }
    }

}