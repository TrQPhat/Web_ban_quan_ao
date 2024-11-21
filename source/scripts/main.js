//mở sidebar khi click nút
function openNav() {
  //document.getElementById("mySidebar").style.display = "block";
  document.getElementById("mySidebar").style.width = "300px";
  document.getElementById("mySidebar").style.border = "groove";
  document.getElementById("btnOpenSidebar").style.display = "none";
}

//tắt hiển thị sidebar
function closeNav() {
  //document.getElementById("mySidebar").style.display = "none";
  document.getElementById("mySidebar").style.width = "0";
  document.getElementById("mySidebar").style.border = "hidden";
  //
  setTimeout(function () {
    document.getElementById("btnOpenSidebar").style.display = "block";
  }, 500);
}
