<?php

namespace SGBD\Sites\Rapture\Controllers;

use \SGBD\App;
use \SGBD\Sites\Rapture\Models\User;

/**
* Cette classe gère l'affichage de la 
* page d'accueil
*/
class HomeController
{
    public function show()
    {
        $data = [];
        $data['title'] = 'The Rapture - Agence de voyage';
        // Ajouter une entrée dans le tableau des variables
        // et récupérer un résultat de la base de données :
        // $data['user'] = User::getCurrent([':id' => 1]);
        return App::getView('home', null, $data);
    }
}
