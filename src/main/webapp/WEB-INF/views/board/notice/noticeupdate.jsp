<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp"%>
<section class="module-small bg-dark-1" data-background="/assets/images/subs/head02.jpg">
</section>

<section class="module home-full-weight bg-light">
	<div class="container">
		<div class="row">
			<div class="col-10" style="float: none; margin: 0 auto;">
				<h3 class="font-alt">Notice Update</h3>
				<hr class="divider-w mb-10">
				<br />
				<form class="form">
					<div class="mb-3 mt-3">
						<input type="text" class="form-control" id="noticeTitle"
							value="${nboard.noticeTitle }" name="noticeTitle"> 
						<input class="form-control" id="noticeCode" type="hidden"
							name="noticeCode" value="${nboard.noticeCode}" />
					</div>
					<div class="form-group">
						<div class="row">
							<div class="col">
								<input class="form-control" id="noticeWriter" type="text"
									name="noticeWriter" value="${nboard.noticeWriter }"
									readonly="readonly" />
							</div>
							<div class="col">
								<input class="form-control" id="noticeRegdate" type="date"
									name="noticeRegdate" />
							</div>
						</div>
					</div>
			<div class="form-group bg-white">
				<textarea id="noticeContent" class="form-control" rows="10"
					name="noticeContent"> ${nboard.noticeContent }
				</textarea>
			</div>
			<br />
			<div class="row">
				<div class="col-12">
					<input type="button"
						class="btn btn btn-round btn-g btn-sm float-right" 
						onclick="location.href='/noticelist'"
						value="list"> 	
					<input type="button"
						class="btn btn btn-round btn-d btn-sm float-right" 
						id="btnNUpdate"
						value="Update">
				
				</div>
			</div>
			</form>
		</div>
	</div>
	</div>
</section>


<script>
	//날짜세팅
	document.getElementById('noticeRegdate').valueAsDate = new Date();

	
	//수정버튼
	$("#btnNUpdate").click(function(){
	if(confirm('정말 수정할까요?')){
	data={
		"noticeCode":$("#noticeCode").val(),   //기본키
		"noticeTitle":$("#noticeTitle").val(),  
		"noticeContent":$("#noticeContent").val(), 
		"noticeRegdate":$("#noticeRegdate").val()
		} //sql
	$.ajax({
		type:"put",
		url:"/noticeupdate",
		contentType:"application/json;charset=utf-8",
		data:JSON.stringify(data),
		success: function(resp){
			if(resp=="success"){
				alert("수정성공")
				location.href="../noticeview/${nboard.noticeCode}"//회원일경우 
			}
		},
		error: function(request, status, error){
			alert("수정실패 - code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	})
	}
})

	//써머노트
	$(document).ready(function() {
		$('#noticeContent').summernote({
			height : 300,
			minHeight : null,
			maxHeight : null,
			focus : true,
			lang : "ko-KR",
			placeholder : '내용을 입력하세요'

		});
	});
</script>

<%@ include file="../../layout/footer.jsp"%>