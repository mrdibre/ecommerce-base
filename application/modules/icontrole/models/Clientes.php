<?php

namespace Icontrole\Models;

use Phalcon\Mvc\MongoCollection;

class Clientes extends MongoCollection {

    public function initialize(){
        $this->setSource("clientes");
    }

    /**
     * @var string $nome
     * Ex.: Comprador
     */
    public $nome;

    /**
     * @var string $sobrenome
     * Ex.: Teste
     */
    public $sobrenome;

    /**
     * @var string $nascimento
     * Ex.: 01/01/2000
     */
    public $nascimento;

    /**
     * @var string $email
     * Ex.: example@example.com
     */
    public $email;

    /**
     * @var string $senha
     * Ex.: $this->security->hash(12345678) -> String maior que 7 caracteres
     */
    public $senha;

    /**
     * @var \stdClass $documento
     * Ex.:
     * {
     *      "tipo": CPF,
     *      "valor": número de CPF válido
     * }
     */
    public $documento;

    /**
     * @var array $carrinho
     * Ex.:
     * [
     *      {
     *          "id": ObjectId(),
     *          "nome": Produto 1,
     *          "quantidade": 5,
     *          "preco": 10.00
     *      },
     *      ...
     * ]
     */
    public $carrinho;

    /**
     * @var \stdClass $contato
     * Ex.:
     * {
     *      "ddd": 34,
     *      "telefone": 99999999
     * }
     */
    public $contato;

    /**
     * @var \stdClass $endereco
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
     */
    public $endereco;

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
     * @return string
     */
    public function getSobrenome(): string
    {
        return $this->sobrenome;
    }

    /**
     * @param string $sobrenome
     */
    public function setSobrenome(string $sobrenome)
    {
        $this->sobrenome = $sobrenome;
    }

    /**
     * @return string
     */
    public function getNascimento(): string
    {
        return $this->nascimento;
    }

    /**
     * @param string $nascimento
     */
    public function setNascimento(string $nascimento)
    {
        $this->nascimento = $nascimento;
    }

    /**
     * @return string
     */
    public function getEmail(): string
    {
        return $this->email;
    }

    /**
     * @param string $email
     */
    public function setEmail(string $email)
    {
        $this->email = $email;
    }

    /**
     * @return string
     */
    public function getSenha(): string
    {
        return (object) $this->senha;
    }

    /**
     * @param string $senha
     */
    public function setSenha(string $senha)
    {
        $this->senha = $senha;
    }

    /**
     * @return \stdClass
     */
    public function getDocumento(): \stdClass
    {
        return (object) $this->documento;
    }

    /**
     * @param \stdClass $documento
     */
    public function setDocumento(\stdClass $documento)
    {
        $this->documento = $documento;
    }

    /**
     * @return array
     */
    public function getCarrinho(): array
    {
        return $this->carrinho;
    }

    /**
     * @param array $carrinho
     */
    public function setCarrinho(array $carrinho)
    {
        $this->carrinho = $carrinho;
    }

    /**
     * @return \stdClass
     */
    public function getContato(): \stdClass
    {
        return (object) $this->contato;
    }

    /**
     * @param \stdClass $contato
     */
    public function setContato(\stdClass $contato)
    {
        $this->contato = $contato;
    }

    /**
     * @return \stdClass
     */
    public function getEndereco(): \stdClass
    {
        return (object) $this->endereco;
    }

    /**
     * @param \stdClass $endereco
     */
    public function setEndereco(\stdClass $endereco)
    {
        $this->endereco = $endereco;
    }

}