<?php

namespace Icontrole\Library\Payment\PagSeguro\Payment;

use \Icontrole\Library\Payment\PagSeguro\Sender\Sender;

interface Payment{

    /**
     * @param array $items
     * @return mixed
     * [id,nome,quantidade,preço]
     */
    public function AdicionarItems(array $items);

    /**
     * @param string $moeda
     * @return mixed
     */
    public function Moeda(string $moeda);

    /**
     * @param float $extra
     * @return mixed
     */
    public function ValorExtra(float $extra);

    /**
     * @param string $referencia
     * @return mixed
     */
    public function Referencia(string $referencia);

    /**
     * @param string $redirecionamento
     * @return mixed
     */
    public function Redirecionamento(string $redirecionamento);

    /**
     * @param string $notificacao
     * @return mixed
     */
    public function Notificacao(string $notificacao);

    /**
     * @param Sender $comprador
     * @return mixed
     * Ex.:
     * [nome,email,ddd,telefone, tipo do documento, valor do documento, rua, numero, bairro, estado, pais(3 letras), complemento]
     */
    public function Comprador(Sender $comprador);

    /**
     * @param \stdClass $frete
     * @return mixed
     * Ex.:
     * {
     *      "tipo" => SEDEX,PAC e etc,
     *      "valor" => 30.00
     * }
     */
    public function Frete(\stdClass $frete);

    /**
     * @param string $hash
     * @return mixed
     */
    public function Hash(string $hash);

}