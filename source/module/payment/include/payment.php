<section class="payment-payment payment-page">
    <div class="medthod-payment">
        <h4>PHƯƠNG THỨC THANH TOÁN</h4>
        <p>Đơn hàng của bạn sẽ phải mất một chút thời gian để chờ xác nhận</p>
        <div class="value-input">
            <input type="radio" name="pay" value="momo" id="momo" onchange="changeTypeOfPay(0)">
            <label for="momo">MOMO</label>
            <div id="note-pay">Vui lòng ghi nội dung chuyển khoản là mã đơn hàng</div>
        </div>
        <div class="value-input">
            <input type="radio" name="pay" value="cod" id="ship-cod" onchange="changeTypeOfPay(1)" checked>
            <label for=" momo">THANH TOÁN KHI NHẬN HÀNG (COD)</label>
        </div>


    </div>
    <input class="payment-action-btn next-step-btn" onclick="validateForm(3)" name="submit" type="submit"
        value="TIẾP TỤC">
</section>