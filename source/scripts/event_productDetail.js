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

let selectedSize = 2;

const btnSizes = document.getElementsByClassName("size-btn");

function resetBtnSize(i) {
  btnSizes[i].className = btnSizes[i].className.replace(" active", "");
}

function changeSize(index) {
  btnSizes[index].className += " active";
  resetBtnSize(currentBarItem);
  currentBarItem = index;
}
