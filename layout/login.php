<?php

include_once "../views/meta.html";
include_once "../views/header.php";
include_once "../model/connection.php";
include_once "../controller/DisplayController.php";

use controller\QuerieController;
use controller\DisplayController;

$display = new DisplayController();
$display->displayLogin();

include_once "../views/footer.html";

?>
