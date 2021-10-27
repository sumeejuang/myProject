<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<section class="module-small bg-dark-1"
	data-background="assets/images/subs/head01.jpg"></section>
<div class="main">
	<section class="module">
		<div class="container mb-50">
			<div class="row">
				<div class="col-10" style="float: none; margin: 0 auto;">
					<h4 class="font-alt">Update</h4>
					<hr class="divider-w mb-10">
					<br />
					<form class="form">
						<div class="row">
							<div class="col">
								<div class="form-group">
									<input class="form-control" id="useremail" type="text"
										name="useremail" placeholder="이메일(ID)" readonly="readonly" />
								</div>
							</div>
							<div class="col"></div>
							<div class="col"></div>
						</div>
						<div class="row">
							<div class="col">
								<div class="form-group">
									<input class="form-control" id="userpasswd" type="text"
										name="userpasswd" placeholder="비밀번호" />
								</div>
							</div>
							<div class="col">
								<div class="form-group">
									<input class="form-control" id="userpasswdCK" type="text"
										name="userpasswdCK" placeholder="비밀번호확인" />
								</div>
							</div>
							<div class="col">
								<div id="check">비밀번호 일치</div>
							</div>
						</div>
						<div class="row">
							<div class="col">
								<div class="form-group">
									<input class="form-control" id="username" type="text"
										name="username" placeholder="이름" />
								</div>
							</div>
							<div class="col"></div>
							<div class="col"></div>
						</div>
						<div class="row">
							<div class="col">
								<div class="form-group">
									<input class="form-control" id="userphone" type="text"
										name="userphone" placeholder="전화번호" />
								</div>
							</div>
							<div class="col"></div>
							<div class="col"></div>
						</div>
						<div class="row">
							<div class="col">
								<div class="form-group">
									<input class="form-control" id="postcode" type="text"
										name="postcode" placeholder="우편번호" />
								</div>
							</div>
							<div class="col">
								<button type="button" class="btn btn-g btn-round btn-sm"
									onclick="execDaumPostcode()">FIND</button>
							</div>
							<div class="col"></div>
						</div>
						<div class="row">
							<div class="col">
								<div class="form-group">
									<input class="form-control" id="address" type="text"
										name="address" placeholder="주소" readonly="readonly" />
								</div>
							</div>
							<div class="col"></div>
						</div>
						<div class="row">
							<div class="col">
								<div class="form-group">
									<input class="form-control" id="detailAddress" type="text"
										name="detailAddress" placeholder="상세주소" />
								</div>
							</div>
							<div class="col-5">
								<input class="form-control" id="extraAddress" type="text"
									name="extraAddress" placeholder="주소참조" readonly="readonly" />
							</div>
						</div>
						<br />
						<hr class="divider-w mb-10">
						<div class="row">
							<div class="col-12">
								<input type="button"
									class="btn btn-danger btn-round float-right" value="UnRegister">
								<input type="button" class="btn btn btn-d btn-round float-right"
									value="Update">
							</div>
						</div>
				</form>
				</div>
			</div>
		</div>
</section>
</div>


<script>
	function execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수

				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}

				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if (data.userSelectedType === 'R') {
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraAddr !== '') {
						extraAddr = ' (' + extraAddr + ')';
					}
					// 조합된 참고항목을 해당 필드에 넣는다.
					document.getElementById("extraAddress").value = extraAddr;

				} else {
					document.getElementById("extraAddress").value = '';
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('postcode').value = data.zonecode;
				document.getElementById("address").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("detailAddress").focus();
			}
		}).open();
	}
</script>

<%@ include file="../layout/footer.jsp"%>