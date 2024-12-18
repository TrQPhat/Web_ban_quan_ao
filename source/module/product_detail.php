<!DOCTYPE html>
<html lang="en">

<head>
    <link rel="stylesheet" href="styles/product_detail.css" />
    <script type="text/javascript" src="/scripts/product_detail.js"></script>
</head>

<body>

    <?php
        $_SESSION['previous_url'] = "http://" . $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI'];
      if (!isset($_GET['id'])) exit;
      $masp = $_GET['id'];
      $query = "SELECT soluong from tonkho
                WHERE mach= ? AND masp = ?;";
      $sl = $db->executeQueryWithParams($query, [MA_CH, $masp]);
      

      

    ?>

    <div class="product-container">
        <div class="product-image">
            <?php
            $query = "SELECT ten FROM hinhanh
                            WHERE masp = ?";
            $images = $db -> executeQueryWithParams($query, [$masp]);
        
            foreach ($images as $key=>$image){

            ?>
            <div class="slide-image">
                <img src="../images/products/<?php echo $image['ten'] ?>" alt="Image <?php echo $key +1 ?>" />
            </div>

            <?php
            }
            ?>
            <!-- Nút điều khiển -->
            <a class="prevImage" onclick="changeImage(-1)">&#10094;</a>
            <a class="nextImage" onclick="changeImage(1)">&#10095;</a>
            <!-- Chỉ số (dots) -->
            <div class="dots-container">
                <?php
                foreach ($images as $key=>$image){
                ?>
                <span class="dot" onclick="currentImage(<?php echo $key ?>)"></span>
                <?php
                }
                ?>
            </div>
        </div>

        <!-- Thông tin sản phẩm -->
        <?php 
          $query = "SELECT sp.masp, sp.tensp, sp.giaban
                FROM sanpham sp
                WHERE masp = ?";
          $product = $db -> executeQueryWithParams($query, [$masp])[0];
         ?>
        <div class="product-info">
            <h1 class="product-detail-title"><?php echo $product['tensp']; ?></h1>
            <p class="product-price">
                <span class="old-price">1.398.000 VNĐ</span>
                <span class="new-price"><?php echo number_format(
                            $product['giaban'] , 
                            0, 
                            '.', 
                            ',')
                            ." VNĐ"?></span>
            </p>
            <p class="product-sku">SKU: <?php echo $product['masp']; ?></p>

            <!-- Kích cỡ -->
            <div class="product-size">
                <span>Kích cỡ:</span>
                <button class="size-btn" onclick="changeSize(0)" value="S"
                    <?php if ($sl[2]['soluong']==0) echo "disabled"  ?>>
                    S</button>
                <button class="size-btn" onclick="changeSize(1)" value="M"
                    <?php if ($sl[1]['soluong']==0) echo "disabled"  ?>>M</button>
                <button class="size-btn active" onclick="changeSize(2)" value="L"
                    <?php if ($sl[0]['soluong']==0) echo "disabled"  ?>>L</button>
                <button class="size-btn" onclick="changeSize(3)" value="XL"
                    <?php if ($sl[3]['soluong']==0) echo "disabled"  ?>>XL</button>
            </div>

            <!-- Số lượng -->
            <div class="product-quantity">
                <span>Số lượng:</span>
                <div class="quantity-wrapper">
                    <button class="quantity-btn" id="decrease">
                        <i class="fa-solid fa-minus"></i>
                    </button>
                    <input type="number" value="1" id="quantity" />
                    <button class="quantity-btn" id="increase">
                        <i class="fa-solid fa-plus"></i>
                    </button>
                </div>
            </div>

            <!-- Nút chức năng -->
            <div class="product-actions">
                <button class="btn add-to-cart" id="btn-add-to-cart" onclick="addToCart()">THÊM VÀO GIỎ</button>
                <button class="btn add-to-wishlist">THÊM VÀO YÊU THÍCH</button>
            </div>

            <!-- Thêm thông tin -->
            <div class="product-details">
                <details>
                    <summary>HƯỚNG DẪN MUA HÀNG</summary>
                    <p>Chi tiết về quy trình mua hàng và thanh toán.</p>
                </details>
                <details>
                    <summary>HƯỚNG DẪN CHỌN KÍCH CỠ</summary>
                    <p>Thông tin chi tiết về kích cỡ sản phẩm.</p>
                </details>
                <details>
                    <summary>CHIA SẺ</summary>
                    <p>Chia sẻ sản phẩm này qua mạng xã hội.</p>
                </details>
            </div>
        </div>
    </div>
    <script src="../scripts/event_productDetail.js"></script>
</body>

</html>