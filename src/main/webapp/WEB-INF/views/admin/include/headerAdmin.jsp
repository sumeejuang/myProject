<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Laundromat Admin</title>
	
<script src="/js/style.js"></script>
<!-- jQuery-->
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	
	
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link href="/admin/css/styles.css" rel="stylesheet" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
</head>


<body class="sb-nav-fixed">
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<a class="navbar-brand ps-3" href="../admin" style="color:papayawhip">Laundromat Admin</a>
		<div class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
			<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0"
				id="sidebarToggle" href="../admin">
				<i class="fas fa-bars"></i>
			</button>
		</div>
		<ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
				role="button" data-bs-toggle="dropdown" aria-expanded="false"><i
					class="fas fa-user fa-fw"></i></a>
				<ul class="dropdown-menu dropdown-menu-end"
					aria-labelledby="navbarDropdown">
					<li><a class="dropdown-item" href="../loginForm">로그인</a></li>
					<li><a class="dropdown-item" href="../joinForm">회원가입</a></li>
				</ul></li>
		</ul>
	</nav>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-light"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<div class="sb-sidenav-menu-heading">관리자 메뉴</div>
						<a class="nav-link" href="../admin"> <span
							class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></span>
							AdminMain
						</a> 
						<a class="nav-link" href="../main"> <span
							class="sb-nav-link-icon"><i class="fa fa-bed" aria-hidden="true"></i></span>
							Laundromat
						</a>
						<a class="nav-link" href="../admin/user"> <span
							class="sb-nav-link-icon"><i class="fas fa-table"></i></span> 
							회원관리
						</a> 
						<a class="nav-link" href="../admin/product"> <span
							class="sb-nav-link-icon"><i class="fas fa-table"></i></span> 
							상품관리
						</a> 
						<a class="nav-link" href="../admin/notice"> 
						<span class="sb-nav-link-icon"><i class="fas fa-table"></i></span>
							공지사항관리
						</a> 
						<a class="nav-link" href="../admin/review"> <span
							class="sb-nav-link-icon"><i class="fas fa-table"></i></span>
							리뷰페이지관리
						</a> 
						<a class="nav-link" href="../admin/comment"> 
						<span class="sb-nav-link-icon"><i class="fas fa-table"></i></span>
							상품내리뷰관리
						</a> 
						<a class="nav-link" href="../admin/event"> 
						<span class="sb-nav-link-icon"><i class="fas fa-table"></i></span>
							이벤트관리
						</a>
						<a class="nav-link" href="../admin/blog"> 
						<span class="sb-nav-link-icon"><i class="fas fa-table"></i></span>
							블로그관리
						</a>
						<a class="nav-link" href="../admin/charts"> <span
							class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></span>
							사이트 통계
						</a> 
					</div>
				</div>
			</nav>
		</div>
		<div id="layoutSidenav_content">