<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/headerAdmin.jsp"%>
	<main>
		<div class="container-fluid px-4">
			<h1 class="mt-4">공지사항페이지 관리</h1>
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item"><a href="/admin" style="text-decoration:none">대시보드</a></li>
				<li class="breadcrumb-item active">공지사항</li>
			</ol>
			<div class="card mb-4">
				<div class="card-body">
					<b>Laundromat</b> 공지사항페이지 관리
				</div>
			</div>
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-table me-1"></i> 공지사항관리
				</div>
				<div class="card-body">
					<table id="datatablesSimple">
						<thead>
							<tr>
								<th>공지사항번호</th>
								<th>제목</th>
								<th>회원아이디</th>
								<th>내용</th>
								<th>이미지</th>
								<th>작성날짜</th>
								<th>조회수</th>
								<th>수정/삭제</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th>샤넬</th>
								<th>30</th>
								<th>4.5</th>
								<th>342</th>
								<th>2011.01.12</th>
							</tr>
							<tr>
								<th>샤넬</th>
								<th>30</th>
								<th>4.5</th>
								<th>342</th>
								<th>2011.01.12</th>
							</tr>
							<tr>
								<th>샤넬</th>
								<th>30</th>
								<th>4.5</th>
								<th>342</th>
								<th>2011.01.12</th>
							</tr>
							<tr>
								<th>샤넬</th>
								<th>30</th>
								<th>4.5</th>
								<th>342</th>
								<th>2011.01.12</th>
							</tr>
							<tr>
								<th>샤넬</th>
								<th>30</th>
								<th>4.5</th>
								<th>342</th>
								<th>2011.01.12</th>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</main>
<%@ include file="include/footerAdmin.jsp"%>