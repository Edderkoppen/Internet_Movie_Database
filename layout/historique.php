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
$control = new Controller();

$requete = $bdd->prepare( $querie->querieHistorique("ryan")); //
$requete->execute();
$reponse = $requete->fetchAll();

$name = $control->getName($reponse);
$display->displayHistorique($reponse, $name);

include "../views/footer.html";

?>