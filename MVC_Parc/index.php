<?php

use Controller\ParcController;

spl_autoload_register(function($class_name) {
    include $class_name . ".php";
});

$ctrlParc = new ParcController();

$id = (isset($_GET["id"])) ? $_GET["id"] : null;

if (isset($_GET["action"])) {
    switch ($_GET["action"]) {
        case 'listAttrac': $ctrlParc->listAttrac();
            break;
        case "listAvis" : $ctrlParc->listAvis();
            break;
    }
}