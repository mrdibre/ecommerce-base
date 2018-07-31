<?php

namespace Icontrole\Library\Payment\PagSeguro\Config;

use Icontrole\Library\Payment\PagSeguro\Sensitive\App;

/**
 * Class PagSeguroConfig
 * @package Icontrole\Library\Payment\PagSeguro\Config
 * Ex.:
 * $config = new PagSeguroConfig("email","token")
 *
 */
class PagSeguroConfig{

    /**
     * @var string $pagSeguroSession;
     */
    public $pagSeguroSession;

    /**
     * @return mixed
     */
    public function getSession()
    {
        return $this->pagSeguroSession;
    }

    /**
     * @param mixed $session
     */
    public function setSession($session)
    {
        $this->pagSeguroSession = $session;
    }

    public function __construct(string $email, string $token, string $env = "sandbox",string $charset = "UTF-8"){

        try {

            $_SESSION['PagSeguroDesativado'] = false;

            $app = new App();

            \PagSeguro\Library::initialize();
            \PagSeguro\Library::cmsVersion()->setName($app->getCmsN())->setRelease($app->getCmsV());
            \PagSeguro\Library::moduleVersion()->setName($app->getModN())->setRelease($app->getModV());

            \PagSeguro\Configuration\Configure::setEnvironment($env);
            \PagSeguro\Configuration\Configure::setAccountCredentials($email,$token);
            \PagSeguro\Configuration\Configure::setCharset($charset);
            \PagSeguro\Configuration\Configure::setLog(true, APP_PATH.'/common/library/Payment/Logs/Logs.log');

            $sessionCode = \PagSeguro\Services\Session::create(
                \PagSeguro\Configuration\Configure::getAccountCredentials()
            );
            $this->setSession( $sessionCode->getResult() );
        }
        catch (\Exception $e) {
            $_SESSION['PagSeguroDesativado'] = true;
        }

    }

}