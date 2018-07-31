<?php

namespace Icontrole\Models;

use Phalcon\Mvc\MongoCollection;

class Banners extends MongoCollection {

    public function initialize(){
        $this->setSource("banners");
    }

    /**
     * @var string $title
     * Ex.: Desconto de 10% no Google Home
     */
    public $title;

    /**
     * @var string $link
     * Ex.: site.com.br/produto/google-home
     */
    public $link;

    /**
     * @var float|int $price
     * Ex.: 1200.00
     */
    public $price;

    /**
     * @var string $primaryImage
     * Ex.: foto_do_google_home.png
     */
    public $primaryImage;

    /**
     * @var string $secondaryImage
     * Ex.: logo_da_google.png
     */
    public $secondaryImage;

    /**
     * @return string
     */
    public function getTitle(): string
    {
        return $this->title;
    }

    /**
     * @param string $title
     */
    public function setTitle(string $title)
    {
        $this->title = $title;
    }

    /**
     * @return string
     */
    public function getLink(): string
    {
        return $this->link;
    }

    /**
     * @param string $link
     */
    public function setLink(string $link)
    {
        $this->link = $link;
    }

    /**
     * @return float|int
     */
    public function getPrice()
    {
        return $this->price;
    }

    /**
     * @param float|int $price
     */
    public function setPrice($price)
    {
        $this->price = $price;
    }

    /**
     * @return string
     */
    public function getPrimaryImage(): string
    {
        return $this->primaryImage;
    }

    /**
     * @param string $primaryImage
     */
    public function setPrimaryImage(string $primaryImage)
    {
        $this->primaryImage = $primaryImage;
    }

    /**
     * @return string
     */
    public function getSecondaryImage(): string
    {
        return $this->secondaryImage;
    }

    /**
     * @param string $secondaryImage
     */
    public function setSecondaryImage(string $secondaryImage)
    {
        $this->secondaryImage = $secondaryImage;
    }

}