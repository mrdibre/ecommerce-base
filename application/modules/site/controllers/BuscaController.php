<?php

namespace Icontrole\Site\Controllers;

use Icontrole\Models\Tags;
use Icontrole\Models\Departamentos;
use Icontrole\Models\Produtos;
use MongoDB\BSON\Regex;
use MongoDB\Driver\Cursor;

class BuscaController extends BaseController {

    /**
     * Função responsável por procurar produtos de
     * acordo com a busca do usuário
     */
    public function indexAction(){

        /**
         * Define a variável busca de acordo
         * com o que foi digitado pelo usuário
         */
        $this->view->busca = $this->request->get("nome");

        /**
         * Define a variável tags
         */
        $this->view->tags =  Tags::find();

        /**
         * Define a variável departamentos
         */
        $this->view->departamentos = Departamentos::find();

        /**
         * Pega as informações que foram passadas por URL
         */
        $data = $this->request->get();

        /**
         * Verifica se existe o parâmetro departamento
         * e se ele não está vazio
         */
        if( isset($data["departamento"]) && !empty($data["departamento"]) ){

            /**
             * Responsável por armazenar todos os produtos encontrados
             * @var Cursor $produtos
             */
            $produtos = [];

            /**
             * Responsável por guardar a query que será
             * utilizada no aggregate
             */
            $query = [];

            /**
             * Vefica se existe o parâmetro categoria e se
             * ele não está vazio
             */
            if( isset($data["categoria"]) && !empty($data["categoria"]) ){

                /**
                 * Verifica se existe o parâmetro subcategoria e se
                 * ele não está vazio
                 */
                if( isset($data["subcategoria"]) && !empty($data["subcategoria"]) ){

                    /**
                     * Monta um pedaço da query procurando por
                     * departamento -> categoria -> subcategoria
                     */
                    $query = [
                        [
                            '$match'=> [
                                "departamento.nome" => $data["departamento"],
                            ]
                        ],

                        [
                            '$match' => [
                                "departamento.categoria.nome" => $data["categoria"]
                            ]
                        ],

                        [
                            '$match' => [
                                "departamento.categoria.subcategoria"=> $data["subcategoria"]
                            ]
                        ]
                    ];
                }

                /**
                 * Caso não exista uma subcategoria
                 */
                else{

                    /**
                     * Monta um pedaço da query procurando por
                     * departamento -> categoria
                     */
                    $query = [
                        [
                            '$match'=> [
                                "departamento.nome" => $data["departamento"],
                            ]
                        ],

                        [
                            '$match' => [
                                "departamento.categoria.nome" => $data["categoria"]
                            ]
                        ]
                    ];
                }
            }

            /**
             * Caso não exista uma categoria
             */
            else{

                /**
                 * Monta um pedaço da query procurando por departamento
                 */
                $query = [
                    [
                        '$match'=> [
                            "departamento.nome" => $data["departamento"],
                        ]
                    ]
                ];
            }

            /**
             * Verifica se existe o parâmetro nome e se ele
             * não está vazio
             */
            if(isset($data["nome"]) && !empty($data["nome"])){

                /**
                 * Monta um pedaço da query procurando por nome
                 */
                $query[] = [
                    '$match' => [
                        "nome" => new Regex($data["nome"],"i")
                    ]
                ];
            }

            /**
             * Variável responsável por armazenar as tags
             */
            $tags = [];

            /**
             * Percorre todos os parâmetros que foram passados
             */
            foreach ($data as $key => $item){

                /**
                 * Verifica se no parâmetro atual existe tag...
                 */
                if( strpos($key,"tag") > -1 ){

                    /**
                     * Adiciona a tags[] o valor atual
                     */
                    $tags[] = [
                        "tags" => $item
                    ];
                }

            }

            /**
             * Caso tenha tags na procura
             */
            if($tags){

                /**
                 * Monta outro pedaço da query
                 */
                $query[] = [
                    '$unwind' => '$tags'
                ];

                /**
                 * Muda o valor de $tags
                 */
                $tags = [
                    '$match' => [
                        '$and' => $tags
                    ]
                ];

                /**
                 * Finaliza a query
                 */
                $query[] = $tags;
            }

            /**
             * Procura pelos produtos com a query acima e converte de
             * Mongo\Cursor para Array
             */
            $produtos = Produtos::aggregate($query)->toArray();

            /**
             * Seta a variável produtos
             */
            $this->view->produtos = $produtos;

            /**
             * Seta a variável departamentosfiltro departamentos
             */
            $this->view->departamentosfiltro = Departamentos::find(
                [
                    [
                        "nome" => $data["departamento"]
                    ]
                ]
            );

        }
        /**
         * Caso não tenha departamentos e tenha nome
         */
        else if($this->request->has("nome")){

            /**
             * Monta um pedaço da query
             */
            $query[] = [
                '$match' => [
                    "nome" => new Regex($data["nome"],"i")
                ]
            ];

            $query[] = [
                '$limit' => 200
            ];

            /**
             * Armazena as tags
             */
            $tags = [];

            /**
             * Percorre todos os parâmetros que foram passados
             */
            foreach ($data as $key => $item){

                /**
                 * Verifica se no parâmetro atual existe tag...
                 */
                if( strpos($key,"tag") > -1 ){

                    /**
                     * Adiciona a tags[] o valor atual
                     */
                    $tags[] = [
                        "tags" => $item
                    ];
                }

            }

            /**
             * Caso tenha tags
             */
            if($tags){

                /**
                 * Monta mais um pedaço da query
                 */
                $query[] = [
                    '$unwind' => '$tags'
                ];

                /**
                 * Redefine o valor de $tags
                 */
                $tags = [
                    '$match' => [
                        '$and' => $tags
                    ]
                ];

                /**
                 * Finaliza a query
                 */
                $query[] = $tags;
            }

            /**
             * Procura por produtos com a query montada e transforma de
             * Mongo\Cursor para Array
             */
            $produtos = Produtos::aggregate($query)->toArray();

            /**
             * Seta a variável de produtos
             */
            $this->view->produtos = $produtos;

        }

        /**
         * Caso não tenha nem nome e nem departamento nos parâmetros
         */
        else{

            /**
             * Seta a variável produtos
             */
            $this->view->produtos = [];

            /**
             * Seta o valor de busca
             */
            $this->view->busca = "~";
        }

    }

}