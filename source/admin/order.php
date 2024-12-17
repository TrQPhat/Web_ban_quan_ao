<?php
include 'database.php';

// Tìm kiếm hóa đơn
$search = $_GET['search'] ?? '';
$query = "
    SELECT hoadonban.*, khachhang.tenkh, trangthai.tentt
    FROM hoadonban
    LEFT JOIN khachhang ON hoadonban.makh = khachhang.makh
    LEFT JOIN trangthai ON hoadonban.matt = trangthai.matt
    WHERE hoadonban.mahd LIKE ?
";
$stmt = $pdo->prepare($query);
$stmt->execute(["%$search%"]);
$invoices = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Xem chi tiết hóa đơn bán
$invoiceDetails = [];
if (isset($_GET['view'])) {
    $mahd = $_GET['view'];
    $stmtDetails = $pdo->prepare("
        SELECT * FROM chitiethoadonban WHERE mahd = ?
    ");
    $stmtDetails->execute([$mahd]);
    $invoiceDetails = $stmtDetails->fetchAll(PDO::FETCH_ASSOC);
}

// Xử lý thêm/cập nhật hóa đơn
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $mahd = $_POST['mahd'];
    $mach = $_POST['mach'];
    $makh = $_POST['makh'];
    $ngaydat = $_POST['ngaydat'];
    $matt = $_POST['matt'];

    if (isset($_POST['edit'])) {
        $query = "UPDATE hoadonban SET mach = ?, makh = ?, ngaydat = ?, matt = ? WHERE mahd = ?";
        $stmt = $pdo->prepare($query);
        $stmt->execute([$mach, $makh, $ngaydat, $matt, $mahd]);
        echo "<script>alert('Hóa đơn bán đã được cập nhật!');</script>";
    } else {
        $query = "INSERT INTO hoadonban (mahd, mach, makh, ngaydat, matt) VALUES (?, ?, ?, ?, ?)";
        $stmt = $pdo->prepare($query);
        $stmt->execute([$mahd, $mach, $makh, $ngaydat, $matt]);
        echo "<script>alert('Hóa đơn bán mới đã được thêm!');</script>";
    }
    header("Location: " . $_SERVER['PHP_SELF']);
    exit;
}

// Xóa hóa đơn
if (isset($_GET['delete'])) {
    $mahd = $_GET['delete'];
    $pdo->prepare("DELETE FROM chitiethoadonban WHERE mahd = ?")->execute([$mahd]);
    $pdo->prepare("DELETE FROM hoadonban WHERE mahd = ?")->execute([$mahd]);
    echo "<script>alert('Hóa đơn bán đã được xóa!');</script>";
    header("Location: " . $_SERVER['PHP_SELF']);
    exit;
}

// Lấy dữ liệu để chỉnh sửa
$editInvoice = null;
if (isset($_GET['edit'])) {
    $mahd = $_GET['edit'];
    $stmt = $pdo->prepare("SELECT * FROM hoadonban WHERE mahd = ?");
    $stmt->execute([$mahd]);
    $editInvoice = $stmt->fetch(PDO::FETCH_ASSOC);
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý hóa đơn bán</title>
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
    <h1 class="text-center mb-4">Quản lý hóa đơn bán</h1>

    <!-- Tìm kiếm và thêm hóa đơn bán -->
    <div class="d-flex justify-content-between align-items-center mb-3">
        <form class="d-flex w-100 me-3" method="GET">
            <input type="text" name="search" class="form-control search-input me-2" placeholder="Tìm kiếm hóa đơn bán" value="<?= htmlspecialchars($search) ?>">
            <button type="submit" class="btn btn-primary">Tìm kiếm</button>
        </form>
        <button type="button" class="btn btn-success" onclick="toggleForm()">Thêm</button>
    </div>
    <!-- Form hóa đơn bán -->
    <div id="invoice-form" class="<?= $editInvoice ? '' : 'd-none' ?> form-container">
        <h2><?= $editInvoice ? 'Cập nhật hóa đơn bán' : 'Thêm hóa đơn bán mới' ?></h2>
        <form method="POST">
            <input type="hidden" name="edit" value="<?= $editInvoice ? '1' : '0' ?>">
            <div class="mb-3">
                <label>Mã hóa đơn:</label>
                <input type="text" name="mahd" class="form-control" value="<?= htmlspecialchars($editInvoice['mahd'] ?? '') ?>" required>
            </div>
            <div class="mb-3">
                <label>Mã cửa hàng:</label>
                <input type="text" name="mach" class="form-control" value="<?= htmlspecialchars($editInvoice['mach'] ?? '') ?>" required>
            </div>
            <div class="mb-3">
                <label>Mã khách hàng:</label>
                <input type="text" name="makh" class="form-control" value="<?= htmlspecialchars($editInvoice['makh'] ?? '') ?>" required>
            </div>
            <div class="mb-3">
                <label>Ngày đặt:</label>
                <input type="date" name="ngaydat" class="form-control" value="<?= htmlspecialchars($editInvoice['ngaydat'] ?? '') ?>" required>
            </div>
            <div class="mb-3">
                <label>Mã trạng thái:</label>
                <input type="text" name="matt" class="form-control" value="<?= htmlspecialchars($editInvoice['matt'] ?? '') ?>" required>
            </div>
            <button type="submit" class="btn btn-primary"><?= $editInvoice ? 'Cập nhật' : 'Thêm mới' ?></button>
        </form>
    </div>

    <!-- Bảng hóa đơn bán -->
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Mã hóa đơn</th>
                <th>Mã cửa hàng</th>
                <th>Tên khách hàng</th>
                <th>Ngày đặt</th>
                <th>Trạng thái</th>
                <th>Chức năng</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($invoices as $invoice): ?>
            <tr>
                <td><?= htmlspecialchars($invoice['mahd']) ?></td>
                <td><?= htmlspecialchars($invoice['mach']) ?></td>
                <td><?= htmlspecialchars($invoice['tenkh']) ?></td>
                <td><?= htmlspecialchars($invoice['ngaydat']) ?></td>
                <td><?= htmlspecialchars($invoice['tentt']) ?></td>
                <td>
                    <a href="?view=<?= $invoice['mahd'] ?>" class="btn btn-info">Chi tiết</a>
                    <a href="?edit=<?= $invoice['mahd'] ?>" class="btn btn-warning">Sửa</a>
                    <a href="?delete=<?= $invoice['mahd'] ?>" class="btn btn-danger" onclick="return confirm('Xác nhận xóa?')">Xóa</a>
                </td>
            </tr>
            <?php endforeach; ?>
        </tbody>
    </table>

    <!-- Chi tiết hóa đơn -->
    <?php if (!empty($invoiceDetails)): ?>
    <h2 class="mt-5">Chi tiết hóa đơn: <?= htmlspecialchars($_GET['view']) ?></h2>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Mã hóa đơn</th>
                <th>Mã sản phẩm</th>
                <th>Mã size</th>
                <th>Số lượng</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($invoiceDetails as $detail): ?>
            <tr>
                <td><?= htmlspecialchars($detail['mahd']) ?></td>
                <td><?= htmlspecialchars($detail['masp']) ?></td>
                <td><?= htmlspecialchars($detail['masize']) ?></td>
                <td><?= htmlspecialchars($detail['soluong']) ?></td>
            </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
    <?php endif; ?>
</div>

<script>
    function toggleForm() {
        document.getElementById('invoice-form').classList.toggle('d-none');
    }
</script>
</body>
</html>
