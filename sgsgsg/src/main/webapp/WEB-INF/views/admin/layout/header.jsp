<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
body {
    font-family: 'Pretendard-Regular', sans-serif;
   /*  background-color: #f8f9fa; */
}

/* 헤더 부분 꾸미기 */
.admin-header {
    background-color: #3949ab;
    color: white;
    padding: 10px 20px;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.logo-text {
    font-size: 24px;
    font-weight: bold;
    color: #fff;
    margin: 0;
}

/* 헤더 정보랑 버튼들 */
.header-info, .header-actions {
    display: flex;
    align-items: center;
    gap: 15px;
}


.search-bar {
    width: 100%;
    padding: 8px 15px 8px 35px;
    border-radius: 20px;
    border: none;
    font-size: 14px;
}

.search-icon {
    position: absolute;
    left: 15px;
    top: 50%;
    transform: translateY(-50%);
    color: #666;
}

/* 알림 아이콘 꾸미기 */
.notifications {
    position: relative;
}

.notification-count {
    position: absolute;
    top: -5px;
    right: -5px;
    background-color: #ffc107;
    color: black;
    border-radius: 50%;
    padding: 2px 5px;
    font-size: 12px;
}

/* 관리자 프로필 부분 */
.admin-profile {
    display: flex;
    align-items: center;
    gap: 5px;
}

.admin-name {
    font-size: 14px;
}

/* 네비게이션 바 스타일링 */
.navbar-custom {
    background-color: #3949ab;
    padding: 0;
}

.navbar-custom .navbar-brand,
.navbar-custom .nav-link {
    color: white;
    padding: 1rem;
}

.navbar-custom .nav-link:hover,
.navbar-custom .nav-link.active {
    background-color: rgba(255,255,255,0.1);
}
</style>

<header class="admin-header">
    <h1 class="logo-text">새근새근</h1>
    <div class="header-info">
        오늘: n명, 어제: n명, 최대: 739, 전체: 5000명
    </div>
    <div class="header-actions">
        <div class="notifications">
            <i class="bi bi-bell fs-4"></i>
            <span class="notification-count">3</span>
        </div>
        <div class="admin-profile">
            <i class="bi bi-person-circle fs-4"></i>
            <span class="admin-name">관리자명</span>
        </div>
        <a href="${pageContext.request.contextPath}/" class="btn btn-outline-light btn-sm">쇼핑몰</a>
        <a href="${pageContext.request.contextPath}/member/logout" class="btn btn-danger btn-sm">로그아웃</a>
    </div>
</header>

<!-- 하단 네비게이션 바 -->
<nav class="navbar navbar-expand-lg navbar-custom">
    <div class="container-fluid">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/admin">관리자 화면</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/adminManagement/productManage/productList">
                        <img src="https://img.icons8.com/ios/24/ffffff/product.png" alt="상품관리" class="me-1">
                        상품관리
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/adminManagement/orderManage/order">
                        <img src="https://img.icons8.com/ios/24/ffffff/purchase-order.png" alt="주문관리" class="me-1">
                        주문 및 배송 관리
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/adminManagement/supportManage/supportList">
                        <img src="https://img.icons8.com/ios/24/ffffff/customer-support.png" alt="고객센터" class="me-1">
                        고객센터
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/adminManagement/memberManage/list">
                        <img src="https://img.icons8.com/ios/24/ffffff/user-group-man-man.png" alt="회원관리" class="me-1">
                        회원관리
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/adminManagement/promotionManage/list">
                        <img src="https://img.icons8.com/ios/24/ffffff/gift.png" alt="프로모션" class="me-1">
                        프로모션 및 이벤트
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<script>
$(document).ready(function() {
    var currentPath = window.location.pathname;
    $('.nav-link').each(function() {
        if (currentPath.includes($(this).attr('href'))) {
            $(this).addClass('active');
        }
    });
});
$(function() {
	const f = $("form[name='searchForm'] input[name='kwd']");
	f.keydown(function(e) {
		if(e.key==='Enter' && f.val().trim()){
			f.closest("form").submit();
		}
	});
});
</script>