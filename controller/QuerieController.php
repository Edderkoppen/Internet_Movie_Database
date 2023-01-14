<?php

namespace controller;

class QuerieController
{
    public function __construct(){}

    public function selectQuerie($data, $from){
        return "select " . $data . " from " . $from . ";";
    }

    public function selectWhereQuerie($data, $from, $id, $idValue){
        return "select " . $data . " from " . $from . " where " . $id . "=" . $idValue . ";";
    }

    public function selectLimitQuerie($data, $from, $limit) {
        return "select " . $data . " from " . $from . " limit " . $limit . ";";
    }

    public function selectLimitOffsetQuerie($data, $from, $limit, $offset) {
        return "select " . $data . " from " . $from . " limit " . $limit . " offset " . $offset . ";";
    }

    public function selectWhereLimitQuerie($data, $from, $id, $idValue, $limit) {
        return "select " . $data . " from " . $from . " where " . $id . "=" . $idValue . " limit " . $limit . ";";
    }

    public function querieDetail($terme){
        return "select film.titre, film.film_description, film.image_path, film.prix, categorie.nom_categorie,
                       producteur.nom_producteur, producteur.prenom_producteur, acteur.nom_acteur,
                       acteur.prenom_acteur from FILM
                inner join produit on produit.id_film = film.id_film
                inner join producteur on producteur.id_producteur = produit.id_producteur
                inner join casting on casting.id_film = film.id_film
                inner join acteur on acteur.id_acteur = casting.id_acteur
                inner join categorie on categorie.id_categorie = film.id_categorie
                where film.titre like '". $terme . "%'
                limit 1;";
    }

    public function querieHistorique($user){
        return "select * from film
                inner join achete on achete.id_film = film.id_film
                inner join client on client.id_client = achete.id_client
                where client.prenom_client like '" . $user . "%';";
    }

    public function querieRecherche($terme){
        return "select * from FILM
                where titre
                like '" .$terme . "%';";
    }


    public function selectWhereLikeQuerie($data, $from, $where, $like) {
        return "select " . $data . " from " . $from . " where " . $where . " like  '" . $like . "';";
    }
} ?>