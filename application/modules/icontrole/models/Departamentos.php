<?php

namespace Icontrole\Models;

use Phalcon\Mvc\MongoCollection;

class Departamentos extends MongoCollection{

    public function initialize(){
        $this->setSource("departamentos");
    }

    /**
     * @var string $nome - Obrigatório
     * Ex.: Informática
     */
    public $nome;

    /**
     * @var array $categorias - Obrigatório
     * Ex.:
     * [
     *      {
     *          "nome" : "Computador,
     *          "subcategorias" : [ "All-in-one", "Gamer" ]
     *      },
     *     {
     *          "nome" : "Notebook,
     *          "subcategorias" : [ "Ultrafino", "2 em 1" ]
     *      }
     * ]
     */
    public $categorias = [];

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
    public function getCategorias(): array
    {
        return $this->categorias;
    }

    /**
     * @param array $categorias
     */
    public function setCategorias(array $categorias)
    {
        $this->categorias = $categorias;
    }

}