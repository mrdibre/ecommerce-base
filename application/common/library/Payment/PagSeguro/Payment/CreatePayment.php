<?php

namespace Icontrole\Library\Payment\PagSeguro\Payment;

use Icontrole\Library\Payment\PagSeguro\Payment\Options\Boleto;
use Icontrole\Library\Payment\PagSeguro\Payment\Options\CreditCard;
use Icontrole\Models\Configpagamento;

/**
 * Class CreatePayment
 * @package Icontrole\Library\Payment\PagSeguro\Payment
 * Ex.:
 * $payment = new CreatePayment();
 * $response = generatePayment(array $items, string $method,string $hash, \stdClass $comprador, \stdClass $urls, \stdClass $card, \stdClass $frete , int $extra = 0);
 */
class CreatePayment{

    /**
     * @var \Icontrole\Models\Configpagamento $config;
     */
    public $config;

    public function __construct(){
        $this->config = Configpagamento::findFirst();
    }

    /**
     * @param array $items
     * @param string $method
     * @param string $hash
     * @param \stdClass $comprador
     * @param \stdClass $card
     * @param \stdClass $urls
     * @param \stdClass $frete
     * @param int $extra
     * @return array
     */
    public function generatePayment(array $items, string $method,string $hash, \stdClass $comprador, \stdClass $urls, \stdClass $card, \stdClass $frete , int $extra = 0){

        //$methods = $this->config->getMetodos();

        $return = "";

        if($method === "credit_card"){
            $pagamento =  (new CreditCard($items,$hash,$comprador,$card,$urls,$frete,$extra))->Pagamento();

            $return = $pagamento;

        }
        else if($method === "boleto"){
            $pagamento = (new Boleto($items,$hash,$comprador,$urls,$frete,$extra))->Pagamento();

            $return = $pagamento;

        }

        return $return;

    }

}