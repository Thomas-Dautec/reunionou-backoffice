<?php
    /**
     * 
     * File: index.php
     * 
     */

    //require_once __DIR__ . '/../src/t.php' ;
    require_once __DIR__ . '/../src/vendor/autoload.php' ;

    use \Psr\Http\Message\ServerRequestInterface as Request;
    use \Psr\Http\Message\ResponseInterface as Response;

    use \reu\back1\app\controller\Reu_Controller as Reu_Controller;
    use \reu\back1\app\model\User;

    $conf = parse_ini_file(__DIR__ .'/../src/app/conf/back1.db.conf.ini.dist'); 

    $capsule = new \Illuminate\Database\Capsule\Manager;

    $capsule->addConnection($conf);
    $capsule->bootEloquent();
    $capsule->setAsGlobal();
    
    $config = require_once __DIR__. '/../src/app/conf/settings.php';
    $deps = require_once __DIR__.'/../src/app/conf/deps.php';

    $c=new \Slim\Container(array_merge($config, $deps));

    $app = new \Slim\App($c);

    $app->get('/hello/{name}',
        function (Request $req, Response $resp, $args) {
            $name = $args['name'];
            $dbfile = $this->settings['dbfile'];

            $r = User::select()->get();
            foreach($r as $l){
            echo $l->fullname; 
            echo " ";
            }

            $resp->getBody()->write("<h1>Hello, $name </h1> <h2>$dbfile</h2>");
            return $resp;
        }
    );

    //Route pour retourner les users 
    $app->get('/users[/]', Reu_Controller::class.':getAllUsers');

    //Route pour retourner un user
    $app->get('/users/{id}[/]', Reu_Controller::class.':oneUser');

    //Route pour retourner les événements
    $app->get('/events[/]', Reu_Controller::class.':getAllEvents');

    //Route pour retourner un événement
    $app->get('/events/{id}[/]', Reu_Controller::class.':oneEvent');

    //Route pour retourner le contenu de tous les événements
    $app->get('/comments[/]', Reu_Controller::class.':getAllComments');

    //Route pour retourner le contenu d'un événement
    $app->get('/comments/{id}[/]', Reu_Controller::class.':oneComment');


    $app->run();
