<?php

namespace Icontrole\Library\Payment\PagSeguro\Sensitive;

class App{

    public $cmsV;
    public $cmsN;
    public $modV;
    public $modN;

    public function __construct(){
        $this->setCmsV("1.0.0");
        $this->setCmsN("UDIPOP");
        $this->setModV("1.0.0");
        $this->setModN("UDIPOP");
    }

    /**
     * @return mixed
     */
    public function getCmsV()
    {
        return $this->cmsV;
    }

    /**
     * @param mixed $cmsV
     */
    public function setCmsV($cmsV)
    {
        $this->cmsV = $cmsV;
    }

    /**
     * @return mixed
     */
    public function getCmsN()
    {
        return $this->cmsN;
    }

    /**
     * @param mixed $cmsN
     */
    public function setCmsN($cmsN)
    {
        $this->cmsN = $cmsN;
    }

    /**
     * @return mixed
     */
    public function getModV()
    {
        return $this->modV;
    }

    /**
     * @param mixed $modV
     */
    public function setModV($modV)
    {
        $this->modV = $modV;
    }

    /**
     * @return mixed
     */
    public function getModN()
    {
        return $this->modN;
    }

    /**
     * @param mixed $modN
     */
    public function setModN($modN)
    {
        $this->modN = $modN;
    }

}