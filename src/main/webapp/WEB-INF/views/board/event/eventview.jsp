<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp" %>
<section class="module-small bg-dark-1" 
data-background="/assets/images/subs/head05.jpg">
</section>

<section class="module home-full-weight bg-light">
	<div class="container">
	<div class="row">
		<div class="col-10" style="float: none; margin: 0 auto;">
		  <h2 class="font-alt">Event </h2><br/>

                <div class="post ">
                   <div class="post-header">
                   <blockquote>
                    <h1 class="post-title">${eboard.eventTitle}</h1>
                    </blockquote>
                    </div>
                    <input class="form-control" id="eventCode" type="hidden"
						name="eventCode" value="${eboard.eventCode }" />
                    <div style="float: right; margin: 0 auto;">
                    <h5 class=" post-body font-alt">By&nbsp;
							${eboard.eventWriter } &nbsp;| &nbsp; ${eboard.eventRegdate }&nbsp;
							| &nbsp; 조회수 ${eboard.eventHitcount }</h5>
                    </div><br/><br/>
                  
                  <div class="post-entry">
                  <p>${eboard.eventContent }</p>
                  </div>
                  <br/>
                  <br/>
                    <hr class="divider-w mb-10"><br/>
                    <div class="row">
						<div class="col-12">
							<input type="button"
								class="btn btn-g btn-round btn-sm float-right"
								onclick="location.href='/eventlist'" value="list">

							<c:if test="${principal.user.userrole =='ROLE_ADMIN' }">
								<input type="button"
									class="btn btn-danger btn-round btn-sm float-right" id="btnNDelete"
									value="Delete">	
								<input type="button"
									class="btn btn btn-d btn-round float-right btn-sm"
									onclick="location.href='/eventupdate/${eboard.eventCode }'"
									value="Update">

							</c:if>
						</div>
					</div>
                </div>
                </div>
                </div>
                </div>
 </section>
 
 <script>
//삭제버튼
	$("#btnNDelete").click(
			function() {
				if (!confirm('정말 삭제할까요?'))
					return false;
				$.ajax({
					type : "DELETE",
					url : "../eventdelete/${eboard.eventCode }",
					success : function(resp) {
						if (resp == "success") {
							alert("삭제되었습니다");
							location.href = "/eventlist"
						}
					},
					error : function(request, status, error) {
						alert("삭제실패 - code:" + request.status + "\n"
								+ "message:" + request.responseText + "\n"
								+ "error:" + error);
					}
				})
			})		
</script>


<%@ include file="../../layout/footer.jsp" %>