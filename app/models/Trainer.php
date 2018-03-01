<?php
class Trainer extends Model {
    const statNames = ['HP','ATK','DEF','S.ATK', 'S.DEF','SPD'];
    protected $name, $playerName, $age, $gender, $height, $weight, $level,
        $baseStat, $baseMax, $startingPoints, $stats, $combatStages, $errors,
        $trainer_id, $secret_id;

    function __construct($id = null){
        $this->name = 'Unknown';
        $this->playerName = 'NPC';
        $this->trainer_id = $this->secret_id = $this->age = $this->gender =
                            $this->height = $this->weight = $this->level = 0;
        $this->baseStat = 6;
        $this->baseMax = 14;
        $this->startingPoints = 30;
        foreach (self::statNames as $stat){
            $this->stats[$stat] = $this->baseStat;
            $this->combatStages[$stat] = 0;
        }
        $this->errors = [];
        parent::__construct();
        if(!empty($id))
            $this->load($id);
    }

    function load($id){
        $trainer = parent::get($id);
        $trainer->stats = json_decode($trainer->stats);
        $this->name = $trainer->name;
        $this->playerName = $trainer->player_name;
        $this->age = $trainer->age;
        $this->gender = $trainer->gender;
        $this->height = $trainer->height;
        $this->weight = $trainer->weight;
        $this->level = $trainer->level;
        $this->secret_id = $trainer->trainer_id;
        $this->trainer_id = $trainer->trainer_code;
        foreach (self::statNames as $i=>$stat){
            $this->setStat($stat, $trainer->stats[$i]);
        }
    }

    function trainerId(){
        return $this->trainer_id;
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

    function setStat($statName, $value){
        $return = false;
        if(!in_array($statName, self::statNames))
            $this->errors[] = "Invalid Stat Name: \"{$statName}\"";
        else if($value < 6)
            $this->errors[] = "Invalid Stat Value ({$statName}): Trainer stats can't be less than 6";
        else if($this->statsTotal()+($value-$this->stats[$statName]) > $this->statsMaxTotal())
            $this->errors[] = "Invalid Stat Value ({$statName}): Total stats would break max stats (".($this->statsTotal()+$value)." > {$this->statsMaxTotal()} - ".json_encode($this->stats).")";
        else if($value > ($this->level()+$this->baseMax))
            $this->errors[] = "Invalid Stat Value ({$statName}): Stat value is over what is avaiable for you level";
        else{
            $return = true;
            $this->stats[$statName] = $value;
        }

        return $return;
    }

    /**
     * Sum of all trainer stats points
     * @return int
     */
    function statsTotal(){
        $total =    $this->stats[self::statNames[0]] +
                    $this->stats[self::statNames[1]] +
                    $this->stats[self::statNames[2]] +
                    $this->stats[self::statNames[3]] +
                    $this->stats[self::statNames[4]] +
                    $this->stats[self::statNames[5]];
        return $total;
    }

    function statsMaxTotal(){
        $base = $this->baseStat * 6 + $this->startingPoints;
        if($this->level() > 10)
            return $base + 10 + ($this->level()-10)/2;
        else
            return $base+$this->level();

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