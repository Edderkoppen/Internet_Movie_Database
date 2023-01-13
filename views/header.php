<nav>
  <a href="../layout/accueil.php" class="logo">
    <img src="../images/logo.png" alt="logo">
  </a>
  <div class="recherche">
      <form class="" method="get">
      <input type="search" name="s" placeholder="Rechercher"/>
  </div>

    <?php
            include_once "../model/connection.php";
            include_once "../controller/QuerieController.php";
            include_once "../controller/DisplayController.php";
            use controller\QuerieController;
            use controller\DisplayController;
            $test = new QuerieController();
            $test2 = new DisplayController();

        if (isset($_GET["s"]) AND !empty($_GET["s"])) {
            $_GET["s"] = htmlspecialchars($_GET["s"]); //pour sécuriser le formulaire contre les intrusions html
            $terme = $_GET["s"];
            $terme = trim($terme);
            $terme = strip_tags($terme);

            if (isset($terme)){

                if(preg_match_all("/([Aa]ction)|([Dd]rame)|([Pp]roducteur)/i", $terme)) {
                    header("Location: ../layout/categorie" . $terme . ".php");

                } else {
                    $requete = $bdd->prepare($test->blabla("*", "FILM", "titre", $terme));
                    $requete->execute();
                    $reponse = $requete->fetchAll();

                    if(empty($reponse)) {
                        $requete = $bdd->prepare($test->blabla("*", "PRODUCTEUR", "titre", $terme));
                        $requete->execute();
                        $reponse = $requete->fetchAll();
                    }
//                    header("Location: ../layout/recherche.php");
                }
            }
    }
//
//    if (isset($terme)) {
//        $terme = strtolower($terme);
//        $select_terme = $bdd->prepare("SELECT titre, contenu FROM articles WHERE titre LIKE ? OR contenu LIKE ?");
//        $select_terme->execute();
//    } else {
//        $message = "Vous devez entrer votre requete dans la barre de recherche";
//    }
    ?>
  <ul class="menu">
    <li class="deroulant"><a href="#"> Catégorie</a>
      <ul class="sous">
        <li><a href="../layout/categorieAction.php"> Action</a> </li>
        <li><a href="../layout/categorieDrame.php"> Drama</a> </li>
        <li><a href="#"> Animée</a> </li>
      </ul>
    </li>
    <li><a href="#"> Panier</a> </li>
    <li><a href="../layout/login.php"> Login</a> </li>
  </ul>
</nav>
<script>
  function getValue() {
    var input = document.getElementById("in").value;
    return input;
  }
</script>