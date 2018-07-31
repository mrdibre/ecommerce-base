<?php

namespace Icontrole\Icontrole\Controllers;

use Icontrole\Models\Administradores;

class AdministradoresController extends BaseController
{

    public function indexAction(){
        $this->tag->setTitle("Administradores");
        $this->assets->addJs("icontrole/administradores.bundle.js");

        if($this->request->isPost()){
            die(
                json_encode(
                    [
                        "adms" => Administradores::find()
                    ]
                )
            );
        }

    }

    public function createAction(){

        $data = $this->request->getJsonRawBody()->administradores;

        /**
         * @var Administradores $adm
         */
        $adm = new Administradores();
        $adm->setEmail($data->email);
        $adm->setName($data->name);
        $adm->setPasswd($data->passwd);

        if($adm->create()){
            die(
            json_encode(
                [
                    "status" => "success",
                    "id" => $adm->getId()
                ]
            )
            );
        }

        die(
        json_encode(
            [
                "status" => "error",
                "response" => $adm->getMessages()
            ]
        )
        );

    }

    public function deleteAction($id){

        /**
         * @var Administradores $adm
         */
        $adm = Administradores::findById($id);

        if($adm->delete()){
            die(
                json_encode(
                    [
                        "status" => "success"
                    ]
                )
            );
        }

        die(
            json_encode(
                [
                    "status" => "error",
                    "response" => $adm->getMessages()
                ]
            )
        );

    }

    public function updateAction(){
        $data = $this->request->getJsonRawBody()->administradores;

        /**
         * @var Administradores $adm
         */
        $adm = Administradores::findById($data->_id->{'$oid'});
        $adm->setEmail($data->email);
        $adm->setName($data->name);
        $adm->setPasswd($data->passwd);

        if($adm->save()){
            die(
            json_encode(
                [
                    "status" => "success"
                ]
            )
            );
        }

        die(
        json_encode(
            [
                "status" => "error",
                "response" => $adm->getMessages()
            ]
        )
        );
    }

}