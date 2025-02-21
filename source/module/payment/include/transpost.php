<?php 
    include ROOT."/include/address.php";
?>
<section class="payment-transpost payment-page">
    <div class="information">
        <h4>ĐỊA CHỈ GIAO HÀNG</h4>
        <div class="info-input">
            <span class="col col-1">
                <div>
                    <p class="title">Họ và tên</p>
                    <p class="required">*</p> <br>
                </div>
                <input type="text" class="value-input" id="name" name="name" required>

                <div>
                    <p class="title">Giới tính</p>
                    <p class="required">*</p> <br>
                </div>
                <div class="value-input sex">
                    <div>
                        <input type="radio" id="male" name="sex" value="Nam">
                        <label for="male">Nam</label>
                    </div>
                    <div>
                        <input type="radio" id="female" name="sex" value="Nữ" checked>
                        <label for="female">Nữ</label>
                    </div>
                </div>

                <div>
                    <p class="title">Ngày sinh</p>
                    <p class="required">*</p> <br>
                </div>
                <input type="date" class="value-input" id="birthday" name="birthday">

                <div>
                    <p class="title">Số điện thoại</p>
                    <p class="required">*</p> <br>
                </div>
                <input type="text" class="value-input" id="phone" name="phone" required>

            </span>
            <span class="col col-2">
                <div>
                    <p class="title">Tỉnh/Thành phố</p>
                    <p class="required">*</p> <br>
                </div>
                <select name="province" id="province" onchange="changeProvince()" class="value-input">
                    <option value="none">--Chọn tỉnh/thành phố--</option>
                    <?php
                        foreach ($provinces as $province)
                            echo '<option value="'.$province['code'].'">'.$province['name'].'</option>';
                    ?>
                </select>

                <div>
                    <p class="title">Quận/Huyện</p>
                    <p class="required">*</p> <br>
                </div>
                <select name="district" id="district" onchange="changeDistrict()" class="value-input">
                    <option value="none">--Chọn quận/huyện--</option>

                </select>

                <div>
                    <p class="title">Phường/Xã</p>
                    <p class="required">*</p> <br>
                </div>
                <select name="ward" id="ward" class="value-input">
                    <option value="none">--Chọn phường/xã--</option>

                </select>

                <div>
                    <p class="title">Địa chỉ</p>
                    <p class="required">*</p> <br>
                </div>
                <input type="text" name="address" id="address" class="value-input" required>
            </span>
        </div>
        <div id="notice-form">Thông tin còn thiếu hoặc chưa chính xác.</div>
    </div>
    <div class="transpost">
        <h4>PHƯƠNG THỨC GIAO HÀNG</h4>
        <p>Phí vận chuyển dựa trên trọng lượng kiện hàng và địa điểm giao hàng</p>
        <div class="value-input">
            <input type="radio" name="type_transpost" value="save" id="save" checked>
            <label for="save">Giao hàng tiết kiệm</label>
        </div>
        <div class="value-input">
            <input type="radio" name="type_transpost" value="express" id="express">
            <label for="express">Giao hàng hỏa tốc</label>
        </div>

    </div>

    <div class="payment-btn payment-transpost-action-btn">
        <div class="payment-action-btn next-step-btn" onclick="validateForm(2)" name="next_step">TIẾP
            TỤC</div>
    </div>

</section>