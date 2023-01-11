<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Lato:wght@100;300;400;700&family=Righteous&family=Roboto+Condensed:wght@100;200;300&display=swap" rel="stylesheet">
    <title>InternetMovies</title>
</head>
<body>

<!---------------- HEADER ---------------->

<header id="header">
    <div class="logo-haut">
        <div><img class="logo-name" src="images/logo.png" alt="logo"></div>
    </div>
    <div class="menu">
        <div class="lien"><a href=""> <i class="fa-solid fa-house"></i> Accueil /</a></div>
        <div class="lien"><a href=""><i class="fa-solid fa-book"></i></i> Filmographie /</a></div>
        <div class="lien"><a href=""><i class="fa-solid fa-truck"></i></i> Categories /</a></div>
        <div class="lien"><a href=""> <i class="fa-solid fa-envelope"></i> Panier </a></div>
    </div>

</header>


    <!---------------- CONTENU ---------------->
    <div class="container_right">
        <main id="main">
            <?php

            try {
                $bdd = new PDO("mysql:host=localhost; dbname=internetmovies; charset=utf8", "root", "", array(PDO::ATTR_ERRMODE=>PDO::ERRMODE_EXCEPTION));

            } catch (Exception $e) {

                die("Erreur : " . $e->getMessage());
            }

            $reqUse=$bdd->prepare("use internetmovies");
            $reqUse->execute();
            $req2 = $bdd->prepare("select * from FILM;");
            $req2->execute();
            $test = $req2->fetchAll();

            foreach ($test as $test) {

                ?>
                <div>
                    <p> <?php echo $test['image_path']; ?> </p>
                    <img src="<?php $test['image_path']; ?>" alt="test" />
                    <p> <?php echo $test['titre']; ?> </p>
                    <p> <?php echo $test['film_description']; ?> </p>
                </div>

                <?php
            }

            $coucou = false;
            $i = 0;
            while (!$coucou) {

                ?>
                <p style="color:red"> <?php echo "test autre"; ?></p>

                <?php
                $i++;
                if ($i == 5) {
                    $coucou = true;
                }
            }

            ?>


        </main>
    </div>
</div>

<!---------------- FOOTER ---------------->
<footer id="footer">

    <div class="logo-bas">
        <img class="logo" src="images/logo.png" alt="logo">
    </div>

    <div class="menu-bas">
        <div><a class="a-bas" href="" target="_blank"><i class="fa-solid fa-question"></i> FAQ</a></div>
        <div>|</div>
        <div><a class="a-bas" href="" target="_blank"><i class="fa-solid fa-file-contract"></i> Mentions légales</a></div>
        <div>|</div>
        <div><a class="a-bas" href=""> <i class="fa-solid fa-mug-hot"></i> Contact</a></div>
    </div>

</footer>

</body>
</html>

