<?php
//require "../model/connection.php";
//$email = "";
//$name = "";
//$errors = array();
//
////if user signup button
//if(isset($_POST['inscription'])){
//    $name = mysqli_real_escape_string($bdd, $_POST['name']);
//    $email = mysqli_real_escape_string($bdd, $_POST['email']);
//    $password = mysqli_real_escape_string($bdd, $_POST['password']);
//    $cpassword = mysqli_real_escape_string($bdd, $_POST['cpassword']);
//    if($password !== $cpassword){
//        $errors['password'] = "mot de passe different !";
//    }
//    $email_check = "SELECT * FROM identifiant WHERE nom_utilisateur = '$email'";
//    $res = mysqli_query($bdd, $email_check) or die(mysqli_error());
//    if(mysqli_num_rows($res) > 0){
//        $errors['email'] = "l'adresse email existe déjà!";
//    }
//
//    if(count($errors) === 0) {
//        $encpass = password_hash($password, PASSWORD_BCRYPT);
//        $insert_data_identifiant = "INSERT INTO identifiant ( nom_utilisateur, mot_de_passe) values ('$email','$password')";
//        $data_check = mysqli_query($bdd, $insert_data_identifiant);
//        header('location: ../layout/login.php');
//
//    }else{
//        $errors['db-error'] = "erreur insertion dans la database !";
//    }
//
//}
//
//
//if(isset($_POST['connexion'])){
//    $email = mysqli_real_escape_string($bdd, $_POST['email']);
//    $password = mysqli_real_escape_string($bdd, $_POST['password']);
//    $check_email = "SELECT * FROM identifiant WHERE nom_utilisateur = '$email' and mot_de_passe = '$password'";
//    $res = mysqli_query($bdd, $check_email) or die(mysqli_error());
//    $row=mysqli_num_rows($res);
//    if($row == 1){
//        $_SESSION['email'] = $email;
//        $_SESSION['password'] = $password;
//        header("Location: ../layout/index.php");
//    }else{
//        $errors['email'] = "email ou mot de passe incorrect";
//    }
//
//}
?>