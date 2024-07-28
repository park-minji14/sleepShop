<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<style type="text/css">
body {
	background: white;
}

.container-member {
	display: block;
	max-width: 680px;
	width: 80%;
	margin: 120px auto;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
    padding: 30px;
}

h1 {
	font-size: 48px;
	letter-spacing: -3px;
	text-align: center;
	/* margin: 120px 0 80px 0; */
	transition: 0.2s linear;
	font-weight: 900;
}

.links {
	list-style-type: none;
}

.links li {
	display: inline-block;
	margin: 0 20px 0 0;
	transition: 0.2s linear;
}

.links li:nth-child(2) {
	opacity: 0.6;
}

.links li:nth-child(2):hover {
	opacity: 1;
}

.links li:nth-child(3) {
	opacity: 0.6;
	float: right;
}

.links li:nth-child(3):hover {
	opacity: 1;
}

.links li a {
	text-decoration: none;
	color: #0f132a;
	text-align: center;
	cursor: pointer;
}

form {
	width: 100%;
	max-width: 680px;
	margin: 40px auto 10px;
}

form .input__block {
	margin: 20px auto;
	display: block;
	position: relative;
}

form .input__block.first-input__block::before {
	content: "";
	position: absolute;
	top: -15px;
	left: 50px;
	display: block;
	width: 0;
	height: 0;
	background: transparent;
	border-left: 15px solid transparent;
	border-right: 15px solid transparent;
	border-bottom: 15px solid rgba(15, 19, 42, 0.1);
	transition: 0.2s linear;
}

form .input__block.signup-input__block::before {
	content: "";
	position: absolute;
	top: -15px;
	left: 150px;
	display: block;
	width: 0;
	height: 0;
	background: transparent;
	border-left: 15px solid transparent;
	border-right: 15px solid transparent;
	border-bottom: 15px solid rgba(15, 19, 42, 0.1);
	transition: 0.2s linear;
}

form .input__block {
	display: flex;
	gap: 15px;
}

form .input__block input {
	display: block;
	width: 100%;
	max-width: 680px;
	height: 50px;
	border-radius: 8px;
	border: none;
	background: rgba(15, 19, 42, 0.1);
	color: rgba(15, 19, 42, 0.3);
	padding: 0 0 0 15px;
	font-size: 14px;
}

form .input_btn_box .btn_check {
	background: #35c5f0;
	color: white;
	display: block;
	width: 20%;
	max-width: 100px;
	height: 50px;
	border-radius: 8px;
	margin: 0 auto;
	border: none;
	cursor: pointer;
	font-size: 14px;
	box-shadow: 0 15px 30px rgba(0, 150, 136, 0.16);
	transition: 0.2s linear;
}

form .input__block input:focus, form .input__block input:active {
	outline: none;
	border: none;
	color: #0f132a;
}

form .login__btn {
	background: #35c5f0;
	color: white;
	display: block;
	/* width: 92.5%; */
	width: 100%;
	max-width: 680px;
	height: 50px;
	border-radius: 8px;
	margin: 0 auto;
	border: none;
	cursor: pointer;
	font-size: 14px;
	box-shadow: 0 15px 30px rgba(0, 150, 136, 0.16);
	transition: 0.2s linear;
}

form .login__btn:hover {
	box-shadow: 0 0 0 rgba(233, 30, 99, 0);
}

.separator {
	display: block;
	margin: 30px auto 10px;
	text-align: center;
	height: 40px;
	position: relative;
	background: transparent;
	color: rgba(15, 19, 42, 0.4);
	font-size: 13px;
	width: 90%;
	max-width: 680px;
}

.separator::before {
	content: "";
	position: absolute;
	top: 8px;
	left: 0;
	background: rgba(15, 19, 42, 0.2);
	height: 1px;
	width: 45%;
}

.separator::after {
	content: "";
	position: absolute;
	top: 8px;
	right: 0;
	background: rgba(15, 19, 42, 0.2);
	height: 1px;
	width: 45%;
}

.google__btn, .github__btn {
	display: block;
	width: 90%;
	max-width: 680px;
	margin: 20px auto;
	height: 50px;
	cursor: pointer;
	font-size: 14px;
	border-radius: 8px;
	border: none;
	line-height: 40px;
}

.google__btn.google__btn, .github__btn.google__btn {
	background: #5b90f0;
	color: white;
	box-shadow: 0 15px 30px rgba(91, 144, 240, 0.36);
	transition: 0.2s linear;
}

.google__btn.google__btn .fa, .github__btn.google__btn .fa {
	font-size: 20px;
	padding: 0 5px 0 0;
}

.google__btn.google__btn:hover, .github__btn.google__btn:hover {
	box-shadow: 0 0 0 rgba(91, 144, 240, 0);
}

.google__btn.github__btn, .github__btn.github__btn {
	background: #25282d;
	color: white;
	box-shadow: 0 15px 30px rgba(37, 40, 45, 0.36);
	transition: 0.2s linear;
}

.google__btn.github__btn .fa, .github__btn.github__btn .fa {
	font-size: 20px;
	padding: 0 5px 0 0;
}

.google__btn.github__btn:hover, .github__btn.github__btn:hover {
	box-shadow: 0 0 0 rgba(37, 40, 45, 0);
}

footer p {
	text-align: center;
}

footer p .fa {
	color: #e91e63;
}

footer p a {
	text-decoration: none;
	font-size: 17px;
	margin: 0 5px;
}

footer p a .fa-facebook {
	color: #3b5998;
}

footer p a .fa-twitter {
	color: #1da1f2;
}

footer p a .fa-instagram {
	color: #f77737;
}

footer p a .fa-linkedin {
	color: #0077b5;
}

footer p a .fa-behance {
	color: #1769ff;
}

.btn_check {
	background: #35c5f0;
	color: white;
	display: block;
	width: 40%;
	max-width: 680px;
	height: 50px;
	border-radius: 8px;
	margin: 0 auto;
	border: none;
	font-size: 14px;
	box-shadow: 0 15px 30px rgba(0, 150, 136, 0.16);
	transition: 0.2s linear;
}

.btn_check {
	background: #35c5f0;
	color: white;
	display: block;
	width: 40%;
	max-width: 680px;
	height: 50px;
	border-radius: 8px;
	margin: 0 auto;
	border: none;
	font-size: 14px;
	box-shadow: 0 15px 30px rgba(0, 150, 136, 0.16);
	transition: 0.2s linear;
}

#idCheckResult {
	margin-top: 5px;
	font-size: 12px;
	font-weight: 700;
}

.container-mypage {
	max-width: 700px;
	margin-top: 50px;
	background-color: #fff;
	padding: 30px;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h1 {
	margin-bottom: 30px;
}

.form-label {
	font-weight: bold;
}

.btn-primary {
	background-color: #35c5f0;
	border-color: #35c5f0;
}

.btn-primary:hover {
	background-color: #2ba3d0;
	border-color: #2ba3d0;
}

.links {
	margin-bottom: 20px;
}

.links a {
	color: #35c5f0;
	text-decoration: none;
	margin-right: 15px;
}

.links a:hover {
	text-decoration: underline;
}
</style>






<script type="text/javascript">
	function memberOk() {
		const f = document.memberForm;
		let str;

		str = f.userId.value;
		if (!/^[a-z][a-z0-9_]{4,9}$/i.test(str)) {
			alert("아이디를 다시 입력 하세요. ");
			f.userId.focus();
			return;
		}

		let mode = "${mode}";
		if (mode === "member" && f.userIdValid.value === "false") {
			str = "아이디 중복 검사가 실행되지 않았습니다.";
			$("#userId").parent().find(".help-block").html(str);
			f.userId.focus();
			return;
		}

		str = f.userPwd.value;
		if (!/^(?=.*[a-z])(?=.*[!@#$%^*+=-]|.*[0-9]).{5,10}$/i.test(str)) {
			alert("패스워드를 다시 입력 하세요. ");
			f.userPwd.focus();
			return;
		}

		if (str !== f.userPwd2.value) {
			alert("패스워드가 일치하지 않습니다. ");
			f.userPwd.focus();
			return;
		}

		str = f.userName.value;
		if (!/^[가-힣]{2,5}$/.test(str)) {
			alert("이름을 다시 입력하세요. ");
			f.userName.focus();
			return;
		}

		str = f.birth.value;
		if (!str) {
			alert("생년월일를 입력하세요. ");
			f.birth.focus();
			return;
		}

		str = f.tel1.value;
		if (!str) {
			alert("전화번호를 입력하세요. ");
			f.tel1.focus();
			return;
		}

		str = f.tel2.value;
		if (!/^\d{3,4}$/.test(str)) {
			alert("숫자만 가능합니다. ");
			f.tel2.focus();
			return;
		}

		str = f.tel3.value;
		if (!/^\d{4}$/.test(str)) {
			alert("숫자만 가능합니다. ");
			f.tel3.focus();
			return;
		}

		str = f.email1.value.trim();
		if (!str) {
			alert("이메일을 입력하세요. ");
			f.email1.focus();
			return;
		}

		str = f.email2.value.trim();
		if (!str) {
			alert("이메일을 입력하세요. ");
			f.email2.focus();
			return;
		}

		f.action = "${pageContext.request.contextPath}/member/${mode}";
		f.submit();
	}

	function changeEmail() {
		const f = document.memberForm;

		let str = f.selectEmail.value;
		if (str !== "direct") {
			f.email2.value = str;
			f.email2.readOnly = true;
			f.email1.focus();
		} else {
			f.email2.value = "";
			f.email2.readOnly = false;
			f.email1.focus();
		}
	}

	function userIdCheck() {
		// 아이디 중복 검사
		 let userId = $('#userId').val();

		    if (!/^[a-z][a-z0-9_]{4,9}$/i.test(userId)) {
		        let str = '아이디는 5~10자 이내이며, 첫글자는 영문자로 시작해야 합니다.';
		        $('#userId').focus();
		        $('.userId-box').find('.help-block').html(str);
		        return;
		    }

		    let url = '${pageContext.request.contextPath}/member/userIdCheck';

		    // AJAX 요청
		    $.post(url, {userId: userId}, function(data) {
		        let passed = data.passed;

		        if (passed === 'true') {
		            let str = '<span style="color:blue; font-weight: bold;">' + userId + '</span> 아이디는 사용가능 합니다.';
		            $('#userIdValid').html(str);
		            $('input[name="userIdValid"]').val('true');
		        } else {
		            let str = '<span style="color:red; font-weight: bold;">' + userId + '</span> 아이디는 사용할 수 없습니다.';
		            $('#userIdValid').html(str);
		            $('input[name="userIdValid"]').val('false');
		            $('#userId').val('');
		            $('#userId').focus();
		        }
		    }, 'json');
		}
</script>



<div class="container-member">
	<h1 class="text-center">${mode=="member"?"회원가입":"회원 정보 수정"}</h1>
	<div class="links text-center">
		<a href="${pageContext.request.contextPath}/member/login" id="signin">로그인</a>
		<a href="${pageContext.request.contextPath}/member/member" id="signup">회원가입</a> <a href="#" id="reset">RESET</a>
	</div>

	<form name="memberForm" method="post">
		<div class="mb-3 userId-box">
			<label for="userId" class="form-label">아이디</label>
			<div class="input-group">
				<input type="text" name="userId" id="userId" class="form-control"
					value="${dto.userId}" ${mode=="update" ? "readonly" : ""}
					placeholder="아이디">
				<c:if test="${mode=='member'}">
					<button type="button" class="btn btn-outline-secondary"
						onclick="userIdCheck();">아이디중복검사</button>
				</c:if>
			</div>
			<div class="help-block form-text"></div>
			<div id="userIdValid" class="form-text"></div>
		</div>

		<div class="mb-3">
			<label for="userPwd" class="form-label">패스워드</label> <input
				type="password" name="userPwd" id="userPwd" class="form-control"
				autocomplete="off" placeholder="패스워드">
			<div class="form-text">패스워드는 5~10자이며 하나 이상의 숫자나 특수문자가 포함되어야
				합니다.</div>
		</div>

		<div class="mb-3">
			<label for="userPwd2" class="form-label">패스워드 확인</label> <input
				type="password" name="userPwd2" id="userPwd2" class="form-control"
				autocomplete="off" placeholder="패스워드 확인">
			<div class="form-text">패스워드를 한번 더 입력해주세요.</div>
		</div>

		<div class="mb-3">
			<label for="userName" class="form-label">이름</label> <input
				type="text" name="userName" id="userName" class="form-control"
				value="${dto.userName}" ${mode=="update" ? "readonly" : ""}
				placeholder="이름">
		</div>

		<div class="mb-3">
			<label for="birth" class="form-label">생년월일</label> <input type="date"
				name="birth" id="birth" class="form-control" value="${dto.birth}"
				placeholder="생년월일">
			<div class="form-text">생년월일은 2000-01-01 형식으로 입력 합니다.</div>
		</div>

		<div class="mb-3">
			<label class="form-label">이메일</label>
			<div class="input-group">
				<input type="text" name="email1" class="form-control" maxlength="30"
					value="${dto.email1}"> <span class="input-group-text">@</span>
				<select name="selectEmail" id="selectEmail" class="form-select"
					onchange="changeEmail();">
					<option value="">선택</option>
					<option value="naver.com"
						${dto.email2=="naver.com" ? "selected" : ""}>네이버 메일</option>
					<option value="gmail.com"
						${dto.email2=="gmail.com" ? "selected" : ""}>지 메일</option>
					<option value="hanmail.net"
						${dto.email2=="hanmail.net" ? "selected" : ""}>한 메일</option>
					<option value="hotmail.com"
						${dto.email2=="hotmail.com" ? "selected" : ""}>핫 메일</option>
					<option value="direct">직접입력</option>
				</select>
			</div>
			<div class="input-group mt-2">
				<input type="text" name="email2" class="form-control" maxlength="30"
					value="${dto.email2}" readonly>
			</div>
		</div>

		<div class="mb-3">
			<label class="form-label">전화번호</label>
			<div class="input-group">
				<input type="text" name="tel1" id="tel1" class="form-control"
					value="${dto.tel1}" maxlength="3"> <span
					class="input-group-text">-</span> <input type="text" name="tel2"
					id="tel2" class="form-control" value="${dto.tel2}" maxlength="4">
				<span class="input-group-text">-</span> <input type="text"
					name="tel3" id="tel3" class="form-control" value="${dto.tel3}"
					maxlength="4">
			</div>
		</div>

		<div class="mb-3">
			<label for="zip" class="form-label">우편번호</label>
			<div class="input-group">
				<input type="text" name="zip" id="zip" class="form-control"
					placeholder="우편번호" value="${dto.zip}" readonly>
				<button class="btn btn-outline-secondary" type="button"
					onclick="daumPostcode();">우편번호 검색</button>
			</div>
		</div>

		<div class="mb-3">
			<label for="addr1" class="form-label">주소</label> <input type="text"
				name="addr1" id="addr1" class="form-control" placeholder="기본 주소"
				value="${dto.addr1}" readonly>
		</div>

		<div class="mb-3">
			<label for="addr2" class="form-label">상세 주소</label> <input
				type="text" name="addr2" id="addr2" class="form-control"
				placeholder="상세 주소" value="${dto.addr2}">
		</div>

		<c:if test="${mode=='member'}">
			<div class="mb-3 form-check">
				<input type="checkbox" id="agree" name="agree"
					class="form-check-input" checked
					onchange="form.sendButton.disabled = !checked"> <label
					class="form-check-label" for="agree"> <a href="#"
					class="text-decoration-none">이용약관</a>에 동의합니다.
				</label>
			</div>
		</c:if>

		<div class="text-center mt-4">
			<button type="button" name="sendButton" class="btn btn-primary"
				onclick="memberOk();">
				${mode=="member"?"회원가입":"정보수정"} <i class="bi bi-check2"></i>
			</button>
			<button type="button" class="btn btn-danger"
				onclick="location.href='${pageContext.request.contextPath}/';">
				${mode=="member"?"가입취소":"수정취소"} <i class="bi bi-x"></i>
			</button>
		</div>
		<input type="hidden" name="userIdValid" id="userIdValidField"
			value="false">
	</form>

	<p class="text-center mt-3">${message}</p>
</div>




<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	function daumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullAddr = ''; // 최종 주소 변수
						var extraAddr = ''; // 조합형 주소 변수

						// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							fullAddr = data.roadAddress;

						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							fullAddr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
						if (data.userSelectedType === 'R') {
							//법정동명이 있을 경우 추가한다.
							if (data.bname !== '') {
								extraAddr += data.bname;
							}
							// 건물명이 있을 경우 추가한다.
							if (data.buildingName !== '') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
							fullAddr += (extraAddr !== '' ? ' (' + extraAddr
									+ ')' : '');
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('zip').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('addr1').value = fullAddr;

						// 커서를 상세주소 필드로 이동한다.
						document.getElementById('addr2').focus();
					}
				}).open();
	}
</script>