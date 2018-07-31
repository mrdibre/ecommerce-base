<?php


namespace Icontrole\Models;

use Phalcon\Mvc\MongoCollection;

class Pedidos extends MongoCollection {

    public function initialize(){
        $this->setSource("pedidos");
    }

    /**
     * @var \stdClass $cliente
     * Ex.:
     * {
     *      nome: Cliente 1,
     *      email: example@example.com
     * }
     */
    public $cliente;

    /**
     * @var array $produtos
     * Ex.:
     * [
     *      {
     *          "id" : ObjectId(),
     *          "nome": produto 1,
     *          "quantidade": 10,
     *          "valor": 100.00
     *      },
     *      ...
     * ]
     */
    public $produtos;

    /**
     * @var \stdClass $pagamento
     * Ex.:
     * {
     *      "tipo": cartao_credito,
     *      "parcelas": 1,
     *      "valor_parcela": 10,
     *      "acrescimo": 0
     * }
     */
    public $pagamento;

    /**
     * @var string $referencia
     * Ex.: md5( uniqid( "REF", true ) )
     */
    public $referencia;

    /**
     * @var float $total
     * Ex.: 10.00
     */
    public $total;

    /**
     * @var string $rastreamento
     * Ex.: REF032039203
     */
    public $rastreamento;

    /**
     * @var \stdClass $frete
     * Ex.:
     * {
     *      "tipo": SEDEX,
     *      "valor": 10.00
     * }
     */
    public $frete;

    /**
     * @var \stdClass $status
     * Ex.:
     * {
     *      "pagamento" : Pago,
     *      "loja" : Entregue
     * }
     */
    public $status;

    /**
     * @var string $data
     * Ex.: 20/04/2018
     */
    public $data;

    /**
     * @var \stdClass $entrega
     * Ex.:
     * {
     *      "rua": teste,
     *      "cidade": teste,
     *      "numero": 001,
     *      "bairro": teste,
     *      "cep": 99999999,
     *      "estado": teste,
     *      "pais": BRA,
     *      "complemento": ""
     * }
     * Pode ser a conta do usuário ou um endereço alternativo
     */
    public $entrega;

    /**
     * @return \stdClass
     */
    public function getCliente(): \stdClass
    {
        return (object) $this->cliente;
    }

    /**
     * @param \stdClass $cliente
     */
    public function setCliente(\stdClass $cliente)
    {
        $this->cliente = $cliente;
    }

    /**
     * @return array
     */
    public function getProdutos(): array
    {
        return $this->produtos;
    }

    /**
     * @param array $produtos
     */
    public function setProdutos(array $produtos)
    {
        $this->produtos = $produtos;
    }

    /**
     * @return \stdClass
     */
    public function getPagamento(): \stdClass
    {
        return $this->pagamento;
    }

    /**
     * @param \stdClass $pagamento
     */
    public function setPagamento(\stdClass $pagamento)
    {
        $this->pagamento = $pagamento;
    }

    /**
     * @return string
     */
    public function getReferencia(): string
    {
        return $this->referencia;
    }

    /**
     * @param string $referencia
     */
    public function setReferencia(string $referencia)
    {
        $this->referencia = $referencia;
    }

    /**
     * @return float
     */
    public function getTotal(): float
    {
        return $this->total;
    }

    /**
     * @param float $total
     */
    public function setTotal(float $total)
    {
        $this->total = $total;
    }

    /**
     * @return string
     */
    public function getRastreamento(): string
    {
        return $this->rastreamento;
    }

    /**
     * @param string $rastreamento
     */
    public function setRastreamento(string $rastreamento)
    {
        $this->rastreamento = $rastreamento;
    }

    /**
     * @return \stdClass
     */
    public function getFrete(): \stdClass
    {
        return $this->frete;
    }

    /**
     * @param \stdClass $frete
     */
    public function setFrete(\stdClass $frete)
    {
        $this->frete = $frete;
    }

    /**
     * @return \stdClass
     */
    public function getStatus(): \stdClass
    {
        return (object) $this->status;
    }

    /**
     * @param \stdClass $status
     */
    public function setStatus(\stdClass $status)
    {
        $this->status = $status;
    }

    /**
     * @return string
     */
    public function getData(): string
    {
        return $this->data;
    }

    /**
     * @param string $data
     */
    public function setData(string $data)
    {
        $this->data = $data;
    }

    /**
     * @return \stdClass
     */
    public function getEntrega(): \stdClass
    {
        return $this->entrega;
    }

    /**
     * @param \stdClass $entrega
     */
    public function setEntrega(\stdClass $entrega)
    {
        $this->entrega = $entrega;
    }

}