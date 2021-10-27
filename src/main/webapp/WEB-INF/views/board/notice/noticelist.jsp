<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp" %>
<section class="module-small bg-dark-1" data-background="assets/images/subs/head02.jpg">
</section>
<div class="main">
	 <section class="module home-full-weight bg-light">
	 <div class="container">
	 	<h3 class="font-alt">Notice</h3>
        <hr class="divider-w mb-10"><br/>
		  <table class="table table-hover">
		    <thead>
		      <tr>
		        <th>공지사항번호</th>
				<th>제목</th>
				<th>회원아이디</th>
				<th>내용</th>
				<th>이미지</th>
				<th>작성날짜</th>
				<th>조회수</th>
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
		      </tr>
		      <tr>
		        <th>002</th>
				<th>공지03</th>
				<th>admin01</th>
				<th>블라블라</th>
				<th>img02</th>
				<th>2021-10-25</th>
				<th>1</th>
		      </tr>
		      <tr>
		        <th>003</th>
				<th>공지03</th>
				<th>admin03</th>
				<th>블라블라</th>
				<th>img01</th>
				<th>2021-10-26</th>
				<th>1</th>
		      </tr>
		    </tbody>
		  </table>
		  	<br/>
				<ul class="pagination justify-content-center">
			    <li class="page-item"><a class="page-link" href="javascript:void(0);">Previous</a></li>
			    <li class="page-item"><a class="page-link" href="javascript:void(0);">1</a></li>
			    <li class="page-item"><a class="page-link" href="javascript:void(0);">2</a></li>
			    <li class="page-item"><a class="page-link" href="javascript:void(0);">Next</a></li>
			  </ul>
	</div>
	</section>
</div>

<%@ include file="../../layout/footer.jsp" %>