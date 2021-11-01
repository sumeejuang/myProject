<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp"%>
<section class="module-small bg-dark-1"
	data-background="assets/images/subs/head05.jpg"></section>
<div class="main">
	<section class="module home-full-weight bg-light">
		<div class="container">
			<h3 class="font-alt">Reviews </h3> <h5 class="font-alt">| 회원님들의 소중한 ${count }개의 리뷰후기</h5>
			<hr class="divider-w mb-10">
			<br />
			<sec:authorize access="isAuthenticated()">
				<button class="btn btn-round btn-primary btn-lg float-right"
					onclick="location.href='/reviewinsert'">Write</button>
				<br />
				<br />
				<br />
			</sec:authorize>
		</div>
		<div class="container">
			<c:forEach items="${lists.content}" var="rboard" varStatus="st">
				<div class="card">
					<div class="card-body">
						<h4 class="card-title">${rowNo-st.index }.
							${rboard.reviewTitle }</h4>
						<div class="row mb-20">
							<div class="col-sm-12">
							<c:if test="'${rboard.reviewStar==1}">
							<span><i class="fa fa-star star"></i></span>
							<span><i class="fa fa-star star-off"></i></span> 
							<span><i class="fa fa-star star-off"></i></span> 
							<span><i class="fa fa-star star-off"></i></span> 
							<span><i class="fa fa-star star-off"></i></span> 
							</c:if>
							<c:if test="${rboard.reviewStar==2}">
							<span><i class="fa fa-star star"></i></span>
							<span><i class="fa fa-star star"></i></span>
							<span><i class="fa fa-star star-off"></i></span>
							<span><i class="fa fa-star star-off"></i></span>
							<span><i class="fa fa-star star-off"></i></span>
							</c:if>
							<c:if test="${rboard.reviewStar==3}">
							<span><i class="fa fa-star star"></i></span>
							<span><i class="fa fa-star star"></i></span>
							<span><i class="fa fa-star star"></i></span>
							<span><i class="fa fa-star star-off"></i></span>
							<span><i class="fa fa-star star-off"></i></span>
							</c:if>
							<c:if test="${rboard.reviewStar==4}">
							<span><i class="fa fa-star star"></i></span>
							<span><i class="fa fa-star star"></i></span>
							<span><i class="fa fa-star star"></i></span>
							<span><i class="fa fa-star star"></i></span>
							<span><i class="fa fa-star star-off"></i></span>
							</c:if>
							<c:if test="${rboard.reviewStar==5}">
							<span><i class="fa fa-star star"></i></span>
							<span><i class="fa fa-star star"></i></span>
							<span><i class="fa fa-star star"></i></span>
							<span><i class="fa fa-star star"></i></span>
							<span><i class="fa fa-star star"></i></span>
							</c:if>
								
								<span> Rating ${rboard.reviewStar }, </span> 
								<span> By ${rboard.reviewWriter },</span> 
								<span> <i class="fa fa-clock-o" aria-hidden="true"></i> 
								${rboard.reviewRegdate }</span>
							</div>
						</div>
						<p class="card-text">${rboard.reviewContent }</p>
						<c:if test="${principal.user.username==rboard.reviewWriter }">
						<button class="btn btn-g btn-circle btn-xs float-right"
							onclick="location.href='../reviewupdate/${rboard.reviewCode}'"
							type="submit">Update / delete</button>
						</c:if>
						<br />
					</div>
				</div>
				<br />
				<br />
			</c:forEach>
			<!-- 페이징처리 -->
			<ul class="pagination font-alt">
				<c:if test="${lists.first==false}">
					<li class="page-item"><a class="page-link text-dark"
						href="?page=${lists.number-1 }"> 
						<i class="fa fa-angle-left"></i>&nbsp;Previous</a></li>
				</c:if>
				<c:if test="${lists.last==false}">
					<li class="page-item"><a class="page-link text-dark"
						href="?page=${lists.number+1 }"> Next <i class="fa fa-angle-right"></i></a></li>
				</c:if>
			</ul>
			<br />
		</div>
	</section>
</div>



<%@ include file="../../layout/footer.jsp"%>

