<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%><!-- 날짜포멧지정 -->

<section class="module-small bg-dark-1" data-background="assets/images/subs/head02.jpg">
</section>
<div class="main">
	 <section class="module home-full-weight bg-light">
	 <div class="container">
	 	<h3 class="font-alt">Notice</h3>
	 	  <c:if test="${principal.user.userrole =='ROLE_ADMIN' }">
			<div class="row">
			<div class ="col-1"></div>
		  <div class="col-11">
		  <input type="button"
			class="btn btn-white btn-round float-right btn-xs" 
			onclick="location.href='/noticeinsert'"
			value="관리자모드 글작성"> 
			</div>
			
			</div>
			
		  </c:if>
        <hr class="divider-w mb-10"><br/>
		  <table class="table table-hover ">
		    <thead>
		      <tr>
		      	<th>순번</th>				
				<th>제목</th>
				
				<th>작성날짜</th>
				<th>조회수</th>
		      </tr>
		    </thead>
		    <tbody>
		      <tr>
	        <c:forEach items="${lists.content}" var="nboard" varStatus="st">  
			<tr>
				<th>${rowNo-st.index }</th>
				<th><a class="text-dark" href="/noticeview/${nboard.noticeCode}"> 
				${nboard.noticeTitle }
				&nbsp;&nbsp;&nbsp;&nbsp;</a> 
				<i class="fa fa-commenting-o" aria-hidden="true"></i>
				${nboard.noticeReplycnt } </th>
				
				<th><fmt:formatDate value="${nboard.noticeRegdate }"
						pattern="yyyy-MM-dd" /></th>
				<th>${nboard.noticeHitcount }</th>
		      </tr>
	        </c:forEach>     
		    </tbody>
		  </table>
		  
		  

	<!-- 페이징처리 -->
	  <ul class="pagination font-alt float-right"><!-- 페이징처리 -->
	 	<c:if test = "${lists.first==false}">
	 		<li class="page-item">
	 		<a class="page-link text-dark" 
	 		href="?page=${lists.number-1 }">
	 		<i class="fa fa-angle-left"></i>&nbsp; Previous</a></li>
	 	</c:if>
	 	<c:if test = "${lists.last==false}">
	 		<li class="page-item">
	 		<a class="page-link text-dark" 
	 		href="?page=${lists.number+1 }">
	 		Next <i class="fa fa-angle-right"></i></a></li>
	 	</c:if>
	  </ul><br/>
	  </div>
	</section>
</div>

<%@ include file="../../layout/footer.jsp" %>