<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<section class="module-small bg-dark-1"
	data-background="/assets/images/subs/head01.jpg"></section>
<div class="main">
	<section class="module home-full-weight bg-white">
		<div class="container">
			<div class="row">
				<div class="col-10" style="float: none; margin: 0 auto;">
					<div class="row">
						<div class="col-sm-9">
							<h2 class="font-alt">My Page</h2>
						</div>
						<div class="col-sm-2 ">
							<img src="/assets/images/subs/board01.png">
						</div>
					</div>
					<div class="post ">
						<div class="post-header">
							<div class=row>
								<div class=col>
									<br />
									<h1 class="post-title">
										" <strong>${list.name}</strong> " 님의 <br />
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Laundromat
									</h1>
									<p class="email align:rignt">${list.username}</p>
									<div class=col-sm-1-offset-6>
										<input type="button" onclick="location.href='/logout'"
											class="btn btn-d btn-round btn-xs" value="로그아웃">
										<c:if test="${principal.user.userrole =='ROLE_ADMIN' }">
											<input type="button" onclick="location.href='/admin'"
												class="btn btn-d btn-round btn-xs" value="관리자페이지">
										</c:if>
									</div>
									<br /> <br />
									<hr class="divider-w mt-10 mb-10">
									<br />
								</div>
								<div class="col-sm-9 ">
									<div class="col card bg-light">
										<div class=" card-body">
											<h4 class="card-title font-alt">Subscription</h4>
											<p class="card-text">정기구독 내역이 없습니다.</p>
											<a href="#" class="card-link">Card link</a> <a href="#"
												class="card-link">Another link</a>
										</div>
									</div>
									<div class="card">
										<div class="card-body">
											<h4 class="card-title font-alt">Order</h4>
											<p class="card-text">주문내역이 없습니다.</p>
											<a href="#" class="card-link">Card link</a> <a href="#"
												class="card-link">Another link</a>
										</div>
									</div>
									<div class="card">
										<div class="card-body  bg-light">
											<h4 class="card-title font-alt">PayInfo</h4>
											<p class="card-text">카드미등록</p>
											<a href="#" class="card-link">Card link</a> <a href="#"
												class="card-link">Another link</a>
										</div>
									</div>
									<div class="card">
										<div class="card-body">
											<h4 class="card-title font-alt">Account</h4>
											<p class="card-text">
												<Strong>${list.name}</Strong> 님 반가워요.
											</p>
											<a href="../updateForm/${list.usercode}" class="card-link">회원정보수정</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</div>
<%@ include file="../layout/footer.jsp"%>
