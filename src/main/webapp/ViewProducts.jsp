<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.ayush.javafiles.Product" %>
<html>
<head>
  <title>View Products</title>
</head>
<body>
  <h1>Products</h1>
  <table>
    <thead>
      <tr>
        <th>ID</th>
        <th>Name</th>
        <th>MRP</th>
        <th>SELLING Price</th>
        <th>Actions</th>
      </tr>
    </thead>
    <tbody>
      <c:set var="products" value="${null}" scope="request"/>
      <%
        try {
          Class.forName("com.mysql.jdbc.Driver");
          Connection con = DriverManager.getConnection("jdbc:mysql://u95bkzftvx8tpees:XQG18W1E6DvpJgMSS77Y@bpgcz0m5wxumvwiokehb-mysql.services.clever-cloud.com:3306/bpgcz0m5wxumvwiokehb");

          Statement stmt = con.createStatement();
          ResultSet rs = stmt.executeQuery("SELECT * FROM products");

          List<Product> productList = new ArrayList<Product>();
          while (rs.next()) {
            String id = rs.getString("proid");
            String name = rs.getString("proname");
            double mrp = rs.getDouble("mrp");
            double sellprice = rs.getDouble("selling_Price");

            Product product = new Product(id, name, mrp, sellprice);
            productList.add(product);
          }

          request.setAttribute("products", productList);
        } catch (Exception e) {
          out.println(e);
        }
      %>
      <c:forEach var="product" items="${products}">
        <tr>
          <td>${product.id}</td>
          <td>${product.name}</td>
          <td>${product.description}</td>
          <td>${product.price}</td>
          <td>
            <a href="EditProduct.jsp?id=${product.id}">Edit</a>
            <a href="RemoveProduct.jsp?id=${product.id}" onclick="return confirm('Are you sure you want to delete this product?')">Remove</a>
          </td>
        </tr>
      </c:forEach>
    </tbody>
  </table>
  <a href="AddProduct.jsp">Add Product</a>
</body>
</html>
