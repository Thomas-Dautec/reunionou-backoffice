<?php

namespace reu\back1\app\controller;

use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

//Model
use \reu\back1\app\model\User as User;
use \reu\back1\app\model\Event as Event;

//Error

class Reu_Controller {

    private $container;

    public function __construct(\Slim\Container $container){
        $this->container = $container;
    }

    ///////////////USER//////////////

    public function getAllUser(Request $req, Response $resp, array $args): Response {
        
        //Get all the Users
        $users = User::select(['id', 'mail', 'fullname', 'username', 'password'])
            ->get();
        
        //complete the data 
        $data = [
            "type" => "collection",
            "count" => count($users),
            "users" => $users,
        ];

        //Configure the response headers
        $resp = $resp->withStatus(200)
            ->withHeader('Content-Type', 'application/json; charset=utf-8');

        //Write in the body with data encode with json_encode
        $resp->getBody()->write(json_encode($data));

        //Return the response
        return $resp;

    }

    public function OneUser(Request $req, Response $resp, array $args): Response {

        //Get the id in the URI
        $id = $args['id'];

        //Get the user with some id
        $user = User::select(['id', 'mail', 'fullname', 'username', 'password'])
            ->where('id', '=', $id);

        //Complete the data
        $data = [
            "type" => "ressource",
            "user" => $user,
        ];

        //Configure the response header
        $resp = $resp->withStatus(200)
            ->withHeader('Content-Type', 'application/json; charset=utf-8');
        
        //Write in the body with data encode a json_encode
        $resp->getBody()->write(json_encode($data));

        //Return the response 
        return $resp;

    } 

    ///////////////EVENT//////////////

    public function getAllEvent(Request $req, Response $resp, array $args): Response {

        //Get all the events
        $events = Event::select(['id', 'title', 'description', 'date', 'place', 'id_user'])
            ->get();

        //Complete the data
        $data = [
            "type" => "collection",
            "count" => count($users),
            "users" => $users,
        ];

        //Configure the response header
        $resp = $resp->withStatus(200)
            ->withHeader('Content-Type', 'application/json; charset=utf-8');

        //Write in the body with data encode with json_encode
        $resp->getBody()->write(json_encode($data));

        //Return the response 
        return $resp; 
    }

    public function OneEvent(Request $res, Response $resp, array $args): Response {

        //Get the id in the URI
        $id = $args['id'];

        //Get the event with some id
        $event = Event::select(['id', 'title', 'description', 'date', 'place', 'id_user'])
            ->where('id', '=', $id);

        //Complete the data
        $data = [
            "type" => "ressource",
            "event" => $event,
        ];

        //Configure the response header
        $resp = $resp->withStatus(200)
            ->withHeader('Content-Type', 'application/json; charset=utf-8');

        //Write in the body data encode with a json_encode
        $resp->getBody()->write(json_encode($data));

        //Return the response
        return $resp;
    }

    ///////////////COMMENT//////////////

    public function getAllComment(Request $req, Response $resp, array $args): Response {

        //Get all the comments
        $comments = Comment::select(['id', 'id_event', 'id_user', 'content'])
            ->get();

        //complete the data
        $data = [
            "type" => "collection", 
            "count" => count($comments),
            "comments" => $comments,
        ];

        //Configure the response header
        $resp = $resp->withStatus(200)
            ->withHeader('Content-Type', 'application/json; charset=utf-8');

        //Write in the body with data encode with json_encode
        $resp->getBody()->write(json_encode($data));

        //Return the response 
        return $resp;
    }

    public function OneComment(Request $res, Response $resp, array $args): Response {

        //Get the id in the URI
        $id = $args['id'];

        //Get the comment with some id
        $comment = Comment::select(['id', 'id_event', 'id_user', 'content'])
            ->where('id', '=', $id);

        //Complete the data
        $data = [
            "type" => "ressource",
            "comment" => $comment,
        ];

        //Configure the response header
        $resp = $resp->withStatus(200)
            ->withHeader('Content-Type', 'application/json; charset=utf-8');

        //Write in the body with data encode with json_encode
        $resp->getBody()->write(json_encode($data));

        //Return the response
        return $resp;
    }

}


?>