<html>
<head>
    <title> Accueil </title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="../css/styles.css"/>
    <link rel="stylesheet" href="fontawesome.min.css"/>
    <link rel="shortcut icon" href="../images/logo.png"/>
    <script src="https://kit.fontawesome.com/c8e4d183c2.js" crossorigin="anonymous"></script>
    <script src="https://example.com/fontawesome/v5.15.4/js/all.js" data-auto-replace-svg></script>
</head>
<body>
    <?php
        include_once "../views/header.html";
        use controller\QuerieController\QuerieController;
        include_once("../model/connection.php");

        $requete = $bdd->prepare("select * from FILM");
        $requete->execute();
        $donnee = $requete->fetchAll();
    ?>

    <section id="last">
        <h2 class="last-titre">Dernier film Ajouté</h2>
        <a class="plus" href="#"> Voir plus</a>
        <ul class="cS-hidden">

        <?php foreach ($donnee as $donnee) { ?>
            <li class="item-1">
                <div class="last-box">
                    <div class="last-img-1">
                        <?php echo "<img src=\"../" . $donnee['image_path'] . "\" alt=\"affiche " . $donnee["titre"] . "\" >"; ?>
                    </div>

                    <div class="last-txt-1">
                        <strong><?php echo $donnee['titre']; ?></strong>
                        <p><?php echo $donnee['image_path']; ?></p>
                    </div>
                </div>
            </li>
        <?php } ?>

        </ul>
    </section>
</body>
</html>
