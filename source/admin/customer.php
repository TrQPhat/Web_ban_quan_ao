<?php
include 'database.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $makh = $_POST['makh'];
    $tenkh = $_POST['tenkh'];
    $gioitinh = $_POST['gioitinh'];
    $ngaysinh = $_POST['ngaysinh'];
    $diachi = $_POST['diachi'];
    $email = $_POST['email'];
    $sdt = $_POST['sdt'];
    
    if (isset($_POST['edit'])) {
        // Cập nhật thông tin khách hàng
        $query = "UPDATE khachhang SET tenkh = ?, gioitinh = ?, ngaysinh = ?, diachi = ?, email = ?, sdt = ? WHERE makh = ?";
        $params = [$tenkh, $gioitinh, $ngaysinh, $diachi, $email, $sdt, $makh];
        
        $stmt = $pdo->prepare($query);
        $stmt->execute($params);

        echo "<script>alert('Thông tin khách hàng đã được cập nhật thành công!');</script>";
    } else {
        // Thêm khách hàng mới
        $stmt = $pdo->prepare("INSERT INTO khachhang (makh, tenkh, gioitinh, ngaysinh, diachi, email, sdt) VALUES (?, ?, ?, ?, ?, ?, ?)");
        $stmt->execute([$makh, $tenkh, $gioitinh, $ngaysinh, $diachi, $email, $sdt]);
        echo "<script>alert('Thông tin khách hàng đã được thêm thành công!');</script>";
    }
    header('Location: customer.php');
    exit;
}

if (isset($_GET['delete'])) {
    $makh = $_GET['delete'];
    $stmt = $pdo->prepare("DELETE FROM khachhang WHERE makh = ?");
    $stmt->execute([$makh]);
    echo "<script>alert('Thông tin khách hàng đã được xóa thành công!');</script>";
    header('Location: customer.php');
    exit;
}

$search = $_GET['search'] ?? '';

// Lọc khách hàng theo tìm kiếm
$query = "SELECT * FROM khachhang WHERE tenkh LIKE ?";
$stmt = $pdo->prepare($query);
$stmt->execute(["%$search%"]);
$customers = $stmt->fetchAll(PDO::FETCH_ASSOC);

$editCustomer = null;
if (isset($_GET['edit'])) {
    $makh = $_GET['edit'];
    $stmt = $pdo->prepare("SELECT * FROM khachhang WHERE makh = ?");
    $stmt->execute([$makh]);
    $editCustomer = $stmt->fetch(PDO::FETCH_ASSOC);
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý khách hàng</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="styles.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .hidden {
            display: none;
        }
        .form-container {
            margin-top: 20px;
            padding: 20px;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        table {
            background: #fff;
        }
        .search-input {
            flex: 1;
        }
    </style>
</head>
<body>
<header>
    <h1>Trang quản trị cửa hàng</h1>
</header>
<nav>
    <a href="product.php">Quản lý sản phẩm</a>
    <a href="customer.php">Quản lý khách hàng</a>
    <a href="order.php">Quản lý hóa đơn bán</a>
    <a href="invoice.php">Quản lý hóa đơn nhập</a>
</nav>
<div class="container mt-4">
    <h1 class="text-center mb-4">Quản lý khách hàng</h1>

    <!-- Tìm kiếm và thêm khách hàng -->
    <div class="d-flex justify-content-between align-items-center mb-3">
        <form class="d-flex w-100 me-3" method="GET">
            <input type="text" name="search" class="form-control search-input me-2" placeholder="Tìm kiếm khách hàng" value="<?= htmlspecialchars($search) ?>">
            <button type="submit" class="btn btn-primary">Tìm kiếm</button>
        </form>
        <button type="button" class="btn btn-success" onclick="toggleForm()">Thêm</button>
    </div>

    <!-- Form thêm/sửa khách hàng -->
    <div id="customer-form" class="form-container <?= $editCustomer ? '' : 'hidden' ?>">
        <h2 class="mb-3"><?= $editCustomer ? 'Chỉnh sửa khách hàng' : 'Thêm khách hàng mới' ?></h2>
        <form method="POST">
            <input type="hidden" name="edit" value="<?= $editCustomer ? '1' : '0' ?>">
            <div class="mb-3">
                <label class="form-label">Mã khách hàng:</label>
                <input type="text" name="makh" class="form-control" value="<?= htmlspecialchars($editCustomer['makh'] ?? '') ?>" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Tên khách hàng:</label>
                <input type="text" name="tenkh" class="form-control" value="<?= htmlspecialchars($editCustomer['tenkh'] ?? '') ?>" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Giới tính:</label>
                <input type="text" name="gioitinh" class="form-control" value="<?= htmlspecialchars($editCustomer['gioitinh'] ?? '') ?>" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Ngày sinh:</label>
                <input type="date" name="ngaysinh" class="form-control" value="<?= htmlspecialchars($editCustomer['ngaysinh'] ?? '') ?>" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Địa chỉ:</label>
                <input type="text" name="diachi" class="form-control" value="<?= htmlspecialchars($editCustomer['diachi'] ?? '') ?>" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Email:</label>
                <input type="email" name="email" class="form-control" value="<?= htmlspecialchars($editCustomer['email'] ?? '') ?>" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Số điện thoại:</label>
                <input type="text" name="sdt" class="form-control" value="<?= htmlspecialchars($editCustomer['sdt'] ?? '') ?>" required>
            </div>
            <button type="submit" class="btn btn-primary"><?= $editCustomer ? 'Cập nhật' : 'Thêm khách hàng' ?></button>
        </form>
    </div>

    <!-- Bảng khách hàng -->
    <table class="table table-bordered mt-4">
        <thead>
            <tr>
                <th>Mã khách hàng</th>
                <th>Tên khách hàng</th>
                <th>Giới tính</th>
                <th>Ngày sinh</th>
                <th>Địa chỉ</th>
                <th>Email</th>
                <th>Số điện thoại</th>
                <th>Chức năng</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($customers as $index => $customer): ?>
                <tr>
                    <td><?= htmlspecialchars($customer['makh']) ?></td> 
                    <td><?= htmlspecialchars($customer['tenkh']) ?></td>
                    <td><?= htmlspecialchars($customer['gioitinh']) ?></td>
                    <td><?= htmlspecialchars($customer['ngaysinh']) ?></td>
                    <td><?= htmlspecialchars($customer['diachi']) ?></td>
                    <td><?= htmlspecialchars($customer['email']) ?></td>
                    <td><?= htmlspecialchars($customer['sdt']) ?></td>
                    <td>
                        <a href="?edit=<?= htmlspecialchars($customer['makh']) ?>" class="btn btn-warning">Sửa</a>
                        <a href="?delete=<?= htmlspecialchars($customer['makh']) ?>" class="btn btn-danger" onclick="return confirm('Bạn có chắc chắn muốn xóa khách hàng này?')">Xóa</a>
                    </td>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
</div>

<script>
    function toggleForm() {
        document.getElementById('customer-form').classList.toggle('hidden');
    }
</script>
</body>
</html>
