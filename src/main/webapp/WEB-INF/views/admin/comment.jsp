<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/headerAdmin.jsp"%>
	<main>
		<div class="container-fluid px-4">
			<h1 class="mt-4">상품내리뷰관리</h1>
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item"><a href="/admin" style="text-decoration:none">대시보드</a></li>
				<li class="breadcrumb-item active">상품내리뷰</li>
			</ol>
			<div class="card mb-4">
				<div class="card-body">
					<b>Laundromat</b> 상품내리뷰관리
				</div>
			</div>
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-table me-1"></i> 상품내리뷰관리
				</div>
				<div class="card-body">
					<table id="datatablesSimple">
						<thead>
							<tr>
								<th>댓글번호</th>
								<th>회원아이디</th>
								<th>회원이메일</th>
								<th>별점</th>
								<th>내용</th>
								<th>작성날짜</th>
								<th>수정/삭제</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th>샤넬미스트</th>
								<th>샤넬</th>
								<th>★★★</th>
								<th>456</th>
								<th>2021/10/01</th>
							</tr>
							<tr>
								<th>샤넬미스트</th>
								<th>샤넬</th>
								<th>★★★</th>
								<th>456</th>
								<th>2021/10/01</th>
							</tr>
							<tr>
								<th>샤넬미스트</th>
								<th>샤넬</th>
								<th>★★★</th>
								<th>456</th>
								<th>2021/10/01</th>
							</tr>
							<tr>
								<th>샤넬미스트</th>
								<th>샤넬</th>
								<th>★★★</th>
								<th>456</th>
								<th>2021/10/01</th>
							</tr>
							<tr>
								<th>샤넬미스트</th>
								<th>샤넬</th>
								<th>★★★</th>
								<th>456</th>
								<th>2021/10/01</th>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</main>
<%@ include file="include/footerAdmin.jsp"%>