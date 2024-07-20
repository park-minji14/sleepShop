<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<nav class="sidebar">
    <ul class="nav flex-column">
        <li class="nav-item" >
            <a class="nav-link active" href="#">프로모션 및 이벤트 관리</a>
        </li>
		<li class="nav-item" data-category="all">
            <a class="nav-link active" href="${pageContext.request.contextPath}/promotion/main">전체 이벤트</a>
        </li>
        <li class="nav-item" data-category="progress">
            <a class="nav-link" href="#">진행중인 이벤트</a>
        </li>
		<li class="nav-item" data-category="winner">
            <a class="nav-link" href="#">당첨자 발표</a>
        </li>
        <li class="nav-item" data-category="ended">
            <a class="nav-link" href="#">종료된 이벤트</a>
        </li>
        <li class="nav-item" data-category="upcoming">
            <a class="nav-link" href="#">진행 예정인 이벤트</a>
        </li>
    </ul>
</nav>




<script>
$(function() {
    $('.toggleSubMenu').click(function(e) {
        e.preventDefault();
        var $submenu = $(this).next('.submenu');

        // 현재 열린 하위 메뉴를 모두 닫음
        $('.submenu').not($submenu).slideUp();

        // 클릭된 하위 메뉴를 토글
        $submenu.slideToggle();
    });
});
</script>