<?php

include "../views/meta.html";
include "../views/header.html";
include "../model/connection.php";
include "../controller/DisplayController.php";

use controller\QuerieController;
use controller\DisplayController;

$display = new DisplayController();
$display->displayLogin();

include "../views/footer.html";

?>
