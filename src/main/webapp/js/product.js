function addProduct() {
var productName = document.getElementById("productName").value;
var productId = document.getElementById("productId").value;
var mrp = document.getElementById("mrp").value;
var sellingPrice = document.getElementById("sellingPrice").value;
var mfd = document.getElementById("mfd").value;
var expiryDate = document.getElementById("expiryDate").value;
var xhr = new XMLHttpRequest();
xhr.onreadystatechange = function() {
    if (xhr.readyState === 4 && xhr.status === 200) {
        window.location.href = "product.jsp";
    }
};
xhr.open("POST", "ProductServlet", true);
xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
xhr.send("action=add&productName=" + productName + "&productId=" + productId + "&mrp=" + mrp + "&sellingPrice=" + sellingPrice + "&mfd=" + mfd + "&expiryDate=" + expiryDate);
}

function viewProduct(productId) {
alert("View product " + productId);
}

function editProduct(productId) {
alert("Edit product " + productId);
}

function deleteProduct(productId) {
if (confirm("Are you sure you want to delete product " + productId + "?")) {
var xhr = new XMLHttpRequest();
xhr.onreadystatechange = function() {
if (xhr.readyState === 4 && xhr.status === 200) {
window.location.href = "product.jsp";
}
};
xhr.open("POST", "ProductServlet", true);
xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
xhr.send("action=delete&productId=" + productId);
}
}
