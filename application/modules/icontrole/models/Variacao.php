<?php

namespace Icontrole\Models;

use Phalcon\Mvc\MongoCollection;

class Variacao extends MongoCollection {

    public function initialize(){
        $this->setSource("variacao");
    }

    /**
     * @var string $nome
     * Ex.: Cor
     */
    public $nome;

    /**
     * @var array $variacoes
     * Ex.:
     * [
     *      "Preto",
     *      "Azul",
     *      "Branco"
     * ]
     */
    public $variacoes;

    /**
     * @return string
     */
    public function getNome(): string
    {
        return $this->nome;
    }

    /**
     * @param string $nome
     */
    public function setNome(string $nome)
    {
        $this->nome = $nome;
    }

    /**
     * @return array
     */
    public function getVariacoes(): array
    {
        return $this->variacoes;
    }

    /**
     * @param array $variacoes
     */
    public function setVariacoes(array $variacoes)
    {
        $this->variacoes = $variacoes;
    }

}