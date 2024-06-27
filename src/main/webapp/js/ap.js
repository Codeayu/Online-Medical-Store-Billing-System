const form = document.querySelector('#add-product-form');

form.addEventListener('submit', (e) => {
e.preventDefault();
const productName = form.elements['product-name'].value;
const productId = form.elements['product-id'].value;
const productMrp = parseFloat(form.elements['product-mrp'].value);
const productSellingPrice = parseFloat(form.elements['product-selling-price'].value);
const productManufacturingDate = form.elements['product-manufacturing-date'].value;
const productExpiryDate = form.elements['product-expiry-date'].value;

// validate input values
if (!productName || !productId || isNaN(productMrp) || isNaN(productSellingPrice) ||
!productManufacturingDate || !productExpiryDate) {
alert('Please fill all fields with valid values');
return;
}

// add product to database or perform other actions here
alert('Product added successfully');
form.reset();
});