<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="bootstrap.min.css">
    <title>Product Cost Calculation</title>
    
        <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #eef6f9;
            animation: fadeIn 0.5s ease-in;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }
        h3{
            color: #333;
            margin-top: 20px;
            text-align: left;
            animation: slideDown 0.5s ease-in-out;   
        }       
        h1 {
            font-family: Verdana, Geneva, Tahoma, sans-serif;
            text-align: center;
            color: #5a21dd;
            text-shadow: 2px 2px 4px #cff1fd;
            animation: shadowPop 0.5s ease-in-out;
        }

        @keyframes shadowPop {
            0% {
                text-shadow: none;
            }
            50% {
                text-shadow: 2px 2px 4px #41a1c0;
            }
            100% {
                text-shadow: none;
            }
        }

        h2 {
            color: #333;
            margin-top: 20px;
            text-align: center;
            animation: slideDown 0.5s ease-in-out;
        }

        @keyframes slideDown {
            0% {
                transform: translateY(-50px);
            }
            100% {
                transform: translateY(0);
            }
        }

        table {
            border-collapse: collapse;
            width: 100%;
            margin-bottom: 20px;
            animation: fadeIn 0.5s ease-in;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
            color: #333;
        }

        .total {
            background-color: #f2f2f2;
            font-weight: bold;
        }

        .print-button {
            display: block;
            width: 120px;
            margin: 20px auto;
            padding: 12px;
            text-align: center;
            background-color: #41a1c0;
            color: #fff;
            font-size: 16px;
            border-radius: 4px;
            text-decoration: none;
            transition: background-color 0.3s;
            animation: fadeIn 0.5s ease-in;
        }

        .print-button:hover {
            background-color: #68b5cd;
        }
		 .home-button {
            display: block;
            width: 120px;
            margin: 20px auto;
            padding: 12px;
            text-align: center;
            background-color: #41a1c0;
            color: #fff;
            font-size: 16px;
            border-radius: 4px;
            text-decoration: none;
            transition: background-color 0.3s;
            animation: fadeIn 0.5s ease-in;
        }

        .home-button:hover {
            background-color: #68b5cd;
        }
        ul {
            font-style: italic;
            list-style: none;
            padding-left: 0;
        }

        ul li {
            margin-bottom: 10px;
            animation: fadeIn 0.5s ease-in;
        }

        ul li:before {
            content: "▹";
            margin-right: 8px;
        }

        ul li p {
            margin: 0;
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
        <% out.println("<h1>" + snm + "</h1>");
        String cusnm = request.getParameter("customer_name");
        String cusadd = request.getParameter("customer_address");
        String cusemail = request.getParameter("customer_email");
        String cusnum = request.getParameter("customer_number");
        %>
        <h3>Customer details</h3>
        <ul>
            <% out.println("<p>Customer Name: " + cusnm + "</p>"); %>
            <% out.println("<p>Customer Address: " + cusadd + "</p>"); %>
            <% out.println("<p>Customer Number: " + cusnum + "</p>"); %>
            <% out.println("<p>Customer Email: " + cusemail + "</p>"); %>
        </ul>

        <h2>Product Cost Calculation</h2>

        <table>
            <tr>
                <th>Product Name</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Cost</th>
            </tr>

            <%!
                double totalCost = 0;
            %>

            <%
            // Database connection details
    String url = "jdbc:mysql://u95bkzftvx8tpees:XQG18W1E6DvpJgMSS77Y@bpgcz0m5wxumvwiokehb-mysql.services.clever-cloud.com:3306/bpgcz0m5wxumvwiokehb";
//            String username = "your_username";
  //          String password = "your_password";

            // Get the tax percentage from the user
            double taxPercentage = Double.parseDouble(request.getParameter("tax"));

            // Get the product IDs and quantities from the user
            String[] productIds = request.getParameterValues("product_id");
            String[] quantities = request.getParameterValues("quantity");

            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection(url);

                for (int i = 0; i < productIds.length; i++) {
                    String productId = productIds[i];
                    int quantity = Integer.parseInt(quantities[i]);

                    // Fetch the product details from the database
                    String query = "SELECT proname, selling_Price FROM products WHERE proid = ?";
                    PreparedStatement pstmt = conn.prepareStatement(query);
                    pstmt.setString(1, productId);
                    ResultSet rs = pstmt.executeQuery();

                    if (rs.next()) {
                        String productName = rs.getString("proname");
                        double productPrice = rs.getDouble("selling_Price");

                        // Calculate the cost for this product based on quantity
                        double productCost = productPrice * quantity;
                        totalCost += productCost;

                        // Display individual product details
                        out.println("<tr>");
                        out.println("<td>" + productName + "</td>");
                        out.println("<td>" + productPrice + "</td>");
                        out.println("<td>" + quantity + "</td>");
                        out.println("<td>" + productCost + "</td>");
                        out.println("</tr>");
                    }

                    rs.close();
                    pstmt.close();
                }

                // Save the bill details to the database
                String insertQuery = "INSERT INTO bills (customer_name, customer_address, customer_email, customer_number, total_cost, tax_percentage, final_cost) VALUES (?, ?, ?, ?, ?, ?, ?)";
                PreparedStatement insertStmt = conn.prepareStatement(insertQuery);
                insertStmt.setString(1, cusnm);
                insertStmt.setString(2, cusadd);
                insertStmt.setString(3, cusemail);
                insertStmt.setString(4, cusnum);
                insertStmt.setDouble(5, totalCost);
                insertStmt.setDouble(6, taxPercentage);
                insertStmt.setDouble(7, totalCost + (totalCost * (taxPercentage / 100)));
                insertStmt.executeUpdate();

                insertStmt.close();
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            %>
            
            <tr class="total">
                <td colspan="3">Total Cost:</td>
                <td><%= totalCost %></td>
            </tr>
            <tr class="total">
                <td colspan="3">Tax (<%= taxPercentage %>%):</td>
                <td><%= totalCost * (taxPercentage / 100) %></td>
            </tr>
            <tr class="total">
                <td colspan="3">Final Cost:</td>
                <td><%= totalCost + (totalCost * (taxPercentage / 100)) %></td>
            </tr>
        </table>
        <button class="print-button" onclick="window.print()">Print</button>
        <button class="home-button"><a href="admin.jsp">Home page</button>
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

