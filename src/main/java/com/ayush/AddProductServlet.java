package com.ayush;

// ProductServlet.java
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/AddProductServlet")
public class AddProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String productName = request.getParameter("productName");
        String productId = request.getParameter("productId");
        double mrp = Double.parseDouble(request.getParameter("mrp"));
        double sellingPrice = Double.parseDouble(request.getParameter("sellingPrice"));
        String mfd = request.getParameter("mfd");
        String expiryDate = request.getParameter("expiryDate");
        String userName = request.getParameter("userName");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String shop_name = request.getParameter("shop_name");

//        HttpSession session = request.getSession(true);
        

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://u95bkzftvx8tpees:XQG18W1E6DvpJgMSS77Y@bpgcz0m5wxumvwiokehb-mysql.services.clever-cloud.com:3306/bpgcz0m5wxumvwiokehb");
            String sql = "INSERT INTO products (proid, proname, quantity, mrp, selling_Price, mfg, expiry, shop_name, user_name) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, productId);
            statement.setString(2, productName);
            statement.setInt(3, quantity);
            statement.setDouble(4, mrp);
            statement.setDouble(5, sellingPrice);
            statement.setString(6, mfd);
            statement.setString(7, expiryDate);
            statement.setString(8, shop_name );
            statement.setString(9, userName);
            statement.executeUpdate();
            conn.close();
//            session.setAttribute("message", "Product added successfully");
            response.sendRedirect("prose.jsp");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
//            session.setAttribute("message", "Error: " + e.getMessage());
            response.sendRedirect("proer.jsp");
        }
    }
    }

