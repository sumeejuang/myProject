<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/headerAdmin.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%><!-- 날짜포멧지정 -->

<main>
	<div class="container-fluid px-4">
		<h1 class="mt-4">공지사항페이지 관리</h1>
		<ol class="breadcrumb mb-4">
			<li class="breadcrumb-item"><a href="/admin"
				style="text-decoration: none">대시보드</a></li>
			<li class="breadcrumb-item active">공지사항</li>
		</ol>
		<div class="card mb-4">
			<div class="card-body">
				<b>Laundromat</b> 공지사항페이지 관리 - 게시글수 : 총 <Strong>${count }</Strong> 개
			</div>
		</div>
		<div class="card mb-4">
			<div class="card-header">
				<div class="row">
					<div class="col-sm-8 ">
						<i class="fas fa-table me-1"></i> 공지사항관리
					</div>
					<div class="col-sm-1">
						<input type="button" class="btn btn-d btn-round btn-sm"
							onclick="location.href='/noticelist'" value="리스트로">
					</div>
					<div class="col-sm-3 d-grid">
						<button type="button" class="btn btn-danger btn-sm btn-block"
							onclick="location.href='../noticeinsert'">게시글 추가하기</button>
					</div>
				</div>
			</div>
			<div class="card-body">
				<table id="datatablesSimple">
					<thead>
						<tr>
							<th>공지사항번호</th>
							<th>제목</th>
							<th>회원번호</th>
							<th>회원이메일</th>
							<th>내용</th>
							<th>작성날짜</th>
							<th>조회수</th>
							<th>댓글수</th>
							<th>수정</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${lists}" var="nboard">
							<tr>
								<th>${nboard.noticeCode }</th>
								<th>${nboard.noticeTitle }</th>
								<th>${nboard.user.usercode }</th>
								<th>${nboard.noticeWriter }</th>
								<th>${nboard.noticeContent }</th>
								<th><fmt:formatDate value="${nboard.noticeRegdate }"
										pattern="yyyy-MM-dd HH:mm" /></th>
								<th>${nboard.noticeHitcount }</th>
								<th>${nboard.noticeReplycnt }</th>
								<th>
									<button type="button"
										onclick="location.href='../noticeupdate/${nboard.noticeCode }'"
										class="btn btn-outline-warning btn-sm">수정</button>
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