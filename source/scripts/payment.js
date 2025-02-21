const barItems = document.getElementsByClassName("process-bar-item");
const paymentPage = document.getElementsByClassName("payment-page");

let currentBarItem = 0;

function resetBarItem(i) {
  barItems[i].className = barItems[i].className.replace(" selected", "");
  paymentPage[i].className = paymentPage[i].className.replace(" active", "");
}

function clickBarItem(index) {
  if (currentBarItem <= index) return;
  changeCurrentBarItem(index);
}

function changeCurrentBarItem(index) {
  document.getElementById("notice-form").style.visibility = "hidden";
  barItems[index].className += " selected";
  paymentPage[index].className += " active";

  resetBarItem(currentBarItem);
  currentBarItem = index;
}

function isValidEmail(email) {
  // Sử dụng biểu thức chính quy để kiểm tra định dạng email
  const emailRegex = /^[A-Za-z0-9._%+-]+@[A-Za-z0-9-]+[.][A-Za-z.]{2,}$/;
  return emailRegex.test(email);
}

let checkForm = false;
function validateForm(index) {
  let valid = true;
  if (index == 1) {
    const emailInput = document.getElementById("emailDatHang").value;
    if (!isValidEmail(emailInput)) {
      alert("Email không hợp lệ.");
      valid = false;
      return;
    }
  } else if (index == 2) {
    // Lấy các trường dữ liệu
    const name = document.getElementById("name");
    const birthday = document.getElementById("birthday");
    const phone = document.getElementById("phone");
    const province = document.getElementById("province");
    const district = document.getElementById("district");
    const ward = document.getElementById("ward");
    const address = document.getElementById("address");

    // Kiểm tra trường "Họ và tên"
    if (!validateFullName(name.value.trim())) {
      valid = false;
    }
    // Kiểm tra trường "Ngày sinh"
    if (birthday.value === "") {
      valid = false;
    }
    if (!validateAge(birthday.value)) {
      valid = false;
    }
    // Kiểm tra trường "Số điện thoại"
    const phonePattern = /^[0-9]{10}$/; // Kiểm tra số điện thoại 10 chữ số
    if (!phone.value.match(phonePattern)) {
      valid = false;
    }

    // Kiểm tra trường "Tỉnh/Thành phố"
    if (province.value === "none") {
      valid = false;
    }
    // Kiểm tra trường "Quận/Huyện"
    if (district.value === "none") {
      valid = false;
    }
    // Kiểm tra trường "Phường/Xã"
    if (ward.value === "none") {
      valid = false;
    }
    // Kiểm tra trường "Địa chỉ"
    if (address.value.trim() == "") {
      valid = false;
    }
    if (!valid) {
      document.getElementById("notice-form").style.visibility = "visible";
      return;
    }
  }

  document
    .getElementById("payment-form")
    .addEventListener("submit", function (event) {
      if (!valid) event.preventDefault();
    });

  changeCurrentBarItem(index);
  return;
}

function preventSubmitForm() {
  document
    .getElementById("payment-form")
    .addEventListener("submit", function (event) {
      event.preventDefault();
    });
}

function validateFullName(name) {
  const regex =
    /^[a-zA-ZáàảạăắẳặââấầẩậđéèẻẹêếềểệíìỉịóòỏọôốồổộơớờởợúùủụưúừửựýỳỷỵÁÀẢẠĂẮẰẲẶÂẤẦẨẬĐÉÈẺẸÊẾỀỂỆÍÌỈỊÓÒỎỌÔỐỒỔỘƠỚỜỞỢÚÙỦỤƯỨÙỬỰÝỲỶỴ ]+$/;
  return regex.test(name);
}

function validateAge(birthday) {
  const today = new Date(); // Ngày hiện tại
  const birthDate = new Date(birthday); // Ngày sinh nhập vào

  // Tính tuổi dựa trên năm
  let age = today.getFullYear() - birthDate.getFullYear();

  return age >= 17 && age < 71;
}

function validateAddress(address) {
  const addressRegex =
    /^[a-zA-ZáàảạăắẳặââấầẩậđéèẻẹêếềểệíìỉịóòỏọôốồổộơớờởợúùủụưúừửựýỳỷỵÁÀẢẠĂẮẰẲẶÂẤẦẨẬĐÉÈẺẸÊẾỀỂỆÍÌỈỊÓÒỎỌÔỐỒỔỘƠỚỜỞỢÚÙỦỤƯỨÙỬỰÝỲỶỴ ]+$/;
  return addressRegex.test(address);
}

function changeProvince() {
  var provinceId = document.getElementById("province").value;
  document.getElementById("district").value = "none";
  document.getElementById("ward").value = "none";
  // Gửi yêu cầu AJAX tới PHP
  $.ajax({
    url: "../include/address.php?code=" + provinceId,
    type: "GET",
    data: { province_id: provinceId },
    success: function (response) {
      // Xử lý kết quả và cập nhật ComboBox quận/huyện
      $("#district").html(response);
    },
  });
}

function changeDistrict() {
  var districtId = document.getElementById("district").value;
  var ward = document.getElementById("ward");
  $.ajax({
    url: "../include/address.php",
    type: "GET",
    data: { district_id: districtId },
    success: function (response) {
      // Xử lý kết quả và cập nhật ComboBox quận/huyện
      $("#ward").html(response);
    },
  });
}

function changeTypeOfPay(index) {
  const note = document.getElementById("note-pay");
  if (index == 0) note.style.display = "block";
  else note.style.display = "none";
}

// function addProduct(mahd) {
//   const cart = JSON.parse(localStorage.getItem("cart")) || []; // Lấy giỏ hàng từ localStorage

//   if (cart.length === 0) {
//     alert("Giỏ hàng trống.");
//     return;
//   }

//   $.ajax({
//     url: "../include/order.php",
//     type: "POST",
//     data: {
//       cart: JSON.stringify(cart), // Chuyển giỏ hàng thành chuỗi JSON
//       mahd: mahd, // Mã hóa đơn
//     },
//     success: function (response) {
//       if (response.success) {
//         alert("Đặt hàng thành công");
//         localStorage.removeItem("cart"); // Xóa giỏ hàng sau khi đặt thành công
//       } else {
//         alert("Có lỗi xảy ra: " + response.message);
//       }
//     },
//     error: function () {
//       alert("Không thể kết nối tới server.");
//     },
//   });
// }
