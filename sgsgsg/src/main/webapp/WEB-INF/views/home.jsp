<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- CSS: 메인전용 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/page/main.css"
	type="text/css">


<div class="main-content">
	<section class="main-banner">
		<div class="swiper-container">
			<div class="swiper-wrapper">
				<div class="swiper-slide">
					<img
						src="${pageContext.request.contextPath}/uploads/etc/banner.png"
						alt="프로모션 배너 1">
				</div>
				<div class="swiper-slide">
					<img
						src="${pageContext.request.contextPath}/uploads/etc/banner4.png"
						alt="프로모션 배너 2">
				</div>
				<div class="swiper-slide">
					<img
						src="${pageContext.request.contextPath}/uploads/etc/banner3.png"
						alt="프로모션 배너 3">
				</div>
			</div>
			<div class="swiper-pagination"></div>
			<div class="swiper-button-next"></div>
			<div class="swiper-button-prev"></div>
		</div>
	</section>
	</div>
<!-- 카테고리 섹션 -->
<section class="category-section">
    <div class="inner">
        <h2>카테고리</h2>
        <div class="category-list">
            <c:forEach var="category" items="${categoryList}">
                <div class="category-item">
					<a href="${pageContext.request.contextPath}/product/category?categoryNum=${category.categoryNum}">
					    <img src="${pageContext.request.contextPath}/uploads/icon/${category.categoryImage}" alt="${category.categoryName}">
					    <p>${category.categoryName}</p>
					</a>
                </div>
            </c:forEach>
        </div>
    </div>
</section>
<section class="best-sellers-section">
    <div class="container">
        <h2 class="best-sellers-title mb-4">고객 추천 상품</h2>
        <div class="swiper best-sellers-slider">
            <div class="swiper-wrapper">
                <div class="swiper-slide">
                    <div class="best-seller-item">
                        <img src="${pageContext.request.contextPath}/uploads/product/150.png" alt="메모리폼 베개" class="best-seller-img">
                        <p class="best-seller-name">메모리폼 숙면 베개</p>
                        <p class="best-seller-price">29,900원</p>
                    </div>
                </div>
                <div class="swiper-slide">
                    <div class="best-seller-item">
                        <img src="${pageContext.request.contextPath}/uploads/product/300.png" alt="가습기" class="best-seller-img">
                        <p class="best-seller-name">초음파 가습기</p>
                        <p class="best-seller-price">35,000원</p>
                    </div>
                </div>
                <div class="swiper-slide">
                    <div class="best-seller-item">
                        <img src="${pageContext.request.contextPath}/uploads/product/300.png" alt="숙면 조명" class="best-seller-img">
                        <p class="best-seller-name">숙면 유도 조명</p>
                        <p class="best-seller-price">45,000원</p>
                    </div>
                </div>
					<div class="swiper-slide">
						<div class="best-seller-item">
							<img
								src="${pageContext.request.contextPath}/uploads/product/300.png"
								alt="메모리폼 베개" class="best-seller-img">
							<p class="best-seller-name">메모리폼 숙면 베개</p>
							<p class="best-seller-price">29,900원</p>
						</div>
					</div>
					<div class="swiper-slide">
						<div class="best-seller-item">
							<img
								src="${pageContext.request.contextPath}/uploads/product/300.png"
								alt="수면 안대" class="best-seller-img">
							<p class="best-seller-name">수면 안대</p>
							<p class="best-seller-price">12,000원</p>
						</div>
					</div>
				</div>
            <div class="swiper-scrollbar"></div>
        </div>
    </div>
</section>


	<section class="recommended-products">
		<div class="inner">
			<h2>추천 상품</h2>
			<div class="product-slider">
				<button class="product-nav prev" onclick="slideProducts(-1)">&#10094;</button>
				<div class="product-list" id="productList">
					<div class="product-item">
						<div class="wishlist-btn">
							<i class="bi bi-heart"></i>
						</div>
						<img
							src="${pageContext.request.contextPath}/uploads/product/150.png"
							alt="메모리폼 베개">
						<p>메모리폼 숙면 베개</p>
						<p>29,900원</p>
					</div>
					<div class="product-item">
						<div class="wishlist-btn">
							<i class="bi bi-heart"></i>
						</div>
						<img
							src="${pageContext.request.contextPath}/uploads/product/150.png"
							alt="가습기">
						<p>초음파 가습기</p>
						<p>35,000원</p>
					</div>
					<div class="product-item">
						<div class="wishlist-btn">
							<i class="bi bi-heart"></i>
						</div>
						<img
							src="${pageContext.request.contextPath}/uploads/product/150.png"
							alt="숙면 조명">
						<p>숙면 유도 조명</p>
						<p>45,000원</p>
					</div>
					<div class="product-item">
						<div class="wishlist-btn">
							<i class="bi bi-heart"></i>
						</div>
						<img
							src="${pageContext.request.contextPath}/uploads/product/150.png"
							alt="아로마 디퓨저">
						<p>아로마 테라피 디퓨저</p>
						<p>22,000원</p>
					</div>
					<div class="product-item">
						<div class="wishlist-btn">
							<i class="bi bi-heart"></i>
						</div>
						<img
							src="${pageContext.request.contextPath}/uploads/product/150.png"
							alt="수면 마스크">
						<p>수면 안대</p>
						<p>12,000원</p>
					</div>
					<div class="product-item">
						<div class="wishlist-btn">
							<i class="bi bi-heart"></i>
						</div>
						<img
							src="${pageContext.request.contextPath}/uploads/product/150.png"
							alt="숙면 매트리스">
						<p>럭셔리 숙면 매트리스</p>
						<p>220,000원</p>
					</div>
					<div class="product-item">
						<div class="wishlist-btn">
							<i class="bi bi-heart"></i>
						</div>
						<img
							src="${pageContext.request.contextPath}/uploads/product/150.png"
							alt="온열 담요">
						<p>온열 담요</p>
						<p>55,000원</p>
					</div>
					<div class="product-item">
						<div class="wishlist-btn">
							<i class="bi bi-heart"></i>
						</div>
						<img
							src="${pageContext.request.contextPath}/uploads/product/150.png"
							alt="숙면 차">
						<p>숙면 유도 차 세트</p>
						<p>18,000원</p>
					</div>
					<div class="product-item">
						<div class="wishlist-btn">
							<i class="bi bi-heart"></i>
						</div>
						<img
							src="${pageContext.request.contextPath}/uploads/product/150.png"
							alt="차분한 음악 기기">
						<p>차분한 음악 재생기</p>
						<p>75,000원</p>
					</div>
					<div class="product-item">
						<div class="wishlist-btn">
							<i class="bi bi-heart"></i>
						</div>
						<img
							src="${pageContext.request.contextPath}/uploads/product/150.png"
							alt="잠옷 세트">
						<p>편안한 잠옷 세트</p>
						<p>40,000원</p>
					</div>
				</div>
				<button class="product-nav next" onclick="slideProducts(1)">&#10095;</button>
			</div>
		</div>
	</section>


	<!-- 특가섹션 -->
<div class="timedeal-header">
    <div class="inner">
        <div class="timedeal-logo">⚡오늘의 특가</div>
        <div class="timedeal-timer" id="timer"></div>
    </div>
</div>
<div class="container">
    <div class="inner">
        <div class="row timedeal-product-grid">
			<c:forEach var="item" items="${specialList}" varStatus="status">
				<div class="col-md-3 col-sm-6">
					<a
						href="${pageContext.request.contextPath}/product/details?productNum=${item.productNum}">
						<div class="timedeal-product-card position-relative"
							data-end-time="${item.endDate}">
							<img
								src="${pageContext.request.contextPath}/uploads/product/${item.thumbnail}"
								alt="${item.productName}" class="timedeal-product-image">
							<div class="timedeal-product-info">
								<div class="timedeal-timer"></div>
								<div class="timedeal-product-title">${item.productName}</div>
								<div class="timedeal-product-price">
									<span class="original-price">${item.price}원</span> <span
										class="discount-rate badge bg-danger">${item.discountRate}%
										할인</span>
								</div>
								<div class="sale-price fw-bold text-danger">${item.salePrice}원</div>
							</div>
						</div>
					</a>
				</div>
			</c:forEach>
		</div>
    </div>

	<section class="featured-products">
		<div class="inner">
			<h2>꿀잠을 위한 필수 아이템</h2>
			<div class="product-grid">
				<c:forEach var="product" items="${list}">
					<div class="product-item">
						<a
							href="${pageContext.request.contextPath}/product/details?productNum=${product.productNum}">
							<div class="image-wrapper">
							    <img src="${pageContext.request.contextPath}/uploads/product/${product.thumbnail}"
							         alt="${product.productName}">
							    <div class="bookmark" data-product-id="${product.productNum}"></div>
							</div>
							 <span class="product-info">
								<span>${product.productName}</span> <span class="discount">
									${product.discountRate}% <span class="price"> <fmt:formatNumber
											value="${product.price * (1 - product.discountRate / 100)}"
											pattern="#,###원" />
								</span>
							</span> <span class="rating"> ★ ${product.score} <span
									class="review-count">리뷰 ${product.reviewCount}</span>
							</span>
						</span>
						</a>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>
</div>

<script type="text/javascript">

$(document).ready(function() {
    //북마크
    $('.bookmark').click(function(e) {
        e.preventDefault(); 
        e.stopPropagation(); 

        var $bookmark = $(this);
        var productId = $bookmark.data('product-id');

        $bookmark.toggleClass('active');

        if ($bookmark.hasClass('active')) { 
            console.log('Bookmark added for product ID:', productId);
        } else {
            console.log('Bookmark removed for product ID:', productId);
        }
    });

    // 모든 초기화 함수를 여기서 호출
    initProductSlider();
    initSwiper();
    initWishlistButtons();
    startCountdown();
});

let productItemWidth = 200;
let productCurrentIndex = 0;

function initProductSlider() {
    console.log("initProductSlider 함수 시작");
    const prevButton = document.querySelector('.product-nav.prev');
    const nextButton = document.querySelector('.product-nav.next');
    
    if (!prevButton || !nextButton) {
        console.error("네비게이션 버튼을 찾을 수 없습니다.");
        return;
    }

    prevButton.style.display = 'none';
    slideProducts(0);

    prevButton.addEventListener('click', () => slideProducts(-1));
    nextButton.addEventListener('click', () => slideProducts(1));
}

function slideProducts(direction) {
    console.log(`slideProducts 함수 시작, direction: ${direction}`);
    const productList = document.getElementById('productList');
    if (!productList) {
        console.error("productList를 찾을 수 없습니다.");
        return;
    }

    const productsCount = productList.children.length;
    const containerWidth = productList.parentElement.offsetWidth;
    const itemsPerView = Math.floor(containerWidth / productItemWidth);
    const maxIndex = productsCount - itemsPerView;

    productCurrentIndex += direction;
    productCurrentIndex = Math.max(0, Math.min(productCurrentIndex, maxIndex));

    productList.style.transform = `translateX(-${productCurrentIndex * productItemWidth}px)`;

    const prevButton = document.querySelector('.product-nav.prev');
    const nextButton = document.querySelector('.product-nav.next');
    prevButton.style.display = productCurrentIndex > 0 ? 'block' : 'none';
    nextButton.style.display = productCurrentIndex < maxIndex ? 'block' : 'none';
}

function initSwiper() {
    console.log("initSwiper 함수 시작");
    if (typeof Swiper === 'undefined') {
        console.error("Swiper is not defined. Make sure you've included the Swiper library.");
        return;
    }

    try {
        new Swiper('.swiper-container', {
            slidesPerView: 'auto',
            centeredSlides: true,
            spaceBetween: 30,
            loop: true,
            grabCursor: true,
            effect: 'coverflow',
            coverflowEffect: {
                rotate: 0,
                stretch: 0,
                depth: 100,
                modifier: 1,
                slideShadows: false,
            },
            pagination: {
                el: '.swiper-pagination',
                clickable: true,
            },
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev',
            },
            autoplay: {
                delay: 3000,
                disableOnInteraction: false,
            },
        });

        new Swiper('.best-sellers-slider', {
            slidesPerView: 3,
            spaceBetween: 30,
            scrollbar: {
                el: '.swiper-scrollbar',
                hide: false,
            },
            breakpoints: {
                320: {
                    slidesPerView: 1,
                    spaceBetween: 10
                },
                768: {
                    slidesPerView: 2,
                    spaceBetween: 20
                },
                1024: {
                    slidesPerView: 3,
                    spaceBetween: 30
                }
            }
        });
    } catch (error) {
        console.error("Swiper 초기화 중 오류 발생:", error);
    }
}

function initWishlistButtons() {
    console.log("initWishlistButtons 함수 시작");
    document.querySelectorAll('.product-item .wishlist-btn').forEach(btn => {
        btn.addEventListener('click', function(e) {
            e.preventDefault();
            this.classList.toggle('active');
            const icon = this.querySelector('i');
            if (this.classList.contains('active')) {
                icon.classList.replace('bi-heart', 'bi-heart-fill');
                icon.style.color = 'red';
            } else {
                icon.classList.replace('bi-heart-fill', 'bi-heart');
                icon.style.color = '';
            }
        });
    });
}

function startCountdown() {
    console.log("startCountdown 함수 시작");
    document.querySelectorAll('.timedeal-product-card').forEach((card, index) => {
        const timerElement = card.querySelector('.timedeal-timer');
        const endTimeStr = card.getAttribute('data-end-time');
        console.log(`카드 ${index + 1} 종료 시간:`, endTimeStr);
        console.log(`카드 ${index + 1} 타이머 요소:`, timerElement);
        
        if (!endTimeStr) {
            console.log(`카드 ${index + 1}의 종료 시간이 설정되지 않았습니다.`);
            timerElement.textContent = "시간 정보 없음";
            return;
        }
        
        const endTime = new Date(endTimeStr).getTime();
        console.log(`카드 ${index + 1} 파싱된 종료 시간:`, new Date(endTime));

        function updateTimer() {
            const now = new Date().getTime();
            const distance = endTime - now;

            console.log("Updating timer, distance:", distance);

            if (distance < 0) {
                timerElement.textContent = "종료됨";
                console.log("Timer ended");
                return;
            }

            const days = Math.floor(distance / (1000 * 60 * 60 * 24));
            const hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
            const minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
            const seconds = Math.floor((distance % (1000 * 60)) / 1000);
            
            console.log("Raw time values:", {days, hours, minutes, seconds});

            let timerText = '';
            if (days > 0) timerText += days + "일 ";
            if (hours > 0 || days > 0) timerText += hours + "시간 ";
            if (minutes > 0 || hours > 0 || days > 0) timerText += minutes + "분 ";
            timerText += seconds + "초";

            console.log("Timer text:", timerText);
            timerElement.textContent = timerText;
        }
        updateTimer();
        setInterval(updateTimer, 1000);
    });
}
</script>