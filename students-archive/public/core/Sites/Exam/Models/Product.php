<?php

namespace SGBD\Sites\Exam\Models;

use \SGBD\App;
use \SGBD\BaseModel;

class Product extends BaseModel
{
    protected $folder = 'examen';

    static function makeRequest($term)
    {
        $response = self::getInstance()->loadRequest(':term',$term);
        if($response) return $response->fetchAll();
        return false;
    }
}
