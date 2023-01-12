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
