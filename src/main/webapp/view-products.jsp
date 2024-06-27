<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%
    // Establish a connection to your database
    String url = "jdbc:mysql://u95bkzftvx8tpees:XQG18W1E6DvpJgMSS77Y@bpgcz0m5wxumvwiokehb-mysql.services.clever-cloud.com:3306/bpgcz0m5wxumvwiokehb";
    //String user = "username";
   // String password = "password";
    Connection conn = DriverManager.getConnection(url);
    
    if(session.getAttribute("user") != null){
        String snm = session.getAttribute("snm").toString();
        String usnm = session.getAttribute("user").toString();
        System.out.println(usnm);

       
    
    // Retrieve the products from your database
    //Statement stmt = conn.createStatement();
    PreparedStatement pst;
   pst= conn.prepareStatement("Select * from products where user_name=?");
    pst.setString(1,usnm);
    ResultSet rs = pst.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
  <title>View Products</title>
    <style>
        /* Add some styles for your products table */
         {
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        h1 {
            text-align: center;
            margin: 20px 0;
        }

        table {
            border-collapse: collapse;
            width: 100%;
            margin-bottom: 20px;
        }

        th, td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        tr:hover {
            background-color: #f5f5f5;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .btn {
            background-color: #4CAF50;
            color: white;
            padding: 8px 16px;
            border: none;
            cursor: pointer;
            border-radius: 4px;
            transition: background-color 0.3s ease;
        }

        .btn:hover {
            background-color: #45a049;
        }

        .btn-secondary {
            background-color: #ccc;
        }

        .btn-secondary:hover {
            background-color: #bbb;
        }

        .btn-group {
            display: inline-block;
        }

        .btn-group .btn {
            float: none;
            display: inline-block;
            margin: 0;
            border-radius: 0;
        }

        .btn-group .btn:first-child {
            border-top-left-radius: 4px;
            border-bottom-left-radius: 4px;
        }

        .btn-group .btn:last-child {
            border-top-right-radius: 4px;
            border-bottom-right-radius: 4px;
        }

        .confirm-delete {
            display: none;
            text-align: center;
            margin-top: 10px;
        }

        .confirm-delete p {
            margin-bottom: 5px;
        }

        .confirm-delete .btn {
            margin: 5px;
        }

        .animation-fade {
            animation: fade 0.3s;
        }

        @keyframes fade {
            from { opacity: 0; }
            to { opacity: 1; }
        }
    </style>
</head>
<body>

    <h1>View Products</h1>
    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Quantity</th>
            <th>Selling Price</th>
            <th>MRP</th>
            <th>Action</th>
        </tr>
        <% while(rs.next()) { %>
            <tr>
                <td><%= rs.getString("proid") %></td>
                <td><%= rs.getString("proname") %></td>
                <td><%= rs.getInt("quantity") %></td>
                <td><%= rs.getDouble("selling_Price") %></td>
                <td><%= rs.getDouble("mrp") %></td>
                <td>
                    <a href="edit-product.jsp?proid=<%= rs.getString("proid") %>">
                        <button class="btn">Edit</button>
                    </a>
                    <button class="btn" onclick="confirmDelete('<%= rs.getString("proid") %>')">Remove</button>
                </td>
            </tr>
        <% } %>
    </table>
    
    <script>
        // Add a JavaScript function to confirm the product removal
        function confirmDelete(proid) {
            if (confirm("Are you sure you want to remove this product?")) {
                window.location.href = "remove-product.jsp?proid=" + proid;
            }
        }
    </script>
       <%
    } else {
        %>
        <h2>Invalid session...</h2>
        <hr>
        <p>You are not authorized to see this information.</p>
        <a href="login.html">Login</a>
        <%
    }
%>
</body>
</html>
