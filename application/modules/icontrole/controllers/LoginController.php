<?php


namespace Icontrole\Icontrole\Controllers;


use Icontrole\Models\Administradores;
use Phalcon\Mvc\View;

class LoginController extends \Phalcon\Mvc\Controller{

    public function initialize(){
        $this->view->setRenderLevel([
            View::LEVEL_MAIN_LAYOUT
        ]);
    }

    public function indexAction(){
        $this->tag->setTitle("Login");
        $this->assets->addJs("icontrole/login.bundle.js");
    }

    public function loginAction(){
        $dados = $this->request->getJsonRawBody();
        $dados = $dados->user;
        /**
         * @var Administradores $user;
         */
        $user = Administradores::findFirst(
            [
                "email" => $dados->email,
                "passwd" => $dados->password
            ]
        );

        if($user){
            $this->session->set("icontrole",$user->getName());
            die("login");
        }
        else{
            die("not found");
        }

    }

}