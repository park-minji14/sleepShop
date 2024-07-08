<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title><tiles:insertAttribute name="title"/></title>
	<link rel="icon" href="data:;base64,iVBORw0KGgo=">
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/jquery/css/jquery-ui.min.css" type="text/css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.5.2/css/all.css">
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/forms.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/paginate.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mySideBar.css" type="text/css">
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/jquery/js/jquery.min.js"></script>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/util-jquery.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.3/js/bootstrap.min.js"></script>
	<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.3/css/bootstrap.min.css" rel="stylesheet">
	<!-- 안쓰는거라서 숨겼음 -->
	<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/menu2.js"></script> --%>
</head>

<body>
<header>
	<tiles:insertAttribute name="header"/>
</header>

<div class="unique-container-fluid">
	<aside class="unique-sidebar">
		<tiles:insertAttribute name="left"/>
	</aside>
	
	<main class="unique-main-content">
		<tiles:insertAttribute name="body"/>
	</main>
</div>

<div id="loadingLayout" style="display:none; position: absolute; left: 0; top:0; width: 100%; height: 100%; z-index: 9000; background: #eee;">
	<div class="loader"></div>
</div>
<!-- Bootstrap JS -->

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.11.6/umd/popper.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.3/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/jquery/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/jquery/js/jquery.ui.datepicker-ko.js"></script>

</body>
</html>