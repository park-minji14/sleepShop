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
                    <a href="${pageContext.request.contextPath}/product/category/${category.categoryNum}">
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
			<div class="timedeal-timer" id="timer">23:59:59</div>
		</div>
	</div>
	<div class="container">
		<div class="inner">
			<div class="row timedeal-product-grid">
				<div class="col-md-4 col-sm-6">
					<div class="timedeal-product-card position-relative">
						<div class="timedeal-product-timer"
							data-end-time="2023-05-15T15:00:00">00:00:00</div>
						<img src="${pageContext.request.contextPath}/uploads/product/150.png"
							alt="Product 1" class="timedeal-product-image">
						<div class="timedeal-product-info">
							<div class="timedeal-product-title">상품 1</div>
							<div>
								<span class="badge bg-danger">40%</span> <span
									class="fw-bold text-danger">29,900원</span>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-4 col-sm-6">
					<div class="timedeal-product-card position-relative">
						<div class="timedeal-product-timer"
							data-end-time="2023-05-15T18:30:00">00:00:00</div>
						<img src="${pageContext.request.contextPath}/uploads/product/150.png"
							alt="Product 2" class="timedeal-product-image">
						<div class="timedeal-product-info">
							<div class="timedeal-product-title">상품 2</div>
							<div>
								<span class="badge bg-danger">30%</span> <span
									class="fw-bold text-danger">34,900원</span>
							</div>
						</div>
					</div>
				</div>
				<!-- 추가 상품들... -->
			</div>
		</div>
		<section class="featured-products">
			<div class="inner">
				<h2>꿀잠을 위한 필수 아이템</h2>
				<div class="product-grid">
					<c:forEach var="product" items="${list}">
						<div class="product-item">
							<a
								href="${pageContext.request.contextPath}/product/details/${product.productNum}">
								<img
								src="${pageContext.request.contextPath}/uploads/product/${product.thumbnail}"
								alt="${product.productName}"> <span class="product-info">
									<span>${product.productName}</span> <span class="discount">
										${product.discountRate}% <span class="price"> <fmt:formatNumber
												value="${product.price * (1 - product.discountRate / 100)}" pattern="#,###원" />
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
	document.addEventListener('DOMContentLoaded', () => {
	    initProductSlider();
	    initSwiper();
	    initWishlistButtons();
	    startCountdown(); //메인 타이머 
	    setInterval(updateTimers, 1000);
	});

	let productItemWidth = 200;
	let productCurrentIndex = 0;

	function initProductSlider() {
	    const prevButton = document.querySelector('.product-nav.prev');
	    const nextButton = document.querySelector('.product-nav.next');
	    
	    prevButton.style.display = 'none';
	    slideProducts(0);

	    prevButton.addEventListener('click', () => slideProducts(-1));
	    nextButton.addEventListener('click', () => slideProducts(1));
	}

	function slideProducts(direction) {
	    const productList = document.getElementById('productList');
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
	}

	function initWishlistButtons() {
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

function updateTimers() {
    document.querySelectorAll('.timedeal-product-timer').forEach(timer => {
        const endTime = new Date(timer.dataset.endTime).getTime();
        const now = new Date().getTime();
        const distance = endTime - now;

        if (distance < 0) {
            timer.textContent = "종료됨";
            return;
        }

        const hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
        const minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
        const seconds = Math.floor((distance % (1000 * 60)) / 1000);

        timer.textContent = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')}`;
    });
}

function startCountdown() {
    const timerElement = document.querySelector('.timedeal-timer');
    if (!timerElement) {
        console.error('Timer element not found');
        return;
    }

    let timeLeft = 24 * 60 * 60; // 24시간

    function updateTimer() {
        const hours = Math.floor(timeLeft / 3600);
        const minutes = Math.floor((timeLeft % 3600) / 60);
        const seconds = timeLeft % 60;

        timerElement.textContent = 
            `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')}`;

        if (timeLeft > 0) {
            timeLeft--;
            setTimeout(updateTimer, 1000);
        } else {
            timerElement.textContent = "특가 종료";
        }
    }

    updateTimer();
}
</script>