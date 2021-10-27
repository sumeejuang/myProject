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
								<th>001</th>
								<th>공지01</th>
								<th>admin01</th>
								<th>블라블라</th>
								<th>img01</th>
								<th>2021-10-25</th>
								<th>1</th>
								<th>
								<button type="button" class="btn btn-outline-warning btn-sm">수정</button><br/>
								<button type="button" class="btn btn-outline-danger btn-sm">삭제</button>
								</th>
							</tr>
							<tr>
								<th>002</th>
								<th>공지02</th>
								<th>admin02</th>
								<th>블라블라</th>
								<th>img02</th>
								<th>2021-10-25</th>
								<th>1</th>
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