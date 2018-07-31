<?php

namespace Icontrole\Site\Controllers;

use Icontrole\Models\Banners;
use Icontrole\Models\Produtos;

class IndexController extends BaseController{

    public function indexAction(){

        /**
         * Pega os últimos 8 produtos adicionados
         */
        $this->view->ultimosadicionados = Produtos::find(
            [
                [
                    "ativo" => true
                ],
                [
                    "sort" => [
                        "_id" => -1
                    ],
                    "limit" => 12
                ]
            ]
        );

        /**
         * Pega os banners cadastrados
         */
        $this->view->banners = Banners::find();

        /**
         * Armazena alguns produtos de acordo departamentos
         */
        $depprods = [];

        /**
         * Pega todos os departamentos
         */
        foreach ( $this->view->getVar("departamentos") as $departamento ){

            /**
             * Cria um novo objeto
             */
            $dep = new \stdClass();

            /**
             * Define o nome do departamento
             */
            $dep->nome = $departamento->nome;

            /**
             * Pega até 3 produtos vinculados ao departamento atual
             */
            $dep->produtos = Produtos::find(
                [
                    [
                        "departamento.nome" => $departamento->nome,
                        "ativo" => true
                    ],
                    [
                        "limit" => 3
                    ]
                ]
            );

            /**
             * Adiciona esse departamento ao array
             */
            $depprods[] = $dep;

        }

        /**
         * Restinge o array a 4 posições
         */
        $depprods = array_slice($depprods,0,4);

        /**
         * Seta a variável depprods
         */
        $this->view->depprods = $depprods;

    }

}