let slideIndex = 1;

// nút next-pre
function plusSlides(n) {
  showSlides((slideIndex += n));
}

// điều khiển slide
function currentSlide(n) {
  showSlides((slideIndex = n));
}

function showSlides(n) {
  let i;
  //lấy tập slide
  let slides = document.getElementsByClassName("mySlides");
  //chấm tượng trưng cho từng slide
  let dots = document.getElementsByClassName("dot");

  //Tăng giảm n (0<n<sl ảnh +1)
  if (n > slides.length) {
    slideIndex = 1;
  }
  if (n < 1) {
    slideIndex = slides.length;
  }

  //tắt hết tất cả slide
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";
  }

  //xóa đánh dấu active
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" active", "");
  }
  //hiển thị slide chuyển tiếp, đánh dấu active
  slides[slideIndex - 1].style.display = "block";
  dots[slideIndex - 1].className += " active";
}

//đặt thời gian tự chuyển slide là 6s
setInterval(function () {
  plusSlides(1);
}, 6000);
