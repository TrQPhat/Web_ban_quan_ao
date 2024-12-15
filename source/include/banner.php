<section class="banner">
    <!--ảnh slide-->
    <div class="slideshow-container">

        <?php
            // Đường dẫn đến thư mục chứa hình ảnh
            $directory = "./images/banner"; // Thay bằng đường dẫn của bạn

            // Lấy danh sách file trong thư mục
            $files = glob($directory . "/*.{jpg,png}", GLOB_BRACE); 

            foreach ($files as $key=>$s){
                          
        ?>
        <div class="mySlides mySlide<?php echo $key+1 ?> slidefade">
            <img src="<?php echo $s ?>" alt="banner" width="100%" class="img-feature" />
        </div>
        <?php }
        ?>

        <!--nút pre-next-->
        <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
        <a class="next" onclick="plusSlides(1)">&#10095;</a>
    </div>
    <br />

    <!-- nút dots -->
    <div style="text-align: center">
        <?php 
        foreach ($files as $key=>$s){
          echo "<span class='dot dot$key' onclick='currentSlide($key)'></span>";
        }
        ?>
    </div>
</section>