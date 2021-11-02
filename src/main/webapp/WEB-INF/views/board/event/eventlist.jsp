<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%><!-- 날짜포멧지정 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<section class="module-small bg-dark-1"
	data-background="/assets/images/subs/head05.jpg"></section>
<div class="main">
	<section class="module home-full-weight">
		<div class="container">
			<h3 class="font-alt">Event | 이벤트</h3>
			<c:if test="${principal.user.userrole =='ROLE_ADMIN' }">
				<div class="row">
					<div class="col-1"></div>
					<div class="col-11">
						<input type="button"
							class="btn btn-white btn-round float-right btn-xs"
							onclick="location.href='/eventinsert'" value="관리자모드 글작성">
					</div>
				</div>
			</c:if>
			<hr class="divider-w mb-10">
			<br />
			<div class="row multi-columns-row post-columns bg-white">
				<c:forEach items="${lists.content}" var="eboard">
					<div class="col-sm-6 col-md-4 col-lg-4">
						<div class="post">
							<div>
								<c:set var="content" value="${eboard.eventContent }" />
								<!--전체콘텐츠-->
								<c:set var="imgfront"
									value="${fn:substringBefore(content,'<img') }" />
								<!--앞부분-->
								<c:set var="imgback"
									value="${fn:substringAfter(content,'></p>') }" />
								<!--뒷부분-->
								<c:set var="imgfront1" value="${fn:indexOf(content,'<img') }" />
								<!--앞부분시작수-->
								<c:set var="imgback2" value="${fn:indexOf(content,'></p>')+1}" />
								<!--뒷부분시작수+1-->
								<c:set var="realimage"
									value="${fn:substring(content,imgfront1,imgback2) }" />
								<!-- 이미지만추출-->
								${realimage}
							</div>
							<div class="post-header font-alt">
								<h2 class="post-title">
									<a class="text-dark" href="/eventview/${eboard.eventCode}">
										${eboard.eventTitle }</a>
								</h2>
								<div class="post-meta">
									By&nbsp; ${eboard.eventWriter } &nbsp;|
									<fmt:formatDate value="${eboard.eventRegdate }"
										pattern="yyyy-MM-dd" />
									| <i class="fa fa-eye" aria-hidden="true"></i>
									${eboard.eventHitcount }
								</div>
							</div>
							<div class="post-more">
								<a class="more-link text-dark" style="text-align: right"
									href="/eventview/${eboard.eventCode}"> <I>Read more</I></a>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<br />
			<!-- 페이징처리 -->
			<ul class="pagination font-alt float-right">
				<!-- 페이징처리 -->
				<c:if test="${lists.first==false}">
					<li class="page-item"><a class="page-link text-dark"
						href="?page=${lists.number-1 }"> <i class="fa fa-angle-left"></i>&nbsp;
							Previous
					</a></li>
				</c:if>
				<c:if test="${lists.last==false}">
					<li class="page-item"><a class="page-link text-dark"
						href="?page=${lists.number+1 }"> Next <i
							class="fa fa-angle-right"></i></a></li>
				</c:if>
			</ul>
			<!--             <div class="pagination font-alt"><a class="text-dark" href="#"><i class="fa fa-angle-left"></i></a><a class="text-dark" class="active" href="#">1</a><a class="text-dark" href="#">2</a><a class="text-dark" href="#">3</a><a class="text-dark" href="#">4</a><a class="text-dark" href="#"><i class="fa fa-angle-right"></i></a></div>
 -->
		</div>

	</section>
</div>

<%@ include file="../../layout/footer.jsp"%>