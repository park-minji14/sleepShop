<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="fixed-header">
    <div class="inner">
        <div class="logo" id="logo">새근새근</div>
        <ul class="main-menu">
            <li onclick="updateSubMenu('쇼핑')">쇼핑</li>
            <li onclick="updateSubMenu('커뮤니티')">커뮤니티</li>
        </ul>
        <div class="search-bar">
            <input type="text" id="searchInput" placeholder="쇼핑 검색">
            <button onclick="performSearch()" class="search-button">
                <i class="bi bi-search"></i>
            </button>
        </div>
        <div class="user-icons">
			<span class="me-4"><img
				src="https://img.icons8.com/fluent-systems-regular/60/000000/like--v1.png"
				alt="좋아요" /></span> <span class="me-4 notification" data-count="2"><img
				src="https://img.icons8.com/fluent-systems-regular/60/000000/appointment-reminders.png"
				alt="알림" /></span> <span class="me-4"><a
				href="${pageContext.request.contextPath}/cart/list"><img
					src="https://img.icons8.com/fluent-systems-regular/60/000000/shopping-cart.png"
					alt="장바구니" /></a></span>
			<c:choose>
				<c:when test="${not empty sessionScope.member}">
					<div class="user-profile">
						<c:choose>
							<c:when test="${sessionScope.member.membership >= 70}">
								<img
									src="https://img.icons8.com/plasticine/100/000000/super-mario.png"
									alt="Admin Profile" class="profile-img"
									style="width: 40px; height: 40px; border-radius: 50%; cursor: pointer;">
							</c:when>
							<c:otherwise>
								<img
									src="https://img.icons8.com/plasticine/100/shoto.png" 
									alt="Profile" class="profile-img"
									style="width: 40px; height: 40px; border-radius: 50%; cursor: pointer;">
							</c:otherwise>
						</c:choose>
						<div class="profile-menu" style="display: none;">
							<div class="profile-header">
								<span class="user-name">${sessionScope.member.userName}</span> <img
									src="https://img.icons8.com/ios/50/000000/bell.png"
									alt="Notifications" class="notification-icon"
									style="width: 24px; height: 24px;">
							</div>
							<c:choose>
								<c:when test="${sessionScope.member.membership >= 51}">
									<ul class="menu-list">
										<li><a href="${pageContext.request.contextPath}/admin"
											style="text-decoration: none; color: inherit;"> <img
												src="https://img.icons8.com/color/48/000000/dashboard.png"
												alt="대시보드" style="width: 20px; height: 20px;"> 대시보드
										</a></li>
										<li><a
											href="${pageContext.request.contextPath}/adminManagement/supportManage/inquiryList"
											style="text-decoration: none; color: inherit;"> <img
												src="https://img.icons8.com/color/48/000000/product.png"
												alt="상품 관리" style="width: 20px; height: 20px;"> 상품 관리
										</a></li>
										<li><a
											href="${pageContext.request.contextPath}/adminManagement/orderManage/order"
											style="text-decoration: none; color: inherit;"> <img
												src="https://img.icons8.com/color/48/000000/purchase-order.png"
												alt="주문 관리" style="width: 20px; height: 20px;"> 주문 관리
										</a></li>
									</ul>
								</c:when>
								<c:otherwise>
									<div class="user-stats">
										<span>쿠폰 <strong></strong>개
										</span> <span>포인트 <strong></strong>원
										</span>
									</div>
									<ul class="menu-list">
										<li><a
											href="${pageContext.request.contextPath}/mypage/main"
											style="text-decoration: none; color: inherit;"> <img
												src="https://img.icons8.com/ios/50/000000/like.png"
												alt="마이페이지" style="width: 20px; height: 20px;"> 마이페이지
										</a></li>
										<li><a
											href="${pageContext.request.contextPath}/mypage/myshop"
											style="text-decoration: none; color: inherit;"> <img
												src="https://img.icons8.com/ios/50/000000/purchase-order.png"
												alt="구매 내역" style="width: 20px; height: 20px;"> 구매 내역
										</a></li>
										<li><a
											src="https://img.icons8.com/ios/50/000000/settings.png"
											alt="설정" style="text-decoration: none; color: inherit;">
												설정</a></li>
									</ul>
								</c:otherwise>
							</c:choose>
							<div class="footer-links">
								<a href="${pageContext.request.contextPath}/member/logout">로그아웃</a>
								<a href="#">고객센터 ></a>
							</div>
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<button id="loginBtn" class="login-btn">로그인</button>
				</c:otherwise>
			</c:choose>
		</div>
	</div>

	<nav class="fixed-nav">
		<div class="inner">
			<ul class="sub-menu" id="subMenu">
				<!--서브메뉴 자바스크립트로 동적 생성 -->
			</ul>
		</div>
	</nav>

	<div class="popular-search-container">
		<div class="popular-search">
			<span id="popularSearchText"></span>
			<button class="popular-search-btn" onclick="togglePopularSearch()">▼</button>
			<div class="popular-search-content" id="popularSearchContent">
				<div class="popular-search-header">
					<span>인기 검색어</span>
					<button class="close-btn" onclick="togglePopularSearch()">▲</button>
				</div>
				<ul class="popular-search-list">
					<li><span>1. 메모리폼 베개</span><span class="new">NEW</span></li>
					<li><span>2. 숙면 매트리스</span><span class="new">NEW</span></li>
					<li><span>3. 수면등</span><span class="new">NEW</span></li>
					<li><span>4. 릴렉스 체어</span><span class="new">NEW</span></li>
					<li><span>5. 수면 음료</span></li>
					<li><span>6. 아로마 디퓨저</span></li>
					<li><span>7. 블랙아웃 커튼</span><span class="new">NEW</span></li>
					<li><span>8. 수면 보조제</span></li>
					<li><span>9. 릴렉스 오일</span></li>
                </ul>
            </div>
        </div>
    </div>
</div>


<script>
function activateMenuBasedOnURL() {
 var currentPath = window.location.pathname;
 var category = '쇼핑'; // 기본값
 var submenu = '쇼핑홈'; // 기본값

 // URL 경로에 따라 카테고리와 서브메뉴 설정
 if (currentPath.includes('/clinic')) {
     category = '커뮤니티';
     submenu = '수면클리닉';
 } else if (currentPath.includes('/notice')) {
     category = '커뮤니티';
     submenu = '공지사항';
 } else if (currentPath.includes('/faq')) {
     category = '커뮤니티';
     submenu = 'FAQ';
 } else if (currentPath.includes('/event')) {
     category = '커뮤니티';
     submenu = '이벤트';
 } else if (currentPath.includes('/category')) {
     category = '쇼핑';
     submenu = '카테고리';
 }

 // 메뉴 업데이트 및 세션 스토리지에 저장
 updateSubMenu(category, submenu);
 sessionStorage.setItem('activeCategory', category);
 sessionStorage.setItem('activeSubmenu', submenu);
}

//인기 검색어 업데이트 함수
function updatePopularSearch() {
 const $popularSearchText = $('#popularSearchText');
 const $popularSearchList = $('.popular-search-list li');
 let popularSearchIndex = 0;

 if ($popularSearchList.length > 0) {
     const $currentItem = $popularSearchList.eq(popularSearchIndex);
     const itemText = $currentItem.find('span:first').text();
     $popularSearchText.html(itemText);
     popularSearchIndex = (popularSearchIndex + 1) % $popularSearchList.length;
 }
}

//서브메뉴 업데이트 함수
//선택된 카테고리에 따라 서브메뉴가 변경됨
function updateSubMenu(category, activeSubmenu = null) {
 
 // 서브메뉴 아이템 정의
 const subMenuItems = {
     '쇼핑': [
         {text: '쇼핑홈', url: '${pageContext.request.contextPath}/'}, 
         {text: '카테고리', url: '${pageContext.request.contextPath}/'}, 
         {text: '베스트', url: '${pageContext.request.contextPath}/'},
         {text: '오늘의딜', url: '${pageContext.request.contextPath}/'}, 
         {text: '빠른배송', url: '${pageContext.request.contextPath}/'}, 
         {text: '기획전', url: '${pageContext.request.contextPath}/'}
     ],
     '커뮤니티': [
         {text: '홈', url: '${pageContext.request.contextPath}/'}, 
         {text: '수면클리닉', url: '${pageContext.request.contextPath}/clinic/list'}, 
         {text: '공지사항', url: '${pageContext.request.contextPath}/'}, 
         {text: 'FAQ', url: '${pageContext.request.contextPath}/faq/list'}, 
         {text: '이벤트', url: '${pageContext.request.contextPath}/promotion/progress/list'}
     ]
 };

 const $subMenu = $('#subMenu');
 $subMenu.empty();

 // 메인 메뉴 활성화 상태 업데이트
 $('.main-menu li').removeClass('active');
 $(`.main-menu li`).filter(function() {
     return $(this).text().trim() === category;
 }).addClass('active');


 // 서브메뉴 항목 생성 및 추가
 $.each(subMenuItems[category], function(index, item) {
     const $li = $('<li>').appendTo($subMenu);
     const $a = $('<a>').attr('href', item.url).text(item.text).appendTo($li);

     if (activeSubmenu && item.text === activeSubmenu) {
         $li.addClass('active');
     }
 });

 // 서브메뉴 클릭 이벤트 처리
 $subMenu.off('click').on('click', 'li', function(e) {
     e.preventDefault();
     $subMenu.find('li').removeClass('active');
     $(this).addClass('active');
     const url = $(this).find('a').attr('href');
     const submenuText = $(this).text().trim();
     
     const currentCategory = $('.main-menu li.active').text().trim();
     console.log("Current category:", currentCategory);
     
     sessionStorage.setItem('activeCategory', currentCategory);
     sessionStorage.setItem('activeSubmenu', submenuText);
     
     window.location.href = url;
 });
}

//검색 수행 함수
function performSearch() {
 var searchTerm = document.getElementById('searchInput').value;
 var searchUrl = '${pageContext.request.contextPath}/product/search?searchTerm=' + searchTerm;
 window.location.href = searchUrl;
}

//인기 검색어 토글 함수
function togglePopularSearch() {
 $('#popularSearchContent').toggleClass('active');
}

//-----------------document이벤트 시작-----------------//

$(document).ready(function() {
 // 로그인 버튼 클릭 이벤트
 $('#loginBtn').on('click', function() {
     window.location.href = '${pageContext.request.contextPath}/member/login';
 });
 
 // 페이지 로드 시 URL 기반 메뉴 활성화
 activateMenuBasedOnURL();

 // 로고 클릭 이벤트
 $('#logo').on('click', function(e) {
     e.preventDefault();
     updateSubMenu('쇼핑', '쇼핑홈');
     sessionStorage.setItem('activeCategory', '쇼핑');
     sessionStorage.setItem('activeSubmenu', '쇼핑홈');
     window.location.href = '${pageContext.request.contextPath}';
 });

 // 메인 메뉴 클릭 이벤트
 $('.main-menu li').on('click', function(e) {
     e.preventDefault();
     const category = $(this).text().trim();
     updateSubMenu(category);
 });

 // 검색창 외부 클릭 시 검색창 닫기
 $(document).on('click', function(event) {
     const $popularSearchContent = $('#popularSearchContent');
     const $popularSearchButton = $('.popular-search-btn');
     const $closeButton = $('.close-btn');
     if (!$popularSearchContent.is(event.target) &&
         !$popularSearchButton.is(event.target) &&
         !$closeButton.is(event.target) &&
         $popularSearchContent.has(event.target).length === 0) {
         $popularSearchContent.removeClass('active');
     }
 });

 // 프로필 메뉴 토글 기능
 const $profileImg = $('.profile-img');
 const $profileMenu = $('.profile-menu');

 $profileImg.click(function(event) {
     event.stopPropagation();
     $profileMenu.toggle();
 });

 $(document).click(function(event) {
     if (!$(event.target).closest('.profile-menu').length && !$(event.target).is('.profile-img')) {
         $profileMenu.hide();
     }
 });

 // 인기 검색어 업데이트 시작
 updatePopularSearch();
 setInterval(updatePopularSearch, 3000);
 
 
//----------------------북마크 함수 -----------------//
 
});
</script>