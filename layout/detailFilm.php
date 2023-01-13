<?php
include_once "../views/meta.html";
include_once "../views/header.php";
include_once "../model/connection.php";
include_once "../controller/QuerieController.php";
include_once "../controller/DisplayController.php";

use controller\QuerieController;
use controller\DisplayController;

$display = new DisplayController();
$querie = new QuerieController();

$requete = $bdd->prepare( $querie->blabla("*", "FILM", "titre", "parasite")); //
$requete->execute();
$reponse = $requete->fetchAll();

$display->displayDetail($reponse);

include_once "../views/footer.html";
?>


