<?php

Class QuerieController {

    public function selectQuerie($what, $where){
        return "select " . $what . " from " . $where . ";";
    }

    public function selectFilmQuerie($what, $where, $type, $content) {
        return "select " . $what . " from " . $where . "\n"
                . " where " . $type . " = " . $content . ";";

    }
}
