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

$requete = $bdd->prepare( $querie->selectQuerie("*", "PRODUCTEUR")); //
$requete->execute();
$reponse = $requete->fetchAll();

$display->displayProducteur($reponse, "Tous les producteurs");

include_once "../views/footer.html";
?>


