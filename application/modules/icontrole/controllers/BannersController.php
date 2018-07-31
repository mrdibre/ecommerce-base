<?php

namespace Icontrole\Icontrole\Controllers;

use Icontrole\Models\Banners;

class BannersController extends BaseController {

    public function initialize(){
        $this->tag->setTitle("Banners");
        $this->assets->addJs("icontrole/banners.bundle.js");
    }

    public function indexAction(){}

    public function insertAction(){

        $data = json_decode($this->request->getPost()["data"]);
        $images = $this->request->getUploadedFiles();

        $banner = new Banners();
        $banner->setTitle($data->title);
        $banner->setLink($data->link);
        $banner->setPrice($data->price);

        foreach ($images as $index => $image){

                $imagename =  uniqid(md5(rand(0,1000000)),true)."_".$image->getName();

                if($image->moveTo(ROOT_PATH."/public/assets/uploads/".$imagename)){
                    switch ($index){
                        case 0:
                            $banner->setPrimaryImage($imagename);
                            break;
                        case 1:
                            $banner->setSecondaryImage($imagename);
                            break;
                    }
                }
                else{
                    die(
                    json_encode(
                        [
                            "status" => "error",
                            "reason" => "Não foi possível upar a imagem ".$index
                        ]
                    )
                    );
                }

            }

        if($banner->create()){
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
                    "reason" => $banner->getMessages()
                ]
            )
            );
        }

    }

    public function getbannersAction(){
        die(
            json_encode(
                [
                    "banners" => Banners::find()
                ]
            )
        );
    }

    public function deleteAction($id){

        /**
         * @var Banners $banner
         */
        $banner = Banners::findById($id);

        if($banner){

            if($banner->delete()){
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
                            "reason" => $banner->getMessages()
                        ]
                    )
                );
            }

        }
        else{
            die(
                json_encode(
                    [
                        "status" => "error",
                        "reason" => "Banner não encontrado"
                    ]
                )
            );
        }

    }

}