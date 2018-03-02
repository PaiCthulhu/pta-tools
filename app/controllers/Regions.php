<?php

class Regions extends Controller{

    static function tag($id){
        $reg = new Region();
        $reg = $reg->load($id);
        parent::render('pages.regions.tag', ['region'=>$reg]);
    }

}