<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp"%>
<section class="module-small bg-dark-1"
	data-background="/assets/images/subs/head02.jpg"></section>
<section class="module home-full-weight bg-light">
	<div class="container">
		<div class="row">
			<div class="col-10" style="float: none; margin: 0 auto;">
				<h2 class="font-alt">Notice</h2>
				<br /> <br /> <br />
				<div class="post ">
					<div class="post-header">
						<blockquote>
							<h1 class="post-title">${nboard.noticeTitle }</h1>
						</blockquote>
					</div>
					<input class="form-control" id="noticeCode" type="hidden"
						name="noticeCode" value="${nboard.noticeCode }" />
					<div style="float: right; margin: 0 auto;">
						<h5 class=" post-body font-alt">By&nbsp;
							${nboard.noticeWriter } &nbsp;| &nbsp; ${nboard.noticeRegdate }&nbsp;
							| &nbsp; 조회수 ${nboard.noticeHitcount }</h5>
					</div>
					<br /> <br />
					<div class="post-entry">
						<p>${nboard.noticeContent }</p>
					</div>
					<br /> <br />
					<hr class="divider-w mb-10">
					<br />
					<div class="row">
						<div class="col-12">
							<input type="button"
								class="btn btn-d btn-round btn-sm float-right"
								onclick="location.href='/noticelist'" value="list">
							<c:if test="${principal.user.userrole =='ROLE_ADMIN' }">
								<input type="button"
									class="btn btn-danger btn-round btn-sm float-right"
									id="btnNDelete" value="Delete">

								<input type="button"
									class="btn btn btn-d btn-round float-right btn-sm"
									onclick="location.href='../noticeupdate/${noticeCode}'"
									value="Update">
							</c:if>
						</div>
					</div>
					<br />
					<form action="post">
						<div class="comment-form">
							<h4 class="comment-form-title font-alt">ADD YOUR COMMENT</h4>
							<input class="form-control" id="noticeCode" type="hidden"
								name="noticeCode" value="${nboard.noticeCode }" />
							<sec:authorize access="isAnonymous()">
								<div class="form-group">
									<label class="sr-only" for="username">ID</label> <input
										class="form-control" id="ncWriter" type="text" name="ncWriter"
										placeholder="Login" readonly="readonly">
								</div>
								<div class="form-group">
									<textarea class="form-control" id="ncContent" name="text"
										rows="4" placeholder="로그인 후 작성가능합니다" readonly="readonly"></textarea>
								</div>
							</sec:authorize>
							<sec:authorize access="isAuthenticated()">
								<div class="form-group">
									<label class="sr-only" for="ncWriter">ID</label> <input
										class="form-control" id="ncWriter" type="text" name="ncWriter"
										value="${principal.user.username }" readonly="readonly">
								</div>
								<div class="form-group">
									<textarea class="form-control" id="ncContent" name="text"
										rows="4" placeholder="Comment"></textarea>
								</div>
							</sec:authorize>
							<button type="button" class="btn btn-d btn-round btn-sm"
								id="commentBtn">Post comment</button>
						</div>
					</form>
					<div class="comments" id="comments"></div>
				</div>
			</div>
		</div>
	</div>
</section>
<script>
	//댓글출력
	var init = function(){
		$.ajax({
			type:"get",
			url:"../nclist/"+$("#noticeCode").val()
			//dataType: "html",
			//contentType: 'application/json; charset=utf-8'
		
		})
		.done(function(resp){  
			//alert(resp.length);
			var str="<h4 class='comment-title font-alt'> 총 ${nboard.noticeReplycnt } 개의 댓글이 있습니다.</h4>"
				
			$.each(resp,function(key,val){
				str +="<div class='comment-content clearfix' style=' pull-left; margin-left:30px'>"
				str +="<i class='fa fa-commenting-o' aria-hidden='true'></i>"
				str +=" <div class='title'><Strong>"+val.ncWriter+"</Strong></div>"
				str +=" <div class='title'><Strong> 씨넘: "+val.nCnum+"</Strong></div>"
				str += "<div class='comment-body'> <p>"+val.ncContent +"</p> </div>" 
				str += "<div class='comment-meta'>"+ val.nRegdate 
			if("${principal.user.username}"==val.ncWriter){
				str += "- <a class='text-dark' href='javascript:fdel("
						+ val.nCnum+")'> Delete </a> "
					}
				str +=" </div></div>"
			})
			$("#comments").html(str);
		})
		.fail(function(request, status, error){
			alert("출력error:- code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error );
		})
	}
	
	//댓글 삭제
	function fdel(nCnum){
		$.ajax({
			type:"delete",
			url:"/ncdelete/"+nCnum
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
				"ncWriter": $('#ncWriter').val(),
				"ncContent":$("#ncContent").val(),
				"nBnum":$("#noticeCode").val()
				}
		$.ajax({
			type:"post", 
			url: "../ncinsert/"+$("#noticeCode").val(), 
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


	//공지삭제버튼
	$("#btnNDelete").click(
			function() {
				if (!confirm('정말 삭제할까요?'))
					return false;
				$.ajax({
					type : "DELETE",
					url : "../noticedelete/${noticeCode}",
					success : function(resp) {
						if (resp == "success") {
							alert("삭제되었습니다");

							location.href = "/noticelist"
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