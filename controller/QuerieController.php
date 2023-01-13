<?php

namespace controller;

class QuerieController
{
    public function __construct(){}

    public function selectQuerie($data, $from){
        return "select " . $data . " from " . $from . ";";
    }

    public function selectWhereQuerie($data, $from, $id, $idValue){
        return "select " . $data . " from " . $from . " where " . $id . "=" . $idValue . ";";
    }

    public function selectLimitQuerie($data, $from, $limit) {
        return "select " . $data . " from " . $from . " limit " . $limit . ";";
    }

    public function selectLimitOffsetQuerie($data, $from, $limit, $offset) {
        return "select " . $data . " from " . $from . " limit " . $limit . " offset " . $offset . ";";
    }

    public function selectWhereLimitQuerie($data, $from, $id, $idValue, $limit) {
        return "select " . $data . " from " . $from . " where " . $id . "=" . $idValue . " limit " . $limit . ";";
    }

    public function blabla($data, $from, $where, $like){
        return "select " . $data . " from " . $from . " where " . $where . " like '" . $like . "';";
    }

} ?>