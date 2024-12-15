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
