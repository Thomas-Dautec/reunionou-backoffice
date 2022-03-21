<?php

namespace reu\back1\app\model;

use \Psr\Http\Message\ServerRequestInterface as Request ;
use \Psr\Http\Message\ResponseInterface as Response ;
use Psr\Container\ContainerInterface;

class User extends \Illuminate\Database\Eloquent\Model{

    protected   $table      = 'user';
    protected   $primaryKey = 'id';
    public      $timestamps = false;

}
?>