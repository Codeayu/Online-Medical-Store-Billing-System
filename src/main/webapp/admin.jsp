<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ATS</title>


    <title>ATS - WEB base Billing System</title>
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
    <link href="css/admine.css" rel="stylesheet">
</head>

<body>
<%
    if(session.getAttribute("user")!=null){
    	String snm = session.getAttribute("snm").toString();
	String usnm=session.getAttribute("user").toString();
	System.out.println(usnm);
    
    %>
    
    <!-- Spinner Start -->
    <div id="spinner"
        class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-border text-primary" role="status" style="width: 3rem; height: 3rem;"></div>
    </div>
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
                    <a class="btn btn-link text-light" target="_blank" href="https://www.instagram.com/billing_with_ats/"><i class="fab fa-instagram"></i></a>
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
                <a href="index.html" class="nav-item nav-link active">Home</a>
                <a href="about.html" class="nav-item nav-link">About</a>
                <a href="service.jsp" class="nav-item nav-link">Services</a>
                <a href="contact.html" class="nav-item nav-link">Contact</a>
            </div>

            <a href="/Indsutrio-1.0.0/login.html" class="btn btn-primary px-3 d-none d-lg-block"><%= session.getAttribute("user") %>!</a>
                
        </div>
    </nav>
    <!-- Navbar End -->


    <!-- Carousel Start -->
    <div class="container-fluid px-0 mb-5">
        <div id="header-carousel" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="w-100" src="img/Business medical meeting.jpg" alt="Image"  width="900" height="650">
                    <div class="carousel-caption">
                        <div class="container">
                            <div class="row justify-content-center">
                                <div class="col-lg-10 text-start">
                                    <p class="fs-5 fw-medium text-primary text-uppercase animated slideInRight">6 Month
                                        of Working Experience</p>
                                    <h1 class="display-1 text-white mb-5 animated slideInRight">Medical Store Billing Software</h1>
                                    <a href="" class="btn btn-primary py-3 px-5 animated slideInRight">Explore More</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="carousel-item">
                    <img class="w-100" src="img/Business executive holding blank placard.jpg" alt="Image" width="900" height="650">
                    <div class="carousel-caption">
                        <div class="container">
                            <div class="row justify-content-center">
                                <div class="col-lg-10 text-start">
                                    <p class="fs-5 fw-medium text-primary text-uppercase animated slideInRight">6 Month
                                        of Working Experience</p>
                                    <h1 class="display-1 text-white mb-5 animated slideInRight">The Best Reliable
                                        Billing Solution</h1>
                                    <a href="" class="btn btn-primary py-3 px-5 animated slideInRight">Explore More</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#header-carousel" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#header-carousel" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
    </div>
    <!-- Carousel End -->


    




  <!-- Service Start -->
  <div class="container-xxl py-5">
    <div class="container">
        <div class="text-center mx-auto pb-4 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px;">
            <p class="fw-medium text-uppercase text-primary mb-2">Our Services</p>
            <h1 class="display-5 mb-4">We Provide Best Industrial Services</h1>
        </div>
        <div class="row gy-5 gx-4">
            <div class="col-md-6 col-lg-4 wow fadeInUp" data-wow-delay="0.1s">
                <div class="service-item">
                    <img class="img-fluid" src="img/medibhai.png" alt="">
                    <div class="service-img">
                        <img class="img-fluid" src="img/medibhai.png" alt="">
                    </div>
                    <div class="service-detail">
                        <div class="service-title">
                            <hr class="w-25">
                            <h3 class="mb-0">Client are Happy</h3>
                            <hr class="w-25">
                        </div>
                        <div class="service-text">
                            <p class="text-white mb-0">This software is designed to simplify and automate the
                                billing process of these stores, making it easier for them to manage their inventory
                                and financial transactions.</p>
                        </div>
                    </div>
                    <a class="btn btn-light" href="">Read More</a>
                </div>
            </div>
            <div class="col-md-6 col-lg-4 wow fadeInUp" data-wow-delay="0.3s">
                <div class="service-item">
                    <img class="img-fluid" src="img/medib2b.png" alt="">
                    <div class="service-img">
                        <img class="img-fluid" src="img/medib2b.png" alt="">
                    </div>
                    <div class="service-detail">
                        <div class="service-title">
                            <hr class="w-25">
                            <h3 class="mb-0">Staff is Happy</h3>
                            <hr class="w-25">
                        </div>
                        <div class="service-text">
                            <p class="text-white mb-0">With a medical store billing system, staff can quickly and
                                easily generate bills for customers, keep track of inventory levels, and monitor
                                sales trends.</p>
                        </div>
                    </div>
                    <a class="btn btn-light" href="">Read More</a>
                </div>
            </div>
            <div class="col-md-6 col-lg-4 wow fadeInUp" data-wow-delay="0.5s">
                <div class="service-item">
                    <img class="img-fluid" src="img/newhap.png" alt="">
                    <div class="service-img">
                        <img class="img-fluid" src="img/newhap.png" alt="">
                    </div>
                    <div class="service-detail">
                        <div class="service-title">
                            <hr class="w-25">
                            <h3 class="mb-0">B to B is Happy</h3>
                            <hr class="w-25">
                        </div>
                        <div class="service-text">
                            <p class="text-white mb-0">Such a system could provide a number of benefits to the
                                business, including streamlined operations, improved accuracy in billing and
                                inventory management, and increased efficiency in handling orders and payments.</p>
                        </div>
                    </div>
                    <a class="btn btn-light" href="">Read More</a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Service End -->


  <!-- Project Start -->
  <div class="container-fluid bg-dark pt-5 my-5 px-0">
    <div class="text-center mx-auto mt-5 wow fadeIn" data-wow-delay="0.1s" style="max-width: 600px;">
        <p class="fw-medium text-uppercase text-primary mb-2">Our Projects</p>
        <h1 class="display-5 text-white mb-5">See What We Have Completed Recently</h1>
    </div>
    <div class="owl-carousel project-carousel wow fadeIn" data-wow-delay="0.1s">
        <a class="project-item" href="">
            <img class="img-fluid" src="img/medibhai.png" alt="">
            <div class="project-title">
                <h5 class="text-primary mb-0">Billing process is happy</h5>
            </div>
        </a>
        <a class="project-item" href="">
            <img class="img-fluid" src="img/bdk.jpg" alt="">
            <div class="project-title">
                <h5 class="text-primary mb-0">***</h5>
            </div>
        </a>
        <a class="project-item" href="">
            <img class="img-fluid" src="img/medib2b.png" alt="">
            <div class="project-title">
                <h5 class="text-primary mb-0">B to B is happy</h5>
            </div>
        </a>
        <a class="project-item" href="">
            <img class="img-fluid" src="img/bc.jpg" alt="">
            <div class="project-title">
                <h5 class="text-primary mb-0">****</h5>
            </div>
        </a>
        <a class="project-item" href="">
            <img class="img-fluid" src="img/happystaff.png" alt="">
            <div class="project-title">
                <h5 class="text-primary mb-0">Staff is happy</h5>
            </div>
        </a>
        <a class="project-item" href="">
            <img class="img-fluid" src="img/bs.jpg" alt="">
            <div class="project-title">
                <h5 class="text-primary mb-0">***</h5>
            </div>
        </a>
    </div>
</div>
<!-- Project End -->


   <!-- Testimonial Start -->
   <div class="container-xxl py-5">
    <div class="container">
        <div class="text-center mx-auto wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px;">
            <p class="fw-medium text-uppercase text-primary mb-2">Testimonial</p>
            <h1 class="display-5 mb-5">What Our Clients Say!</h1>
        </div>
        <div class="owl-carousel testimonial-carousel wow fadeInUp" data-wow-delay="0.1s">
            <div class="testimonial-item text-center">
                <div class="testimonial-img position-relative">
                    <img class="img-fluid rounded-circle mx-auto mb-5" src="img/nishu.jpg">
                    <div class="btn-square bg-primary rounded-circle">
                        <i class="fa fa-quote-left text-white"></i>
                    </div>
                </div>
                <div class="testimonial-text text-center rounded p-4">
                    <p>Mobile-friendly: A large percentage of users access the internet using their mobile devices.
                        Therefore, ensure that your website is mobile-friendly and responsive to different screen
                        sizes.</p>
                    <h5 class="mb-1">Client Name</h5>
                    <span class="fst-italic">Profession</span>
                </div>
            </div>
            <div class="testimonial-item text-center">
                <div class="testimonial-img position-relative">
                    <img class="img-fluid rounded-circle mx-auto mb-5" src="img/karm.jpg">
                    <div class="btn-square bg-primary rounded-circle">
                        <i class="fa fa-quote-left text-white"></i>
                    </div>
                </div>
                <div class="testimonial-text text-center rounded p-4">
                    <p>Functionality: The website should be fully functional and easy to use. Ensure that the
                        billing process is smooth and efficient. It should be easy for the user to add items to the
                        cart, review their order, and complete the payment process.</p>
                    <h5 class="mb-1">Karamveer Singh</h5>
                    <span class="fst-italic">Student</span>
                </div>
            </div>
            <div class="testimonial-item text-center">
                <div class="testimonial-img position-relative">
                    <img class="img-fluid rounded-circle mx-auto mb-5" src="img/prathmesh.jpg">
                    <div class="btn-square bg-primary rounded-circle">
                        <i class="fa fa-quote-left text-white"></i>
                    </div>
                </div>
                <div class="testimonial-text text-center rounded p-4">
                    <p>Security: Security is a significant concern for online transactions, especially when it comes
                        to medical information. Ensure that the website is secure and that the user's personal
                        information is kept confidential.</p>
                    <h5 class="mb-1">Khanda Bhau</h5>
                    <span class="fst-italic">Student</span>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Testimonial End -->


    <!-- Footer Start -->
    <div class="container-fluid bg-dark footer mt-5 py-5 wow fadeIn" data-wow-delay="0.1s">
        <div class="container py-5">
            <div class="row g-5">
                <div class="col-lg-3 col-md-6">
                    <h5 class="text-white mb-4">Our Office</h5>
                    <p class="mb-2"><i class="fa fa-map-marker-alt me-3"></i>Gulshan tower,amravati</p>
                    <p class="mb-2"><i class="fa fa-phone-alt me-3"></i>+012 345 67890</p>
                    <p class="mb-2"><i class="fa fa-envelope me-3"></i>info@example.com</p>
                    <div class="d-flex pt-3">
                        <a class="btn btn-square btn-primary rounded-circle me-2" href=""><i
                                class="fab fa-twitter"></i></a>
                        <a class="btn btn-square btn-primary rounded-circle me-2" href=""><i
                                class="fab fa-facebook-f"></i></a>
                        <a class="btn btn-square btn-primary rounded-circle me-2" href=""><i
                                class="fab fa-youtube"></i></a>
                        <a class="btn btn-square btn-primary rounded-circle me-2" href=""><i
                                class="fab fa-linkedin-in"></i></a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <h5 class="text-white mb-4">Quick Links</h5>
                    <a class="btn btn-link" href="about.html">About Us</a>
                    <a class="btn btn-link" href="contact.html">Contact Us</a>
                    <a class="btn btn-link" href="servicepg.html">Our Services</a>
                    <a class="btn btn-link" href="">Terms & Condition</a>
                    <a class="btn btn-link" href="contact.html">Support</a>
                </div>
                <div class="col-lg-3 col-md-6">
                    <h5 class="text-white mb-4">lorem8</h5>
                    <p class="mb-1">Monday - Friday</p>
                    <h6 class="text-light"></h6>
                    <p class="mb-1">Saturday</p>
                    <h6 class="text-light"></h6>
                    <p class="mb-1">Sunday</p>
                    <h6 class="text-light"></h6>
                </div>
                <div class="col-lg-3 col-md-6">
                    <h5 class="text-white mb-4">FeedBack</h5>
                    <p>Type anything that you want to share with us.</p>
                    <div class="position-relative w-100">
                        <input class="form-control bg-transparent w-100 py-3 ps-4 pe-5" type="text"
                            placeholder="feedback">
                        <a href="logout.jsp" class="btn btn-primary py-2 position-absolute top-0 end-0 mt-2 me-2">LogOut!</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Footer End -->


    <!-- Copyright Start -->
    <div class="container-fluid copyright bg-dark py-4">
        <div class="container text-center">
            <p class="mb-2">Copyright &copy; <a class="fw-semi-bold" href="#">ATS Pvt Lmt</a>, All Right Reserved.
            </p>
            <!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
            <p class="mb-0">Designed By<a class="fw-semi-bold" href="https:">Team medical store biling system</a>@Copyright: Tushar, Ayush, and Sahil. <a href="https://themewagon.com"></a> </p>
        </div>
    </div>
    <!-- Copyright End -->


    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top"><i
            class="bi bi-arrow-up"></i></a>


    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/wow/wow.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="lib/counterup/counterup.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
    <script>
        document.getElementById("logout").addEventListener("click", function(event) {
          event.preventDefault();
          if (confirm("Are you sure you want to log out?")) {
            // send an HTTP request to invalidate the session on the server
            var xhr = new XMLHttpRequest();
            xhr.open("GET", "logout.jsp", true);
            xhr.onload = function() {
              if (xhr.readyState == 4 && xhr.status == 200) {
                // redirect the user to the login page
                window.location.href = "index.html";
              }
            };
            xhr.send();
          }
        });
    </script>
    <%
    }
    else{
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
</html>