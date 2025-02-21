<?php
class DBHelper {
    private $dbhelper = null;  // Đối tượng PDO
    public $last_id_insert = null;
    public function __construct() {
        $driver = "mysql:host=" . HOST . "; dbname=" . DB_NAME;
        try {
            $this->dbhelper = new PDO($driver, DB_USER, DB_PASS);
            $this->dbhelper->query("set names 'utf8' ");
            $this->dbhelper->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        } catch (PDOException $e) {
            echo "Err:" . $e->getMessage();
            exit();
        }
    }

    public function __destruct() {
        $this->dbhelper = null;
    }

    // Truy vấn không điều kiện, trả về nhiều giá trị
    public function executeQuery($sql) {
        try {
            $stmt = $this->dbhelper->prepare($sql);
            $stmt->execute();
            $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

            return $result;
        } catch (PDOException $e) {
            echo "Lỗi truy vấn: " . $e->getMessage();
            return null;
        }
    }

    // Truy vấn có điều kiện, trả về nhiều giá trị
    public function executeQueryWithParams($sql, $params = []) {
        try {
            $stmt = $this->dbhelper->prepare($sql);
            $stmt->execute($params);
            $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

            return $result;
        } catch (PDOException $e) {
            echo "Lỗi truy vấn: " . $e->getMessage();
            return null;
        }
    }

    // Truy vấn có điều kiện, trả về một giá trị duy nhất
    public function executeScalar($sql) {
        try {
            $stmt = $this->dbhelper->prepare($sql);
            $stmt->execute();
            $result = $stmt->fetchColumn();
             
            return $result;
        } catch (PDOException $e) {
            echo "Lỗi truy vấn: " . $e->getMessage();
            return null;
        }
    }

    // Truy vấn có điều kiện, trả về một giá trị duy nhất với tham số
    public function executeScalarWithParams($sql, $params = []) {
        try {
            $stmt = $this->dbhelper->prepare($sql);
            $stmt->execute($params);
            $result = $stmt->fetchColumn();
            return $result;
        } catch (PDOException $e) {
            echo "Lỗi truy vấn: " . $e->getMessage();
            return null;
        }
    }

    // Thêm, sửa, xóa (Không trả về dữ liệu)
    public function executeNonQuery($sql, $params = []) {
        try {
            $stmt = $this->dbhelper->prepare($sql);
            $stmt->execute($params);
            $this->last_id_insert = $this->dbhelper->lastInsertId();
            return true;
        } catch (PDOException $e) {
            echo "Lỗi thực thi: " . $e->getMessage();
            return false;
        }
    }
}
?>