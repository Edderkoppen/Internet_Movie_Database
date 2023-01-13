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

$requete = $bdd->prepare( $querie->selectWhereQuerie("*", "FILM", "id_categorie", "1")); //
$requete->execute();
$reponse = $requete->fetchAll();

$display->displayCategorie($reponse, "Nos films d'action");

include_once "../views/footer.html";
?>

