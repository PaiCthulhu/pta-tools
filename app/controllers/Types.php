<?php

class Types extends Controller{
    function tablematch(){
        $types = new Type();
        self::render('pages.typematch', ['types'=>$types->all()]);
    }
}