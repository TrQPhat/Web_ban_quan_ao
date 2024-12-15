<!-- banner -->
<?php 
    include "include/banner.php" ; 
    $query = "SELECT COUNT(*) AS num
            FROM (
            SELECT sp.masp
                FROM sanpham sp
                JOIN tonkho tk ON sp.masp = tk.masp
                WHERE tk.mach = ?
                GROUP BY sp.masp
                HAVING SUM(tk.soluong) > 0
            ) AS san_pham_hien_hanh;";
    $totalItems = $db -> executeScalarWithParams($query, [MA_CH]);
    $totalPages = ceil($totalItems/LIMIT_ITEM);
    unset($totalItems, $query);
    $currentPage = isset($_GET['page']) ? intval($_GET['page']) : 1;
?>


<section class="main">
    <!--sidebar-->
    <?php 
                include "include/side_bar_filter.html" ;
            ?>
    <!-- body area -->
    <div class="main__stall">
        <div>
            <h1>TOÀN BỘ SẢN PHẨM</h1>
        </div>
        <div class="main__stall_products row">
            <?php
            $offset = ($currentPage -1) * LIMIT_ITEM;
            $query = "SELECT sp.masp, sp.tensp, sp.giaban
                FROM sanpham sp
                JOIN tonkho tk ON sp.masp = tk.masp
                WHERE tk.mach = ?
                GROUP BY sp.masp
                HAVING SUM(tk.soluong) > 0
                LIMIT ".LIMIT_ITEM." OFFSET $offset";
            $listOfProducts = $db->executeQueryWithParams($query, [MA_CH]);
            
            foreach ($listOfProducts as $sp){
                $query = "SELECT ten FROM hinhanh
                            WHERE masp = ?
                            LIMIT 2;";
                $images = $db -> executeQueryWithParams($query, [$sp['masp']]);
            ?>

            <div class="item col-sm-6 col-md-4 col-xl-3">
                <div class="card-image">
                    <img src="<?php echo "./images/products/".$images[0]['ten'] ?>"
                        class="card-header card-header-front" />
                    <img src="<?php echo "./images/products/".$images[1]['ten'] ?>"
                        class="card-header card-header-back" />
                </div>
                <div class="card-body">
                    <a href="../index.php?mod=product_detail"><?php echo $sp['tensp'] ?></a>
                </div>
                <div class="card-footer">
                    <?php echo number_format(
                            $sp['giaban'] , 
                            0, 
                            '.', 
                            ',')
                            ." VNĐ"?>
                </div>
            </div>
            <?php
            }
            ?>
        </div>
    </div>

</section>

<?php 
    include "include/pagination.php";
?>