<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en-US" dir="ltr">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Laundromat</title>
<!--페브콘-->
<link rel="icon" type="image/png"
	href="/assets/images/subs/favicon11.png">
<!-- 주소찾기 api-->
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- jQuery-->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- 썸머노트 include summernote css/js -->
<script src="/summernote/summernote-lite.min.js"></script>
<script src="/summernote/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="/summernote/summernote-lite.min.css">
<!--Google Font link-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Raleway:400,600,700"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700"
	rel="stylesheet">
<!-- Titan 스타일적용-->
<!-- Default stylesheets-->
<link href="/assets/lib/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Template specific stylesheets-->
<link href="/assets/lib/animate.css/animate.css" rel="stylesheet">
<link
	href="/assets/lib/components-font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<link href="/assets/lib/et-line-font/et-line-font.css" rel="stylesheet">
<link href="/assets/lib/flexslider/flexslider.css" rel="stylesheet">
<link href="/assets/lib/owl.carousel/dist/assets/owl.carousel.min.css"
	rel="stylesheet">
<link
	href="/assets/lib/owl.carousel/dist/assets/owl.theme.default.min.css"
	rel="stylesheet">
<link href="/assets/lib/magnific-popup/dist/magnific-popup.css"
	rel="stylesheet">
<link href="/assets/lib/simple-text-rotator/simpletextrotator.css"
	rel="stylesheet">
<!-- Main stylesheet and color file-->
<link href="/assets/css/style.css" rel="stylesheet">
<!--JavaScripts -->
<script src="/assets/lib/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="/assets/lib/wow/dist/wow.js"></script>
<script src="/assets/lib/isotope/dist/isotope.pkgd.js"></script>
<script src="/assets/lib/imagesloaded/imagesloaded.pkgd.js"></script>
<script src="/assets/lib/flexslider/jquery.flexslider.js"></script>
<script src="/assets/lib/owl.carousel/dist/owl.carousel.min.js"></script>
<script src="/assets/lib/magnific-popup/dist/jquery.magnific-popup.js"></script>
<script
	src="/assets/lib/simple-text-rotator/jquery.simple-text-rotator.min.js"></script>
<script src="/assets/js/plugins.js"></script>
<script src="/assets/js/main.js"></script>


<!--Range 스타일적용-->
<link
	href="https://fonts.googleapis.com/css?family=Roboto+Condensed:400,700"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Volkhov:400i"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800"
	rel="stylesheet">
<!-- JS includes :rage-->
<script src="/assets/rage/assets/js/bootsnav.js"></script>
<!-- css :rage -->
<link rel="stylesheet" href="/assets/rage/assets/css/bootstrap.css">
<link rel="stylesheet" href="/assets/rage/assets/css/bootsnav.css">
<!--Theme custom css -->
<link rel="stylesheet" href="/assets/rage/assets/css/style.css">


</head>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal" />
	<!-- 기본값principal var로 변수에 담아줌 /닫는기호중요 -->
</sec:authorize>
<body data-spy="scroll" data-target=".onpage-navigation"
	data-offset="60">
	<main>
		<!-- 네브바 -->
		<nav
			class="navbar navbar-light navbar-expand-lg navbar-fixed white no-background bootsnav">
			<!-- Start Top Search -->
			<div class="top-search">
				<div class="container">
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-search"></i></span>
						<input type="text" class="form-control" placeholder="Search">
						<span class="input-group-addon close-search"><i
							class="fa fa-times"></i></span>
					</div>
				</div>
			</div>
			<!-- End Top Search -->
			<div class="container">
				<!-- Start Atribute Navigation -->
				<div class="attr-nav mt-1">
					<ul>
						<sec:authorize access="isAnonymous()">
							<li class="button"><a href="../loginForm"><i
									class="fa fa-user-circle-o" aria-hidden="true"></i></a></li>
						</sec:authorize>
						<sec:authorize access="isAuthenticated()">
							<li class="button"><a
								href="../mypage/${principal.user.usercode }"><i
									class="fa fa-user-circle"></i></a></li>
						</sec:authorize>
						<li class="button"><a href="../cart"> <i
								class="fa fa-shopping-bag"></i> <span class="badge bg-primary">3</span>
						</a></li>
						<li class="search"><a href="#"><i class="fa fa-search"></i></a></li>
						<li class="side-menu"><a href="#"><i class="fa fa-bars"></i></a></li>
					</ul>
				</div>
				<!-- End Atribute Navigation -->
				<!-- Start Header Navigation -->
				<div class="navbar-header">
					<a class="navbar-brand" href="../main"> <img
						src="/assets/images/logo_transparent123.png"
						class="logo logo-display" alt="로고"> <img
						src="/assets/images/logo_transparent123.png"
						class="logo logo-scrolled " alt="로고">
					</a>
				</div>
				<!-- End Header Navigation -->
				<!-- 윗네브 -->
				<div class="collapse navbar-collapse" id="navbar-menu">
					<ul class="nav navbar-nav navbar-right" data-in="fadeInDown"
						data-out="fadeOutUp">
						<li class="nav-item dropdown"><a class="nav-link"
							id="navbarDropdown" href="#" role="button"
							data-bs-toggle="dropdown" aria-expanded="false"> Shop</a>
							<ul class="dropdown-menu dropdown-menu-end"
								aria-labelledby="navbarDropdown">
								<li><a class="dropdown-item"
									href="../productlist?productCategory=subs">Subscription</a></li>
								<li><a class="dropdown-item"
									href="../productlist?productCategory=bedding">Bedding Shop</a></li>
								<li><a class="dropdown-item" href="../eventlist">Event</a></li>
							</ul></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">
								About</a>
							<ul class="dropdown-menu dropdown-menu-start"
								aria-labelledby="navbarDropdown">
								<li><a class="dropdown-item" href="../brandstory">Brand
										Story</a></li>
								<!-- <li><a class="dropdown-item" href="../bloglist">Blog</a></li> -->
								<li><a class="dropdown-item" href="../reviewlist">Review</a></li>
								<li><a class="dropdown-item" href="../qna">Q&A</a></li>
								<li><a class="dropdown-item" href="../noticelist">Notice</a></li>
							</ul></li>
					</ul>
				</div>
				<!-- /.navbar-collapse -->
			</div>
			<!-- Start Side Menu -->
			<div class="side">
				<a href="#" class="close-side"><i class="fa fa-times"></i></a>
				<div class="widget">
					<h6 class="title">
						<Strong>Shop</Strong>
					</h6>
					<ul class="link">
						<li><a href="../productlist?productCategory=subs">Subscription
								정기구독</a></li>
						<li><a href="../productlist?productCategory=bedding">Bedding
								Shop 침구샵</a></li>
						<li><a href="../eventlist">Event 이벤트</a></li>
					</ul>
				</div>
				<div class="widget">
					<h6 class="title">
						<Strong>About</Strong>
					</h6>
					<ul class="link">
						<li><a href="../brandstory">Brand Story 런드로맷</a></li>
						<!-- <li><a href="../bloglist">Blog 침구의재발견</a></li> -->
						<li><a href="../reviewlist">Review 후기</a></li>
						<li><a href="../qna">Q&A 문의사항</a></li>
						<li><a href="../noticelist">Notice 공지</a></li>
					</ul>
				</div>
				<div class="widget">
					<h6 class="title"></h6>
					<ul class="link">
						<sec:authorize access="isAnonymous()">
							<!-- 누구나-->
							<li><a href="../loginForm"><i class="fa fa-unlock-alt"
									aria-hidden="true"></i></i> 로그인</a> &nbsp;&nbsp; | &nbsp;&nbsp; <a
								href="../joinForm"> <i class="fa fa-user" aria-hidden="true"></i>
									회원가입
							</a></li>
						</sec:authorize>
						<sec:authorize access="isAuthenticated()">
							<!-- 권한0 -->
							<c:if test="${principal.user.userrole == 'ROLE_USER' }">
								<li><a href="../updateForm/${principal.user.usercode }"><i
										class="fa fa-address-card-o" aria-hidden="true"></i> 회원정보수정</a>
									&nbsp;&nbsp; &nbsp;&nbsp;
								<li><a href="../logout"><i class="fa fa-sign-out"
										aria-hidden="true"></i> 로그아웃</a><br /> | &nbsp;&nbsp; <Strong>
										${principal.user.name }</Strong> 님 환영합니다.</a></li>
							</c:if>
							<c:if test="${principal.user.userrole =='ROLE_ADMIN' }">
								<li><a href="../admin"><i class="fa fa-commenting-o"
										aria-hidden="true"></i> 관리자페이지</a> &nbsp;&nbsp; &nbsp;&nbsp;
								<li><a href="../logout"><i class="fa fa-sign-out"
										aria-hidden="true"></i> 로그아웃</a><br /> | &nbsp;&nbsp; <Strong>
										${principal.user.name }</Strong> 님 환영합니다.</a></li>
							</c:if>
						</sec:authorize>
					</ul>
				</div>
			</div>
			<!-- End Side Menu -->
		</nav>