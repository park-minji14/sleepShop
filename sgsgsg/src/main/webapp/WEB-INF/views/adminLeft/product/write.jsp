<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript">
//상품등록
function sendLogin() {
	const f = document.productSubmitForm;
	let str;

/* 	str = f.userId.value;
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
	} */

	f.action = "${pageContext.request.contextPath}/adminManagement/productManage/write";
	f.submit();
}

</script>

<div class="unique-main-content">
	<form name="productSubmitForm" id="productSubmitForm" method="post" action="">
		
	</form>
</div>