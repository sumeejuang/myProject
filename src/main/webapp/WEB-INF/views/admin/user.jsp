<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/headerAdmin.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%><!-- 날짜포멧지정 -->
<main>
	<div class="container-fluid px-4">
		<h1 class="mt-4">회원관리</h1>
		<ol class="breadcrumb mb-4">
			<li class="breadcrumb-item"><a href="/admin"
				style="text-decoration: none">대시보드</a></li>
			<li class="breadcrumb-item active">회원관리</li>
		</ol>
		<div class="card mb-4">
			<div class="card-body">
				<b>Laundromat</b> 회원관리 - 회원수 : 총 <Strong>${count }</Strong> 명
			</div>
		</div>
		<div class="card mb-4">
			<div class="card-header">
				<i class="fas fa-table me-1"></i> 회원관리
			</div>
			<div class="card-body">
				<table id="datatablesSimple">
					<thead>
						<tr>
							<th>회원번호</th>
							<th>회원이메일</th>
							<th>이름</th>
							<th>전화번호</th>
							<th>우편번호</th>
							<th>주소</th>
							<th>상세주소</th>
							<th>참고항목</th>
							<th>가입일</th>
							<th>계정권한</th>
							<th>수정</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach items="${list}" var="list">
							<tr>
								<th>${list.usercode}</th>
								<th>${list.username}</th>
								<th>${list.name}</th>
								<th>${list.userphone}</th>
								<th>${list.postcode}</th>
								<th>${list.address}</th>
								<th>${list.detailaddress}</th>
								<th>${list.extraaddress}</th>
								<th><fmt:formatDate value="${list.userregdate}"
										pattern="yyyy-MM-dd" /></th>
								<th>${list.userrole}</th>
								<th>
									<button type="button"
										onclick="location.href='../updateForm/${list.usercode}'"
										class="btn btn-outline-warning btn-sm">수정</button>
									<br />
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