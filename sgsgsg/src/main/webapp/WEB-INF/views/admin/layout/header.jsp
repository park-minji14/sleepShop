<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.navbar-custom {
    background-color: #3a3f44;
}
.navbar-custom .navbar-nav .nav-link {
    color: white;
}
.navbar-custom .navbar-nav .nav-link.active {
    background-color: #ffffff;
    color: #000000;
}
.navbar-custom .navbar-brand {
    color: white;
}
.navbar-custom .nav-item .logout {
    color: red;
}
.info-bar {
    background-color: #343a40;
    color: white;
    padding: 10px;
    font-size: 0.9em;
}
.info-bar .info-item {
    margin-right: 15px;
}
.navbar-collapse {
    justify-content: space-between;
}

.navbar-nav .nav-item.active {
    background-color: #ffffff;
}
.navbar-nav .nav-item.active .nav-link {
    color: #000000;
}
</style>

<!-- 최상단 정보 바 -->
<div class="info-bar d-flex justify-content-end">
    <div class="info-item">새근새근</div>
    <div class="info-item">오늘: n명, 어제: n명, 최대: 739, 전체: 5000명</div>
    <div class="info-item"><a href="${pageContext.request.contextPath}/">쇼핑몰</a></div>
    <div class="info-item logout"><a href="${pageContext.request.contextPath}/member/logout">로그아웃</a></div>
</div>

<!-- 하단 네비게이션 바 -->
<nav class="navbar navbar-expand-lg navbar-custom">
    <div class="container-fluid">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/admin">관리자 화면</a>
        <button class="navbar-toggler" type="button">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
               <li class="nav-item">
                   <a class="nav-link" href="${pageContext.request.contextPath}/adminManagement/productManage/productList" onclick="setActive(event)">상품관리</a>
               </li>
               <li class="nav-item">
                   <a class="nav-link" href="${pageContext.request.contextPath}/adminManagement/orderManage/main" onclick="setActive(event)">주문 및 배송 관리</a>
               </li>
               <li class="nav-item">
                   <a class="nav-link" href="#" onclick="setActive(event)">고객센터</a>
               </li>
               <li class="nav-item">
                   <a class="nav-link" href="${pageContext.request.contextPath}/adminManagement/memberManage/list" onclick="setActive(event)">회원관리</a>
               </li>
               <li class="nav-item">
                   <a class="nav-link" href="${pageContext.request.contextPath}/adminManagement/promotionManage/main" onclick="setActive(event)">프로모션 및 이벤트</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<script>
function setActive(event) {
    var items = document.querySelectorAll('.navbar-nav .nav-item');
    items.forEach(function(item) {
        item.classList.remove('active');
    });
    event.target.closest('.nav-item').classList.add('active');
}
</script>