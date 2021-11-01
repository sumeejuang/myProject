<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/headerAdmin.jsp"%>
	<main>
		<div class="container-fluid px-4">
			<h1 class="mt-4">상품페이지 관리 (정기구독, 침구샵)</h1>
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item"><a href="/admin" style="text-decoration:none">대시보드</a></li>
				<li class="breadcrumb-item active">상품관리</li>
			</ol>
			<div class="card mb-4">
				<div class="card-body">
					<b>Laundromat</b> 상품페이지 관리 - 게시글수 : 총 <Strong>${count }</Strong> 개
				</div>
			</div>
			<div class="card mb-4">
				<div class="card-header">
				<div class="row">
					<div class="col-sm-8 ">
					<i class="fas fa-table me-1"></i> 상품페이지 관리
					</div>
					<div class="col-sm-1">
					<input type="button"
						class="btn btn-d btn-round btn-sm" 
						onclick="location.href='/productlist'"
						value="리스트로"> 
					</div>
					<div class="col-sm-3 d-grid">
					<button type="button" 
					class="btn btn-danger btn-sm btn-block"
					onclick="location.href='../productinsert'">게시글 추가하기</button>
					</div>
				</div>
				</div>
				<div class="card-body">
					<table id="datatablesSimple">
						<thead>
							<tr>
								<th>카테고리</th>
								<th>상품번호</th>
								<th>이름</th>
								<th>회원아이디</th>
								<th>가격</th>
								<th>수량</th>
								<th>조회수</th>
								<th>댓글수</th>
								<th>수정</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${lists}" var="pboard"> 
							<tr>
								<th>${pboard.productCategory }</th>
								<th>${pboard.productCode }</th>
								<th>${pboard.productTitle }</th>
								<th>${pboard.productWriter }</th>
								<th>${pboard.productPrice }</th>
								<th>${pboard.productAmount }</th>
								<th>${pboard.productHitcount }</th>
								<th>${pboard.productReplycnt }</th>
								<th>
								<button type="button" 
								onclick="location.href='../productupdate/${pboard.productCode }'"
								class="btn btn-outline-warning btn-sm"
								>수정</button>
								</th>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</main>
	<%@ include file="include/footerAdmin.jsp"%>