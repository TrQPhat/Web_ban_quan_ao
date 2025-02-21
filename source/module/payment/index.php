<link rel="stylesheet" href="../styles/payment.css">
<?php
    $_SESSION['previous_url'] = "http://" . $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI'];
    $step = 0;
    if ($_SERVER["REQUEST_METHOD"] === "POST") {
        // Lấy email từ form
        if (isset($_POST['submit'])){
            $step = 3;
            $email = $_POST['emailDatHang'];
            $ten = $_POST['name'];
            
            include ROOT."/include/address.php";
            $province_name = getProvinceByCode($_POST['province']);
            $district_name =  getDistrictByCode($_POST['district']);
            $ward_name = getWardByCode($_POST['ward']);
            
            $diachi = implode(", ", [$_POST['address'], $ward_name, $district_name, $province_name]);
            $gioitinh = $_POST['sex'];
            $ngaysinh = $_POST['birthday'];
            $sdt = $_POST['phone'];
            $mach = MA_CH;
            $httt = $_POST['pay'];
            $ngaydat = date('Y-m-d H:i:s');
            $matt = "CXN";
            $query="SELECT count(`email`) FROM `khachhang` WHERE email=?";
            $makh ="";
            if ($db->executeScalarWithParams($query,[$email])==0) {
                $query = "INSERT INTO `khachhang`(`tenkh`, `gioitinh`, `ngaysinh`, `diachi`, `email`, `sdt`) VALUES (?,?,?,?,?,?)";
                $db->executeNonQuery($query,[$ten,$gioitinh,$ngaysinh,$diachi,$email,$sdt]);
                $makh= $db->last_id_insert;
            }
            else {
                $query = "SELECT `makh` FROM `khachhang` WHERE `email`= ? OR `sdt` = ?";
                $makh = $db->executeScalarWithParams($query,[$email, $sdt]);
            }
            $query = "INSERT INTO `hoadonban`(`mach`, `makh`, `httt`, `ngaydat`, `matt`) VALUES (?,?,?,?,?)";
            $db->executeNonQuery($query, [$mach, $makh, $httt, $ngaydat, $matt]);
            $mahd = $db->last_id_insert;
        }
        // echo "<script> addProduct($mahd);</script>";
    }
    if (!isset($_SESSION['user_login'])){
     ?>

<div class="payment-container">

    <div class="process-bar">
        <button class="process-bar-item<?php echo $step==0?" selected":""?>" onclick="clickBarItem(0)">CHI TIẾT</button>
        <i class="fa-solid fa-thin fa-forward" style="color: #ccc"></i>
        <button class="process-bar-item" onclick="clickBarItem(1)">VẬN CHUYỂN</button>
        <i class="fa-solid fa-thin fa-forward" style="color: #ccc"></i>
        <button class="process-bar-item" onclick="clickBarItem(2)">THANH TOÁN</button>
        <i class="fa-solid fa-thin fa-forward" style="color: #ccc"></i>
        <button class="process-bar-item<?php echo $step==3?" selected":""?>" onclick="clickBarItem(3)">HOÀN
            THÀNH</button>
    </div>

    <div class="payment-info">
        <form method="post" id="payment-form">
            <?php
        if ($step == 0){
            include "include/detail.php";
        include "include/transpost.php";
        include "include/payment.php";
        } else include "include/complete.php";
    
        ?>
        </form>
    </div>
    <!-- Phần Giỏ hàng -->
    <div id="cartDialog cartDialog-payment" class="cart-dialog cartDialog-payment">
        <div class="dialog-content">
            <div class="dialog-title">ĐẶT HÀNG</div>
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