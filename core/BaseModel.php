<?php

namespace SGBD;

use \SGBD\App;

/**
* Cette classe sert de base à tous
* les modèles.
*/
class BaseModel
{
    public static $instance;

    protected $connexion;

    public function __construct()
    {
        try {
            $this->connexion = new \PDO('mysql:host=' . MYSQL_HOST . ';dbname=' . MYSQL_DBNAME . ';charset=utf8', MYSQL_USER, MYSQL_PASSWORD);
            $this->connexion->setAttribute(\PDO::ATTR_DEFAULT_FETCH_MODE, \PDO::FETCH_OBJ);
        } catch (\Exception $e) {
            die('Erreur : ' . $e->getMessage());
        }
    }

    public static function __callStatic($name, $args)
    {
        $args = isset($args[0]) ? $args[0] : [];
        if(strpos($name, 'get') === 0){
            $response = self::getInstance()->loadRequest(strtolower(substr($name, 3)), $args);
            if($response) return $response->fetch();
        }
        elseif(strpos($name, 'list') === 0){
            $response = self::getInstance()->loadRequest(strtolower(substr($name, 4)), $args);
            if($response) return $response->fetchAll();
        }
        return false;
    }

    public static function getInstance()
    {
        if(is_null(self::$instance)){
            $class = get_called_class();
            self::$instance = new $class();
        }
        return self::$instance;
    }

    public function loadRequest($file, $args)
    {
        if(!($path = realpath(SITE_PATH . 'Requests' . DS . $this->folder . DS . $file . '.sql'))) return null;
        return $this->execute(file_get_contents($path), $args);
    }

    public function execute($sql, $args)
    {
        if(count($args)){
            $result = $this->connexion->prepare($sql);
            $result->execute($args);
            return $result;
        }
        return $this->connexion->query($sql);
    }
}
