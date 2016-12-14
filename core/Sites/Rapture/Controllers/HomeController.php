<?php

namespace SGBD\Sites\Rapture\Controllers;

use \SGBD\App;
use \SGBD\Sites\Rapture\Models\User;
use \SGBD\Sites\Rapture\Models\Place;
use \SGBD\Sites\Rapture\Models\Trip;

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
        $data['user'] = User::getCurrent([':id' => 4]);
        $data['currency'] = User::getCurrency([':id' => $data['user']->id]);
        $data['places'] = Place::listPopular([':locale' => $data['user']->locale]);
        $data['trips'] = $this->updatePrices(Trip::listFeatured(), $data['currency']);

        // Ajouter une entrée dans le tableau des variables
        // et récupérer un résultat de la base de données :
        // $data['user'] = User::getCurrent([':id' => 1]);
        return App::getView('home', null, $data);
    }

    public function updatePrices($trips, $currency)
    {
        foreach($trips as $trip){
            // assigner à $trip->price :
            // - le symbole de la currency
            // - un espace
            // - la valeur "humaine" du prix dans la bonne currency
            $trip->price = $currency->symbol . ' ' . round(($trip->price/100 * $currency->rate), 2);
        }
        return $trips;
    }
}
