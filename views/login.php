<div class="container" id="container">
    <div class="form-container sign-up-container">
        <form action="#">
            <h1>S'inscrire</h1>
            <input type="text" placeholder="Nom" />
            <input type="email" placeholder="Email" />
            <input type="password" placeholder="Mot de passe" />
            <input type="password" placeholder="Comfirmation" />
            <button>S'inscrire</button>
        </form>
    </div>
    <div class="form-container sign-in-container">
        <form action="#">
            <h1>Se connecter</h1>
            <input type="email" placeholder="Email" />
            <input type="password" placeholder="Password" />
            <a href="#">Mot de passe oublié ?</a>
            <button>Se connecter</button>
        </form>
    </div>
    <div class="overlay-container">
        <div class="overlay">
            <div class="overlay-panel overlay-left">
                <h1>Welcome Back!</h1>
                <p>To keep connected with us please login with your personal info</p>
                <button class="ghost" id="signIn">Sign In</button>
            </div>
            <div class="overlay-panel overlay-right">
                <h1>Hello, Friend!</h1>
                <p>Enter your personal details and start journey with us</p>
                <button class="ghost" id="signUp">Sign Up</button>
            </div>
        </div>
    </div>
</div>
<script  src="./script.js"></script>
