window.addEventListener("load", function () {
  //đặt thời gian tắt pre loader 2.5s (cộng thêm hiệu ứng phụ xấp xỉ 3s)

  //hiệu ứng mờ dần
  this.setTimeout(function () {
    this.document.getElementById("preLoader").style.opacity = 0.4;
  }, 2200);

  setTimeout(function () {
    //tắt đối tượng pre loader
    this.document.getElementById("preLoader").style.display = "none";

    //hiển thị nội dung trang web
    document.getElementsByClassName("content")[0].style.display = "block";
  }, 2700);
});
