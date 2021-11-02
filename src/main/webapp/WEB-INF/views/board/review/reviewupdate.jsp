<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp"%>
<section class="module-small bg-dark-1"
	data-background="assets/images/subs/head05.jpg"></section>
<section class="module home-full-weight bg-light">
	<div class="container">
		<div class="row">
			<div class="col-10" style="float: none; margin: 0 auto;">
				<h3 class="font-alt">Review Update</h3>
				<hr class="divider-w mb-10">
				<br />
				<form class="form" action="reviewinsert" method="post">
					<div class="mb-3 mt-3">
						<input type="text" class="form-control" id="reviewTitle"
							value="${rboard.reviewTitle }" name="reviewTitle">
					</div>
					<div class="row">
						<div class="col">
							<div class="form-group">
								<input class="form-control" id="reviewWriter" type="text"
									name="reviewWriter" readonly="readonly"
									value="${rboard.reviewWriter }" /> <input class="form-control"
									id="reviewCode" type="hidden" name="reviewCode"
									value="${rboard.reviewCode}" />
							</div>
						</div>
						<div class="col">
							<div class="form-group">
								<select class="form-control" id="reviewStar">
									<option selected="true" disabled="">Rating</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
								</select>
							</div>
						</div>
					</div>
					<div class="form-group bg-white">
						<textarea id="reviewContent" class="form-control" rows="10"
							name="reviewContent">
				${rboard.reviewContent }
				</textarea>
					</div>
					<br />

					<div class="row">
						<div class="col-12">

							<input type="button"
								class="btn btn btn-round btn-g btn-sm float-right"
								onclick="location.href='/reviewlist'" value="list"> <input
								type="button"
								class="btn btn-danger btn-round btn-sm float-right"
								id="btnNDelete" value="Delete"> <input type="button"
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
	//수정버튼
	$("#btnNUpdate").click(
			function() {
				if (confirm('정말 수정할까요?')) {
					data = {
						"reviewCode" : $("#reviewCode").val(), //기본키
						"reviewTitle" : $("#reviewTitle").val(),
						"reviewContent" : $("#reviewContent").val(),
						"reviewStar" : $("#reviewStar").val(),
						"reviewWriter" : $("#reviewWriter").val()
					} //sql
					$.ajax({
						type : "put",
						url : "/reviewupdate",
						contentType : "application/json;charset=utf-8",
						data : JSON.stringify(data),
						success : function(resp) {
							if (resp == "success") {
								alert("수정성공")
								location.href = "../reviewlist"//회원일경우 
							}
						},
						error : function(request, status, error) {
							alert("수정실패 - code:" + request.status + "\n"
									+ "message:" + request.responseText + "\n"
									+ "error:" + error);
						}
					})
				}
			})

	//삭제
	//삭제버튼
	$("#btnNDelete").click(
			function() {
				if (!confirm('정말 삭제할까요?'))
					return false;
				$.ajax({
					type : "DELETE",
					url : "../reviewdelete/${rboard.reviewCode}",
					success : function(resp) {
						if (resp == "success") {
							alert("삭제되었습니다");
							location.href = "/reviewlist"
						}
					},
					error : function(request, status, error) {
						alert("삭제실패 - code:" + request.status + "\n"
								+ "message:" + request.responseText + "\n"
								+ "error:" + error);
					}
				})
			})

	$(document).ready(function() {
		$('#reviewContent').summernote({
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