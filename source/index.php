<?php 
    include "config/config.php";
    include "include/function.php";
    if (!isset($_SESSION)) session_start();
    spl_autoload_register("loadClass");
    $db = new DBHelper();
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <!--font---------------------------->
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@200..700&amp;display=swap" rel="stylesheet" />

    <!--CSS----------------------------->
    <link rel="stylesheet" href="styles/bootstrap.min.css" />
    <link rel="stylesheet" href="styles/fontawesome-free-6.5.2/css/all.min.css" />
    <link rel="stylesheet" href="styles/slideshow.css" />
    <link rel="stylesheet" href="styles/page_preloader.css" />
    <link rel="stylesheet" href="styles/style.css" />
    <link rel="stylesheet" href="styles/main.css" />
    <link rel="stylesheet" href="styles/pagination.css" />

    <!--Script-------------------------->
    <script type="text/javascript" src="scripts/slideshow.js"></script>
    <script type="text/javascript" src="scripts/page_preloader.js"></script>
    <script type="text/javascript" src="scripts/bootstrap.bundle.min.js"></script>
    <script type="text/javascript" src="scripts/main.js"></script>
    <script type="text/javascript" src="scripts/all_page.js"></script>

    <?php 
        $mod = isset($_GET['mod']) ? $_GET['mod'] : "home";
        $title = "Trang chủ";
        if ($mod == "contact") {
            $title = "Liên hệ";
            echo '<link rel="stylesheet" href="styles/lien_he.css" />';
        }
        else if ($mod == "account") $title = "Tài khoản";
        else if ($mod == "product_detail"){
            $title = "Chi tiết";
        }
     ?>

    <style>
    #navbarSupportedContent ul <?php echo '.'.$mod.'NavItem'?> {
        color: #f7f0f0;
    }

    /* mặc kệ, không có vấn đề gì */
    </style>

    <title> <?php echo $title; unset($title) ?> | Fat Store</title>
</head>

<body>
    <!--pre loadder-->
    <div id="preLoader">
        <div class="infinityChrome">
            <div></div>
            <div></div>
            <div></div>
        </div>
    </div>

    <div class="content" id="content">
        <?php 
            ob_start();
            include "include/header.html" ;
            include "mod.php";
            include "include/footer.html"; 
            ob_end_flush();
        ?>

        <!-- Nút Quay về đầu trang -->
        <button onclick="topFunction()" id="topBtn" title="Go to top">
            <i class="fa-solid fa-chevron-up"></i>
        </button>

        <!-- action button ----------------->

        <button id="openActionBtn" onclick="openActionButton()">
            <i class="fa-solid fa-chevron-down"></i>
        </button>

        <button id="closeActionBtn" onclick="closeActionButton()">
            <i class="fa-solid fa-chevron-up"></i>
        </button>

        <div id="action-button">
            <img src="./images/logo/facebook_logo.png" alt="fb" />
            <img src="./images/logo/messenger.png" alt="mess" />
            <img src="./images/logo/zalo.png" alt="zalo" style="border-radius: 7px" />
            <img src="./images/logo/gmail.png" alt="email" />
            <img src="./images/logo/map_1865269.png" alt="map" />
            <img src="./images/logo/phone.png" alt="tel" />
        </div>
    </div>
</body>

</html>