<html>

<?php include_once "../views/meta.html"; ?>

<body>

    <?php
    include_once "../views/header.html";
    include_once "../controller/QuerieController.php";
    include_once "../controller/DisplayController.php";
    include_once "../model/connection.php";

    use controller\QuerieController;

    use controller\DisplayController;
    $display = new DisplayController();
    $querie = new QuerieController();

    $requete = $bdd->prepare( $querie->selectLimitQuerie("*", "FILM", "4")); //
    $requete->execute();
    $reponse = $requete->fetchAll();

    $display->displayFilmsAccueil($reponse, "Derniers films");

    $requete = $bdd->prepare($querie->selectWhereLimitQuerie("*", "FILM", "id_categorie", "1", "6"));
    $requete->execute();
    $reponse = $requete->fetchAll();

    $display->displayFilmsAccueil($reponse, "Action");

    $requete = $bdd->prepare($querie->selectWhereLimitQuerie("*", "FILM", "id_categorie", "2", "6"));
    $requete->execute();
    $reponse = $requete->fetchAll();

    $display->displayFilmsAccueil($reponse, "Drame");

    include_once "../views/footer.html";
    ?>

</body>
</html>
