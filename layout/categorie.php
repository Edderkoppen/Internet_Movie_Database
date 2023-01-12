<?php include_once "../views/meta.html"; ?>

<body>

<?php
    include_once "../views/header.html";
    use controller\QuerieController\QuerieController;
    include_once("../model/connection.php");

    $requete = $bdd->prepare("select * from FILM where id_categorie = 1");
    $requete->execute();
    $requeteSection = $bdd->prepare("select nom_categorie from categorie where id_categorie = 1");
    $requeteSection->execute();
    $section = $requeteSection->fetchAll();
    $donnee = $requete->fetchAll();
?>

    <div>
    <?php foreach ($section as $section) { ?>
      <h2 class="titre"><?php echo $section["nom_categorie"] ?></h2>
    <?php }; ?>
    </div>

    <section id="list-film" class="cS-hidden">
    <?php foreach ($donnee as $donnee) { ?>
      <div class="film-box">
        <div class="film-img">
          <div class="qualite">HDRip</div>
            <?php echo "<img src=\"../" . $donnee['image_path'] . "\" alt=\"affiche " . $donnee["titre"] . "\" >"; ?>
        </div>
        <a href="#"><?php echo $donnee['titre']; ?></a>
        <a href="#"><?php echo $donnee['prix'] . "€"; ?></a>
      </div>
    <?php }; ?>
    </section>
</body>

