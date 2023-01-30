<?php

namespace SGBD\Sites\Exam\Controllers;

use \SGBD\App;
use \SGBD\Sites\Exam\Models\Product;

/**
* Cette classe gère l'affichage de la 
* page d'accueil
*/
class HomeController
{
    public function show()
    {
        $data = [];
        $data['term'] = isset($_GET['search']) && strlen($_GET['search']) ? $_GET['search'] : 'boulette';
        $data['results'] = Product::makeRequest($data['term']);
        return App::getView($data);
    }
}
