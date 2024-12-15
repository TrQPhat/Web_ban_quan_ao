<?php
    $mod = isset($_GET['mod']) ? $_GET['mod'] : 'home';
    if ($mod == 'home'){
        include "module/home.php";
    }
    else if ($mod == 'contact'){
        include "module/contact.html";
    }
    else if ($mod == 'product'){
        include "module/product.php";
    }
    else if ($mod == 'product_detail'){
        include "module/product_detail.php";
    }
    else if ($mod == 'account'){
        ob_clean();
        header("Location: module/account.html");
        ob_end_flush();
        exit();
    }
    

?>