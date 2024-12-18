<link rel="stylesheet" href="../styles/payment.css">
<?php
    $_SESSION['previous_url'] = "http://" . $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI'];
    $_SESSION['order'] = [];
    if ($_SERVER["REQUEST_METHOD"] === "POST") {
        // Lấy email từ form
        if (isset($_POST['submit'])){
            // $_SESSION['order'][] = array("email"=>$_POST['emailDatHang']);
            // echo $_SESSION['order']['email'];
        }
    }
    if (!isset($_SESSION['user_login'])){
     ?>
<div class="payment-container">

    <div class="process-bar">
        <button class="process-bar-item selected" onclick="clickBarItem(0)">CHI TIẾT</button>
        <i class="fa-solid fa-thin fa-forward" style="color: #ccc"></i>
        <button class="process-bar-item" onclick="clickBarItem(1)">VẬN CHUYỂN</button>
        <i class="fa-solid fa-thin fa-forward" style="color: #ccc"></i>
        <button class="process-bar-item" onclick="clickBarItem(2)">THANH TOÁN</button>
        <i class="fa-solid fa-thin fa-forward" style="color: #ccc"></i>
        <button class="process-bar-item" onclick="clickBarItem(3)">HOÀN THÀNH</button>
    </div>


    <form method="post" id="payment-form">
        <?php
        include "include/detail.php";
        include "include/transpost.php";
        include "include/payment.php";
        include "include/complete.php";
    
    ?>
    </form>
    <!-- Phần Giỏ hàng -->
    <div id="cartDialog" class="cart-dialog">
        <div class="dialog-content">
            <div class="dialog-title">Giỏ Hàng</div>
            <div id="cartItems" class="cartItems">
                <!-- các sản phẩm trong giỏ hang, sinh ra ở cartEvent.js -->
            </div>

            <div class="dialog-footer">
                <div class="product-total">
                    <p class="product-total-title">Sản phẩm:</p>

                </div>
                <div class="tranfer-fee">
                    <p class="product-total-title">Vận chuyển:</p>

                </div>
                <div class="cart-total" id="total-bill-payment">
                    Tổng đơn đặt hàng:
                </div>
            </div>
        </div>
    </div>
</div>
<?php   
    }
?>

<script src="../../scripts/payment.js"></script>