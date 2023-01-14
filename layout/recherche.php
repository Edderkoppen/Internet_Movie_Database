<?php
include "../views/meta.html";
include "../views/header.html";
include "../model/connection.php";
include "../controller/QuerieController.php";
include "../controller/DisplayController.php";
include "../controller/Controller.php";

use controller\QuerieController;
use controller\DisplayController;
use controller\Controller;

$display = new DisplayController();
$querie = new QuerieController();
$test = new Controller();



$terme = $test->protectValue('s');
//$nb = $test->protectValue("test");
$display->displayBarreRecherche();

$nb = 1;

if ($nb == 1) {
    $requete = $bdd->prepare( $querie->querieRechercheFilm($terme)); //
    $requete->execute();
    $reponse = $requete->fetchAll();

    $display->displayRechercheFilm($reponse, $terme);

} elseif ($nb ==2) {

    $requete = $bdd->prepare( $querie->querieRechercheProducteur($terme)); //
    $requete->execute();
    $reponse = $requete->fetchAll();

    $display->displayRechercheProducteur($reponse, $terme);
}


include "../views/footer.html";
?>