<?php

namespace Icontrole\Icontrole\Controllers;

use Phalcon\Mvc\Controller;

class BaseController extends Controller {

    public function initialize(){
        if(!$this->session->has("icontrole")){
            $this->response->redirect("icontrole/login");
        }
    }

    public function afterExecuteRoute(){
        if($this->session->has("PagSeguroDesativado") && $this->session->get("PagSeguroDesativado")){
            $this->flashSession->message("error","PagSeguro Desabilitado");
        }
    }

}