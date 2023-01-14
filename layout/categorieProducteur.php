<?php
include "../views/meta.html";
include "../views/header.html";
include "../model/connection.php";
include "../controller/QuerieController.php";
include "../controller/DisplayController.php";

use controller\QuerieController;
use controller\DisplayController;

$display = new DisplayController();
$querie = new QuerieController();

$requete = $bdd->prepare( $querie->selectQuerie("*", "PRODUCTEUR")); //
$requete->execute();
$reponse = $requete->fetchAll();

$display->displayProducteur($reponse, "Tous les producteurs");

include "../views/footer.html";
?>


