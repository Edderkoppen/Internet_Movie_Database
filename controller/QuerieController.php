<?php

namespace controller;

class QuerieController
{
    public $coucou;

    public function __construct($coucou){
        $this->coucou = $coucou;
    }
    public function selectQuerie($coucou){
        echo $coucou;
    }

}