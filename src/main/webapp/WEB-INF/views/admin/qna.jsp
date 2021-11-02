<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/headerAdmin.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%><!-- 날짜포멧지정 -->
<main>
	<div class="container-fluid px-4">
		<h1 class="mt-4">Qna확인</h1>
		<ol class="breadcrumb mb-4">
			<li class="breadcrumb-item"><a href="/admin"
				style="text-decoration: none">대시보드</a></li>
			<li class="breadcrumb-item active">Qna확인</li>
		</ol>
		<div class="card mb-4">
			<div class="card-body">
				<b>Laundromat</b> Qna확인 - 문의수 : 총 <Strong>${count }</Strong> 개
			</div>
		</div>
		<div class="card mb-4">
			<div class="card-header">
				<i class="fas fa-table me-1"></i> Qna
			</div>
			<div class="card-body">
				<table id="datatablesSimple">
					<thead>
						<tr>
							<th>문의번호</th>
							<th>문의제목</th>
							<th>문의이메일</th>
							<th>문의내용</th>
							<th>문의날짜</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach items="${lists}" var="list">
							<tr>
								<th>${list.qnaCode}</th>
								<th>${list.qnaTitle}</th>
								<th>${list.qnaEmail}</th>
								<th>${list.qnaMsg}</th>
								<th><fmt:formatDate value="${list.qnaRegdate}"
										pattern="yyyy-MM-dd" /></th>
							</tr>
						</c:forEach>
					</tbody>
				</table>

			</div>
		</div>
	</div>
</main>


<%@ include file="include/footerAdmin.jsp"%>