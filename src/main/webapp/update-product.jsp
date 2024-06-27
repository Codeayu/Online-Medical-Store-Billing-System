<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%
    // Establish a connection to your database
       String url = "jdbc:mysql://u95bkzftvx8tpees:XQG18W1E6DvpJgMSS77Y@bpgcz0m5wxumvwiokehb-mysql.services.clever-cloud.com:3306/bpgcz0m5wxumvwiokehb";

    Connection conn = DriverManager.getConnection(url);

    // Retrieve the edited product data from the form submission
    String id = request.getParameter("id");
    String name = request.getParameter("name");
    int quantity = Integer.parseInt(request.getParameter("quantity"));
    double sellingPrice = Double.parseDouble(request.getParameter("selling_price"));
    double mrp = Double.parseDouble(request.getParameter("mrp"));

    // Update the product data in the database using a UPDATE query
    PreparedStatement stmt = conn.prepareStatement("UPDATE products SET proname = ?, quantity = ?, selling_Price = ?, mrp = ? WHERE proid = ?");
    stmt.setString(1, name);
    stmt.setInt(2, quantity);
    stmt.setDouble(3, sellingPrice);
    stmt.setDouble(4, mrp);
    stmt.setString(5, id);
    int rowsUpdated = stmt.executeUpdate();

    // Display a success message if the product data was updated successfully
    if (rowsUpdated > 0) {
        out.println("Product updated successfully.");
    } else {
        out.println("Product not found.");
    }

    // Close the database connection
    conn.close();
%>
