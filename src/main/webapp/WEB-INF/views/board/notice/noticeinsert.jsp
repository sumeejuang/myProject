<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp"%>
<section class="module-small bg-dark-1"
	data-background="/assets/images/subs/head02.jpg"></section>
<section class="module home-full-weight bg-light">
	<div class="container">
		<div class="row">
			<div class="col-10" style="float: none; margin: 0 auto;">
				<h3 class="font-alt">Notice Write</h3>
				<hr class="divider-w mb-10">
				<br />
				<form class="form" action="noticeinsert" method="post">
					<div class="mb-3 mt-3">
						<input type="text" class="form-control" id="noticeTitle"
							placeholder="제목" name="noticeTitle">
					</div>
					<div class="row">
						<div class="col">
							<div class="form-group">
								<input class="form-control" id="noticeWriter" type="text"
									name="noticeWriter" value="${principal.user.username }"
									readonly="readonly" />
							</div>
						</div>
						<div class="col"></div>
					</div>
					<div class="form-group bg-white">
						<textarea id="noticeContent" class="form-control" rows="10"
							name="noticeContent">
					</textarea>
					</div>
					<br />
					<div class="row">
						<div class="col-12">
							<input type="button"
								class="btn btn btn-round btn-g btn-sm float-right"
								onclick="location.href='/noticelist'" value="list"> <input
								type="submit" onclick="location.href='/noticeinsert'"
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
		$('#noticeContent').summernote({
			height : 300,
			minHeight : null,
			maxHeight : null,
			focus : true,
			lang : "ko-KR",
			placeholder : '내용을 입력하세요',
			callbacks : {
				onImageUpload : function(files, editor, welEditable) {
					for (var i = 0; i < files.length; i++) {
						sendFile(files[i], this);
					}
				}
			}

		});
	});

	function sendFile(file, el) {
		var form_data = new FormData();
		form_data.append('file', file);
		$.ajax({
			data : form_data,
			type : "POST",
			url : '/image',
			cache : false,
			contentType : false,
			enctype : 'multipart/form-data',
			processData : false,
			success : function(url) {
				$(el).summernote('insertImage', url, function($image) {
					$image.css('width', "25%");
				});
			}
		});
	}
</script>

<%@ include file="../../layout/footer.jsp"%>