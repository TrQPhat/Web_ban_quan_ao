<?php
include 'database.php';

$categories = $pdo->query("SELECT * FROM loaisanpham")->fetchAll(PDO::FETCH_ASSOC);
$brands = $pdo->query("SELECT * FROM thuonghieu")->fetchAll(PDO::FETCH_ASSOC);
$materials = $pdo->query("SELECT * FROM chatlieu")->fetchAll(PDO::FETCH_ASSOC);
$sizes = $pdo->query("SELECT * FROM size")->fetchAll(PDO::FETCH_ASSOC);

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $masp = $_POST['masp'];
    $tensp = $_POST['tensp'];
    $mota = $_POST['mota'];
    $maloai = $_POST['maloai'];
    $math = $_POST['math'];
    $mad = $_POST['mad'];
    $masize = $_POST['masize'];
    $gianhap = $_POST['gianhap'];
    $giaban = $_POST['giaban'];

    // Handle multiple image upload
    $imageNames = [];
    if (isset($_FILES['hinh']) && $_FILES['hinh']['error'][0] == 0) {
        $uploadDir = 'uploads/';
        foreach ($_FILES['hinh']['tmp_name'] as $key => $tmpName) {
            $imageName = $_FILES['hinh']['name'][$key];
            move_uploaded_file($tmpName, $uploadDir . $imageName);
            $imageNames[] = $imageName;
        }
    }

    if (isset($_POST['edit'])) {
        // Cập nhật sản phẩm
        $query = "UPDATE sanpham SET tensp = ?, mota = ?, maloai = ?, math = ?, mad = ?, masize = ?, gianhap = ?, giaban = ? WHERE masp = ?";
        $params = [$tensp, $mota, $maloai, $math, $mad, $masize, $gianhap, $giaban, $masp];

        $stmt = $pdo->prepare($query);
        $stmt->execute($params);

        // Xóa các hình ảnh cũ khỏi bảng hinhanh_sanpham
        $pdo->prepare("DELETE FROM hinhanh_sanpham WHERE masp = ?")->execute([$masp]);

        // Lưu thông tin hình ảnh mới vào bảng hinhanh_sanpham
        foreach ($imageNames as $imageName) {
            $stmt = $pdo->prepare("INSERT INTO hinhanh_sanpham (masp, tenhinh) VALUES (?, ?)");
            $stmt->execute([$masp, $imageName]);
        }

        echo "<script>alert('Sản phẩm đã được cập nhật thành công!');</script>";
    } else {
        // Thêm sản phẩm mới
        $stmt = $pdo->prepare("INSERT INTO sanpham (masp, tensp, mota, maloai, math, mad, masize, gianhap, giaban) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
        $stmt->execute([$masp, $tensp, $mota, $maloai, $math, $mad, $masize, $gianhap, $giaban]);

        // Lưu thông tin hình ảnh vào bảng hinhanh_sanpham
        foreach ($imageNames as $imageName) {
            $stmt = $pdo->prepare("INSERT INTO hinhanh_sanpham (masp, tenhinh) VALUES (?, ?)");
            $stmt->execute([$masp, $imageName]);
        }

        echo "<script>alert('Sản phẩm đã được thêm thành công!');</script>";
    }

    header('Location: product.php');
    exit;
}

if (isset($_GET['delete'])) {
    $masp = $_GET['delete'];
    $stmt = $pdo->prepare("DELETE FROM sanpham WHERE masp = ?");
    $stmt->execute([$masp]);
    echo "<script>alert('Sản phẩm đã được xóa thành công!');</script>";
    header('Location: product.php');
    exit;
}

$search = $_GET['search'] ?? '';

$query = "SELECT sanpham.*, hinhanh.ten FROM sanpham
          LEFT JOIN hinhanh ON sanpham.masp = hinhanh.masp
          WHERE sanpham.tensp LIKE ?";
$stmt = $pdo->prepare($query);
$stmt->execute(["%$search%"]);
$products = $stmt->fetchAll(PDO::FETCH_ASSOC);

$editProduct = null;
if (isset($_GET['edit'])) {
    $masp = $_GET['edit'];
    $stmt = $pdo->prepare("SELECT * FROM sanpham WHERE masp = ?");
    $stmt->execute([$masp]);
    $editProduct = $stmt->fetch(PDO::FETCH_ASSOC);
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý sản phẩm</title>
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
    <h1 class="text-center mb-4">Quản lý sản phẩm</h1>

    <!-- Tìm kiếm và thêm sản phẩm -->
    <div class="d-flex justify-content-between align-items-center mb-3">
        <form class="d-flex w-100 me-3" method="GET">
            <input type="text" name="search" class="form-control search-input me-2" placeholder="Tìm kiếm sản phẩm" value="<?= htmlspecialchars($search) ?>">
            <button type="submit" class="btn btn-primary">Tìm kiếm</button>
        </form>
        <button type="button" class="btn btn-success" onclick="toggleForm()">Thêm</button>
    </div>

    <!-- Form thêm/sửa sản phẩm -->
    <div id="product-form" class="form-container <?= $editProduct ? '' : 'hidden' ?>">
        <h2 class="mb-3"><?= $editProduct ? 'Chỉnh sửa sản phẩm' : 'Thêm sản phẩm mới' ?></h2>
        <form method="POST" enctype="multipart/form-data">
            <input type="hidden" name="edit" value="<?= $editProduct ? '1' : '0' ?>">
            <div class="mb-3">
                <label class="form-label">Mã sản phẩm:</label>
                <input type="text" name="masp" class="form-control" value="<?= htmlspecialchars($editProduct['masp'] ?? '') ?>" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Tên sản phẩm:</label>
                <input type="text" name="tensp" class="form-control" value="<?= htmlspecialchars($editProduct['tensp'] ?? '') ?>" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Mô tả:</label>
                <textarea name="mota" class="form-control" required><?= htmlspecialchars($editProduct['mota'] ?? '') ?></textarea>
            </div>
            <div class="mb-3">
                <label class="form-label">Loại sản phẩm:</label>
                <select name="maloai" class="form-select" required>
                    <option value="">-- Chọn loại --</option>
                    <?php foreach ($categories as $category): ?>
                        <option value="<?= $category['maloai'] ?>" <?= ($editProduct['maloai'] ?? '') == $category['maloai'] ? 'selected' : '' ?>><?= $category['tenloai'] ?></option>
                    <?php endforeach; ?>
                </select>
            </div>
            <div class="mb-3">
                <label class="form-label">Thương hiệu:</label>
                <select name="math" class="form-select" required>
                    <option value="">-- Chọn thương hiệu --</option>
                    <?php foreach ($brands as $brand): ?>
                        <option value="<?= $brand['math'] ?>" <?= ($editProduct['math'] ?? '') == $brand['math'] ? 'selected' : '' ?>><?= $brand['tenth'] ?></option>
                    <?php endforeach; ?>
                </select>
            </div>
            <div class="mb-3">
                <label class="form-label">Màu sắc:</label>
                <select name="mad" class="form-select" required>
                    <option value="">-- Chọn màu sắc --</option>
                    <!-- Add color options -->
                </select>
            </div>
            <div class="mb-3">
                <label class="form-label">Kích cỡ:</label>
                <select name="masize" class="form-select" required>
                    <option value="">-- Chọn kích cỡ --</option>
                    <?php foreach ($sizes as $size): ?>
                        <option value="<?= $size['masize'] ?>" <?= ($editProduct['masize'] ?? '') == $size['masize'] ? 'selected' : '' ?>><?= $size['ten'] ?></option>
                    <?php endforeach; ?>
                </select>
            </div>
            <div class="mb-3">
                <label class="form-label">Giá nhập:</label>
                <input type="number" name="gianhap" class="form-control" value="<?= htmlspecialchars($editProduct['gianhap'] ?? '') ?>" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Giá bán:</label>
                <input type="number" name="giaban" class="form-control" value="<?= htmlspecialchars($editProduct['giaban'] ?? '') ?>" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Chọn hình ảnh:</label>
                <input type="file" name="hinh[]" class="form-control" multiple>
            </div>
            <button type="submit" class="btn btn-primary"><?= $editProduct ? 'Cập nhật sản phẩm' : 'Thêm sản phẩm' ?></button>
        </form>
    </div>

    <!-- Hiển thị sản phẩm -->
    <table class="table table-striped mt-4">
        <thead>
            <tr>
                <th>Mã sản phẩm</th>
                <th>Tên sản phẩm</th>
                <th>Mô tả</th>
                <th>Giá bán</th>
                <th>Hình ảnh</th>
                <th>Thao tác</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($products as $index => $product): ?>
                <tr>
                    <td><?= htmlspecialchars($product['masp']) ?></td>
                    <td><?= htmlspecialchars($product['tensp'] ?? '') ?></td>
                    <td><?= htmlspecialchars($product['mota'] ?? '') ?></td>
                    <td><?= number_format($product['giaban']) ?> VND</td>
                    <td>
                        <?php
                        $stmt = $pdo->prepare("SELECT ten FROM hinhanh WHERE masp = ?");
                        $stmt->execute([$product['masp']]);
                        $images = $stmt->fetchAll(PDO::FETCH_ASSOC);

                        foreach ($images as $image) {
                            echo '<img src="uploads/' . htmlspecialchars($image['ten']) . '" alt="Product Image" width="100" height="100" class="me-2">';
                        }
                        ?>
                    </td>
                    <td>
                        <a href="?edit=<?= $product['masp'] ?>" class="btn btn-warning btn-sm">Sửa</a>
                        <a href="?delete=<?= $product['masp'] ?>" class="btn btn-danger btn-sm" onclick="return confirm('Bạn có chắc chắn muốn xóa sản phẩm này?')">Xóa</a>
                    </td>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
</div>

<script>
    function toggleForm() {
        var form = document.getElementById('product-form');
        form.classList.toggle('hidden');
    }
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
