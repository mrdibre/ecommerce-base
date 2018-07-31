<?php


namespace Icontrole\Icontrole\Controllers;


class EntregaController extends BaseController
{

    public function indexAction()
    {
        $this->tag->setTitle("Administradores");
        $this->assets->addJs("icontrole/entrega.bundle.js");
    }

}