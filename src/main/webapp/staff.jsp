<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> 
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
	<title>Staff Status</title>
	<link rel="stylesheet" type="text/css" href="css/staff.css">
	
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
        href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500;600&family=Rubik:wght@500;600;700&display=swap"
        rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/animate/animate.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
	
</head>
<body>
    <!-- Spinner End -->


    <!-- Topbar Start -->
    <div class="container-fluid bg-dark px-0">
        <div class="row g-0 d-none d-lg-flex">
            <div class="col-lg-6 ps-5 text-start">
                <div class="h-100 d-inline-flex align-items-center text-white">
                    <span>Follow Us:</span>
                    <a class="btn btn-link text-light" href=""><i class="fab fa-facebook-f"></i></a>
                    <a class="btn btn-link text-light" href=""><i class="fab fa-twitter"></i></a>
                    <a class="btn btn-link text-light" href=""><i class="fab fa-linkedin-in"></i></a>
                    <a class="btn btn-link text-light" target="_blank"
                        href="https://www.instagram.com/billing_with_ats/"><i class="fab fa-instagram"></i></a>
                </div>
            </div>

        </div>
    </div>
    <!-- Topbar End -->


    <!-- Navbar Start -->
    <nav class="navbar navbar-expand-lg bg-white navbar-light sticky-top py-0 pe-5">
        <a href="index.html" class="navbar-brand ps-5 me-0">
            <h1 class="text-white m-0"><img src="img/logoo.png" alt="" width="102" height="79"></h1>
        </a>
        <button type="button" class="navbar-toggler me-0" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <div class="navbar-nav ms-auto p-4 p-lg-0">
                 <a href="about.html" class="nav-item nav-link">About</a>
                <a href="servicepg.html" class="nav-item nav-link">Services</a>
                <a href="contact.html" class="nav-item nav-link">Contact</a>
            </div>
            <a href="/Indsutrio-1.0.0/login.html" class="btn btn-primary px-3 d-none d-lg-block">Login</a>
        </div>
    </nav>
    <!-- Navbar End -->
</body>
<body>
	<div class="container">
		<h1>Staff Status</h1>
		<table id="staff-table">
			<thead>
				<tr>
					<th style="color:rgb(255, 255, 255);"><h3 style="font-size:20px;">Name</h3></th>
					<th style="color:rgb(255, 255, 255);"><h3 style="font-size:20px;">joining-date</h3></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>John Doe</td>
					<td>01/01/2020</td>
				</tr>
				<tr>
					<td>Jane Doe</td>
					<td>01/02/2020</td>
				</tr>
			</tbody>
		</table>
	<button id="add-staff-btn">Add Staff</button>
        
        <div id="add-staff-modal" class="modal">
            <div class="modal-content">
                <span class="close">&times;</span>
                <h2>Add Staff</h2>
                
                
                <form method="post" id="add-staff-form">
                    <label for="name" class="staff-name">Name:</label>
                    <input type="text" id="name" name="name" required>
                    
                    <label for="joining-date">Joining Date:</label>
                    <input type="date" id="joining-date" name="joining-date" required>
                    
                    <label for="mobile-number">Mobile Number:</label>
                    <input type="tel" id="mobile-number" name="mobile-number" required>
                    
                    <button type="submit">Add</button>
                </form>
            </div>
	    </div>

    
<%
    String name = request.getParameter("name");
    String joiningdate = request.getParameter("joining_date");
    String mobile = request.getParameter("mobile_number");
    

    if(name != null && joiningdate != null && mobile != null) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://u95bkzftvx8tpees:XQG18W1E6DvpJgMSS77Y@bpgcz0m5wxumvwiokehb-mysql.services.clever-cloud.com:3306/bpgcz0m5wxumvwiokehb", "root", "password");

            String query = "INSERT INTO users (name, joiningdate, mobile) VALUES (?, ?, ?)";
            
            PreparedStatement statement = con.prepareStatement(query);
            
            statement.setString(1, name);
            statement.setString(2, joiningdate);
            statement.setString(3, mobile);
            statement.executeUpdate();

            con.close();

            System.out.println("<p>Staff member added successfully.</p>");
        } catch(Exception e) {
            System.out.println("<p>Error adding staff member.</p>");
            e.printStackTrace();
        }
    }
%>

    
    
	    <button id="remove-staff-btn">remove staff</button>
	</div>
	        <div id="remove-staff-modal" class="model">
	            <div class="modal-content">
	                <span class="closs">&times;</span>
	                <h2>Add Staff</h2>
	                <form id="remove-staff-form">
	
	                    <label for="name">Name:</label>
	                    <!-- <input type="text" id="name" name="name" required> -->
	                    <select id="staff-name" name="staff-name">
	                        <option value="john-doe">John Doe</option>
	                        <option value="jane-smith">Jane Smith</option>
	                        <option value="mark-johnson">Mark Johnson</option>
	                    </select>
	
	                    <label for="mobile-number" >Mobile Number:</label>
	                    <input type="tel" id="mobile-number" name="mobile-number" required>
	
	                    <button type="submit">Add</button>
	                </form>
	            </div>
	        </div>

	<script src="js/staff.js"></script>
</body>
</html>