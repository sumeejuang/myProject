<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp" %>
<section class="module-small bg-dark-1" data-background="/assets/images/subs/head02.jpg">
</section>

	 <section class="module home-full-weight bg-light">
	 	<div class="container">
	 	<div class="row">
		<div class="col-10" style="float: none; margin: 0 auto;">
		<h3 class="font-alt">Product Update</h3>
        <hr class="divider-w mb-10"><br/>
        <form class="form" >
        <div class="mb-3 mt-3">
        <div class="row">
        <div class="col-5">
          <select class="form-control" name="productCategory" 
          id="productCategory">
		  <option selected disabled>카테고리명</option>
		  <option value="subs">정기구독상품</option>
		  <option value="bedding">침구샵상품</option>
		  </select>
        </div>
        <div class="col-7">
		<input type="text" class="form-control" id="productTitle" 
		value="${pboard.productTitle}" name="productTitle">
		<input class="form-control" id="productCode" type="hidden"
		name="productCode" value="${eboard.productCode}" />
		</div>
  		</div>
  		</div>
		<div class="row">
			<div class="col-6">
				<div class="form-group">
					<input class="form-control" id="productWriter" type="text"
						name="productWriter" value="${pboard.productWriter}"
						readonly="readonly" />
							
				</div>
			</div>
			<div class="col-3">
				<input class="form-control" id="productPrice" type="text"
							name="productPrice" value="${pboard.productPrice}" />	
			</div>
			<div class="col-3">
			<input class="form-control" id="productAmount" type="text"
							name="productAmount" value="${pboard.productAmount}" />	
				</div>
			</div>
				<div class="form-group bg-white">
				<textarea id="productContent" class="form-control" rows="10" 
				name="productContent"> "${pboard.productContent}"
				</textarea>	
				</div>
				<br />
		
		<div class="row">
				<div class="col-12">
				<input type="button"
						class="btn btn btn-round btn-g btn-sm float-right" 
						onclick="location.href='/productlist'"
						value="list"> 
				<input type="button"
							class="btn btn-danger btn-round btn-sm float-right" 
							id="btnNDelete" value="Delete">
					<input type="button"
						class="btn btn btn-round btn-d btn-sm float-right"
						value="Update" id="btnNUpdate">
				</div>
		</div>
	</form>
	</div>
	</div>
	</div>
</section>


<script>
$(document).ready(function() {
    $('#productContent').summernote({
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
	"productCode":$("#productCode").val(),   //기본키
	"productTitle":$("#productTitle").val(),   
	"productPrice":$("#productPrice").val(),  
	"productAmount":$("#productAmount").val() 
	"productCategory":$("#productCategory").val() 
	"productContent":$("#productContent").val() 
	} //sql
$.ajax({
	type:"put",
	url:"/productupdate",
	contentType:"application/json;charset=utf-8",
	data:JSON.stringify(data),
	success: function(resp){
		if(resp=="success"){
			alert("수정성공")
			location.href="../productview/${pboard.productCode}"
		}
	},
	error: function(request, status, error){
		alert("수정실패 - code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	}
})
}
})
//공지삭제버튼
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
							location.href = "/productlist"
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