<?php

namespace Icontrole\Library\Payment\PagSeguro\Sender;

class Sender{

    public $nome;
    public $email;
    public $nascimento;
    public $contato;
    public $documento;
    public $endereco;

    /**
     * Sender constructor.
     * @param \stdClass $sender
     * Ex.:
     * { "nome"            => comprador,
     *   "email"           => example@example.com,
     *   "nascimento"      => 01/01/2000
     *   "contato"         =>
     *    {
     *      "ddd"          => 34,
     *      "telefone"     => 99999999
     *    },
     *    documento        =>
     *   {
     *      "tipo"         => CPF,
     *      "valor"        => número de CPF válido
     *   },
     *   "endereco" =>
     *   {
     *      "rua"          => example,
     *      "numero"       => 1,
     *      "bairro"       => example,
     *      "cep"          => 39203982
     *      "estado"       => example,
     *      "pais"         => BRA (3 letras no pais),
     *      "complemento"  =>
     *   }
     *
     */
    public function __construct(\stdClass $sender){
        $this->PopulateClass($sender,$this);
    }

    public function PopulateClass(\stdClass $obj,$context){

        foreach ($obj as $k=> $v) {
            if( gettype($k) === "stdClass" ){
                $this->PopulateClass( $k ,$context->{$k});
            }
            else{
                $context->{$k} = $v;
            }
        }

    }

}