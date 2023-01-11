<?php

try {
    $bdd = new PDO("mysql:host=internetmovies.c3yl2ts7fxxr.eu-west-3.rds.amazonaws.com; dbname=internetmovies; charset=utf8", "Mathieu", "internetmoviesbdd", array(PDO::ATTR_ERRMODE=>PDO::ERRMODE_EXCEPTION));

} catch (Exception $e) {

    die("Erreur : " . $e->getMessage());
}
$reqDestru=$bdd->prepare("TRUNCATE TABLE CATEGORIE");
$reqDestru->execute();
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

