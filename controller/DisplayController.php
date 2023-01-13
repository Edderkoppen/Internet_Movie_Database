<?php

namespace controller;
Class DisplayController {

    public function displayFilmsAccueil($data, $titre){ ?>
        <section id="last">
            <h2 class="titre"><?php echo $titre ?></h2>
            <?php if ($titre != "Derniers ajouts") { ?>
            <a class="plus" href="<?php echo "../layout/categorie" . $titre . ".php" ?>"> Voir plus</a>
            <?php } ?>
            <ul class="alignement">

                <?php foreach ($data as $donnee) { ?>
                    <li class="item-1">
                        <div class="last-box">
                            <div class="last-img-1">
                                <div class="qualite">HDRip</div>
                                <?php echo "<img src=\"../" . $donnee['image_path'] . "\" alt=\"affiche " . $donnee["titre"] . "\" >"; ?>
                            </div>

                            <div class="last-txt-1">
                                <strong><?php echo $donnee['titre']; ?></strong>
                                <p><?php echo $donnee['prix'] . "€"; ?></p>
                            </div>
                        </div>
                    </li>
                <?php } ?>

            </ul>
        </section>
    <?php }


    public function displayLogin(){ ?>

        <div class="box" id="box-login">
            <div class="form-container sign-up-container">
                <form action="#">
                    <h1>S'inscrire</h1>
                    <input type="text" placeholder="Nom" />
                    <input type="email" placeholder="Email" />
                    <input type="password" placeholder="Mot de passe" />
                    <input type="password" placeholder="Comfirmation" />
                    <button class="btn">S'inscrire</button>
                </form>
            </div>
            <div class="form-container sign-in-container">
                <form action="#">
                    <h1>Se connecter</h1>
                    <input type="email" placeholder="Email" />
                    <input type="password" placeholder="Password" />
                    <a href="#">Mot de passe oublié ?</a>
                    <button class="btn">Se connecter</button>
                </form>
            </div>
            <div class="overlay-container">
                <div class="overlay">
                    <div class="overlay-panel overlay-left">
                        <h1>Welcome Back!</h1>
                        <p>To keep connected with us please login with your personal info</p>
                        <button class="ghost btn" id="signIn">Sign In</button>
                    </div>
                    <div class="overlay-panel overlay-right">
                        <h1>Hello, Friend!</h1>
                        <p>Enter your personal details and start journey with us</p>
                        <button class="ghost btn" id="signUp">Sign Up</button>
                    </div>
                </div>
            </div>
        </div>
        <script>
            const signUpButton = document.getElementById('signUp');
            const signInButton = document.getElementById('signIn');
            const container = document.getElementById('box-login');

            signUpButton.addEventListener('click', () => {
                container.classList.add("right-panel-active");
            });

            signInButton.addEventListener('click', () => {
                container.classList.remove("right-panel-active");
            });
        </script>
    <?php }

    public function displayCategorie($data, $titre){ ?>
            <div>
                <h2 class="titre"><?php echo $titre ?></h2>
            </div>
        <section id="list-film" class="align">
                <?php foreach ($data as $donnee) { ?>
                        <div class="film-box">
                            <div class="film-img">
                                <div class="qualite">HDRip</div>
                                <?php echo "<img src=\"../" . $donnee['image_path'] . "\" alt=\"affiche " . $donnee["titre"] . "\" >"; ?>
                            </div>

                            <div>
                                <a href="#"><?php echo $donnee['titre']; ?></a>
                                <a href="#"><?php echo $donnee['prix'] . "€"; ?></a>
                            </div>
                        </div>
                <?php } ?>
        </section>
    <?php }


    public function displayProducteur($data, $titre){ ?>
        <div>
            <h2 class="titre"><?php echo $titre ?></h2>
        </div>
        <section id="list-film" class="align">
            <?php foreach ($data as $donnee) { ?>
                <div class="film-box">
                    <div class="film-img">
                        <a href="#"><?php echo $donnee['nom_producteur']; ?></a>
                        <a href="#"><?php echo $donnee['prenom_producteur']; ?></a>
                    </div>
                </div>
            <?php } ?>
        </section>
    <?php }

    public function displayDetail($data){ ?>
        <section class="detail">
        <div class="detail-box">
        <?php foreach ($data as $donnee) { ?>
                <figure class="detail-img">
                    <img src="../<?php echo $donnee["image_path"];?>" alt="poster">
                </figure>
                <div class="detail-film">
                    <div class="wrap">
                        <h1> <?php echo $donnee["titre"]; ?> </h1>
                        <div class="detail-info">
                            <a href="#">Genre: Film</a>
                            <a href="#">Producteur: </a>
                            <a href="#">Acteurs: </a>
                            <a href="#">Catégorie: </a>
                            <a href="#">Duré: 150 min</a>
                            <p>
                                Synopsis :<br/>
                                <?php echo $donnee["film_description"]; ?>
                            </p>
                        </div>
                    </div>
                    <div class="details-actions">
                        <button class="btn"><span>Ajouter au panier</span></button>

                    </div>
                </div>
            <?php } ?>
            </div>
        </section>
        <div class="detail">
            <h2 class="detail-titre"> Trailers</h2>
            <div class="iframe">

                <iframe width="1000" height="600"
                        src="https://www.youtube.com/embed/qSqVVswa420"
                        title="YouTube video player" frameborder="0"
                        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                        allowfullscreen>
                </iframe>
            </div>
        </div>

    <?php }

} ?>