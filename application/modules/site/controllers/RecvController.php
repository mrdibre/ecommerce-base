<?php

namespace Icontrole\Site\Controllers;

use Icontrole\Models\Clientes;

class RecvController extends BaseController {

    public function indexAction(){
        $this->assets->addJs("js/custom/recv.js");
    }

    public function recuperarAction($email){

        $newpasswd = md5(uniqid($email,true));

        $user = Clientes::find([["email"=>$email]]);

        if($user){

            die(
                json_encode(
                    [
                        "status" => "success",
                        "reason" => $newpasswd
                    ]
                )
            );

        }
        else{
            die(
                json_encode(
                    [
                        "status" => "error",
                        "reason" => "Email não encontrado"
                    ]
                )
            );
        }

    }

}