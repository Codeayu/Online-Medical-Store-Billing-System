<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%
    // Establish a connection to your database
    String url = "jdbc:mysql://u95bkzftvx8tpees:XQG18W1E6DvpJgMSS77Y@bpgcz0m5wxumvwiokehb-mysql.services.clever-cloud.com:3306/bpgcz0m5wxumvwiokehb";
    Connection conn = DriverManager.getConnection(url);
    
    // Update the product in the database using the form data
    String id = request.getParameter("id");
    String name = request.getParameter("name");
    int quantity = Integer.parseInt(request.getParameter("quantity"));
    double sellingPrice = Double.parseDouble(request.getParameter("selling_price"));
    double mrp = Double.parseDouble(request.getParameter("mrp"));
    PreparedStatement ps = conn.prepareStatement("UPDATE products SET proname=?, quantity=?, selling_Price=?, mrp=? WHERE id=?");
    ps.setString(1, name);
    ps.setInt(2, quantity);
    ps.setDouble(3, sellingPrice);
    ps.setDouble(4, mrp);
    ps.setString(5, id);
    ps.executeUpdate();
    
    // Redirect the user back to the view products page
    response.sendRedirect("view-products.jsp");
%>
