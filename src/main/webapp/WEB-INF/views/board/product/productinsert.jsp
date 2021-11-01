<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp" %>
<section class="module-small bg-dark-1" data-background="/assets/images/subs/head02.jpg">
</section>

	 <section class="module home-full-weight bg-light">
	 	<div class="container">
	 	<div class="row">
		<div class="col-10" style="float: none; margin: 0 auto;">
		<h3 class="font-alt">Product Write</h3>
        <hr class="divider-w mb-10"><br/>
        <form class="form"  action="productinsert" method="post" >
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
		placeholder="제목" name="productTitle">
		</div>
  		</div>
  		</div>
		<div class="row">
			<div class="col-6">
				<div class="form-group">
					<input class="form-control" id="productWriter" type="text"
							name="productWriter" value="${principal.user.username }"
								readonly="readonly" />
				</div>
			</div>
			<div class="col-3">
				<input class="form-control" id="productPrice" type="text"
							name="productPrice" placeholder="가격 (숫자만입력)" />	
			</div>
			<div class="col-3">
			<input class="form-control" id="productAmount" type="text"
							name="productAmount" placeholder="수량 (숫자만입력)" />	
			</div>
			</div>
				<div class="form-group bg-white">
				<input class="form-control" id="productDesc" type="text"
								name="productDesc" placeholder="상품간단설명" />	
				</div>
				<div class="form-group bg-white">
				<textarea id="productContent" class="form-control" rows="10" 
				name="productContent">
				</textarea>	
			</div>
			<br />
		
		<div class="row">
				<div class="col-12">
				<input type="button"
						class="btn btn btn-round btn-g btn-sm float-right" 
						onclick="location.href='/productlist'"
						value="list"> 
					<input type="submit" onclick="location.href='/productinsert'"
						class="btn btn btn-round btn-d btn-sm float-right"
						value="Write" id="btnNWrite">
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

</script>

<%@ include file="../../layout/footer.jsp" %>