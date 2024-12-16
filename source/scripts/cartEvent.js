// Lấy phần tử nút "Thêm vào giỏ hàng"
const addToCartBtn = document.getElementById("btn-add-to-cart");
const btnCart = document.getElementById("btn-cart");

btnCart.addEventListener("click", function () {
  document.getElementById("cartDialog").style.display = "flex";
  showAllProducts();
});

function closeCartDialog() {
  document.getElementById("cartDialog").style.display = "none";
}

function checkout() {
  alert("Đang tiến hành thanh toán...");
  closeCartDialog();
}
// Lắng nghe sự kiện nhấn vào nút
addToCartBtn.addEventListener("click", function () {
  // Hành động khi nhấn vào nút
  addToCart();
});

function addToCart() {
  // Lấy thông tin sản phẩm từ giao diện
  const productId = document
    .querySelector(".product-sku")
    .textContent.split(": ")[1];
  const productName = document
    .querySelector(".product-title")
    .textContent.trim();
  const productPrice = parseFloat(
    document.querySelector(".new-price").textContent.replace(/\D/g, "")
  );
  const productSize = document.querySelector(".size-btn.active")?.value; // Lấy kích cỡ được chọn
  const quantity = parseInt(document.getElementById("quantity").value);

  if (!productSize) {
    alert("Vui lòng chọn kích cỡ !");
    return;
  }
  if (isNaN(quantity) || quantity <= 0) {
    alert("Số lượng bắt buộc lớn hơn 0 !");
    return;
  }

  // Tạo sản phẩm và thêm vào giỏ hàng
  const product = {
    id: productId,
    name: productName,
    price: productPrice,
    size: productSize,
    quantity: quantity,
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

  localStorage.setItem("cart", JSON.stringify(cart));
  alert("Sản phẩm đã được thêm vào giỏ hàng!");
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
  let cartInfo = "Giỏ hàng hiện tại:\n\n";
  cart.forEach((product) => {
    cartInfo += `- Mã sản phẩm: ${product.id}\n`;
    cartInfo += `  Tên sản phẩm: ${product.name}\n`;
    cartInfo += `  Giá: ${product.price.toLocaleString()} VNĐ\n`;
    cartInfo += `  Kích cỡ: ${product.size}\n`;
    cartInfo += `  Số lượng: ${product.quantity}\n`;
    cartInfo += "----------------------\n";
  });

  // Hiển thị thông tin giỏ hàng
  alert(cartInfo);
}
