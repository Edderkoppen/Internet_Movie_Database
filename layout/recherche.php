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
$requete = $bdd->prepare( $querie->querieRecherche($terme)); //
$requete->execute();
$reponse = $requete->fetchAll();

$display->displayRecherche($reponse, $terme);

include "../views/footer.html";
?>