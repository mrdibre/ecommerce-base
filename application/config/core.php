<?php

$parameters = include_once __DIR__ . '/parameters.php';
$modules = include_once __DIR__ . '/modules.php';

return [
    'application' => [
        'modules' => &$modules,
        'registerNamespaces' => [
            'Icontrole\Base\Controllers' => APP_PATH . '/common/controllers',
            'Icontrole\Base\Models'      => APP_PATH . '/common/models',
            'Icontrole\Base\Forms'       => APP_PATH . '/common/forms',
            'Icontrole\Base\Plugins'     => APP_PATH . '/common/plugins',
            'Icontrole\Library'          => APP_PATH . '/common/library'
        ],
        'registerDirs' => [
        ]
    ],
    'services' => [
        'view' => [
            'className' => function () {
                $view = new \Phalcon\Mvc\View();

                $view->registerEngines([
                    '.volt'  => 'voltService',
                    '.phtml' => 'voltService'
                ]);

                $view->setViewsDir(APP_PATH . '/common/views/_main/');
                $view->setLayoutsDir(APP_PATH . '/common/views/_layouts/');
                $view->setPartialsDir(APP_PATH . '/common/views/_partials/');
                $view->setMainView(APP_PATH . '/common/views/_main/main');

                return $view;
            },
            'shared' => true
        ],

        'voltService' => [
            'className' => function ($view, $di) {
                $volt = new \Phalcon\Mvc\View\Engine\Volt($di->get('view'), $di);

                $volt->setOptions(
                    [
                        'compiledPath'      => ROOT_PATH . '/cache/volt/',
                        'compiledExtension' => '.compiled',
                        'compiledSeparator' => '_'
                    ]
                );

                $compiler = $volt->getCompiler();
                $compiler->addFilter('number_format', 'number_format');

                $compiler->addFunction('format', function ($resolvedArgs,$exprArgs) use ($compiler){

                    $arr = $exprArgs[0]['expr'];

                    return "number_format($arr,2, ',' ,'')";

                });

                $compiler->addFunction('exp', function ($resolvedArgs, $exprArgs) use ($compiler) {
                    return "explode('-',$resolvedArgs)[0]";
                });

                $compiler->addFunction('vue', function ($resolvedArgs, $exprArgs) use ($compiler) {
                    $value = $compiler->expression($exprArgs[0]['expr']);

                    return '"{{".' . $value . '."}}"';
                });

                return $volt;
            },
            'shared' => true
        ],

        'router' => [
            'className' => function () use ($modules) {
                $router = new \Phalcon\Mvc\Router();

                $router->setDefaultModule('site');

                $router->removeExtraSlashes(true);
                //$router->setUriSource(\Phalcon\Mvc\Router::URI_SOURCE_SERVER_REQUEST_URI);

                $router->add('',[
                    "module" => "site",
                    "controller" => "index",
                    "action" => "index"
                ]);

                $router->add("/:controller/:action",[
                    "controller" => 1,
                    "action" => 2
                ]);

                $icontrole = new \Phalcon\Mvc\Router\Group([
                    'module' => 'icontrole'
                ]);

                $icontrole->setPrefix("/icontrole");

                $icontrole->add("",[
                    'module'     => 'icontrole',
                    'controller' => 'index',
                    'action'     => 'index'
                ]);

                $icontrole->add( '/:controller', [
                    'controller' => 1,
                    'action'     => 'index',
                    'params'     => 'index'
                ]);

                $icontrole->add( '/:controller/:action', [
                    'controller' => 1,
                    'action'     => 2,
                    'params'     => 'index'
                ]);

                $icontrole->add( '/:controller/:action/:params', [
                    'controller' => 1,
                    'action'     => 2,
                    'params'     => 3
                ]);

                $router->mount($icontrole);

                return $router;
            }
        ],

        'url' => [
            'className' => function () {
                $url = new \Phalcon\Mvc\Url();

                $url->setBaseUri('/');
                $url->setStaticBaseUri('/assets/');

                return $url;
            },
            'shared' => true
        ],
        'mongo' => [
            'className' => function () {

                $server   = "mongodb://localhost";
                //$server   = "mongodb://webearte:webe2017@cluster0-shard-00-00-l04rp.mongodb.net:27017,cluster0-shard-00-01-l04rp.mongodb.net:27017,cluster0-shard-00-02-l04rp.mongodb.net:27017/udipop?ssl=true&replicaSet=Cluster0-shard-0&authSource=admin";
                $mongo = new \Phalcon\Db\Adapter\MongoDB\Client($server);

                return $mongo->selectDatabase("casafeliz");
            },
            'shared' => true
        ],
        'collectionManager' => [
            'className' => new \Phalcon\Mvc\Collection\Manager(),
            'shared' => true
        ],
        'session' => [
            'className' => function () {
                $session = new Phalcon\Session\Adapter\Files();
                $session->start();
                return $session;
            }
        ]
    ],
    'paths' => [
        'modulesDir' => APP_PATH . '/modules/'
    ]
];
