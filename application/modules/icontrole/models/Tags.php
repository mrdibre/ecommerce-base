<?php

namespace Icontrole\Models;

use Phalcon\Mvc\MongoCollection;

class Tags extends MongoCollection{

    public function initialize(){
        $this->setSource("tags");
    }

    /**
     * @var string $nome - Obrigatório
     */
    public $nome;

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


}