<?php
class Model{
    protected $db, $_table;

    function __construct(){
        $this->db = new DB(DB_HOST, DB_USER, DB_PSWD, DB_NAME);
        $this->_table = strtolower(get_class($this));
    }

    function all(){
        return $this->db->selectAll($this->_table);
    }

    function get($id){
        return $this->db->selectSingle($this->_table, $id);
    }


    function find($params){
        return $this->db->selectSingleByFields($this->_table, $params);
    }

    function load($id){
        $l = $this->get($id);
        return $this->cast($l, $this);
    }

    /**
     * @param stdClass $source
     * @param string|object $dest
     * @return object
     */
    function cast($source, $dest){
        if(is_string($dest))
            $dest = new $dest();
        foreach (get_object_vars($source) as $prop=>$val){
            $dest->$prop = $val;
        }
        return $dest;
    }
}