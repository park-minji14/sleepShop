<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<div class="fixed-header">
	<div class="inner">
		<div class="logo" id="logo">새근새근</div>
		<ul class="main-menu">
			<li onclick="updateSubMenu('쇼핑')">쇼핑</li>
			<li class="active" onclick="updateSubMenu('커뮤니티')">커뮤니티</li>
		</ul>
		<div class="search-bar">
			<i class="bi bi-search"></i> <input type="text" placeholder="쇼핑 검색">
		</div>
		<div class="user-icons">
			<span class="me-3"><img
				src="https://img.icons8.com/fluency/24/like.png" alt="좋아요" /></span> <span
				class="me-3"><img
				src="https://img.icons8.com/fluency/24/appointment-reminders.png"
				alt="알림" /></span> <span class="me-3"><img
				src="https://img.icons8.com/fluency/24/shopping-cart.png" alt="장바구니" /></span>
			<c:choose>
				<c:when test="${not empty sessionScope.member}">
					<button id="loginStatusBtn" class="login-btn login-success-btn">로그인
						성공</button>
				</c:when>
				<c:otherwise>
					<button id="loginBtn" class="login-btn btn-outline-primary">로그인</button>
				</c:otherwise>
			</c:choose>
		</div>
	</div>

	<nav class="fixed-nav">
		<div class="inner">
			<ul class="sub-menu" id="subMenu">
				<li class="active">홈</li>
				<li>수면클리닉</li>
				<li>질문과답변</li>
				<li>이벤트</li>
				<li class="sub-menu-search">
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
								<li><span>10. 무드등</span></li>
							</ul>
						</div>
					</div>
				</li>
			</ul>
		</div>
	</nav>
</div>

	<script type="text/javascript">
	
//로그인
$(document).ready(function() {
$('#loginBtn').on('click',function() {
window.location.href = '${pageContext.request.contextPath}/member/login';
});


// 로그인 상태 확인 및 버튼 업데이트
function updateLoginStatus() {
	$.ajax({url : '${pageContext.request.contextPath}/member/checkLoginStatus',
				method : 'GET',
				success : function(response) {
					if (response.loggedIn) {
					$('#loginBtn').replaceWith('<button id="loginStatusBtn" class="login-btn login-success-btn">로그인 성공</button>');
				}
			}
		});
}

	// 페이지 로드 시 로그인 상태 확인
	updateLoginStatus();
});

//로고 클릭하면 home으로감 
$(document).ready(function() {
	$('#logo').on('click', function() {
		window.location.href = '${pageContext.request.contextPath}';
	});
});

$(document).ready(function() {
	// 초기 서브메뉴 설정을 '쇼핑'으로 변경
	updateSubMenu('쇼핑');

	// 메인 메뉴의 첫 번째 항목(쇼핑)을 활성화
	$('.main-menu li:first-child').addClass('active');

	// 메인 메뉴 클릭 이벤트
	$('.main-menu li').on('click', function() {
		$('.main-menu li').removeClass('active');
		$(this).addClass('active');
		updateSubMenu($(this).text());
	});
});

//여기에 링크첨부,,,
function updateSubMenu(category) {
	const subMenuItems = {
		'쇼핑' : [ {text : '쇼핑홈',url : '${pageContext.request.contextPath}/'}, 
			{text : '카테고리',url : '${pageContext.request.contextPath}/'}, 
			{text : '베스트',url : '${pageContext.request.contextPath}/'},
			{text : '오늘의딜',url : '${pageContext.request.contextPath}/'}, 
			{text : '빠른배송',url : '${pageContext.request.contextPath}/'}, 
			{text : '기획전',url : '${pageContext.request.contextPath}/'}],
		'커뮤니티' : [ {
			text : '홈',
			url : '${pageContext.request.contextPath}/'
		}, {
			text : '수면클리닉',
			url : '${pageContext.request.contextPath}/'
		}, {
			text : '질문과답변',
			url : '${pageContext.request.contextPath}/'
		}, {
			text : '이벤트',
			url : '${pageContext.request.contextPath}/'
		} ]
	};

	const $subMenu = $('#subMenu');
	$subMenu.empty();

	$.each(subMenuItems[category], function(index, item) {
		const $li = $('<li>').appendTo($subMenu);
		const $a = $('<a>').attr('href', item.url).text(item.text)
				.appendTo($li);

		if (index === 0) {
			$li.addClass('active');
		}

		$a.on('click', function(e) {
			e.preventDefault();
			window.location.href = $(this).attr('href');
		});
	});

	$subMenu.on('click', 'li', function() {
		$subMenu.find('li').removeClass('active');
		$(this).addClass('active');
	});
}

// 검색어
function togglePopularSearch() {
	$('#popularSearchContent').toggleClass('active');
}

// 검색어 순위
const $popularSearchText = $('#popularSearchText');
const $popularSearchList = $('.popular-search-list li');
let popularSearchIndex = 0;

function updatePopularSearch() {
	if ($popularSearchList.length > 0) {
		const $currentItem = $popularSearchList.eq(popularSearchIndex);
		const itemText = $currentItem.find('span:first').text();
		$popularSearchText.html(itemText);
		popularSearchIndex = (popularSearchIndex + 1)
				% $popularSearchList.length;
	}
}

setInterval(updatePopularSearch, 3000);
updatePopularSearch();

// 검색창 외부 클릭 시 닫기
$(document)
		.on(
				'click',
				function(event) {
					const $popularSearchContent = $('#popularSearchContent');
					const $popularSearchButton = $('.popular-search-btn');
					const $closeButton = $('.close-btn');
					if (!$popularSearchContent.is(event.target)
							&& !$popularSearchButton.is(event.target)
							&& !$closeButton.is(event.target)
							&& $popularSearchContent.has(event.target).length === 0) {
						$popularSearchContent.removeClass('active');
					}
				});
	</script>