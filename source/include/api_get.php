<?php
    include "../config/config.php";
    include "../model/DBHelper.class.php";
    $db = new DBHelper();
// Kiểm tra xem dữ liệu có được gửi tới không
if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    // Lấy dữ liệu từ client
    $id = isset($_GET['id']) ? $_GET['id'] : null;
    $size = isset($_GET['size']) ? $_GET['size'] : null;

    $query = "SELECT soluong from tonkho
                WHERE mach= ? AND masp = ? AND masize=?;";
      
    $gh= $db->executeScalarWithParams($query,[MA_CH, $id, $size]); 

    // Xử lý dữ liệu (ví dụ: truy vấn database)
    if ($id && $size) {
        // Ví dụ: trả về dữ liệu JSON
        echo json_encode([
            "success" => true,
            "message" => "received",
            "maxquantity" => $gh
        ]);
    } else {
        // Trả về lỗi nếu thiếu dữ liệu
        http_response_code(400); // Bad Request
        echo json_encode([
            "success" => false,
            "message" => "none"
        ]);
    }
} else {
    http_response_code(405); // Method Not Allowed
    echo json_encode([
        "success" => false,
        "message" => "method not allowed"
    ]);
}
?>