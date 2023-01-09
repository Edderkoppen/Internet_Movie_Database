<?php

try {
    $bdd = new PDO("mysql:host=localhost; dbname=internetmovies; charset=utf8", "root", "", array(PDO::ATTR_ERRMODE=>PDO::ERRMODE_EXCEPTION));

} catch (Exception $e) {

    die("Erreur : " . $e->getMessage());
}

$req=$bdd->prepare("insert into CATEGORIE VALUES(1, 'Drame' )");
$req->execute();
$req2 = $bdd->prepare("select * from categorie");
$req2->execute();
$test = $req2->fetchAll();

foreach ($test as $test) {

?>

    <p> <?php echo $test['nom_categorie']; ?> </p>

<?php
}

echo "test Ryan";

?>

