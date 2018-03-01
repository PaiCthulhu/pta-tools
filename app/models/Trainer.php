<?php
class Trainer extends Model {
    const statNames = ['HP','ATK','DEF','S.ATK', 'S.DEF','SPD'];
    protected $name, $playerName, $age, $gender, $height, $weight, $level,
        $baseStat, $startingPoints, $stats, $combatStages;

    function __construct(){
        $this->name = 'Unknown';
        $this->playerName = 'NPC';
        $this->age = 0;
        $this->gender = 0;
        $this->height = 0;
        $this->weight = 0;
        $this->level = 0;
        $this->baseStat = 6;
        $this->startingPoints = 30;
        foreach (self::statNames as $stat){
            $this->stats[$stat] = $this->baseStat;
            $this->combatStages[$stat] = 0;
        }
        parent::__construct();
    }

    function load($id){
        $trainer = parent::get($id);
        $this->name = $trainer->name;
        $this->playerName = $trainer->player_name;
        $this->age = $trainer->age;
        $this->gender = $trainer->gender;
        $this->height = $trainer->height;
        $this->weight = $trainer->weight;
        $this->level = $trainer->level;
        foreach (self::statNames as $stat){
            $this->stats[$stat] = $this->baseStat;
            $this->combatStages[$stat] = 0;
        }
    }

    function level(){
        return $this->level;
    }

    function titledName(){
        return 'Trainer '.$this->name;
    }

    function player(){
        return $this->playerName;
    }

    function age(){  return $this->age; }
    function height(){  return $this->height; }
    function weight(){  return $this->weight; }

    function stat($statName){
        return $this->stats[strtoupper($statName)];
    }

    function setStat(){

    }

    function combatStage($statName){
        return $this->combatStages[strtoupper($statName)];
    }

    function statMod($statName){
        $mod = $this->stats[strtoupper($statName)]-10;
        if($mod > 0)
            $mod /= 2;

        return floor($mod);
    }

    function maxHP(){
        return $this->stat(self::statNames[0])*4+$this->level()*4;
    }

    function perception(){
        return $this->plusSign($this->statMod(self::statNames[4]));
    }

    function evasion($stat){
        if(!in_array(strtoupper($stat),[self::statNames[2],self::statNames[4],self::statNames[5]]))
            return -1;
        $spl = (strtoupper($stat) == self::statNames[5])? 10:5;
        return floor($this->stat($stat) / $spl);
    }

    function spdEvasion(){ return $this->plusSign($this->evasion(self::statNames[5]));}
    function defEvasion(){ return $this->plusSign($this->evasion(self::statNames[2]));}
    function sdefEvasion(){ return $this->plusSign($this->evasion(self::statNames[4]));}

    function maxStats(){
        return $this->baseStat*6+$this->startingPoints+$this->level;
    }

    function plusSign($val){
        if($val > 0)
            return "+".$val;
        else if ($val == 0)
            return " - ";
        return $val;
    }
}