<?php

namespace Controller;

use Model\Connect;

class ParcController {



    // Lister les attractions
    public function listAttrac() {

        $pdo = Connect::seConnecter();
        $requete = $pdo->prepare("
            SELECT attraction.nom, categorie.libelle, attraction.intensite, attraction.description, DATE_FORMAT(SEC_TO_TIME(attraction.dureeMinutes * 60), \"%i:%s\") AS temps, attraction.capaciteHeure, attraction.id_attraction
            FROM attraction
            INNER JOIN type ON type.id_attraction = attraction.id_attraction
            INNER JOIN categorie ON categorie.id_categorie = type.id_categorie 
        ");
        $requete->execute();
        
        $attracs = $requete->fetchAll();

        require "view/listAttrac.php";
    }



    // Lister les avis
    public function listAvis() {

        $pdo = Connect::seConnecter();
        $requete = $pdo->prepare("
            SELECT attraction.nom, visiteur.prenom, visiteur.nom, avis.dateTime, avis.note, avis.commentaire, avis.id_avis
            FROM avis
            INNER JOIN visiteur ON visiteur.id_visiteur = avis.id_visiteur
            INNER JOIN attraction ON attraction.id_attraction = avis.id_attraction
        ");
        $requete->execute();
        
        $avis = $requete->fetchAll();

        require "view/listAvis.php";
    }
}
    