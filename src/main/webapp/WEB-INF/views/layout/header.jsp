<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="en-US" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
<title>Laundromat</title>

	<link rel="icon" type="image/png" href="assets/images/favicon.png">

    <!--Google Font link-->
	<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Raleway:400,600,700" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
    
    <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:400,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Volkhov:400i" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">
    
    
    
    <!-- Default stylesheets-->
    <link href="assets/lib/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Template specific stylesheets-->
    <link href="assets/lib/animate.css/animate.css" rel="stylesheet">
    <link href="assets/lib/components-font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="assets/lib/et-line-font/et-line-font.css" rel="stylesheet">
    <link href="assets/lib/flexslider/flexslider.css" rel="stylesheet">
    <link href="assets/lib/owl.carousel/dist/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="assets/lib/owl.carousel/dist/assets/owl.theme.default.min.css" rel="stylesheet">
    <link href="assets/lib/magnific-popup/dist/magnific-popup.css" rel="stylesheet">
    <link href="assets/lib/simple-text-rotator/simpletextrotator.css" rel="stylesheet">
    <!-- Main stylesheet and color file-->
    <link href="assets/css/style.css" rel="stylesheet">
    <link id="color-scheme" href="assets/css/colors/default.css" rel="stylesheet">
 
 	<!--JavaScripts -->
    <script src="assets/lib/jquery/dist/jquery.js"></script>
    <script src="assets/lib/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="assets/lib/wow/dist/wow.js"></script>
    <script src="assets/lib/jquery.mb.ytplayer/dist/jquery.mb.YTPlayer.js"></script>
    <script src="assets/lib/isotope/dist/isotope.pkgd.js"></script>
    <script src="assets/lib/imagesloaded/imagesloaded.pkgd.js"></script>
    <script src="assets/lib/flexslider/jquery.flexslider.js"></script>
    <script src="assets/lib/owl.carousel/dist/owl.carousel.min.js"></script>
    <script src="assets/lib/smoothscroll.js"></script>
    <script src="assets/lib/magnific-popup/dist/jquery.magnific-popup.js"></script>
    <script src="assets/lib/simple-text-rotator/jquery.simple-text-rotator.min.js"></script>
    <script src="assets/js/plugins.js"></script>
    <script src="assets/js/main.js"></script>
    
    
	<!-- JS includes -->
	<script src="assets/rage/assets/js/slick.min.js"></script>
	<script src="assets/rage/assets/js/bootsnav.js"></script>

	
	<link rel="stylesheet" href="assets/rage/assets/css/slick.css">
	<link rel="stylesheet" href="assets/rage/assets/css/slick-theme.css">
	<link rel="stylesheet" href="assets/rage/assets/css/bootstrap.css">
	<link rel="stylesheet" href="assets/rage/assets/css/bootsnav.css">
	




	<!--For Plugins external css-->
	<!--<link rel="stylesheet" href="assets/css/plugins.css" />-->

	<!--Theme custom css -->
	<link rel="stylesheet" href="assets/rage/assets/css/style.css">
	<!--<link rel="stylesheet" href="assets/css/colors/maron.css">-->

	<!--Theme Responsive css-->
	<link rel="stylesheet" href="assets/rage/assets/css/responsive.css" />

	<script src="assets/rage/assets/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
    
    
  </head>
  <body data-spy="scroll" data-target=".onpage-navigation" data-offset="60">

	<main>

      	<!-- 네브바 -->
      
		<nav class="navbar navbar-light navbar-expand-lg navbar-fixed white no-background bootsnav">
			<!-- Start Top Search -->
			<div class="top-search">
				<div class="container">
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-search"></i></span>
						<input type="text" class="form-control" placeholder="Search">
						<span class="input-group-addon close-search"><i class="fa fa-times"></i></span>
					</div>
				</div>
			</div>
			<!-- End Top Search -->

			<div class="container">
				<!-- Start Atribute Navigation -->
				<div class="attr-nav">
					<ul>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <i class="fa fa-shopping-bag"></i>
                                    <span class="badge">3</span>
                                </a>
							<ul class="dropdown-menu cart-list">
								<li>
									<a href="#" class="photo"><img src="assets/rage/assets/images/thumb01.jpg" class="cart-thumb" alt="" /></a>
									<h6><a href="#">Delica omtantur </a></h6>
									<p class="m-top-10">2x - <span class="price">$99.99</span></p>
								</li>
								<li>
									<a href="#" class="photo"><img src="assets/rage/assets/images/thumb01.jpg" class="cart-thumb" alt="" /></a>
									<h6><a href="#">Delica omtantur </a></h6>
									<p class="m-top-10">2x - <span class="price">$99.99</span></p>
								</li>
								<li>
									<a href="#" class="photo"><img src="assets/rage/assets/images/thumb01.jpg" class="cart-thumb" alt="" /></a>
									<h6><a href="#">Delica omtantur </a></h6>
									<p class="m-top-10">2x - <span class="price">$99.99</span></p>
								</li>
								<!---- More List ---->
								<li class="total">
									<span class="pull-right"><strong>Total</strong>: $0.00</span>
									<a href="#" class="btn btn-cart">Cart</a>
								</li>
							</ul>
						</li>
						<li class="search"><a href="#"><i class="fa fa-search"></i></a></li>
						<li class="side-menu"><a href="#"><i class="fa fa-bars"></i></a></li>
					</ul>
				</div>
				<!-- End Atribute Navigation -->

				<!-- Start Header Navigation -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbar-menu">
                            <span></span>
                            <span></span>
                            <span></span>
                        </button>

					<a class="navbar-brand" href="#brand">

                            <img src="assets/images/logo_transparent1.png" class="logo logo-display" alt="로고">
                            <img src="assets/images/logo_transparent1.png" class="logo logo-scrolled" alt="로고">

                        </a>
				</div>
				<!-- End Header Navigation -->

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse" id="navbar-menu">
					<ul class="nav navbar-nav navbar-right" data-in="fadeInDown" data-out="fadeOutUp">
						<li><a href="#hello">Hello</a></li>
						<li><a href="#about">About</a></li>
						<li><a href="#service">Services</a></li>
						<li><a href="#portfolio">Portfolio</a></li>
						<li><a href="#pricing">Pricing</a></li>
						<li><a href="#blog">Blog</a></li>
						<li><a href="#contact">Contact</a></li>
					</ul>
				</div>
				<!-- /.navbar-collapse -->
			</div>


			<!-- Start Side Menu -->
			<div class="side">
				<a href="#" class="close-side"><i class="fa fa-times"></i></a>
				<div class="widget">
					<h6 class="title">Custom Pages</h6>
					<ul class="link">
						<li><a href="#">About</a></li>
						<li><a href="#">Services</a></li>
						<li><a href="#">Blog</a></li>
						<li><a href="#">Portfolio</a></li>
						<li><a href="#">Contact</a></li>
					</ul>
				</div>
				<div class="widget">
					<h6 class="title">Additional Links</h6>
					<ul class="link">
						<li><a href="#">Retina Homepage</a></li>
						<li><a href="#">New Page Examples</a></li>
						<li><a href="#">Parallax Sections</a></li>
						<li><a href="#">Shortcode Central</a></li>
						<li><a href="#">Ultimate Font Collection</a></li>
					</ul>
				</div>
			</div>
			<!-- End Side Menu -->

		</nav>