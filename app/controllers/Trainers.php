<?php

class Trainers extends Controller{
    function add(){
        $trainer = new Trainer();
        self::render('pages.trainers.add', ['trainer'=>$trainer]);
    }

}