const btnCart = document.getElementById("btn-cart");
btnCart.addEventListener("click", function () {
  document.getElementById("cartDialog").style.display = "block";
  //showAllProducts();
});

let cart = [];

setNumOfCart();

// Gọi hàm renderCart khi trang tải
document.addEventListener("DOMContentLoaded", renderCart);

let totalValueOfCart = 0;

let tranpostFee = 30000;

function closeCartDialog() {
  document.getElementById("cartDialog").style.display = "none";
}

function addToCart() {
  // Lấy thông tin sản phẩm từ giao diện
  const productId = document
    .querySelector(".product-sku")
    .textContent.split("SKU: ")[1];
  const productName = document
    .querySelector(".product-detail-title")
    .textContent.trim();
  const productPrice = parseFloat(
    document.querySelector(".new-price").textContent.replace(/\D/g, "")
  );
  const productSize = document.querySelector(".size-btn.active")?.value; // Lấy kích cỡ được chọn
  const quantity = parseInt(document.getElementById("quantity").value);
  const maxquatity = parseInt(document.getElementById("quantity").max);

  const img = document.querySelector(".slide-image img");
  let imageName = " ";
  if (img) {
    const src = img.src; // Lấy đường dẫn đầy đủ của ảnh
    imageName = src.substring(src.lastIndexOf("/") + 1); // Tách tên ảnh
  } else {
    alert("Đường dẫn ảnh không hợp lệ");
  }

  if (!productSize) {
    alert("Vui lòng chọn kích cỡ !");
    return;
  }
  if (isNaN(quantity) || quantity <= 0) {
    alert("Số lượng bắt buộc lớn hơn 0 !");
    return;
  }

  if (quantity > maxquatity) {
    alert("Không đủ số lượng sản phẩm");
    return;
  }
  // Tạo sản phẩm và thêm vào giỏ hàng
  const product = {
    id: productId,
    name: productName,
    price: productPrice,
    size: productSize,
    quantity: quantity,
    image: imageName,
  };

  const cart = JSON.parse(localStorage.getItem("cart")) || [];

  const existingProduct = cart.find(
    (item) => item.id === product.id && item.size === product.size
  );

  if (existingProduct) {
    // Nếu sản phẩm cùng kích cỡ đã có, tăng số lượng
    existingProduct.quantity += quantity;
  } else {
    // Thêm sản phẩm mới vào giỏ hàng
    cart.push(product);
  }
  alert("Đã thêm sản phẩm " + productName + " vào giỏ hàng !!");
  localStorage.setItem("cart", JSON.stringify(cart));
  setNumOfCart();
  renderCart();
}

function setNumOfCart() {
  let num = document.getElementById("num-product-in-cart");
  num.innerHTML = (JSON.parse(localStorage.getItem("cart")) || []).length;
}

// Hàm hiển thị giỏ hàng
function renderCart() {
  const items = document.querySelectorAll(".cartItems"); // Vùng chứa giỏ hàng

  content = ""; // Xóa nội dung cũ (nếu có)

  // Lấy dữ liệu từ localStorage
  const cart = JSON.parse(localStorage.getItem("cart")) || [];

  // Duyệt qua từng sản phẩm và tạo HTML
  if (cart.length == 0) {
    content += "Không có sản phẩm nào.";
  } else {
    cart.forEach((product, index) => {
      totalValueOfCart += product.quantity * product.price;
      const productHTML = `
        <div class="cart-product">
          <img src="../images/products/${product.image}" alt="${
        product.name
      }" class="cart-product-image" />
          <div class="cart-product-info">
            <h3 class="product-title">${product.name}</h3>
            <p class="product-size">Size: ${product.size}</p>
            <p class="product-size">Số lượng: ${product.quantity}</p>
            <p class="product-price">Giá: ${product.price.toLocaleString(
              "vi-VN"
            )} VNĐ</p>
          </div>
          <button class="close-btn" onclick="removeFromCart(${index})">&times;</button>
        </div>
      `;
      content += productHTML;
    });

    content += `
      <div class="cart-total">
        TỔNG:
        <p id="total-value-cart">${totalValueOfCart.toLocaleString(
          "vi-VN"
        )} VNĐ</p>
      </div>`;
  }
  items.forEach((item) => {
    item.innerHTML = content;
  });

  document.querySelector(
    ".product-total"
  ).innerHTML += `<p id="total-value-cart">${totalValueOfCart.toLocaleString(
    "vi-VN"
  )}</p>`;
  document.querySelector(
    ".tranfer-fee"
  ).innerHTML += `<p id="total-value-cart">${tranpostFee.toLocaleString(
    "vi-VN"
  )}</p>`;
  document.getElementById(
    "total-bill-payment"
  ).innerHTML += `<p id="total-value-cart">${(
    totalValueOfCart + tranpostFee
  ).toLocaleString("vi-VN")} VNĐ</p>`;
}

// Xóa sản phẩm khỏi giỏ hàng
function removeFromCart(index) {
  const cart = JSON.parse(localStorage.getItem("cart")) || [];
  cart.splice(index, 1); // Xóa sản phẩm tại vị trí index
  localStorage.setItem("cart", JSON.stringify(cart)); // Cập nhật localStorage
  renderCart(); // Hiển thị lại giỏ hàng
  setNumOfCart();
}

function showAllProducts() {
  // Lấy giỏ hàng từ localStorage
  const cart = JSON.parse(localStorage.getItem("cart")) || [];

  // Kiểm tra nếu giỏ hàng rỗng
  if (cart.length === 0) {
    alert("Giỏ hàng của bạn đang trống!");
    return;
  }

  // Tạo thông báo hiển thị toàn bộ sản phẩm
  let cartInfo = "Giỏ hàng hiện tại: " + cart.length + "\n\n";
  cart.forEach((product) => {
    cartInfo += `- Mã sản phẩm: ${product.id}\n`;
    cartInfo += `  Tên sản phẩm: ${product.name}\n`;
    cartInfo += `  Giá: ${product.price.toLocaleString()} VNĐ\n`;
    cartInfo += `  Kích cỡ: ${product.size}\n`;
    cartInfo += `  Số lượng: ${product.quantity}\n`;
    cartInfo += `  Ảnh: ${product.image}\n`;
    cartInfo += "----------------------\n";
  });

  // Hiển thị thông tin giỏ hàng
  alert(cartInfo);
}
