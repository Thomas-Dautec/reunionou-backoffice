<?php

namespace reu\back1\app\utils;

use \Psr\Http\Message\ResponseInterface as Response ;

class Writer{

    public static function json_output(Response $rs, int $code, array $data=null) : Response{

        $rs = $rs->withStatus($code)->withHeader('Content-Type', 'application/json;charset=utf-8');
        if(!is_null($data)){
            $rs->getBody()->write(json_encode($data));
        }
        return $rs;
    }

    public static function json_error(Response $rs, int $code, $message, $url=null) : Response{

        $rs = $rs->withStatus($code)->withHeader('Content-Type', 'application/json;charset=utf-8');
        $data = [
            'type' => 'error',
            'error' => $code,
            'message' => $message
        ];
        if($url){
            $data['redirect'] = $url;
        }
        $rs->getBody()->write(json_encode($data));
        return $rs;

    }
}