<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp"%>
<section class="module-small bg-dark"
	data-background="/assets/images/subs/head03.png"></section>
<div class="main">
	<section class="module home-full-weight bg-light">
		<div class="container">
			<h3 class="font-alt">Preview</h3>
			<c:if test="${principal.user.userrole =='ROLE_ADMIN' }">
				<div class="row">
					<div class="col-1"></div>
					<div class="col-11">
						<input type="button"
							class="btn btn-white btn-round float-right btn-xs"
							onclick="location.href='../productlist?productCategory=subs'"
							value="list"> <input type="button"
							class="btn btn-white btn-round float-right btn-xs"
							id="btnNDelete" value="관리자 Delete"> <input type="button"
							class="btn btn-white btn-round float-right btn-xs"
							onclick="location.href='../productupdate/${productCode}'"
							value="관리자 Update" id="btnNUpdate">
					</div>
				</div>
			</c:if>
			<c:set var="content" value="${pboard.productContent }" />
			<!--전체콘텐츠-->
			<c:set var="imgfront" value="${fn:substringBefore(content,'<img') }" />
			<!--앞부분-->
			<c:set var="imgback" value="${fn:substringAfter(content,'></p>') }" />
			<!--뒷부분-->
			<c:set var="imgfront1" value="${fn:indexOf(content,'<img') }" />
			<!--앞부분시작수-->
			<c:set var="imgback2" value="${fn:indexOf(content,'></p>')+1}" />
			<!--뒷부분시작수+1-->
			<c:set var="realimage"
				value="${fn:substring(content,imgfront1,imgback2) }" />
			<!-- 이미지만추출-->
			<div class="container mt-30">
				<div class="row">
					<div class="col-sm-6 mb-sm-40">
						<a class="gallery"> ${realimage}</a>
					</div>
					<div class="col-sm-6">
						<div class="row">
							<div class="col-sm-12">
								<h1 class="product-title font-alt">${pboard.productTitle }</h1>
							</div>
							<input class="form-control" id="productCode" type="hidden"
								name="productCode" value="${pboard.productCode }" />
						</div>
						<div class="row mb-20">
							<div class="col-sm-12">
								<div class="price font-alt">
									<span class="amount">${pboard.productPrice } 원</span>
								</div>
							</div>
						</div>
						<div class="row mb-20">
							<div class="col-sm-12">
								<div class="description">
									<p>${pboard.productDesc }</p>
								</div>
							</div>
						</div>
						<div class="row mb-20">
							<div class="col-sm-4 mb-sm-20">
								<input class="form-control input-lg" type="number" name=""
									value="1" max="40" min="1" required="required">
							</div>
							<div class="col-sm-8">
								<a class="btn btn-lg btn-block btn-round btn-b" href="#">Add
									To Cart</a>
							</div>
						</div>
						<div class="row mb-20">
							<div class="col-sm-12"></div>
						</div>
					</div>
				</div>
				<div class="row mt-70">
					<div class="col-sm-12">
						<ul class="nav nav-tabs font-alt " role="tablist">
							<li class="active"><a href="#description" data-toggle="tab"
								aria-expanded="true" class="text-dark"> <span
									class="icon-tools-2"></span><Strong>Description</Strong>
							</a></li>
							<li class=""><a href="#reviews" data-toggle="tab"
								aria-expanded="false" class="text-dark"> <span
									class="icon-tools-2"></span><Strong>Reviews</Strong> 댓글수 <i
									class='fa fa-commenting-o' aria-hidden='true'></i>
									${pboard.productReplycnt }
							</a></li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane active" id="description">
								<p>${pboard.productContent }</p>
							</div>
							<div class="tab-pane  bg-white" id="reviews">
								<div class="comments reviews" id="comments"></div>
							</div>
						</div>
						<div class="comment-form mt-30  bg-light">
							<br /> <br />
							<h4 class="comment-form-title font-alt">Add review</h4>
							<form method="post">
								<div class="row ">
									<div class="col-sm-8">
										<div class="form-group">
											<input class="form-control" id="pCnum" type="hidden"
												name="pCnum" value="${ncboard.pCnum }" />
											<sec:authorize access="isAnonymous()">
												<label class="sr-only" for="pcWriter">Name</label>
												<input class="form-control" id="pcWriter" type="text"
													name="pcWriter" placeholder="로그인후 작성 가능합니다"
													readonly="readonly">
											</sec:authorize>
											<sec:authorize access="isAuthenticated()">
												<label class="sr-only" for="pcWriter">Name</label>
												<input class="form-control" id="pcWriter" type="text"
													name="pcWriter" value="${principal.user.username }"
													readonly="readonly">
											</sec:authorize>
										</div>
									</div>
									<div class="col-sm-12">
										<div class="form-group">
											<textarea class="form-control" id="pcContent"
												name="pcContent" rows="4" placeholder="Review"></textarea>
										</div>
									</div>
									<div class="col-sm-12">
										<button class="btn btn-round btn-d" id="commentBtn"
											type="button">Submit Review</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</div>


<script>
//댓글출력
var init = function(){
	$.ajax({
		type:"get",
		url:"../pclist/"+$("#productCode").val()
		//dataType: "html",
		//contentType: 'application/json; charset=utf-8'
	
	})	
/* 	.done(function(resp){  
			//alert(resp.length);
			var str="<h4 class='comment-title font-alt'> 총 ${pboard.productReplycnt } 개의 댓글이 있습니다.</h4>"
				
			$.each(resp,function(key,val){
				str +="<div class='comment-content clearfix' style=' pull-left; margin-left:30px'>"
				str +="<i class='fa fa-commenting-o' aria-hidden='true'></i>"
				str +=" <div class='title'><Strong>"+val.pcWriter+"</Strong></div>"
				str +=" <div class='title'><Strong> 씨넘: "+val.pCnum+"</Strong></div>"
				str += "<div class='comment-body'> <p>"+val.pcContent +"</p> </div>" 
				str += "<div class='comment-meta'>"+ val.pRegdate 
			if("${principal.user.username}"==val.pcWriter){
				str += "- <a class='text-dark' href='javascript:fdel("
						+ val.pCnum+")'> Delete </a> "
					}
				str +=" </div></div>"
			})
			$("#comments").html(str); */
 	.done(function(resp){  
		//alert(resp.length);
		var str=" <div class='comment clearfix'>" 
			str +="<h4 class='comment-title font-alt'>  &nbsp; &nbsp; 총 <Strong>${pboard.productReplycnt }</Strong> 개의 댓글이 있습니다.</h4>"
					
		$.each(resp,function(key,val){
			str +="<div class='comment-author'>"
			str +=" &nbsp; &nbsp;<i class='fa fa-commenting-o' aria-hidden='true'></i><br/>"
			str +="<a class='text-dark'> &nbsp; &nbsp;<Strong>"+val.pcWriter+"</Strong></a></div>"
			str +="<div class='comment-body'> &nbsp; &nbsp;"+val.pcContent+"<p></p></div>"
			str +="<div class='comment-meta font-alt'> &nbsp; &nbsp;"+val.pRegdate
			if("${principal.user.username}"==val.pcWriter){
				str += "- <a class='text-dark' href='javascript:fdel("
						+ val.pCnum+")'> Delete </a> "
					}
				str +=" </div></div><br/>"
			})
			$("#comments").html(str); 
	})
	.fail(function(request, status, error){
		alert("출력error:- code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error );
	})
}

//댓글 삭제
function fdel(pCnum){
	$.ajax({
		type:"delete",
		url:"/pcdelete/"+pCnum
	})
	.done(function(resp){
		alert(resp+"번 댓글 삭제완료");
		init();
	})
	.fail(function(request, status, error){
		alert("출력error:- code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error );

		//alert("댓글 삭제실패")
	})
}


//댓글추가
$("#commentBtn").click(function(){
	if(${empty principal.user}){  
		alert("로그인하세요");
		location.href="../loginForm";
				return;
	}
	if($("#msg").val()==""){
		alert("댓글을 입력하세요")
		return;
	}
	data = {
			"pcWriter": $('#pcWriter').val(),
			"pcContent":$("#pcContent").val(),
			"pBnum":$("#pBnum").val()
			}
	$.ajax({
		type:"post", 
		url: "/pcinsert/"+$("#productCode").val(), 
		contentType:"application/json;charset=utf-8",
		data: JSON.stringify(data)
	})
	.done(function(resp){
		if(resp=="success"){
		alert("댓글추가 성공");
		init();
		$("#nContent").val("");  //성공후 댓글란 공백처리
		}
	})
	.fail(function(request, status, error){
		alert("댓글추가 실패- code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error)
	})
})



//삭제버튼
	$("#btnNDelete").click(
			function() {
				if (!confirm('정말 삭제할까요?'))
					return false;
				$.ajax({
					type : "DELETE",
					url : "../productdelete/${productCode}",
					success : function(resp) {
						if (resp == "success") {
							alert("삭제되었습니다");
							location.href = "../productlist?productCategory=subs"
						}
					},
					error : function(request, status, error) {
						alert("삭제실패 - code:" + request.status + "\n"
								+ "message:" + request.responseText + "\n"
								+ "error:" + error);
					}
				})
			})		
			
	init();	
</script>
<%@ include file="../../layout/footer.jsp"%>
