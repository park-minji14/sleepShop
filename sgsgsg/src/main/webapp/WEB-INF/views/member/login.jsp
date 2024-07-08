<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
body {
	background: white;
}

.container {
	display: block;
	max-width: 680px;
	width: 80%;
	margin: 120px auto;
}

h1 {
	color: #35c5f0;
	font-size: 48px;
	letter-spacing: -3px;
	text-align: center;
	margin: 120px 0 80px 0;
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
</style>

<script type="text/javascript">
//로그인
function sendLogin() {
	const f = document.loginForm;
	let str;

	str = f.userId.value;
	if (!str) {
		alert("아이디를 입력하세요.");
		f.userId.focus();
		return;
	}

	str = f.userPwd.value;
	if (!str) {
		alert("비밀번호를 입력하세요.");
		f.userPwd.focus();
		return;
	}

	f.action = "${pageContext.request.contextPath}/member/login";
	f.submit();
}

</script>


	<div class="container">
		<h1>SIGN IN</h1>
		<ul class="links">
			<li><a href="#" id="signin">로그인</a></li>
			<li><a href="${pageContext.request.contextPath}/member/member" id="signup">회원가입</a></li>
			<li><a href="#" id="reset">RESET</a></li>
		</ul>


		<!-- 로그인 -->
		<form name="loginForm" id="loginForm" action="" method="post">
			<!-- 아이디 -->
			<div class="first-input input__block">
				<input type="text" name="userId" placeholder="아이디" class="input"
					id="userId" value="">
			</div>
			<!-- 비밀번호  -->
			<div class="input__block">
				<input type="password" name="userPwd" placeholder="비밀번호"
					class="input" id="userPwd" value="">
			</div>
			<!-- 비밀번호 유무 -->
			<p class="form-control-plaintext text-center">${message}</p>
			<button class="login__btn" type="button" onclick="sendLogin();">로그인</button>
		</form>
	</div>

	
	
	
<script type="text/javascript">
function sendLogin() {
	const f = document.loginForm;
	let str;
	
	str = f.userId.value.trim();
    if(!str) {
        f.userId.focus();
        return;
    }

    str = f.userPwd.value.trim();
    if(!str) {
        f.userPwd.focus();
        return;
    }
	f.action = "${pageContext.request.contextPath}/member/login";
	f.submit();
}

function sendSignup() {
    window.location.href = "${pageContext.request.contextPath}/member/member";
}

$(document).ready(function(){
    let signup = $(".links").find("li").find("#signup") ; 
    let signin = $(".links").find("li").find("#signin") ;
    let reset  = $(".links").find("li").find("#reset"); 
    let first_input = $("form").find(".first-input");
    let hidden_input = $("form").find(".input__block").find("#repeat_password");
    let signin_btn  = $("form").find(".login__btn");
  
    //----------- sign up ---------------------
    signup.on("click",function(e){
      e.preventDefault();
      sendSignup();
    });
    
  
   //----------- sign in ---------------------
   signin.on("click",function(e){
      e.preventDefault();
      $(this).parent().parent().siblings("h1").text("SIGN IN");
      $(this).parent().css("opacity","1");
      $(this).parent().siblings().css("opacity",".6");
      first_input.addClass("first-input__block")
        .removeClass("signup-input__block");
      hidden_input.css({
        "opacity" : "0",
        "display" : "none"
      });
      signin_btn.text("Sign in");
    });
   
   //----------- reset ---------------------
   reset.on("click",function(e){
     e.preventDefault();
     $(this).parent().parent().siblings("form")
     .find(".input__block").find(".input").val("");
   })
});


</script>
