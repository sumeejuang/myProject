<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>

<div class="container">
	<h3>JOIN</h3>
		<div class="form-group">
			<label for="useremail">이메일(ID) : </label>
			<input type="text" class="form-control" id="username"
			placeholder="Enter email" name="useremail"/>
		</div>
		<div class="form-group">
			<label for="userpasswd">비밀번호 : </label>
			<input type="password" class="form-control" id="userpasswd" 
			placeholder="Enter password" name="userpasswd"/>
		</div>
		<div class="form-group">
			<label for="username">이름 : </label>
			<input type="text" class="form-control" id="username"
			placeholder="Enter email" name="username"/>
		</div>
		<div class="inputArea">
		<div class="form-group">
			<label for="postcode">우편번호 : </label>
			<input type="text" class="form-control" id="postcode" 
			placeholder="Enter postcode" name="postcode"/>
		</div>
		<input type="button" class="btn btn-success"
		onclick="execDaumPostcode()" value="우편번호 찾기"/>
		
		<div class="form-group">
			<label for="address">주소 : </label>
			<input type="text" class="form-control" id="address"
			placeholder="Enter address" name="address"/>
		</div>
		<div class="form-group">
			<label for="detailAddress">상세주소 : </label>
			<input type="text" class="form-control" id=detailAddress
			placeholder="Enter address" name="detailAddress"/>
		</div>
		<div class="form-group">
			<label for="extraAddress">주소참조 : </label>
			<input type="text" class="form-control" id="extraAddress"
			placeholder="Enter address" name="extraAddress"/>
		</div>
		<div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
			<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
		</div>
		
		</div>
		
		<button class="btn btn-success" id="btnJoin">회원가입</button> <!-- 버튼타입없을시 submit -->
</div>

	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	 // 우편번호 찾기 찾기 화면을 넣을 element
    var element_wrap = document.getElementById('wrap');

    function foldDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_wrap.style.display = 'none';
    }

    function execDaumPostcode() {
        // 현재 scroll 위치를 저장해놓는다.
        var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

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
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
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

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_wrap.style.display = 'none';

                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                document.body.scrollTop = currentScroll;
            },
            // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
            onresize : function(size) {
                element_wrap.style.height = size.height+'px';
            },
            width : '100%',
            height : '100%'
        }).embed(element_wrap);

        // iframe을 넣은 element를 보이게 한다.
        element_wrap.style.display = 'block';
    }
    
    
		$("#btnJoin").click(function(){
			if($("#useremail").val()==""){
				alert("아이디를 입력하세요")
				$("#useremail").focus()
				return false;
			}
			if($("#userpasswd").val()==""){
				alert("비밀번호를 입력하세요")
				$("#userpasswd").focus()
				return false;
			}
			if($("#username").val()==""){
				alert("이름을 입력하세요")
				$("#username").focus()
				return false;
			}
			var data={
					"username" : $("#username").val(),
					"password" : $("#password").val(),
					"email" : $("#email").val()
			}
			$.ajax({
				type:"POST",
				url:"/register",
				contentType:"application/json;charset=utf-8",
				data:JSON.stringify(data)
			})
			.done(function(resp){
				if(resp=="success"){
					alert("회원가입 성공")
					location.href="/login"
				} else if(resp=="fail"){
					alert("아이디 중복확인")
					 $("#username").val("");
				}
			})
			.fail(function(){
				alert("회원가입 실패")
			})
		})
		
	</script>


<%@ include file="../layout/footer.jsp" %>