<?php

namespace Icontrole\Models;

use Phalcon\Mvc\MongoCollection;

class Configpagamento extends MongoCollection {

    public function initialize(){
        $this->setSource("configpagamento");
    }

    /**
     * @var string $api
     * Ex.: pagseguro, cielo, paypal...
     */
    public $api;

    /**
     * @var \stdClass $parametros
     * Ex.:
     * {
     *      email: ex@example .com
     *      token: EDSD09923ISPDOISDJ23
     * }
     */
    public $parametros;


    /**
     * @var array $metodos
     * Ex.: [ boleto, cartao_de_credito, cartao_de_debito ]
     */
    public $metodos;

    /**
     * @var array $opcoes
     * Ex.:
     * [
     *      {
     *          max_parcelas: 12,
     *          max_parcelas_sem_juros: 10,
     *          min_parcela: 10.00,
     *          desconto_a_vista: 1.00
     *      }
     * ]
     */
    public $opcoes;

    /**
     * @return array
     */
    public function getOpcoes()
    {
        return $this->opcoes;
    }

    /**
     * @param array $opcoes
     */
    public function setOpcoes(array $opcoes)
    {
        $this->opcoes = $opcoes;
    }

    /**
     * @return array
     */
    public function getMetodos()
    {
        return $this->metodos;
    }

    /**
     * @param array $metodos
     */
    public function setMetodos( array $metodos)
    {
        $this->metodos = $metodos;
    }

    /**
     * @return string
     */
    public function getApi()
    {
        return $this->api;
    }

    /**
     * @param string $api
     */
    public function setApi(string $api)
    {
        $this->api = $api;
    }

    /**
     * @return \stdClass
     */
    public function getParametros()
    {
        return $this->parametros;
    }

    /**
     * @param \stdClass $parametros
     */
    public function setParametros( \stdClass $parametros)
    {
        $this->parametros = $parametros;
    }

}