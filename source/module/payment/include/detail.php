<?php
    if (isset($_POST['emailDatHang'])){
        $_SESSION['emailDatHang'] = $_POST['emailDatHang'];
        echo "có";
    }
?>

<!-- Phần Mua hàng không cần đăng nhập -->
<section class="payment-checkout payment-page  active">
    <h4>MUA HÀNG KHÔNG CẦN ĐĂNG NHẬP</h4>
    <p>Chúng tôi sẽ gửi thông tin đặt hàng đến email của bạn</p>
    <input type="text" placeholder="Nhập email của bạn" id="emailDatHang" name="emailDatHang" />
    <div class="payment-actions">
        <button class="payment-action-btn go-to-login-btn" name="go_to_login"><a href="../index.php?mod=account">
                CHUYỂN HƯỚNG ĐĂNG NHẬP
                <i class="fa-solid fa-thin fa-forward"></i>
            </a>
        </button>

        <button class="payment-action-btn none-email-btn" name="no_email" onclick="changeCurrentBarItem(1)">TÔI
            KHÔNG CÓ ĐỊA CHỈ EMAIL</button>

        <button class="payment-action-btn next-step-btn" onclick="validateForm(1)" name="next_step">TIẾP
            TỤC</button>
    </div>
</section>