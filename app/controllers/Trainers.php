<?php

class Trainers extends Controller{
    function add(){
        $trainer = new Trainer();
        self::render('pages.trainers.add', ['trainer'=>$trainer]);
    }

    function sheet($id){
        $trainer = new Trainer($id);
        self::render('pages.trainers.view', ['trainer'=>$trainer]);
    }

}