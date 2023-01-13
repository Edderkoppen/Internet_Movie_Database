<?php

namespace controller;

class QuerieController
{
    public function __construct(){}


    public function selectQuerie($data, $from){
        return "select " . $data . " from " . $from . ";";
    }


    public function selectLimitQuerie($data, $from, $limit) {
        return "select " . $data . " from " . $from . " limit " . $limit . ";";
    }

    public function selectWhereLimitQuerie($data, $from, $id, $idValue, $limit) {
        return "select " . $data . " from " . $from . " where " . $id . "=" . $idValue . " limit " . $limit . ";";
    }



} ?>