package com.ayush;



import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Check1
 */
@WebServlet("/Check1")
public class Check1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Check1() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String usernm,passwd;
		usernm=request.getParameter("usernm");
		passwd=request.getParameter("passwd");
		System.out.println("usernm="+usernm+" pass="+passwd);
		Connection con;
		PreparedStatement pst;
		ResultSet rs;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://u95bkzftvx8tpees:XQG18W1E6DvpJgMSS77Y@bpgcz0m5wxumvwiokehb-mysql.services.clever-cloud.com:3306/bpgcz0m5wxumvwiokehb");
			pst=con.prepareStatement("select * from users where usernm=? and passwd=?");
			pst.setString(1, usernm);
			pst.setString(2, passwd);
			rs=pst.executeQuery();
			
			if (rs.next()) {
				String spnm=rs.getString("snm");
				HttpSession session = request.getSession(true);
				session.setAttribute("snm", spnm);
				System.out.println(spnm);
			         session.setAttribute("user", usernm);
			         System.out.println(usernm);
			         response.sendRedirect("admin.jsp");
				con.close();
			} else {
				response.sendRedirect("login.html");
			}
			
		
		}
		catch (Exception e) {
			// TODO: handle exception
			out.print(e);
		}
	}

	}



