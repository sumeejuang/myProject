<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp" %>
<section class="module-small bg-dark-1" data-background="assets/images/subs/head03.png">
</section>
<div class="main">
	 <section class="module home-full-weight bg-light">
	           <div class="container">
	         <h3 class="font-alt">Subscription & BeddingShop | 상품구매</h3>
	         <c:if test="${principal.user.userrole =='ROLE_ADMIN' }">
				<div class="row">
					<div class="col-1"></div>
					<div class="col-11">
						<input type="button"
							class="btn btn-white btn-round float-right btn-xs"
							onclick="location.href='/productinsert'" value="관리자모드 글작성">
					</div>
				</div>
			</c:if>
             <hr class="divider-w mb-10"><br/>
            <form class="row">
              <div class="col-sm-4 mb-sm-20"></div>
              <div class="col-sm-2 mb-sm-20"></div>
              <div class="col-sm-3 mb-sm-20"></div>
              <div class="col-sm-3">
                 <select class="form-control">
                  <option selected="selected">All</option>
                  <option>Coats</option>
                  <option>Jackets</option>
                  <option>Dresses</option>
                  <option>Jumpsuits</option>
                  <option>Tops</option>
                  <option>Trousers</option>
                </select>
              </div>
            </form>
          </div>
        </section>	

	<section class="module-smaller home-full-weight bg-light">
          <div class="container ">
            <div class="row multi-columns-row">
            
            <c:forEach items="${lists.content}" var="pboard">
              <div class="col-sm-6 col-md-4 col-lg-4">
                <div class="shop-item">
                   
                  <div class="shop-item-image">
                 <a href="/productview/${pboard.productCode}">
                  <img src=" " alt="item"></a>
                  </div>
                    <div>
                   
                  </div>
                   
                  <h4 class="shop-item-title font-alt">
                <a class="text-dark" href="/productview/${pboard.productCode}">
                ${pboard.productTitle }</a></h4>
                  ${pboard.productAmount } 원
                </div>
              </div>
              <br />
              <br />
              </c:forEach>
              <!-- 페이징처리 -->
			<ul class="pagination font-alt">
				<c:if test="${lists.first==false}">
					<li class="page-item"><a class="page-link text-dark"
						href="?page=${lists.number-1 }"> 
						<i class="fa fa-angle-left"></i>&nbsp;Previous</a></li>
				</c:if>
				<c:if test="${lists.last==false}">
					<li class="page-item"><a class="page-link text-dark"
						href="?page=${lists.number+1 }"> Next <i class="fa fa-angle-right"></i></a></li>
				</c:if>
			</ul>
			<br />
              
            </div><br/>
<!-- 			  <ul class="pagination justify-content-center">
			    <li class="page-item"><a class="page-link" href="javascript:void(0);">Previous</a></li>
			    <li class="page-item"><a class="page-link" href="javascript:void(0);">1</a></li>
			    <li class="page-item"><a class="page-link" href="javascript:void(0);">2</a></li>
			    <li class="page-item"><a class="page-link" href="javascript:void(0);">Next</a></li>
			  </ul>
			  //또는
            <div class="row">
              <div class="col-sm-12 mb-50">
                <div class="pagination font-alt"><a class="text-dark" href="#">
                <i class="fa fa-angle-left"></i></a><a class="text-dark" class="active" href="#">1</a>
                <a class="text-dark" href="#">2</a><a class="text-dark" href="#">3</a>
                <a class="text-dark" href="#">4</a><a class="text-dark" href="#">
                <i class="fa fa-angle-right"></i></a></div>
              </div>
            </div> -->
          </div>
	 </section>
	 
	 
	
</div>

<%@ include file="../../layout/footer.jsp" %>