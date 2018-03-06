<?php

class Natures extends Controller{

    function index(){
        $nats = new Nature();
        parent::render('pages.natures.main',['natures'=>$nats->all()]);
    }

}