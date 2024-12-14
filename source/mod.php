<?php
    $mod = isset($_GET['mod']) ? $_GET['mod'] : 'home';
    if ($mod == 'home'){
        include "module/home.php";
    } else if ($mod == 'contact'){
        include "module/contact.html";
    }
?>