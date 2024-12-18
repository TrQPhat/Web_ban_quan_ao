document.addEventListener("DOMContentLoaded", function () {
  // Đặt thời gian tắt preloader và thực hiện hiệu ứng mờ dần
  setTimeout(function () {
    const preLoader = document.getElementById("preLoader");
    preLoader.style.opacity = 0; // Mờ hoàn toàn
    preLoader.style.transition = "opacity 0.5s ease-out"; // Hiệu ứng mờ dần (1 giây)

    // Lắng nghe khi hiệu ứng mờ dần hoàn tất
    preLoader.addEventListener("transitionend", function () {
      preLoader.style.display = "none"; // Tắt preloader hoàn toàn
      document.querySelector(".content").style.display = "block"; // Hiển thị nội dung chính
    });
  }, 500); // Chờ 2 giây trước khi bắt đầu hiệu ứng
});
