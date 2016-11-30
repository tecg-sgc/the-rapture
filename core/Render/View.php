<?php

namespace SGBD\Render;

/**
* Cette classe est une instance d'une
* route du site
*/
class View
{
    protected $name;
    protected $layout;
    protected $variables;
    protected $file;

    public function __construct($name, $layout = null, $variables = [])
    {
        $this->name = $name;
        $this->layout = $layout ? $layout : null;
        $this->variables = is_array($variables) ? $variables : [];
        $this->file = $this->getBaseFile();
    }

    public function isValid()
    {
        return is_string($this->file);
    }

    public function apply()
    {
        extract($this->variables);
        include($this->file);
    }

    protected function getBaseFile()
    {
        $path = explode('.', is_null($this->layout) ? $this->name : $this->layout);
        return realpath(SITE_PATH . 'Views' . DS . implode(DS, $path) . '.php');
    }
}
