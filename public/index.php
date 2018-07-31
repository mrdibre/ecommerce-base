<?php

define('ROOT_PATH', dirname(__DIR__));
define('APP_PATH', ROOT_PATH . '/application');
define('APPLICATION_ENV', getenv('APPLICATION_ENV') ? getenv('APPLICATION_ENV') : 'development');

include dirname(__DIR__) . '/vendor/autoload.php';

if (!class_exists(\Phalconit\Application::class)) {
    throw new RuntimeException(
        "Unable to load application\n"
        . "- Type `composer install` if you are developing locally."
    );
}

$config = require_once APP_PATH . '/config/core.php';

try {
    $app = new \Phalconit\Application('dev', $config);
    $app->bootstrap()->run();
} catch (Exception $e) {
    echo $e->getMessage();
}
