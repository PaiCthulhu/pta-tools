<?php

class Skill extends Model{
    function __construct(){
        parent::__construct();
        $this->_table = 'trainer_skill';
    }

}