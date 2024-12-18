<?php
include 'database.php';

// Lấy hóa đơn để tìm kiếm
$search = $_GET['search'] ?? '';
$query = "SELECT * FROM hoadonnhap WHERE mahd LIKE ?";
$stmt = $pdo->prepare($query);
$stmt->execute(["%$search%"]);
$invoices = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Lấy chi tiết hóa đơn nếu nhấp vào "xem"
$invoiceDetails = [];
if (isset($_GET['view'])) {
    $mahd = $_GET['view'];
    $stmtDetails = $pdo->prepare("SELECT * FROM chitiethoadonnhap WHERE mahd = ?");
    $stmtDetails->execute([$mahd]);
    $invoiceDetails = $stmtDetails->fetchAll(PDO::FETCH_ASSOC);
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $mahd = $_POST['mahd'];
    $math = $_POST['math'];
    $ngaynhap = $_POST['ngaynhap'];
    $mach = $_POST['mach'];

    if (isset($_POST['edit'])) {
        // Sửa hóa đơn nhập
        $query = "UPDATE hoadonnhap SET math = ?, ngaynhap = ?, mach = ? WHERE mahd = ?";
        $stmt = $pdo->prepare($query);
        $stmt->execute([$math, $ngaynhap, $mach, $mahd]);

        echo "<script>alert('Hóa đơn nhập đã được cập nhật!');</script>";
    } else {
        // Thêm hóa đơn nhập
        $query = "INSERT INTO hoadonnhap (mahd, math, ngaynhap, mach) VALUES (?, ?, ?, ?)";
        $stmt = $pdo->prepare($query);
        $stmt->execute([$mahd, $math, $ngaynhap, $mach]);

        echo "<script>alert('Hóa đơn nhập mới đã được thêm!');</script>";
    }
    header("Location: " . $_SERVER['PHP_SELF']);
    exit;
}

// Xóa hóa đơn nhập
if (isset($_GET['delete'])) {
    $mahd = $_GET['delete'];
    $pdo->prepare("DELETE FROM chitiethoadonnhap WHERE mahd = ?")->execute([$mahd]);
    $pdo->prepare("DELETE FROM hoadonnhap WHERE mahd = ?")->execute([$mahd]);

    echo "<script>alert('Hóa đơn nhập đã được xóa!');</script>";
    header("Location: " . $_SERVER['PHP_SELF']);
    exit;
}

// Lấy hóa đơn để chỉnh sửa
$editInvoice = null;
if (isset($_GET['edit'])) {
    $mahd = $_GET['edit'];
    $stmt = $pdo->prepare("SELECT * FROM hoadonnhap WHERE mahd = ?");
    $stmt->execute([$mahd]);
    $editInvoice = $stmt->fetch(PDO::FETCH_ASSOC);
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý hóa đơn nhập</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="styles.css">
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
    <h1 class="text-center mb-4">Quản lý hóa đơn nhập</h1>

    <!-- Tìm kiếm và thêm hóa đơn nhập -->
    <div class="d-flex justify-content-between align-items-center mb-3">
        <form class="d-flex w-100 me-3" method="GET">
            <input type="text" name="search" class="form-control search-input me-2" placeholder="Tìm kiếm hóa đơn nhập" value="<?= htmlspecialchars($search) ?>">
            <button type="submit" class="btn btn-primary">Tìm kiếm</button>
        </form>
        <button type="button" class="btn btn-success" onclick="toggleForm()">Thêm</button>
    </div>
    <!-- Form hóa đơn nhập -->
    <div id="invoice-form" class="<?= $editInvoice ? '' : 'd-none' ?> mb-5">
        <h2><?= $editInvoice ? 'Cập nhật hóa đơn nhập' : 'Thêm hóa đơn nhập mới' ?></h2>
        <form method="POST">
            <input type="hidden" name="edit" value="<?= $editInvoice ? '1' : '0' ?>">
            <div class="mb-3">
                <label>Mã hóa đơn:</label>
                <input type="text" name="mahd" class="form-control" value="<?= htmlspecialchars($editInvoice['mahd'] ?? '') ?>" required>
            </div>
            <div class="mb-3">
                <label>Mã thương hiệu:</label>
                <input type="text" name="math" class="form-control" value="<?= htmlspecialchars($editInvoice['math'] ?? '') ?>" required>
            </div>
            <div class="mb-3">
                <label>Ngày nhập:</label>
                <input type="date" name="ngaynhap" class="form-control" value="<?= htmlspecialchars($editInvoice['ngaynhap'] ?? '') ?>" required>
            </div>
            <div class="mb-3">
                <label>Mã cửa hàng:</label>
                <input type="text" name="mach" class="form-control" value="<?= htmlspecialchars($editInvoice['mach'] ?? '') ?>" required>
            </div>
            <button type="submit" class="btn btn-primary"><?= $editInvoice ? 'Cập nhật' : 'Thêm mới' ?></button>
        </form>
    </div>

    <!-- Bảng hóa đơn nhập -->
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Mã hóa đơn</th>
                <th>Mã thương hiệu</th>
                <th>Ngày nhập</th>
                <th>Mã cửa hàng</th>
                <th>Chức năng</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($invoices as $invoice): ?>
                <tr>
                    <td><?= htmlspecialchars($invoice['mahd']) ?></td>
                    <td><?= htmlspecialchars($invoice['math']) ?></td>
                    <td><?= htmlspecialchars($invoice['ngaynhap']) ?></td>
                    <td><?= htmlspecialchars($invoice['mach']) ?></td>
                    <td>
                        <a href="?view=<?= $invoice['mahd'] ?>" class="btn btn-info">Xem</a>
                        <a href="?edit=<?= $invoice['mahd'] ?>" class="btn btn-warning">Sửa</a>
                        <a href="?delete=<?= $invoice['mahd'] ?>" class="btn btn-danger" onclick="return confirm('Bạn có chắc chắn muốn xóa?')">Xóa</a>
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

