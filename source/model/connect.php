<?php
// Hàm kết nối cơ sở dữ liệu MySQL

function connectdb() {
    
    try {
        // Tạo kết nối PDO
        $driver="mysql:host=". HOST."; dbname=". DB_NAME . ";charset=utf8";
        $conn = new PDO($driver, DB_USER, DB_PASS);
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION); // Kích hoạt chế độ báo lỗi
        return $conn; // Trả về đối tượng kết nối PDO
    } catch(PDOException $e) {
        die("Kết nối thất bại: " . $e->getMessage()); // Kết thúc nếu lỗi xảy ra
    }
}


// Hàm thực hiện truy vấn SQL
function executeQuery($sql) { // truy vấn không điều kiện trả về nhiều giá trị,

    $conn = connectdb(); // Lấy kết nối từ hàm connectdb

    try {
               
        // Cấu hình PDO để hiển thị lỗi
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        
        // Chuẩn bị và thực thi câu lệnh SQL
        $stmt = $conn->prepare($sql);
        $stmt->execute();
        
        // Lấy kết quả truy vấn dưới dạng mảng kết hợp
        $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
        
        // Đóng kết nối khi không sử dụng nữa
        $conn = null;
        
        // Trả về kết quả truy vấn
        return $result;
    } catch(PDOException $e) {
        // Nếu có lỗi trong truy vấn, hiển thị lỗi chi tiết
        echo "Truy vấn thất bại: " . $e->getMessage();
        return null;  // Trả về mảng rỗng nếu có lỗi
    }
    
}


//truy vấn có điều kiện, trả về nhiều giá trị
function executeQueryWithParams($sql, $params = []) {
    try {
        $conn = connectdb(); // Kết nối đến cơ sở dữ liệu

        // Chuẩn bị câu lệnh SQL
        $stmt = $conn->prepare($sql);

        // Thực thi câu lệnh
        $stmt->execute($params);

        // Trả về kết quả (dữ liệu)
        return $stmt->fetchAll(PDO::FETCH_ASSOC);

    } catch (PDOException $e) {
        echo "Lỗi: " . $e->getMessage();
        return null; // Nếu có lỗi, trả về null
    }
}


//có điều kiện, trả về duy nhất một giá trị
function executeScalar($sql) {
    try {
        $conn = connectdb(); // Kết nối đến cơ sở dữ liệu

        // Chuẩn bị câu lệnh SQL
        $stmt = $conn->prepare($sql);

        // Thực thi câu lệnh với tham số
        $stmt->execute();

        // Lấy một giá trị duy nhất (ví dụ: COUNT, SUM, MIN, MAX, v.v.)
        $result = $stmt->fetchColumn();

        // Trả về kết quả
        return $result;

    } catch (PDOException $e) {
        echo "Lỗi: " . $e->getMessage();
        return null; // Nếu có lỗi, trả về null
    }
}

//truy vấn có điều kiện. trả về 1 giá trị duy nhất
function executeScalarWithParams($sql, $params = []) {
    try {
        $conn = connectdb(); // Kết nối đến cơ sở dữ liệu

        // Chuẩn bị câu lệnh SQL
        $stmt = $conn->prepare($sql);

        // Thực thi câu lệnh với tham số
        $stmt->execute($params);

        // Lấy một giá trị duy nhất (ví dụ: COUNT, SUM, MIN, MAX, v.v.)
        $result = $stmt->fetchColumn();

        // Trả về kết quả
        return $result;

    } catch (PDOException $e) {
        echo "Lỗi: " . $e->getMessage();
        return null; // Nếu có lỗi, trả về null
    }
}


function executeNonQuery($query){ //Sử dụng để thêm xóa sửa
    $conn = connectdb(); // Lấy kết nối từ hàm connectdb

    try {
        $stmt = $conn->prepare($query);
        $stmt->execute();
        return true;
    } catch (PDOException $e) {
        return false;
    }
}

?>