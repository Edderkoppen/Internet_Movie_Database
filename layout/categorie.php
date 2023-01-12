<html>
<head>
  <title> Action </title>
  <meta charset="utf-8">
  <link rel="stylesheet" href="../css/styles.css"/>
  <link rel="stylesheet" href="fontawesome.min.css"/>
  <link rel="shortcut icon" href="#"/>
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
<div>
  <h2 class="titre">Action</h2>
</div>

<section id="list-film" class="cS-hidden">
  <div class="film-box">
    <div class="film-img">
      <div class="qualite">HDRip</div>
      <img src="topgun.jpg">
    </div>
    <a href="#">Titre php</a>
    <a href="#">13.90€</a>
  </div>
</section>


<!--<section id="list-film" class="cS-hidden">-->
<!--  <div class="film-box">-->
<!--    <div class="film-img">-->
<!--      <img src="topgun.jpg">-->
<!--    </div>-->
<!--    <a href="#">Titre php</a>-->
<!--    <a href="#">13.90€</a>-->
<!--  </div>-->
<!--  <div class="film-box">-->
<!--    <div class="film-img">-->
<!--      <img src="topgun.jpg">-->
<!--    </div>-->
<!--    <a href="#">Titre php</a>-->
<!--    <a href="#">13.90€</a>-->
<!--  </div>-->
<!--  <div class="film-box">-->
<!--    <div class="film-img">-->
<!--      <img src="topgun.jpg">-->
<!--    </div>-->
<!--    <a href="#">Titre php</a>-->
<!--    <a href="#">13.90€</a>-->
<!--  </div>-->
<!--  </div>-->
<!--</section>-->
<!--<section id="list-film" class="cS-hidden">-->
<!--  <div class="film-box">-->
<!--    <div class="film-img">-->
<!--      <img src="topgun.jpg">-->
<!--    </div>-->
<!--    <a href="#">Titre php</a>-->
<!--    <a href="#">13.90€</a>-->
<!--  </div>-->
<!--  <div class="film-box">-->
<!--    <div class="film-img">-->
<!--      <img src="topgun.jpg">-->
<!--    </div>-->
<!--    <a href="#">Titre php</a>-->
<!--    <a href="#">13.90€</a>-->
<!--  </div>-->
<!--  <div class="film-box">-->
<!--    <div class="film-img">-->
<!--      <img src="topgun.jpg">-->
<!--    </div>-->
<!--    <a href="#">Titre php</a>-->
<!--    <a href="#">13.90€</a>-->
<!--  </div>-->
<!--  </div>-->
<!--</section>-->
<!--<section id="list-film" class="cS-hidden">-->
<!--  <div class="film-box">-->
<!--    <div class="film-img">-->
<!--      <img src="topgun.jpg">-->
<!--    </div>-->
<!--    <a href="#">Titre php</a>-->
<!--    <a href="#">13.90€</a>-->
<!--  </div>-->
<!--  <div class="film-box">-->
<!--    <div class="film-img">-->
<!--      <img src="topgun.jpg">-->
<!--    </div>-->
<!--    <a href="#">Titre php</a>-->
<!--    <a href="#">13.90€</a>-->
<!--  </div>-->
<!--  <div class="film-box">-->
<!--    <div class="film-img">-->
<!--      <img src="topgun.jpg">-->
<!--    </div>-->
<!--    <a href="#">Titre php</a>-->
<!--    <a href="#">13.90€</a>-->
<!--  </div>-->
<!--  </div>-->
<!--</section>-->
</body>
</html>
