<?php
include "../model/DBHelper.class.php";
$db =  new DBHelper();
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Lấy giỏ hàng từ POST và chuyển JSON thành mảng PHP
    $cart = json_decode($_POST['cart'], true);
    $mahd = $_POST['mahd'];
    // Kiểm tra nếu có giỏ hàng
    if (!empty($cart)) {
        foreach($cart as $sp){
            $masp = $sp['id'];
            $size = $sp['size'];
            $quantity = $sp['quantity'];
            $query = "SELECT soluong FROM `tonkho` WHERE `mach`=? AND `masp`=? AND `masize`=?";
            if ($db->executeScalarWithParams($query, [MA_CH, $masp, $size])<$sp['quantity']){
                echo json_encode(['success' => false, 'message' => "Số lượng mặt hàng ".$sp['id']." không đủ"]);
               exit;
            }
            
        }
        
    } 
}
?>