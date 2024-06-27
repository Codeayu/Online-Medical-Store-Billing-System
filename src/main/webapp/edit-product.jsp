<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit products</title>
 <style>
        body {
            font-family: Arial, sans-serif;
            font-size: 16px;
            background-color: #f5f5f5;
        }
        form {
            border: 1px solid #ccc;
            background-color: #fff;
            padding: 20px;
            margin: 20px auto;
            max-width: 500px;
        }
        input[type=text], input[type=number] {
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            width: 100%;
        }
        input[type=submit] {
            background-color: #4CAF50;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }
        input[type=submit]:hover {
            background-color: #3e8e41;
        }
    </style>
</head>
<body>
	<%
    // Establish a connection to your database
    String url = "jdbc:mysql://u95bkzftvx8tpees:XQG18W1E6DvpJgMSS77Y@bpgcz0m5wxumvwiokehb-mysql.services.clever-cloud.com:3306/bpgcz0m5wxumvwiokehb";
    // Establish a connection to your database

    Connection conn = DriverManager.getConnection(url);

    // Get the ID of the product to be edited from the request parameter
    String id = request.getParameter("proid");

    // Retrieve the product data from the database using a SELECT query
    PreparedStatement stmt = conn.prepareStatement("SELECT * FROM products WHERE proid = ?");
    stmt.setString(1, id);
    ResultSet rs = stmt.executeQuery();

    // Check if the result set is not empty
    if (rs.next()) {
        // Retrieve the product data from the result set
        String name = rs.getString("proname");
        int quantity = rs.getInt("quantity");
        double sellingPrice = rs.getDouble("selling_Price");
        double mrp = rs.getDouble("mrp");

        // Display the product data in a form for editing
        %>
        <form method="post" action="update-product.jsp">
            <input type="hidden" name="id" value="<%=id%>">
            Name: <input type="text" name="name" value="<%=name%>"><br>
            Quantity: <input type="number" name="quantity" value="<%=quantity%>"><br>
            Selling Price: <input type="number" name="selling_price" value="<%=sellingPrice%>"><br>
            MRP: <input type="number" name="mrp" value="<%=mrp%>"><br>
            <input type="submit" value="Save">
        </form>
        <%
    } else {
        // Display an error message if the result set is empty
        out.println("Product not found.");
    }

    // Close the database connection
    conn.close();
%>	
</body>
</html>

