<?php
include "../views/meta.html";
include "../views/header.html";
include "../model/connection.php";
include "../controller/QuerieController.php";
include "../controller/DisplayController.php";
include "../model/session.php";
include "../model/test.php";

use controller\QuerieController;
use controller\DisplayController;

$display = new DisplayController();
$querie = new QuerieController();
$requete = $bdd->prepare($querie->querieDetail("lucy")); //
$requete->execute();
$reponse = $requete->fetchAll();

$display->displayDetail($reponse);

include "../views/footer.html";
?>


