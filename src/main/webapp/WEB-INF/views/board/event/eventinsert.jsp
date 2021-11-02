<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp"%>
<section class="module-small bg-dark-1"
	data-background="/assets/images/subs/head05.jpg"></section>
<section class="module home-full-weight bg-light">
	<div class="container">
		<div class="row">
			<div class="col-10" style="float: none; margin: 0 auto;">
				<h3 class="font-alt">Event Write</h3>
				<hr class="divider-w mb-10">
				<br />
				<form class="form" action="eventinsert" method="post"
					enctype="multipart/form-data">
					<div class="mb-3 mt-3">
						<input type="text" class="form-control" id="eventTitle"
							placeholder="제목" name="eventTitle">
					</div>
					<div class="row">
						<div class="col">
							<div class="form-group">
								<input class="form-control" id="eventWriter" type="text"
									name="eventWriter" value="${principal.user.username }"
									readonly="readonly" />
							</div>
						</div>
						<div class="col"></div>
					</div>
					<div class="form-group bg-white">
						<textarea id="eventContent" class="form-control" rows="10"
							name="eventContent">
				</textarea>
					</div>
					<br />
					<div class="row">
						<div class="col-12">
							<input type="button"
								class="btn btn btn-round btn-g btn-sm float-right"
								onclick="location.href='/eventlist'" value="list"> <input
								type="submit" onclick="location.href='/eventinsert'"
								class="btn btn btn-round btn-d btn-sm float-right" value="Write"
								id="btnNWrite">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</section>
<script>
	$(document).ready(function() {
		$('#eventContent').summernote({
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