<?php

namespace Icontrole\Models;

use Phalcon\Mvc\MongoCollection;

class Seo extends MongoCollection {

    public function initialize(){
        $this->setSource("seo");
    }

    /**
     * @var string $title
     * Ex.: Webearte Ecommerce
     */
    public $title;

    /**
     * @var string $keywords
     * Ex.: ecommerce, site ,webearte
     */
    public $keywords;


    /**
     * @var string tags
     * Ex.: ecommerce, site ,webearte (totalmente inútil)
     */
    public $tags;

    /**
     * @var string $description
     * Ex.: Essa é a descrição do ecommerce
     */
    public $description;

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
    public function getKeywords(): string
    {
        return $this->keywords;
    }

    /**
     * @param string $keywords
     */
    public function setKeywords(string $keywords)
    {
        $this->keywords = $keywords;
    }

    /**
     * @return string
     */
    public function getTags(): string
    {
        return $this->tags;
    }

    /**
     * @param string $tags
     */
    public function setTags(string $tags)
    {
        $this->tags = $tags;
    }

    /**
     * @return string
     */
    public function getDescription(): string
    {
        return $this->description;
    }

    /**
     * @param string $description
     */
    public function setDescription(string $description)
    {
        $this->description = $description;
    }

}