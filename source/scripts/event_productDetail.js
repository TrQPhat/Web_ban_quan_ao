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

function resetBtnSize(i) {
  btnSizes[i].className = btnSizes[i].className.replace(" active", "");
}

let selectedSize = 2;

const btnSizes = document.getElementsByClassName("size-btn");

function changeSize(index) {
  btnSizes[index].className += " active";
  resetBtnSize(selectedSize);
  selectedSize = index;

  const productId = document
    .querySelector(".product-sku")
    .textContent.split("SKU: ")[1];

  const size = btnSizes[index].value;
  postMaspSize(productId, size);
}

function postMaspSize(masp, size) {
  $.ajax({
    url: "../include/api_get.php?id=" + masp + "&size=" + size,
    type: "GET",
    data: { id: masp, size: size },
    success: function (response) {
      const data = JSON.parse(response);
      if (data.success) {
        $("#quantity").attr("max", data.maxquantity);
      } else {
        alert("Lỗi từ server:", data.message);
      }
    },
    error: function (xhr, status, error) {
      alert("Lỗi:", status, error);
    },
  });
  return -1;
}
