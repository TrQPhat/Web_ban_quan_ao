<?php
    function connectdb() {
    
        $servername = "localhost";
        $username = "root";
        $password = "";
        $dbname = "vie_address";
        
        try {
            // Tạo kết nối PDO
            $conn = new PDO("mysql:host=$servername;dbname=$dbname;charset=utf8", $username, $password);
            $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION); // Kích hoạt chế độ báo lỗi
            return $conn; // Trả về đối tượng kết nối PDO
        } catch(PDOException $e) {
            die("Kết nối thất bại: " . $e->getMessage()); // Kết thúc nếu lỗi xảy ra
        }
    }

    function excuteSQL($sql){
        $conn = connectdb(); // Lấy kết nối từ hàm connectdb

        try {
            $stmt = $conn->prepare($sql);
            $stmt->execute();
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        } catch (PDOException $e) {
            echo "Lỗi truy vấn: " . $e->getMessage();
            return null;
        }
    }

    function executeSQLWithParams($sql, $params = []) {
        $conn = connectdb();
        try {
            $stmt = $conn->prepare($sql);
            $stmt->execute($params);
            $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

            return $result;
        } catch (PDOException $e) {
            echo "Lỗi truy vấn: " . $e->getMessage();
            return null;
        }
    }

    function getAllProvinces(){
        $sql = "SELECT code, name FROM `provinces` ORDER BY name;";
        return excuteSQL($sql);
    }

    function getAllDistrictsOfProvince($province_code){
        $sql = "SELECT code, full_name FROM `districts` WHERE province_code = ? ORDER BY name";
        return executeSQLWithParams($sql, [$province_code]);
    }

    function getAllWardsOfDistrict($district_code){
        $sql = "SELECT code, full_name FROM `wards` WHERE district_code = ? ORDER BY name";
        return executeSQLWithParams($sql, [$district_code]);
    
    }

    $provinces = getAllProvinces();

    if (isset($_GET['province_id'])) {
        $provinceId = $_GET['province_id'];
        $districts = getAllDistrictsOfProvince($provinceId);
        echo '<option value="none">--Chọn quận/huyện--</option>';
        foreach ($districts as $district)
            echo '<option value="'.$district['code'].'">'.$district['full_name'].'</option>';
    }

    if (isset($_GET['district_id'])) {
        $districtId = $_GET['district_id'];
        $wards = getAllWardsOfDistrict($districtId);
        echo '<option value="none">--Chọn phường/xã--</option>';
        foreach ($wards as $ward)
            echo '<option value="'.$ward['code'].'">'.$ward['full_name'].'</option>';
    }
?>