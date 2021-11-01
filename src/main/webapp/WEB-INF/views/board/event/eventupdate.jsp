<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp" %>
<section class="module-small bg-dark-1" data-background="/assets/images/subs/head05.jpg">
</section>

	 <section class="module home-full-weight bg-light">
	 	<div class="container">
	 	<div class="row">
		<div class="col-10" style="float: none; margin: 0 auto;">
		<h3 class="font-alt">Event Update</h3>
        <hr class="divider-w mb-10"><br/>
        <form class="form">
        <div class="mb-3 mt-3">
		<input type="text" class="form-control" id="eventTitle" 
		value="${eboard.eventTitle }" name="eventTitle">
		<input class="form-control" id="eventCode" type="hidden"
		name="eventCode" value="${eboard.eventCode}" />
  		</div>
		<div class="row">
			<div class="col">
				<div class="form-group">
					<input class="form-control" id="eventWriter" type="text"
							name="eventWriter" value="${eboard.eventWriter }" readonly="readonly" />
				</div>
				</div>
				
			</div>
				<div class="form-group bg-white">
				<textarea id="eventContent" class="form-control" rows="10" 
				name="eventContent"> ${eboard.eventContent }
				</textarea>	
				</div>
				<br />
		
		<div class="row">
				<div class="col-12">
					<input type="button"
						class="btn btn btn-round btn-g btn-sm float-right" 
						onclick="location.href='/eventlist'"
						value="list"> 	
					<input type="button"
						class="btn btn btn-round btn-d btn-sm float-right" 
						id="btnNUpdate"
						value="Update">
					<input type="button"
						class="btn btn-danger btn-round btn-sm float-right" id="btnNDelete"
						value="Delete">	
				
				</div>
			</div>
	</form>
	</div>
	</div>
	</div>
</section>


<script>

//써머노트
$(document).ready(function() {
  $('#eventContent').summernote({
		  height: 300,                
		  minHeight: null,            
		  maxHeight: null,            
		  focus: true,               
		  lang: "ko-KR",					
		  placeholder: '내용을 입력하세요'
  
	});
});


//수정버튼
$("#btnNUpdate").click(function(){
if(confirm('정말 수정할까요?')){
data={
	"eventCode":$("#eventCode").val(),   //기본키
	"eventTitle":$("#eventTitle").val(),  
	"eventContent":$("#eventContent").val() 
	} //sql
$.ajax({
	type:"put",
	url:"/eventupdate",
	contentType:"application/json;charset=utf-8",
	data:JSON.stringify(data),
	success: function(resp){
		if(resp=="success"){
			alert("수정성공")
			location.href="../eventview/${eboard.eventCode}"
		}
	},
	error: function(request, status, error){
		alert("수정실패 - code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	}
})
}
})
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

</script>

<%@ include file="../../layout/footer.jsp" %>