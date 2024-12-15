const container = document.getElementById("container");
const registerBtn = document.getElementById("register");
const loginBtn = document.getElementById("login");

registerBtn.addEventListener("click", () => {
  container.classList.add("active");
});

loginBtn.addEventListener("click", () => {
  container.classList.remove("active");
});

//validate các giá trị

function validateName(name) {
  const regex =
    /^[a-zA-ZáàảạăắẳặââấầẩậđéèẻẹêếềểệíìỉịóòỏọôốồổộơớờởợúùủụưúừửựýỳỷỵÁÀẢẠĂẮẰẲẶÂẤẦẨẬĐÉÈẺẸÊẾỀỂỆÍÌỈỊÓÒỎỌÔỐỒỔỘƠỚỜỞỢÚÙỦỤƯỨÙỬỰÝỲỶỴ ]+$/;
  return regex.test(name);
}

function validateNumber(num) {
  var numberRegex = /^0\S+/;
  return !isNaN(num) && numberRegex.test(num) && num.length == 10;
}

function validateEmail(email) {
  var emailRegex = /\S+@\S+.com/;
  return emailRegex.test(email);
}

function validatePassword(password) {
  const regex =
    /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,}$/;
  return regex.test(password);
}

//kiểm tra các giá trị đầu vào
function validateValue() {
  //lấy giá trị đầu vào
  var name = nameInput.value.trim();
  var num = numInput.value.trim();
  var email = emailInput.value.trim();
  var pwd = password.value.trim();
  var rePwd = rePassword.value.trim();

  //name
  if (name == "") {
    alert("Vui lòng nhập tên của bạn.");
    return false;
  } else if (!validateName(name)) {
    alert("Tên chỉ bao gồm chữ cái, dấu cách.");
    return false;
    nameInput.focus();
  }

  //email
  if (emailInput == "") {
    alert("Vui lòng nhập email của bạn.");
    return false;
  } else if (!validateEmail(emailInput.value)) {
    alert("Vui lòng nhập đúng định dạng email. vd: abc@domain.com");
    return false;
  }
  //sdt
  if (num == "") {
    alert("Vui lòng nhập số điện thọai của bạn.");
    return false;
  } else if (!validateNumber(num)) {
    alert("Số điện thoại hợp lệ có 10 chữ số và bắt đầu bằng số 0.");
    return false;
  }

  //password
  if (pwd == "") {
    alert("Vui lòng nhập mật khẩu.");
    return false;
  } else if (!validatePassword(pwd)) {
    alert(
      "Mật khẩu có độ dài từ 8 ký tự trở lên, bao gồm chữ hoa, chữ thường, số và ký tự đặc biệt. vd:abc@123A"
    );
    return false;
  }

  if (rePwd == "") {
    alert("Vui lòng nhập lại mật khẩu.");
    return false;
  } else if (pwd != rePwd) {
    alert("Mật khẩu nhập lại không đúng.");
    return false;
  }

  return true;
}

//sự kiện khi click nút hoàn tất đăng ký
function submitSignUp() {
  event.preventDefault(); //ngăn sự kiện

  //validate đúng, chuyển hướng tới trang chủ
  if (validateValue()) window.location.href = "../index.php";
}

//sự kiện khi click nút hoàn tất đăng nhập
function submitLogin() {
  event.preventDefault();

  //lấy dữ liệu đầu vào
  let email = emailLogin.value.trim();
  let pwd = passwordLogin.value.trim();

  //kiểm tra email hợp lệ, không hợp lệ đưa ra tb => thoát
  if (email == "") {
    alert("Vui lòng nhập email của bạn.");
    return false;
  } else if (!validateEmail(email)) {
    alert("Vui lòng nhập đúng định dạng email. vd: abc@domain.com");
    return false;
  }

  //kiểm tra mật khẩu không rỗng, rỗng => thoát
  if (pwd == "") {
    alert("Vul lòng nhập mật khẩu.");
    return;
  }

  //tất cả đúng quay về trang chủ
  window.location.href = "../index.php";
}
