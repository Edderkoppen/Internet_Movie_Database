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

$requete = $bdd->prepare( $querie->selectWhereQuerie("*", "FILM", "id_categorie", "1")); //
$requete->execute();
$reponse = $requete->fetchAll();

$display->displayCategorie($reponse, "Nos films d'action");

include "../views/footer.html";
?>

