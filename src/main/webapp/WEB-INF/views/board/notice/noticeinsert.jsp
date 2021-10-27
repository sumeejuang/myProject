<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp" %>
<section class="module-small bg-dark-1" data-background="assets/images/subs/head02.jpg">
</section>
<div class="main">
	 <section class="module home-full-weight bg-light">
	 	<div class="container">
	 	<div class="row">
		<div class="col-10" style="float: none; margin: 0 auto;">
		<h3 class="font-alt">Notice Write</h3>
        <hr class="divider-w mb-10"><br/>
        <form class="form">
        <div class="mb-3 mt-3">
		<input type="email" class="form-control" id="noticetitle" placeholder="제목" name="noticetitle">
  		</div>
		<div class="row">
			<div class="col">
				<div class="form-group">
					<input class="form-control" id="useremail" type="text"
							name="useremail" placeholder="이메일(ID)" />
				</div>
				</div>
				<div class="col">
				<div class="form-group">
				<input class="form-control" id="noticeRegdate" type="text"
							name="useremail" placeholder="등록날짜" />
				</div>			
				</div>
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
</div>

<script>
$(document).ready(function() {
    $('#summernote').summernote({
		  height: 300,                 // 에디터 높이
		  minHeight: null,             // 최소 높이
		  maxHeight: null,             // 최대 높이
		  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
		  lang: "ko-KR",					// 한글 설정
		  placeholder: '최대 2048자까지 쓸 수 있습니다'	//placeholder 설정

          
	});
});

</script>

<%@ include file="../../layout/footer.jsp" %>