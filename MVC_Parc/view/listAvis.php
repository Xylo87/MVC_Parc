<?php ob_start(); ?>

<?php foreach ($avis as $avi) { ?>
    
    <table>
        <thead>
            <tr>
                <th>ATTRACTION</th>
                <th>VISITEUR</th>
                <th>DATE/HEURE</th>
            </tr> 
        </thead>
        <tbody>
            <tr>
                <td><?= $avi["nom"] ?></td>
                <td><?= $avi["name"] ?></td>
                <td><?= $avi["dateTime"] ?></td>
            </tr>
        </tbody>
        <br>
        <br>
        <br>
        <thead>
            <tr>
                <th>NOTE</th>
                <th colspan="2">COMMENTAIRE</th>
            </tr>  
        </thead>
        <tbody>
            <tr> 
                <td><?= $avi["note"] ?></td>
                <td colspan="2"><?= $avi["commentaire"] ?></td>
            </tr>
        </tbody>
    </table>

<?php } ?>

<?php 

$titre = "Liste des avis";
$titre_secondaire = "Liste des avis";

$contenu = ob_get_clean();

require "view/template.php";