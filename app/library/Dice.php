<?php

require_once ROOT.'/vendor/DiceCalc/Random.php';
require_once ROOT.'/vendor/DiceCalc/Calc.php';
require_once ROOT.'/vendor/DiceCalc/CalcSet.php';
require_once ROOT.'/vendor/DiceCalc/CalcDice.php';
require_once ROOT.'/vendor/DiceCalc/CalcOperation.php';

class Dice{


    static function roll($str){
        $die = new \DiceCalc\Calc($str);
        return $die();
    }



}