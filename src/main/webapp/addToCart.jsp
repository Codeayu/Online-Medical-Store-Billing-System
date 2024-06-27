<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<html>
<head>
    <link rel="stylesheet" href="D:\Projects-1010\Indsutrio-1.0.0\src\main\webapp\css\bootstrap.min.css">
    <style>
        label {
            display: block;
            margin-bottom: 5px;
        }
        input[type="submit"]{
            margin-bottom: 10px;
            width: 100%;
            padding: 10px;
            border-radius: 4px;
            border: 1px solid #609ab9;
            background-color: #60b96f;
            box-sizing: border-box;
            color: white;
        }
        select, input[type="number"], input[type="text"], input[type="email"] {
            margin-bottom: 10px;
            width: 100%;
            padding: 10px;
            border-radius: 4px;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }

        form {
            width: 300px;
            margin: 0 auto;
            animation: fadeIn 1s ease-in-out;
        }

        @keyframes fadeIn {
            0% {
                opacity: 0;
                transform: translateY(-20px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
    <style>
        /* Responsive Styles */

        @media only screen and (max-width: 600px) {
            form {
                width: 90%;
            }
        }

        @media only screen and (min-width: 601px) and (max-width: 1024px) {
            form {
                width: 60%;
            }
        }

        @media only screen and (min-width: 1025px) {
            form {
                width: 40%;
            }
        }
    </style>
</head>
<body>
<%
if(session.getAttribute("user") != null){
    String snm = session.getAttribute("snm").toString();
    String usnm = session.getAttribute("user").toString();
    System.out.println(usnm);
%>
    <form action="Billing.jsp" method="post">
        <label>Product 1</label>
        <select name="product_id">
            <!-- Populate the dropdown with product IDs from the database -->
            <% 
                String url = "jdbc:mysql://u95bkzftvx8tpees:XQG18W1E6DvpJgMSS77Y@bpgcz0m5wxumvwiokehb-mysql.services.clever-cloud.com:3306/bpgcz0m5wxumvwiokehb";
            try {
                Class.forName("com.mysql.jdbc.Driver");

                Connection conn = DriverManager.getConnection(url);
                PreparedStatement pst;
                pst= conn.prepareStatement("SELECT proid, proname FROM products where user_name=?");
                pst.setString(1, usnm);
                ResultSet rs = pst.executeQuery();
                while (rs.next()) {
                    String productId = rs.getString("proid");
                    String productName = rs.getString("proname");
                    out.println("<option value='" + productId + "'>" + productName + "</option>");
                }

                rs.close();
                pst.close();
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            %>
        </select>
        <input type="number" name="quantity" min="1" value="1">

        <label>Product 2</label>
        <select name="product_id">
            <!-- Populate the dropdown with product IDs from the database -->
            <% 
            
            try {
                // String url = "jdbc:mysql://u95bkzftvx8tpees:XQG18W1E6DvpJgMSS77Y@bpgcz0m5wxumvwiokehb-mysql.services.clever-cloud.com:3306/bpgcz0m5wxumvwiokehb";
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection(url);
               // Statement stmt = conn.createStatement();
                PreparedStatement pst;
                pst= conn.prepareStatement("SELECT proid, proname FROM products where user_name=?");
                pst.setString(1, usnm);
                ResultSet rs = pst.executeQuery();
                while (rs.next()) {
                    String productId = rs.getString("proid");
                    String productName = rs.getString("proname");
                    out.println("<option value='" + productId + "'>" + productName + "</option>");
                }

                rs.close();
                pst.close();
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            %>
        </select>
        <input type="number" name="quantity" min="1" value="1">

        <!-- Add more product sections as needed -->

        <label>Tax Percentage (%)</label>
        <input type="number" name="tax" min="0" step="0.01" value="0" required>
        <h2>Customer Details</h2>
        <label>Name</label>
        <input type="text" name="customer_name" required>

        <label>Address</label>
        <input type="text" name="customer_address" required>

        <label>Email</label>
        <input type="email" name="customer_email" required>

        <label>Number</label>
        <input type="text" name="customer_number" required>

        <input type="submit" value="Generate Bill" >
    </form>
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
