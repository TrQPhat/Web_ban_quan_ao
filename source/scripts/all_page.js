//nút go to top
// Khi người dùng cuộn xuống 20px từ đầu trang, hiển thị nút
window.onscroll = function () {
  scrollFunction();
};

function scrollFunction() {
  if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
    document.getElementById("topBtn").style.display = "block";
  } else {
    document.getElementById("topBtn").style.display = "none";
  }
}

// Khi người dùng nhấp vào nút, cuộn lên đầu trang
function topFunction() {
  document.body.scrollTop = 0; // Cho Safari
  document.documentElement.scrollTop = 0; // Cho Chrome, Firefox, IE và Opera
}

//khi nhấp openActionBtn
function openActionButton() {
  document.getElementById("action-button").style.bottom = "400px";
  document.getElementById("openActionBtn").style.display = "none";
  document.getElementById("closeActionBtn").style.display = "block";
}

//khi nhấp closeActionBtn
function closeActionButton() {
  document.getElementById("action-button").style.bottom = "-60px";
  document.getElementById("closeActionBtn").style.display = "none";
  document.getElementById("openActionBtn").style.display = "block";
}
