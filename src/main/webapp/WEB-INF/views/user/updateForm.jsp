<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<section class="module-small bg-dark-1"
	data-background="/assets/images/subs/head01.jpg"></section>
<div class="main">
	<section class="module">
		<div class="container mb-50">
			<div class="row">
				<div class="col-10" style="float: none; margin: 0 auto;">
					<h4 class="font-alt">" <strong>${list.name }</strong> " 님의 Update</h4>
					<hr class="divider-w mb-10">
					<br />
					<form class="form">
						<div class="row">
							<div class="col">
								<div class="form-group">
									<input class="form-control" id="usercode" type="hidden"
										name="usercode" value="${list.usercode}" />
										<input class="form-control" id="userregdate" type="hidden"
										name="userregdate" value="${list.userregdate}" />
										<input class="form-control" id="userrole" type="hidden"
										name="userrole" value="${list.userrole}" />
									<input class="form-control" id="username" type="text"
										name="username" value="${list.username}" readonly="readonly" />
								</div>
							</div>
							<div class="col"></div>
							<div class="col"></div>
						</div>
						<div class="row">
							<div class="col">
								<div class="form-group">
									<input class="form-control" id="userpasswd" type="password"
										name="userpasswd" placeholder="비밀번호" />
								</div>
							</div>
							<div class="col">
								<div class="form-group">
									<input class="form-control" id="userpasswdCK" type="password"
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
									<input class="form-control" id="name" type="text"
										name="name" value="${list.name}" readonly="readonly"/>
								</div>
							</div>
							<div class="col"></div>
							<div class="col"></div>
						</div>
						<div class="row">
							<div class="col">
								<div class="form-group">
									<input class="form-control" id="userphone" type="text"
										name="userphone" value="${list.userphone}" />
								</div>
							</div>
							<div class="col"></div>
							<div class="col"></div>
						</div>
						<div class="row">
							<div class="col">
								<div class="form-group">
									<input class="form-control" id="postcode" type="text"
										name="postcode" value="${list.postcode}" readonly="readonly" />
								</div>
							</div>
							<div class="col">
								<button type="button" class="btn btn-d btn-round btn-sm"
									onclick="execDaumPostcode()">FIND</button>
							</div>
							<div class="col"></div>
						</div>
						<div class="row">
							<div class="col">
								<div class="form-group">
									<input class="form-control" id="address" type="text"
										name="address" value="${list.address}" readonly="readonly" />
								</div>
							</div>
							<div class="col"></div>
						</div>
						<div class="row">
							<div class="col">
								<div class="form-group">
									<input class="form-control" id="detailaddress" type="text"
										name="detailaddress" value="${list.detailaddress}" />
								</div>
							</div>
							<div class="col-5">
								<input class="form-control" id="extraaddress" type="text"
									name="extraaddress" value="${list.extraaddress}" readonly="readonly" />
							</div>
						</div>
						<br />
						<hr class="divider-w mb-10">
						<div class="row">
							<div class="col-12">
								<input type="button"
									class="btn btn-danger btn-round float-right" 
									id="btnUserDelete"
									value="UnRegister">
								<input type="button" class="btn btn btn-d btn-round float-right"
									id="btnUserUpdate"
									value="Update">
								<c:if test="${principal.user.userrole =='ROLE_ADMIN' }">	
							   <input type="button" class="btn btn btn-success btn-round float-right"
									id="btnSetRoleAdmin"
									value="set Role_Admin">
								</c:if>
							</div>
						</div>
				</form>
				</div>
			</div>
		</div>
</section>
</div>


<script>
//Role_Admin버튼
$("#btnSetRoleAdmin").click(function(){
	if(confirm('관리자 권한을 부여할까요?')){
		data={  "usercode":$("#usercode").val(),   //기본키
				"userrole":$("#userrole").val()
				} //sql
		$.ajax({
			type : "PUT",
			url : "/role",
			contentType : "application/json;charset=utf-8",
			data:JSON.stringify(data)
		}).done(function(resp) {
			if (resp == "success") {
				alert("관리자권한이 부여되었습니다")
				location.href="/admin"
				
			} 
		}).fail(function(request, status, error) {
			alert("에러 - code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error)
		})
	}
	
})
//수정버튼
$("#btnUserUpdate").click(function(){
	if(confirm('정말 수정할까요?')){
	data={
		"usercode":$("#usercode").val(),   //기본키
		"username":$("#username").val(),  
		"userpasswd":$("#userpasswd").val(), 
		"name":$("#name").val(), 
		"userphone":$("#userphone").val(), 
		"postcode":$("#postcode").val(), 
		"address":$("#address").val(), 
		"detailaddress":$("#detailaddress").val(), 
		"extraaddress":$("#extraaddress").val(),
		"userregdate":$("#userregdate").val(),
		"userrole":$("#userrole").val()
		} //sql
	$.ajax({
		type:"put",
		url:"/updateForm",
		contentType:"application/json;charset=utf-8",
		data:JSON.stringify(data),
		success: function(resp){
			if(resp=="success"){
				alert("수정성공")
				location.href="/mypage/${list.usercode}"//회원일경우 
			}
		},
		error: function(request, status, error){
			alert("수정실패 - code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	})
	}
})

//삭제버튼
$("#btnUserDelete").click(function(){
	if(!confirm('정말 탈퇴할까요?')) return false; //취소면 끝내고 아니면 아래작업
		$.ajax({
			type:"DELETE",
			url:"../delete/${list.usercode}",
			success:function(resp){
				if(resp=="success"){
					alert("탈퇴되었습니다");
				
					location.href="/main"//회원일경우 
					
					//관리자의경우
						
				}
			},
			error: function(request, status, error){
				alert("삭제실패 - code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		})
})


//우편번호
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
					document.getElementById("extraaddress").value = extraAddr;

				} else {
					document.getElementById("extraaddress").value = '';
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('postcode').value = data.zonecode;
				document.getElementById("address").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("detailaddress").focus();
			}
		}).open();
	}
</script>

<%@ include file="../layout/footer.jsp"%>