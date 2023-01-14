<?php

namespace controller;
use model\Onverra;

Class DisplayController {

    public function displayFilmsAccueil($data, $titre){ ?>
        <section id="last">
            <h2 class="titre"><?php echo $titre ?></h2>
            <?php if ($titre != "Derniers ajouts") { ?>
            <a class="plus" href="<?php echo "../layout/categorie" . $titre . ".php" ?>"> Voir plus</a>
            <?php } ?>
            <ul class="alignement">
                <?php foreach ($data as $donnee) { ?>
                    <a href="../layout/detailFilm.php">
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
                    </a>
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
                    <input type="password" placeholder="Confirmation" />
                    <button class="btn">S'inscrire</button>
                </form>
            </div>
            <div class="form-container sign-in-container">
                <form action="#">
                    <h1>Se connecter</h1>
                    <input type="email" placeholder="Email" />
                    <input type="password" placeholder="Mot de passe" />
                    <a href="#">Mot de passe oublié ?</a>
                    <button class="btn">Se connecter</button>
                </form>
            </div>
            <div class="overlay-container">
                <div class="overlay">
                    <div class="overlay-panel overlay-left">
                        <h1>Bienvenue !</h1>
                        <p>Pour rester avec nous, connectez vous avec vos informations personnelles</p>
                        <button class="ghost btn" id="signIn">Se connecter</button>
                    </div>
                    <div class="overlay-panel overlay-right">
                        <h1>Signez ici !</h1>
                        <p>Entrez vos informations pour débuter avec nous !</p>
                        <button class="ghost btn" id="signUp">S'inscrire</button>
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
                            <a href="../layout/detailFilm.php">
                                <div class="film-box">
                                    <div class="film-img">
                                        <div class="qualite">HDRip</div>
                                        <?php echo "<img src=\"../" . $donnee['image_path'] . "\" alt=\"affiche " . $donnee["titre"] . "\" >"; ?>
                                    </div>

                                    <div class="film-txt">
                                        <a href="#"><?php echo $donnee['titre']; ?></a>
                                        <a href="#"><?php echo $donnee['prix'] . "€"; ?></a>
                                        <button type="submit" name="add" class="btn">Ajouter au panier</button>
                                </div>
                            </a>
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
                        <?php echo "<img src=\"../" . $donnee['photo'] . "\" alt=\"photo " . $donnee["nom_producteur"] . "\" >"; ?>
                    </div>
                    <div>
                        <a href="#"><?php echo $donnee['nom_producteur']; ?></a>
                        <a href="#"><?php echo $donnee['prenom_producteur']; ?></a>
                    </div>
                </div>
            <?php } ?>
        </section>
    <?php }

    public function displayDetail($data){ ?>
        <?php foreach ($data as $donnee) { ?>
            <section class="detail">
            <div class="detail-box">
                <figure class="detail-img">
                    <img src="../<?php echo $donnee["image_path"];?>" alt="poster">
                </figure>
                <div class="detail-film">
                    <div class="wrap">
                        <h1> <?php echo $donnee["titre"]; ?> </h1>
                        <div class="detail-info">
                            <a href="#">Genre: <?php echo " " . $donnee["nom_categorie"] ?></a>
                            <a href="#">Producteur: <?php echo " " . $donnee["prenom_producteur"] . " " . $donnee["nom_producteur"]?> </a>
                            <a href="#">Acteur: <?php echo " " . $donnee["prenom_acteur"] . " " . $donnee["nom_acteur"]?></a>
                            <a href="#">Prix: <?php echo " " . $donnee["prix"] . " €"?></a>
                            <p>
                                <strong>Synopsis :</strong><br/>
                                <?php echo $donnee["film_description"]; ?>
                            </p>
                        </div>
                    </div>
                    <div class="details-actions">
                        <button class="btn"><span>Ajouter au panier</span></button>

                    </div>
                </div>

            </div>
        </section>
        <div class="detail">
            <h2 class="detail-titre"> Trailers</h2>
            <div class="iframe">
                <iframe width="1000" height="600"
                        src= "<?php echo $donnee["lien"];?>"
                        title="YouTube video player" frameborder="0"
                        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                        allowfullscreen>
                </iframe>
            </div>
        </div>
        <?php } ?>
    <?php }


    public function displayBarreRecherche() { ?>
        <div class="center">
            <form class="recherche" method="get">
                <input type="recherche" name="test" placeholder="Rechercher"/>
            </form>
            <div class="radio">
                <label >Fitre</label>
                <select class="select">
                    <option value="default">...</option>
                    <option value="1">Producteur</option>
                    <option value="2">Film</option>

                </select>
            </div>
        </div>
    <?php }


    public function displayRechercheFilm($data, $terme){ ?>
        <?php if (empty($data)) { ?>
            <div>
                <h2 class="titre">Rien pour la recherche "<?php echo $terme ?>"</h2>
            </div>
        <?php } else { ?>
            <div>
                <h2 class="titre">Nos films contenant "<?php echo $terme ?>"</h2>
            </div>
            <?php } ?>
        <section id="list-film" class="align">
            <?php foreach ($data as $donnee) { ?>
                <a href="../layout/detailFilm.php">
                    <div class="film-box">
                        <div class="film-img">
                            <div class="qualite">HDRip</div>
                            <?php echo "<img src=\"../" . $donnee['image_path'] . "\" alt=\"affiche " . $donnee["titre"] . "\" >"; ?>
                        </div>

                        <div class="film-txt">
                            <a href="#"><?php echo $donnee['titre']; ?></a>
                            <a href="#"><?php echo $donnee['prix'] . "€"; ?></a>
                            <button class="btn">Ajouter au panier</button>
                        </div>


                    </div>
                </a>
            <?php } ?>
        </section>
    <?php }


    public function displayRechercheProducteur($data, $terme){ ?>
        <?php if (empty($data)) { ?>
            <div>
                <h2 class="titre">Rien pour la recherche "<?php echo $terme ?>"</h2>
            </div>
        <?php } else { ?>
            <div>
                <h2 class="titre">Producteurs contenant "<?php echo $terme ?>"</h2>
            </div>
        <?php } ?>
        <section id="list-film" class="align">
            <?php foreach ($data as $donnee) { ?>
                <div class="film-box">
                    <div class="film-img">
                        <?php echo "<img src=\"../" . $donnee['photo'] . "\" alt=\"photo " . $donnee["nom_producteur"] . "\" >"; ?>
                    </div>
                    <div>
                        <a href="#"><?php echo $donnee['nom_producteur']; ?></a>
                        <a href="#"><?php echo $donnee['prenom_producteur']; ?></a>
                    </div>
                </div>
            <?php } ?>
        </section>
    <?php }



    public function displayHistorique($data, $titre){ ?>
        <section id="last">
            <div>
                <h2 class="titre">Achats de <?php echo $titre; ?></h2>
            </div>
            <ul class="alignement">
                <?php foreach ($data as $donnee) { ?>
                    <a href="../layout/detailFilm.php">
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
                    </a>
                <?php } ?>

            </ul>
        </section>
    <?php }

} ?>