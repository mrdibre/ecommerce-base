<?php

namespace Icontrole\Icontrole\Controllers;

use Icontrole\Models\Clientes;

class ClientesController extends BaseController
{

    public function indexAction(){
        $this->tag->setTitle("Administradores");
        $this->assets->addJs("icontrole/clientes.bundle.js");

        if($this->request->isPost()){
            die(
                json_encode(
                    [
                        "clients" => Clientes::find()
                    ]
                )
            );
        }

    }

}