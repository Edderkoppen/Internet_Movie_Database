<html>

<?php include_once "../views/meta.html"; ?>

<body>

    <?php
    include_once "../views/header.html";
    include_once "../controller/QuerieController.php";
    include_once "../model/connection.php";

    use controller\QuerieController;

    $querie = new QuerieController();

    $requete = $bdd->prepare($querie->selectQuerie("*", "FILM"));
    $requete->execute();

    $donnee = $requete->fetchAll();
    $querie->test($donnee);

    include_once "../views/footer.html";
    ?>

</body>
</html>
