<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<nav class="sidebar">
    <ul class="nav flex-column">
        <li class="nav-item">
            <a class="nav-link active" href="#">프로모션 및 이벤트 관리</a>
        </li>
		<li class="nav-item">
            <a class="nav-link toggleSubMenu" href="#">예시1 <span class="jArrow"></span></a>
            <ul class="nav flex-column submenu">
                <li class="nav-item">
                    <a class="nav-link" href="#">하위 예시1-1</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">하위 예시1-2</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">하위 예시1-3</a>
                </li>
            </ul>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#">예시2</a>
        </li>
		<li class="nav-item">
            <a class="nav-link toggleSubMenu" href="#">예시3 <span class="jArrow"></span></a>
            <ul class="nav flex-column submenu">
                <li class="nav-item">
                    <a class="nav-link" href="#">하위 예시3-1</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">하위 예시3-2</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">하위 예시3-3</a>
                </li>
            </ul>
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