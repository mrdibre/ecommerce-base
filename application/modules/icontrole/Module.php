<?php

namespace Icontrole\Icontrole;

use Phalcon\DiInterface;
use Phalcon\Loader;
use Phalcon\Mvc\ModuleDefinitionInterface;

class Module implements ModuleDefinitionInterface
{
    public function registerAutoloaders(DiInterface $di = null)
    {
        $loader = new Loader();

        $loader->registerNamespaces([
            __NAMESPACE__ . '\\Controllers' => APP_PATH . '/modules/icontrole/controllers',
            __NAMESPACE__ . '\\Models'      => APP_PATH . '/modules/icontrole/models',
            __NAMESPACE__ . '\\Forms'       => APP_PATH . '/modules/icontrole/forms'
        ]);

        $loader->register();
    }

    public function registerServices(DiInterface $di)
    {
        /**
         * @var $dispatcher \Phalcon\Mvc\Dispatcher
         */
        $dispatcher = $di->get('dispatcher');
        $dispatcher->setDefaultNamespace(__NAMESPACE__ . '\\Controllers');

        /**
         * @var $view \Phalcon\Mvc\View
         */
        $view = $di->get('view');
        $view->setLayout('index');
        $view->setViewsDir(__DIR__ . '/views/');
        $di->set('view', $view);
    }
}