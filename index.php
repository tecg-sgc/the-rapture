<?php

/* ************************************
 * Systèmes de gestion de contenu - TP
 * Par Toon Van den Bos
 * Septembre 2016
 * ************************************/

//  load base constants
require_once(__DIR__ . DIRECTORY_SEPARATOR . 'config' . DIRECTORY_SEPARATOR . 'paths.php');


/* ***
 *
 * Curieux de voir comment ça fonctionne dans les rouages ? Super !
 * Fais le tour dans les fichiers *.php et essayes de comprendre
 * ce qu'il s'y passe, c'est un très bon entrainement pour la suite
 * des cours de web.
 * ---
 * La documentation officielle de PHP se trouve à cette adresse :
 * http://php.net/docs.php
 *
 * Le champ de recherche te permettra de trouver toutes les fonctions
 * de bases de PHP utilisées dans cet exemple.
 * ---
 * Bonne découverte !
 *
 * **/


//  include configuration
require_once(CONFIG_PATH . 'database.php');

//  include autoload
require_once(CORE_PATH . 'autoload.php');

//  launch example website
$site = new \SGBD\App();
$site->boot('rapture');
