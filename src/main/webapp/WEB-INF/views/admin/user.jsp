<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/headerAdmin.jsp"%>
	<main>
		<div class="container-fluid px-4">
			<h1 class="mt-4">회원관리</h1>
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item"><a href="/admin" style="text-decoration:none">대시보드</a></li>
				<li class="breadcrumb-item active">회원관리</li>
			</ol>
			<div class="card mb-4">
				<div class="card-body">
					<b>Laundromat</b> 회원관리
				</div>
			</div>
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-table me-1"></i> 회원관리
				</div>
				<div class="card-body">
					<table id="datatablesSimple" >
						<thead>
							<tr>
								<th>회원번호</th>
								<th>회원이메일</th>
								<th>이름</th>
								<th>비밀번호</th>
								<th>전화번호</th>
								<th>우편번호</th>
								<th>주소</th>
								<th>상세주소</th>
								<th>참고항목</th>
								<th>가입일</th>
								<th>계정권한</th>
								<th>수정/삭제</th>
							</tr>
						</thead>
	
						<tbody>
							<tr>
							    <th>001</th>
								<th>sh@naver.com</th>
								<th>김철수</th>
								<th>1234</th>
								<th>0100000000</th>
								<th>12345</th>
								<th>서울시분당구</th>
								<th>현대아파트 110-203</th>
								<th>(아현동)</th>
								<th>2021-10-25</th>
								<th>user</th>
								<th>
								<button type="button" class="btn btn-outline-warning btn-sm">수정</button><br/>
								<button type="button" class="btn btn-outline-danger btn-sm">삭제</button>
								</th>
							</tr>
							<tr>
								<th>002</th>
								<th>fdf@naver.com</th>
								<th>김영희</th>
								<th>1234</th>
								<th>0100000000</th>
								<th>12345</th>
								<th>서울시강남구</th>
								<th>백산아파트 110-203</th>
								<th>(강남동)</th>
								<th>2021-10-25</th>
								<th>Admin</th>
							</tr>
							<tr>
								<th>003</th>
								<th>sh@naver.com</th>
								<th>김철수</th>
								<th>1234</th>
								<th>0100000000</th>
								<th>12345</th>
								<th>서울시분당구</th>
								<th>현대아파트 110-203</th>
								<th>(아현동)</th>
								<th>2021-10-25</th>
								<th>user</th>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</main>
<%@ include file="include/footerAdmin.jsp" %>