<?php

namespace Icontrole\Site;

use Phalcon\DiInterface;
use Phalcon\Loader;
use Phalcon\Mvc\ModuleDefinitionInterface;

class Module implements ModuleDefinitionInterface
{
    public function registerAutoloaders(DiInterface $di = null)
    {
        $loader = new Loader();

        $loader->registerNamespaces([
            __NAMESPACE__ . '\\Controllers' => APP_PATH . '/modules/site/controllers',
            __NAMESPACE__ . '\\Models'      => APP_PATH . '/modules/site/models',
            __NAMESPACE__ . '\\Forms'       => APP_PATH . '/modules/site/forms'
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
        //$view->setLayout('index');
        $view->setLayoutsDir(__DIR__.'/views/layout/');
        $view->setViewsDir(__DIR__ . '/views/');
        $view->setMainView("main/main");
        $di->set('view', $view);
    }
}