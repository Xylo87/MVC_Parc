# ⚡🎡 Ébauche d'une application dédiée à la gestion d'un parc d'attractions (PHP/SQL)

## 1. Description 
Ce projet est un exercice pratique de programmation web utilisant l'architecture **Modèle/Vue/Contrôleur** et **PHP**.
Il permet l'affichage d'une liste d'attractions (nom, catégorie, intensité, description, durée en minutes, capacité par heure) ainsi que d'une série d'avis de visiteurs fictifs.
Il est principalement axé sur une modélisation conceptuelle de données et un modéle logique de données (**MCD/MLD**) cohérents vis-à-vis de la gestion d'un parc de ce type.
Les informations affichées sont appelées depuis une base de données **MySQL** grâce à l'architecture **MVC**.

---

## 2. Fonctionnalités
- Navigation entre les différentes **Vues** (attractions, avis) à l'aide d'une **Navbar** sommaire.
- Respect des bonnes pratiques de codage :
  - **Temporisation de sortie**
  - **Templating**

---

## 3. Précisions concernant le MCD/MLD
Le concepteur a pris comme postulat que : 
- Un visiteur unique ne peut émettre qu'un seul avis par attraction
- Une réservation n'appartient qu'à un seul visiteur unique
- Une attraction peut hypothétiquement appartenir à plusieurs catégories d'attractions, et ce, pour une meilleure flexibilité du système concernant de futurs projets 

---

## 4. Installation

1. Clonez ce projet depuis GitHub :
 ```bash
   git clone https://github.com/Xylo87/MVC_Parc.git
   cd MVC_Parc
   ```

2. Installer un logiciel type "Looping" de **MCD** pour exécuter le fichier `.loo` et visualiser le modélisation du projet *Parc* 

- Télécharger Looping [ici](https://www.looping-mcd.fr/)

3. Assurez-vous que PHP est installé sur votre machine en exécutant la commande suivante :
   ```bash
   php --version
   ```

4. Installer un logiciel type "Laragon" pour disposer d'un environnement qui permet d'exécuter un script PHP :

- Télécharger Laragon [ici](https://laragon.org/download/)
- Démarrer Laragon
- Enregistrer le "Repo" dans le dossier laragon\www\
- Exécuter la fonction "Base de données" de Laragon
- Sur HeidiSQL : Fichier > Exécuter un fichier SQL > Sélectionner le fichier SQL pour ouvrir la base de données (`parc.sql`)
- Exécuter la fonction "Web" de Laragon

5. Pour commencer la navigation, veuillez exécuter la requête suivante dans la barre d'URL :
   ```bash
   php http://localhost/MVC_Parc/MVC_Parc/index.php?action=listAttrac
   ```

## 4. Utilisation

- "Looping" permet de visualiser le projet en mode **MCD** ou **MLD** via un bouton dédié, en haut à gauche de l'interface

## 5. Auteur
Projet réalisé par Théo Arbogast (aka Xylo87).
N'hésitez pas à ouvrir une issue ou à me contacter pour toute suggestion ou question.
