document.getElementById("decrease").addEventListener("click", function () {
  let quantity = document.getElementById("quantity");
  if (parseInt(quantity.value) > 1) {
    quantity.value = parseInt(quantity.value) - 1;
  }
});

document.getElementById("increase").addEventListener("click", function () {
  let quantity = document.getElementById("quantity");
  quantity.value = parseInt(quantity.value) + 1;
});

// Lấy tất cả các slide và các nút điều khiển
const slides = document.querySelectorAll(".slide"); // Chỉnh sửa lại selector nếu cần
const prevButton = document.querySelector(".prev");
const nextButton = document.querySelector(".next");
const dots = document.querySelectorAll(".dot");

// Biến để theo dõi slide hiện tại
let currentSlide = 0;

// Hàm hiển thị slide hiện tại
function showSlide(index) {
  // Đảm bảo index hợp lệ
  if (index >= slides.length) {
    currentSlide = 0;
  } else if (index < 0) {
    currentSlide = slides.length - 1;
  } else {
    currentSlide = index;
  }

  // Ẩn tất cả các slide
  slides.forEach((slide, i) => {
    slide.classList.remove("active"); // Ẩn slide
    slide.classList.add(i === currentSlide ? "active" : ""); // Hiển thị slide hiện tại
  });

  // Cập nhật các dot
  dots.forEach((dot, i) => {
    dot.classList.remove("active"); // Ẩn dot
    if (i === currentSlide) {
      dot.classList.add("active"); // Hiển thị dot của slide hiện tại
    }
  });
}

// Hàm chuyển đến slide tiếp theo
function nextSlide() {
  showSlide(currentSlide + 1);
}

// Hàm chuyển đến slide trước
function prevSlide() {
  showSlide(currentSlide - 1);
}

// Hàm tự động chuyển slide
function autoSlide() {
  setInterval(nextSlide, 5000); // Chuyển slide mỗi 5 giây
}

// Thêm sự kiện click cho nút prev và next
prevButton.addEventListener("click", prevSlide);
nextButton.addEventListener("click", nextSlide);

// Thêm sự kiện click cho các dot
dots.forEach((dot, index) => {
  dot.addEventListener("click", () => {
    showSlide(index);
  });
});

// Bắt đầu auto slide
autoSlide();

// Hiển thị slide đầu tiên khi load trang
showSlide(currentSlide);
