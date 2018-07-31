<?php

namespace Icontrole\Icontrole\Controllers;

use Icontrole\Models\Departamentos;
use Icontrole\Models\Produtos;
use Icontrole\Models\Tags;
use Phalcon\Mvc\Controller;
use stdClass;

class DepartamentosController extends BaseController {

    public function initialize(){
        $this->tag->setTitle("Departamentos");
        $this->assets->addJs("icontrole/departamentos.bundle.js");
    }

    public function indexAction(){}

    public function getinfoAction(){

        die(
        json_encode(
            [
                "tags" => Tags::find(),
                "departamentos" => Departamentos::find()
            ]
        )
        );

    }

    //////////////////////////
    /// DEPARTAMENTOS
    //////////////////////////

    public function newdepartamentAction(){

        $data = $this->request->getJsonRawBody();

        $departament = new Departamentos();
        $departament->setNome($data->nome);
        $departament->setCategorias($data->categorias);

        if($departament->create()){

            die(

            json_encode(

                [
                    "status" => "success",
                    "_id"    => $departament->getId()
                ]

            )

            );

        }
        else{

            die(

            json_encode(

                [
                    "status" => "error",
                    "messages" => $departament->getMessages()
                ]

            )

            );

        }

    }

    public function deletedepartamentAction($id){

        $checkproduct = Produtos::find(
            [
                [
                    "departamento._id" => $id
                ]
            ]
        );

        if($checkproduct){
            die(
                json_encode(
                    [
                        "status" => "error",
                        "message" => "Departament in use"
                    ]
                )
            );
        }
        else{
            $dep = Departamentos::findById($id);

            if($dep->delete()){
                die(
                    json_encode(
                        [
                            "status" => "success"
                        ]
                    )
                );
            }
            else{
                die(
                json_encode(
                    [
                        "status" => "error",
                        "message" => $dep->getMessages()
                    ]
                )
                );
            }
        }

    }

    //////////////////////////
    /// TAGS
    //////////////////////////

    public function newtagAction(){

        $nome = ($this->request->getJsonRawBody())->nome;

        $tag = new Tags();
        $tag->setNome($nome);

        if($tag->create()){

            die(

                json_encode(

                    [
                        "status" => "success",
                        "_id"    => $tag->getId()
                    ]

                )

            );

        }
        else{

            die(

                json_encode(

                    [
                        "status" => "error",
                        "messages" => $tag->getMessages()
                    ]

                )

            );

        }

    }

    public function deletetagAction($id){

        $tag = Tags::findById($id);

        if($tag->delete()){

            die(

            json_encode(

                [
                    "status" => "success"
                ]

            )

            );

        }
        else{

            die(

            json_encode(

                [
                    "status" => "error",
                    "messages" => $tag->getMessages()
                ]

            )

            );

        }

    }

}
