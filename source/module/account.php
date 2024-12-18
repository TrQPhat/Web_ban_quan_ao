<?php if (!isset($_SESSION)) session_start();?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
    <link rel="stylesheet" href="../styles/account.css" />

    <title>Login | Fat Store</title>
</head>

<body>
    <div class="container" id="container">
        <div class="form-container sign-up">
            <form>
                <h1>Tạo tài khoản</h1>
                <div class="social-icons">
                    <a href="#" class="icon"><i class="fa-brands fa-google-plus-g"></i></a>
                    <a href="#" class="icon"><i class="fa-brands fa-facebook-f"></i></a>
                </div>
                <span>hoặc có thể sử dụng tài khoản email để đăng ký</span>
                <input type="text" placeholder="Họ và tên" id="nameInput" />
                <input type="email" placeholder="Email" id="emailInput" />
                <input type="text" placeholder="Số điện thoại" id="numInput" maxlength="10" />
                <input type="password" placeholder="Mật khẩu" id="password" />
                <input type="password" placeholder="Nhập lại mật khẩu" id="rePassword" />
                <button onclick="submitSignUp()">Đăng ký</button>
            </form>
        </div>
        <div class="form-container sign-in">
            <form novalidate>
                <h1>Đăng nhập</h1>
                <div class="social-icons">
                    <a href="#" class="icon"><i class="fa-brands fa-google-plus-g"></i></a>
                    <a href="#" class="icon"><i class="fa-brands fa-facebook-f"></i></a>
                </div>
                <span>hoặc có thể sử dụng mật khẩu email</span>
                <input type="email" id="emailLogin" placeholder="Email" />
                <input type="password" id="passwordLogin" placeholder="Mật khẩu" />
                <a href="#">Quên mật khẩu ?</a>
                <button onclick="submitLogin()">Đăng nhập</button>
            </form>
        </div>
        <div class="toggle-container">
            <div class="toggle">
                <div class="toggle-panel toggle-left">
                    <h1>Chào mừng quay trở lại !</h1>
                    <p>
                        Nhập thông tin cá nhân của bạn để sử dụng tất cả các tính năng của
                        trang web.
                    </p>
                    <button class="hidden" id="login">Đăng nhập</button>
                </div>
                <div class="toggle-panel toggle-right">
                    <h1>Xin chào !</h1>
                    <p>
                        Đăng ký với thông tin cá nhân của bạn để sử dụng tất cả các tính
                        năng của trang web.
                    </p>
                    <button class="hidden" id="register">Đăng ký</button>
                </div>
            </div>
        </div>
        <a href="<?php echo $_SESSION['previous_url']?>"><i class="fa-solid fa-xmark"></i></a>
    </div>
</body>
<script src="../scripts/account.js"></script>

</html>