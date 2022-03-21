<?php
    print 'hello';
    require_once __DIR__ . '/../src/t.php' ;
    require_once __DIR__ . '/../src/vendor/autoload.php' ;

    $settings = require_once __DIR__. '/../src/app/conf/settings.php';

    $app = new \Slim\App();

    $capsule = new \Illuminate\Database\Capsule\Manager;
    $capsule->addConnection($app_config['settings']['dbfile']);
    $capsule->bootEloquent();
    $capsule->setAsGlobal();

    test();
