<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp"%>
<section class="module-small bg-dark"
	data-background="/assets/images/subs/head03.png"></section>
<div class="main">
	<section class="module home-full-weight bg-light">
		<div class="container mt-30">
			<div class="row">
				<div class="col-sm-6 mb-sm-40"> //싱글사진
					<a class="gallery" href="assets/images/shop/product-7.jpg"> <img
						src="assets/images/shop/product-7.jpg" alt="Single Product Image"></a>
				</div>
				<div class="col-sm-6">
					<div class="row">
						<div class="col-sm-12">
							<h1 class="product-title font-alt">${pboard.productTitle }</h1>
						</div>
					</div>
					<div class="row mb-20">
						<div class="col-sm-12">
							<div class="price font-alt">
								<span class="amount">${pboard.productAmount } 원</span>
							</div>
						</div>
					</div>
					<div class="row mb-20">
						<div class="col-sm-12">
							<div class="description">
								<p>${pboard.productDesc }</p>
							</div>
						</div>
					</div>
					<div class="row mb-20">
						<div class="col-sm-4 mb-sm-20">
							<input class="form-control input-lg" type="number" name=""
								value="1" max="40" min="1" required="required">
						</div>
						<div class="col-sm-8">
							<a class="btn btn-lg btn-block btn-round btn-b" href="#">Add
								To Cart</a>
						</div>
					</div>
					<div class="row mb-20">
						<div class="col-sm-12"></div>
					</div>
				</div>
			</div>
			<div class="row mt-70">
				<div class="col-sm-12">
					<ul class="nav nav-tabs font-alt" role="tablist">
						<li class="active"><a href="#description" data-toggle="tab"
							aria-expanded="true"> <span class="icon-tools-2"></span>Description
						</a></li>
						<li class=""><a href="#reviews" data-toggle="tab"
							aria-expanded="false"> <span class="icon-tools-2"></span>Reviews
								(댓글수!!!)
						</a></li>
					</ul>
					<div class="tab-content  bg-white">
						<div class="tab-pane active" id="description">
							<p>${pboard.productContent }</p>
						</div>
						<div class="tab-pane  bg-white" id="reviews">
							<div class="comments reviews">
								<div class="comment clearfix">
									<div class="comment-content clearfix">
										<div class="comment-author font-alt">
											<a class="text-dark" href="#">John Doe</a>
										</div>
										<div class="comment-body">
											<p>The European languages are members of the same family.
												Their separate existence is a myth. For science, music,
												sport, etc, Europe uses the same vocabulary. The European
												languages are members of the same family. Their separate
												existence is a myth.</p>
										</div>
										<div class="comment-meta font-alt">
											Today, 14:55 -<span><i class="fa fa-star star"></i></span><span><i
												class="fa fa-star star"></i></span><span><i
												class="fa fa-star star"></i></span><span><i
												class="fa fa-star star"></i></span><span><i
												class="fa fa-star star-off"></i></span>
										</div>
									</div>
								</div>
								<div class="comment clearfix">
									<div class="comment-content clearfix">
										<div class="comment-author font-alt">
											<a class="text-dark" href="#">Mark Stone</a>
										</div>
										<div class="comment-body">
											<p>Europe uses the same vocabulary. The European
												languages are members of the same family. Their separate
												existence is a myth.</p>
										</div>
										<div class="comment-meta font-alt">
											Today, 14:59 -<span><i class="fa fa-star star"></i></span><span><i
												class="fa fa-star star"></i></span><span><i
												class="fa fa-star star"></i></span><span><i
												class="fa fa-star star-off"></i></span><span><i
												class="fa fa-star star-off"></i></span>
										</div>
									</div>
								</div>
							</div>
							
						</div>
						<div class="comment-form mt-30  bg-light">
								<br />
								<br />
								<h4 class="comment-form-title font-alt">Add review</h4>
								<form method="post">
									<div class="row ">
										<div class="col-sm-4">
											<div class="form-group">
												<label class="sr-only" for="name">Name</label> <input
													class="form-control" id="name" type="text" name="name"
													placeholder="Name">
											</div>
										</div>
										<div class="col-sm-4">
											<div class="form-group">
												<label class="sr-only" for="email">Name</label> <input
													class="form-control" id="email" type="text" name="email"
													placeholder="E-mail">
											</div>
										</div>
										<div class="col-sm-4">
											<div class="form-group">
												<select class="form-control">
													<option selected="true" disabled="">Rating</option>
													<option value="1">1</option>
													<option value="2">2</option>
													<option value="3">3</option>
													<option value="4">4</option>
													<option value="5">5</option>
												</select>
											</div>
										</div>
										<div class="col-sm-12">
											<div class="form-group">
												<textarea class="form-control" id="" name="" rows="4"
													placeholder="Review"></textarea>
											</div>
										</div>
										<div class="col-sm-12">
											<button class="btn btn-round btn-d" type="submit">Submit
												Review</button>
										</div>
									</div>
								</form>
							</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</div>
<%@ include file="../../layout/footer.jsp"%>
