<?php
class Pokemon extends Model{
    const   BASE_XP = 25,
            XP_BREAKPOINTS = [3=>2,6=>4,10=>2.5,12=>2,20=>1.5, 30=>1.66667, 40=>2, 50=>2];
    protected $level, $xp;

    function __construct(){
        $this->setLevel(1);
        parent::__construct();
    }


    /* - XP - */
    function setLevel($lv){
        $this->level = $lv;
        $this->xp = $this->xpLevel();
    }
    function getLevel(){ return $this->level; }
    protected function levelUp(){
        $this->level++;
    }


    /* - XP - */
    function setXp($xp){
        while($xp > $this->getXpNext())
            $this->levelUp();
        $this->xp = $xp;
    }
    function getXp(){ return $this->xp(); }
    function getXpNext(){ return self::xpNeeded($this->level + 1); }
    function currentXp(){ return self::numberFormat($this->xp); }
    function xpLevel(){ return self::xpNeeded($this->level);}
    function xpNext(){
        return self::numberFormat(self::xpNeeded($this->level + 1));
    }
    static function xpNeeded($level){
        $xp = 0;
        for ($lv = $level;$lv>1;$lv--){
            $mult =1;
            foreach (self::XP_BREAKPOINTS as $i=>$bp)
                if($lv > $i)
                    $mult *= $bp;
            $xp += floor($mult*self::BASE_XP);
        }
        return $xp;
    }

    function evasion($stat){
        if(!in_array(strtoupper($stat),[self::statNames[2],self::statNames[4],self::statNames[5]]))
            return -1;
        $spl = (strtoupper($stat) == self::statNames[5])? 10:5;
        return floor($this->stat($stat) / $spl);
    }

}