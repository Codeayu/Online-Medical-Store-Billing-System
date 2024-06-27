<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>

	<!DOCTYPE html>
	<html>

	<head>
		<title>Add Product - Medical Store Billing System</title>
		<style>
			body {
				font-family: Arial, sans-serif;
				background-color: #f2f2f2;
			}

			h1 {
				text-align: center;
				color: #29006a;
				margin-top: 50px;
			}

			form {
				background-color: #fff;
				border-radius: 5px;
				padding: 20px;
				width: 50%;
				margin: 0 auto;
				margin-top: 50px;
			}

			label {
				display: inline-block;
				width: 150px;
				margin-bottom: 10px;
				color: #666;
			}

			input[type="text"],
			input[type="number"],
			input[type="date"] {
				padding: 5px;
				border: 1px solid #ccc;
				border-radius: 4px;
				box-sizing: border-box;
				width: 100%;
				margin-bottom: 20px;
				font-size: 16px;
				color: #555;
			}

			input[type="submit"] {
				background-color: #10a400;
				color: #fff;
				padding: 10px 20px;
				border: none;
				border-radius: 4px;
				cursor: pointer;
				font-size: 16px;
				margin-top: 20px;
			}

			input[type="submit"]:hover {
				background-color: #8600b3;
			}

			button {
				background-color: #29006a;
				color: #fff;
				padding: 10px 20px;
				border: none;
				border-radius: 4px;
				cursor: pointer;
				font-size: 16px;
				margin-top: 20px;
				margin-left: 30px;
			}

			button[type="Back"]:hover {
				background-color: #8600b3;
			}
		</style>
	</head>

	<body>
		<h1>Add Product</h1>
		<form action="AddProductServlet" method="POST">
			<label for="productName">Product Name:</label>
			<input type="text" id="productName" name="productName" required>
			
			<label for="productId">Product ID:</label>
			<input type="text" id="productId" name="productId" required>

			<label for="quantity">Product Quantity:</label>
			<input type="number" id="qnty" name="quantity" step="0.01" min="0" required>

			<label for="mrp">Product MRP:</label>
			<input type="number" id="mrp" name="mrp" step="0.01" min="0" required>

			<label for="sellingPrice">Product Selling Price:</label>
			<input type="number" id="sellingPrice" name="sellingPrice" step="0.01" min="0" required>

			<label for="mfd">Product Manufacturing Date:</label>
			<input type="date" id="mfd" name="mfd" required>

			<label for="expiryDate">Product Expiry Date:</label>
			<input type="date" id="mfd" name="expiryDate" required>

			<input type="hidden" name="userName" value="<%= session.getAttribute("user") %>">
			<input type="hidden" name="shop_name" value="<%= session.getAttribute("snm") %>">
			<input type="submit" value="Add Product">

			<button onclick="history.back()" class="button"> Back
			</button>
		</form>
	</body>

	</html>