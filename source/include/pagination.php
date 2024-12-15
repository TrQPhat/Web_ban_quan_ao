<div class="pagination">
    <?php
    
    // Hiển thị nút "Previous"
    if ($currentPage > 1) {
        echo '<a href="?page=' . ($currentPage - 1) . '">&laquo;</a>';
    }

    // Hiển thị các số trang
    for ($i = 1; $i <= $totalPages; $i++) {
        if ($i == $currentPage) {
            echo '<span class="active">' . $i . '</span>';
        } else {
            echo '<a href="?page=' . $i . '">' . $i . '</a>';
        }
    }

    // Hiển thị nút "Next"
    if ($currentPage < $totalPages) {
        echo '<a href="?page=' . ($currentPage + 1) . '">&raquo;</a>';
    }
    ?>
</div>