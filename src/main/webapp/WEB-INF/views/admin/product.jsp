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
					<b>Laundromat</b> 상품페이지 관리 (정기구독, 침구샵)
				</div>
			</div>
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-table me-1"></i> 상품페이지 관리
				</div>
				<div class="card-body">
					<table id="datatablesSimple">
						<thead>
							<tr>
								<th>카테고리</th>
								<th>상품번호</th>
								<th>가격</th>
								<th>재고수량</th>
								<th>설명</th>
								<th>등록일자</th>
								<th>상품이미지</th>
								<th>상품썸네일</th>
								<th>수정/삭제</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th>정기구독</th>
								<th>001</th>
								<th>10000</th>
								<th>100</th>
								<th>이불이불이불</th>
								<th>2021-10-25</th>
								<th>http://---</th>
								<th>http://---</th>
								<th>
								<button type="button" class="btn btn-outline-warning btn-sm">수정</button><br/>
								<button type="button" class="btn btn-outline-danger btn-sm">삭제</button>
								</th>
							</tr>
							<tr>
								<th>침구샵</th>
								<th>002</th>
								<th>23000</th>
								<th>90</th>
								<th>123이불</th>
								<th>2021-10-25</th>
								<th>100</th>
								<th>http://---</th>
								<th>http://---</th>
								<th>
								<button type="button" class="btn btn-outline-warning btn-sm">수정</button><br/>
								<button type="button" class="btn btn-outline-danger btn-sm">삭제</button>
								</th>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</main>
	<%@ include file="include/footerAdmin.jsp"%>