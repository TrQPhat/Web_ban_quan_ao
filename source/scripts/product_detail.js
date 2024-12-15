// Biến toàn cục để theo dõi slide hiện tại
let currentIndex = 0;

// Lấy tất cả các slide và dot
const images = document.getElementsByClassName("slide-image");
const dot1s = document.getElementsByClassName("dot");

// Hàm để hiển thị slide hiện tại
function showImage(index) {
  // Đảm bảo rằng index hợp lệ
  if (index >= images.length) {
    currentIndex = 0;
  } else if (index < 0) {
    currentIndex = images.length - 1;
  } else {
    currentIndex = index;
  }

  // Ẩn tất cả các slide
  for (let i = 0; i < images.length; i++) {
    images[i].style.display = "none";
  }

  // Ẩn tất cả các dot
  for (let i = 0; i < dot1s.length; i++) {
    dot1s[i].className = dot1s[i].className.replace(" selected", "");
  }

  // Hiển thị slide hiện tại
  images[currentIndex].style.display = "block";

  // Đánh dấu dot của slide hiện tại là active
  dot1s[currentIndex].className += " selected";
}

// Hàm thay đổi slide khi nhấn nút prev hoặc next
function changeImage(direction) {
  showImage(currentIndex + direction);
}

// Hàm thay đổi slide khi nhấn vào dot
function currentImage(index) {
  showImage(index); // Bởi vì index bắt đầu từ 0
}

// Hiển thị slide đầu tiên khi tải trang
showImage(currentIndex);
