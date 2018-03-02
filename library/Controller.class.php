<?php
use eftec\bladeone;

class Controller{

    const VIEWS = ROOT.DS.'app'.DS.'views',
          CACHE = ROOT.DS.'tmp'.DS.'cache';
    protected $blade;

    function __construct(){
        $this->blade  = new eftec\bladeone\BladeOne(Controller::VIEWS, Controller::CACHE);
    }

    /**
     * @param array $params
     * @throws Exception Se o parâmetro não for array
     */
    function run($params = array()){
        $this->render(get_class($this),$params);
    }

    /**
     * @param $view
     * @param array $params
     * @throws Exception Se o parâmetro não for array
     */
    static function render($view, $params = array()){
        $blade = new eftec\bladeone\BladeOne(Controller::VIEWS, Controller::CACHE);
        if(!is_array($params))
            throw new Exception('Parâmetro não é array');
        $params['_page'] = $view;
        echo $blade->run($view,$params);
    }

}