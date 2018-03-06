<?php

class Pokemons extends Controller{

    function xpchart(){
        $poke = new Pokemon();
        parent::render('pages.pokemons.xpchart',['pokemon'=>$poke]);
    }

    function index(){
        $poke = new Pokemon();
        $poke->setLevel(46);
        parent::render('pages.pokemons.main',['pokemon'=>$poke]);
    }

}