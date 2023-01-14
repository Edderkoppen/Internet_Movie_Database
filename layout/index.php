<?php

include "../views/meta.html";
include "../views/header.html";
include "../views/description.html";
include "../controller/QuerieController.php";
include "../controller/DisplayController.php";
include "../model/connection.php";

use controller\QuerieController;
use controller\DisplayController;

$display = new DisplayController();
$querie = new QuerieController();

$requete = $bdd->prepare( $querie->selectLimitOffsetQuerie("*", "FILM", "4", "3")); //
$requete->execute();
$reponse = $requete->fetchAll();

$display->displayFilmsAccueil($reponse, "Derniers ajouts"); // Affichage du bandeau "derniers ajouts".

$requete = $bdd->prepare($querie->selectWhereLimitQuerie("*", "FILM", "id_categorie", "1", "6"));
$requete->execute();
$reponse = $requete->fetchAll();

$display->displayFilmsAccueil($reponse, "Action"); // Affichage du bandeau "action".

$requete = $bdd->prepare($querie->selectWhereLimitQuerie("*", "FILM", "id_categorie", "2", "6"));
$requete->execute();
$reponse = $requete->fetchAll();

$display->displayFilmsAccueil($reponse, "Drame"); // Affichage du bandeau "drame".

include "../views/footer.html";
?>

