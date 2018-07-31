<?php

namespace Icontrole\Icontrole\Controllers;

use Icontrole\Models\Clientes;
use Icontrole\Models\Configpagamento;
use Icontrole\Models\Pedidos;
use Icontrole\Models\Produtos;
use Icontrole\Models\Seo;

/**
 * Class IndexController
 *
 * @property \Icontrole\Library\Bling\Bling $bling
 */
class IndexController extends BaseController {

    /**
     * @var Configpagamento $config;
     */
    public $config;

    public function initialize(){
        parent::initialize();
        $this->tag->setTitle("IControle");
        $this->assets->addJs("icontrole/dashboard.bundle.js");
    }

    public function indexAction(){
        if($this->request->isPost() && !$this->request->getJsonRawBody()){

            $dateorders = Pedidos::find();
            $products = [
                "Janeiro" => 0,
                "Fevereiro" => 0,
                "Março" => 0,
                "Abril" => 0,
                "Maio" => 0,
                "Junho" => 0,
                "Julho" => 0,
                "Agosto" => 0,
                "Setembro" => 0,
                "Outubro" => 0,
                "Novembro" => 0,
                "Dezembro" => 0
            ];

            foreach ($dateorders as $order){
                $data = date("m/Y",strtotime(str_replace("/","-",$order->data)));
                $data = explode("/",$data);
                $year = $data[1];
                $month = $data[0];

                if($year === date("Y")){
                    $month = $this->formatMonth( $month );
                    $products[$month] += 1;
                }

            }

            die(
            json_encode(
                [
                    "clients" => Clientes::count(),
                    "products" => Produtos::count(),
                    "orders" => Pedidos::count(),
                    "seo" => Seo::findFirst(),
                    "lastorders" => Pedidos::find([[],["limit" => 8, "sort" => ["_id" => -1]]]),
                    "dateorders" => $products
                ]
            )
            );
        }
        else if($this->request->getJsonRawBody("updateseo")){
            $data = $this->request->getJsonRawBody()->item;

            if(Seo::findFirst([])){
                /**
                 * @var Seo $seo
                 */
                $seo = Seo::findFirst();
                $seo->setTitle($data->title);
                $seo->setKeywords($data->keywords);
                $seo->setTags($data->tags);
                $seo->setDescription($data->description);

                $seo->save() ? die("saved") : die(json_encode(["reason"=>$seo->getMessages()]));

            }
            else{
                $seo = new Seo();
                $seo->setTitle($data->title);
                $seo->setKeywords($data->keywords);
                $seo->setTags($data->tags);
                $seo->setDescription($data->description);

                $seo->create() ? die("created") : die(json_encode(["reason"=>$seo->getMessages()]));

            }

        }
    }

    public function formatMonth($month){
        $month = (int) $month;

        switch ($month){
            case 1;
                return "Janeiro";
            case 2:
                return "Fevereiro";
            case 3:
                return "Março";
            case 4:
                return "Abril";
            case 5:
                return "Maio";
            case 6:
                return "Junho";
            case 7;
                return "Julho";
            case 8:
                return "Agosto";
            case 9:
                return "Setembro";
            case 10:
                return "Outubro";
            case 11:
                return "Novembro";
            case 12:
                return "Dezembro";
        }
    }

}