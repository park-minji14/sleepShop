<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<nav class="sidebar">
    <ul class="tabs nav flex-column">
        <li class="nav-item" >
            <a class="nav-link active">프로모션 및 이벤트 관리</a>
        </li>
		<li id="tab-all" class="nav-item" data-category="all">
            <a class="nav-link">전체 이벤트</a>
        </li> 
        <li id="tab-progress" class="nav-item" data-category="progress">
            <a class="nav-link">진행중인 이벤트</a>
        </li>
		<li id="tab-winner" class="nav-item" data-category="winner">
            <a class="nav-link">당첨자 발표</a>
        </li>
        <li id="tab-ended" class="nav-item" data-category="ended">
            <a class="nav-link">종료된 이벤트</a>
        </li>
        <li id="tab-upcoming" class="nav-item" data-category="upcoming">
            <a class="nav-link">진행 예정인 이벤트</a>
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


$(function(){
	$('#tab-${category}').addClass('active');
 
	$('ul.tabs li').click(function() {
		let category = $(this).attr('data-category');
		
		
		location.href = '${pageContext.request.contextPath}/adminManagement/promotionManage/'+category+'/list';
	});
});

</script>