<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%
    // Establish a connection to your database
       String url = "jdbc:mysql://u95bkzftvx8tpees:XQG18W1E6DvpJgMSS77Y@bpgcz0m5wxumvwiokehb-mysql.services.clever-cloud.com:3306/bpgcz0m5wxumvwiokehb";
    Connection conn = DriverManager.getConnection(url);

    // Get the ID of the product to be removed from the request parameter
    String id = request.getParameter("proid");

    // Remove the product from the database using a DELETE query
    PreparedStatement stmt = conn.prepareStatement("DELETE FROM products WHERE proid = ?");
    stmt.setString(1, id);
    stmt.executeUpdate();

    // Close the database connection and redirect back to the view products page
    conn.close();
    response.sendRedirect("view-products.jsp");
%>
