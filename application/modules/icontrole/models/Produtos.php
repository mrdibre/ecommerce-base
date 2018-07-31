<?php

namespace Icontrole\Models;

use Phalcon\Mvc\MongoCollection;

class Produtos extends MongoCollection {

    public function initialize(){
        $this->setSource("produtos");
    }

    /**
     * @var string $nome - Obrigatório
     */
    public $nome;

    /**
     * @var string $descricao - Obrigatório
     */
    public $descricao;

    /**
     * @var float $preco - Obrigatório
     */
    public $preco;

    /**
     * @var int $avaliacao - Obrigatório
     */
    public $avaliacao;

    /**
     * @var array $dimensoes - Obrigatório
     */
    public $dimensoes = [
        "largura"        => 0,
        "altura"         => 0,
        "comprimento"    => 0,
    ];

    /**
     * @var float $peso - Obrigatório
     */
    public $peso;

    /**
     * @var string marca - Opcional
     */
    public $marca;

    /**
     * @var array $imagens - Opcional
     */
    public $imagens = [];

    /**
     * @var object $departamento - Obrigatório
     * Ex.:
     * {
     *      "nome": exemplo,
     *      "categoria": [
     *          {
                    "nome": categoria exemplo,
     *              "subcategoria": subcategoria exemplo,
     *          }
     *      ]
     * }
     */
    public $departamento;

    /**
     * @var array $tags - Opcional
     */
    public $tags = [];

    /**
     * @var array $variacoes - Opcional
     * Ex.:
     * [
     *      {
     *          "cor": Azul,
     *          "tamanho": M,array
     *          "preco": +10,
     *          "formato": redondo
     *      },
     *      {
     *          "cor": Preto,
     *          "tamanho": G,
     *          "preco": 0,
     *          "formato": retangular
     *      }
     * ]
     */
    public $variacoes = [];

    /**
     * @var bool $ativo - Obrigatório
     */
    public $ativo = true;

    /**
     * @var int $estoque - Obrigatório
     */
    public $estoque;

    /**
     * @var object $vinculados - Opcional
     * Ex.:
     * {
     *      produtos: [ObjectId(produto1),ObjectId(produto2),ObjectId(produto3)]
     *      preco_final: 100
     * }
     */
    public $vinculados;

    /**
     * @var object $fichatecnica -> Opcional
     * Ex.:
     * {
     *      "codigo de barras": 129810291,
     *      "polegadas": 20,
     *      "Wi-Fi": Sim,
     *      ...
     * }
     */
    public $fichatecnica;

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
    public function getDescricao(): string
    {
        return $this->descricao;
    }

    /**
     * @param string $descricao
     */
    public function setDescricao(string $descricao)
    {
        $this->descricao = $descricao;
    }

    /**
     * @return float
     */
    public function getPreco(): float
    {
        return $this->preco;
    }

    /**
     * @param float $preco
     */
    public function setPreco(float $preco)
    {
        $this->preco = $preco;
    }

    /**
     * @return int
     */
    public function getAvaliacao(): int
    {
        return $this->avaliacao;
    }

    /**
     * @param int $avaliacao
     */
    public function setAvaliacao(int $avaliacao)
    {
        $this->avaliacao = $avaliacao;
    }

    /**
     * @return array
     */
    public function getDimensoes(): array
    {
        return $this->dimensoes;
    }

    /**
     * @param array $dimensoes
     */
    public function setDimensoes(array $dimensoes)
    {
        $this->dimensoes = $dimensoes;
    }

    /**
     * @return float
     */
    public function getPeso(): float
    {
        return $this->peso;
    }

    /**
     * @param float $peso
     */
    public function setPeso(float $peso)
    {
        $this->peso = $peso;
    }

    /**
     * @return string
     */
    public function getMarca(): string
    {
        return $this->marca;
    }

    /**
     * @param string $marca
     */
    public function setMarca(string $marca)
    {
        $this->marca = $marca;
    }

    /**
     * @return array
     */
    public function getImagens(): array
    {
        return $this->imagens;
    }

    /**
     * @param array $imagens
     */
    public function setImagens(array $imagens)
    {
        $this->imagens = $imagens;
    }

    /**
     * @return object
     */
    public function getDepartamento(): \stdClass
    {
        return $this->departamento;
    }

    /**
     * @param object $departamento
     */
    public function setDepartamento(\stdClass $departamento)
    {
        $this->departamento = $departamento;
    }

    /**
     * @return array
     */
    public function getTags(): array
    {
        return $this->tags;
    }

    /**
     * @param array $tags
     */
    public function setTags(array $tags)
    {
        $this->tags = $tags;
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

    /**
     * @return bool
     */
    public function isAtivo(): bool
    {
        return $this->ativo;
    }

    /**
     * @param bool $ativo
     */
    public function setAtivo(bool $ativo)
    {
        $this->ativo = $ativo;
    }

    /**
     * @return int
     */
    public function getEstoque(): int
    {
        return $this->estoque;
    }

    /**
     * @param int $estoque
     */
    public function setEstoque(int $estoque)
    {
        $this->estoque = $estoque;
    }

    /**
     * @return object
     */
    public function getVinculados(): \stdClass
    {
        return $this->vinculados;
    }

    /**
     * @param object $vinculados
     */
    public function setVinculados(\stdClass $vinculados)
    {
        $this->vinculados = $vinculados;
    }

    /**
     * @return object
     */
    public function getFichatecnica(): array
    {
        return $this->fichatecnica;
    }

    /**
     * @param array $fichatecnica
     */
    public function setFichatecnica(array $fichatecnica)
    {
        $this->fichatecnica = $fichatecnica;
    }
}