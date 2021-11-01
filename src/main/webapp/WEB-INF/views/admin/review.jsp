<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/headerAdmin.jsp"%>
	<main>
		<div class="container-fluid px-4">
			<h1 class="mt-4">리뷰게시판 관리</h1>
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item"><a href="/admin" style="text-decoration:none">대시보드</a></li>
				<li class="breadcrumb-item active">리뷰게시판</li>
			</ol>
			<div class="card mb-4">
				<div class="card-body">
					<b>Laundromat</b> 리뷰게시판 관리 - 게시글수 : 총 <Strong>${count }</Strong> 개
				</div>
			</div>
			<div class="card mb-4">
				<div class="card-header">
					<div class="row">
					<div class="col-sm-10 ">
					<i class="fas fa-table me-1"></i> 리뷰게시판 관리
					</div>
					<div class="col-sm-1">
					<input type="button"
						class="btn btn-d btn-round btn-sm" 
						onclick="location.href='/reviewlist'"
						value="리스트로"> 
					</div>
				</div>
				</div>
				<div class="card-body">
					<table id="datatablesSimple">
						<thead>
							<tr>
								<th>후기번호</th>
								<th>제목</th>
								<th>회원이메일</th>
								<th>내용</th>
								<th>별점</th>
								<th>작성날짜</th>
								<th>수정</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${lists}" var="rboard"> 
							<tr>
								<th>${rboard.reviewCode }</th>
								<th>${rboard.reviewTitle }</th>
								<th>${rboard.reviewWriter }</th>
								<th>${rboard.reviewContent }</th>
								<th>${rboard.reviewStar }</th>
								<th>${rboard.reviewRegdate }</th>
								<th>
								<button type="button" 
								onclick="location.href='../reviewupdate/${rboard.reviewCode }'"
								class="btn btn-outline-warning btn-sm"
								>수정</button></th>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</main>
<%@ include file="include/footerAdmin.jsp" %>