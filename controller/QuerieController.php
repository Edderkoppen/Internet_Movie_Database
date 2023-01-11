<?php

try {

    $bdd = new PDO("mysql:host=localhost; dbname=internetmovies; charset=utf8", "root", "", array(PDO::ATTR_ERRMODE=>PDO::ERRMODE_EXCEPTION));

} catch (Exception $e) {

    die("Erreur : " . $e->getMessage());
}


class QuerieController {

    public $bdd;

    public function querieTest($bdd) {
        $reqTest = $bdd->prepare("select * from film;");
        $reqTest->execute();
        echo $reqTest;

}
}
// Ajouter une classe qui prends en paramètre un bdd.
// Faire toutes les méthodes faisant appel a une requete SQL.