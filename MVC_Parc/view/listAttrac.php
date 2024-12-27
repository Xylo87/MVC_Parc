<?php ob_start(); ?>

<?php foreach ($attracs as $attrac) { ?>
    
    <table>
        <thead>
            <tr>
                <th>NOM</th>
                <th>CATÉGORIE</th>
                <th>INTENSITÉ</th>
            </tr> 
        </thead>
        <tbody>
            <tr>
                <td><?= $attrac["nom"] ?></td>
                <td><?= $attrac["libelle"] ?></td>
                <td><?= $attrac["intensite"] ?></td>
            </tr>
        </tbody>
        <br>
        <br>
        <br>
        <thead>
            <tr>
                <th>DESCRIPTION</th>
                <th>DURÉE (minutes)</th>
                <th>CAPACITÉ (par heure)</th>
            </tr>  
        </thead>
        <tbody>
            <tr> 
                <td><?= $attrac["description"] ?></td>
                <td><?= $attrac["temps"] ?></td>
                <td><?= $attrac["capaciteHeure"] ?></td>
            </tr>
        </tbody>
    </table>

<?php } ?>

<?php 

$titre = "Liste des attractions";
$titre_secondaire = "Liste des attractions";

$contenu = ob_get_clean();

require "view/template.php";