<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../../layout/header.jsp" %>
<section class="module-small bg-dark-1" data-background="assets/images/subs/head02.jpg">
</section>

	 <section class="module home-full-weight bg-light">
	 	<div class="container">
	 	<div class="row">
		<div class="col-10" style="float: none; margin: 0 auto;">
		<h3 class="font-alt">Bedding Write</h3>
        <hr class="divider-w mb-10"><br/>
        <form class="form">
        <div class="mb-3 mt-3">
		<input type="text" class="form-control" id="noticetitle" 
		placeholder="제목" name="noticetitle">
  		</div>
		<div class="row">
			<div class="col">
				<div class="form-group">
					<input class="form-control" id="useremail" type="text"
							name="useremail" placeholder="이메일(ID)" />
				</div>
				</div>
				<div class="col"></div>
			</div>
				<div class="form-group bg-white">
				<textarea id="summernote" class="form-control" rows="10" 
				name="content">
				</textarea>	
				</div>
				<br />
		
		<div class="row">
			<div class="col-12">
				<input type="button" onclick="goWrite(this.form)"
					class="btn btn btn-lg btn-round btn-primary float-right"
					value="Write">
			</div>
		</div>
	</form>
	</div>
	</div>
	</div>
</section>


<script>
$(document).ready(function() {
    $('#summernote').summernote({
		  height: 300,                
		  minHeight: null,            
		  maxHeight: null,            
		  focus: true,               
		  lang: "ko-KR",					
		  placeholder: '내용을 입력하세요'	

          
	});
});

</script>

<%@ include file="../../../layout/footer.jsp" %>