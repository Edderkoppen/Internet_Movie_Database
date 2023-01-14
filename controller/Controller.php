<?php

namespace controller;

class Controller {
    public function protectValue($champ) {
        if (isset($_GET[$champ]) && !empty($_GET[$champ])) {
            $_GET[$champ] = htmlspecialchars($_GET[$champ]);
            $terme = $_GET[$champ];
            $terme = trim($terme);
            $terme = strip_tags($terme);
            return $terme;
        }
    }

    public function choosePage($terme) {
        if ($terme != null) {
            if (preg_match_all("/([Aa]ction)|([Dd]rame)|([Pp]roducteur)/i", $terme)) {
                header("Location: ../layout/categorie" . $terme . ".php");

            } else {
                header("Location: ../layout/recherche.php");
            }

        }
    }

    public function getName($data) {
        foreach ($data as $donnee) {
            return $donnee['prenom_client'];
        }
    }

}