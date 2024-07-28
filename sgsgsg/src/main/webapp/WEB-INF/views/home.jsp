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
					<a
						href="${pageContext.request.contextPath}/product/category?categoryNum=${category.categoryNum}">
						<img
						src="${pageContext.request.contextPath}/uploads/icon/${category.categoryImage}"
						alt="${category.categoryName}">
						<p>${category.categoryName}</p>
					</a>
				</div>
			</c:forEach>
		</div>
	</div>
</section>

<!-- 추천 상품 -->
<section class="best-sellers-section">
    <div class="container">
        <div class="inner">
            <h2 class="best-sellers-title mb-4">고객 추천 상품</h2>
            <div class="swiper best-sellers-slider">
                <div class="swiper-wrapper">
                    <c:forEach var="product" items="${recommendedProductsList}">
                        <div class="swiper-slide">
                            <a href="${pageContext.request.contextPath}/product/details?productNum=${product.productNum}">
                                <div class="best-seller-card position-relative">
                                    <img src="${pageContext.request.contextPath}/uploads/product/${product.thumbnail}"
                                         alt="${product.productName}" class="best-seller-image">
                                    <div class="best-seller-info">
                                        <div class="best-seller-title">${product.productName}</div>
                                        <div class="best-seller-price">
                                            <span class="original-price"><fmt:formatNumber value="${product.price}" pattern="#,###원" /></span>
                                            <span class="discount">${product.discountRate}% 할인</span>
                                        </div>
                                        <div class="sale-price fw-bold text-danger">
                                            <fmt:formatNumber value="${product.salePrice}" pattern="#,###원" />
                                        </div>
                                        <div class="rating-review">
                                            <span class="rating">
                                                <c:forEach begin="1" end="5" var="i">
                                                    <c:choose>
                                                        <c:when test="${i <= product.score}">
                                                            <i class="bi bi-star-fill text-warning"></i>
                                                        </c:when>
                                                        <c:when test="${i > product.score && i - 1 < product.score}">
                                                            <i class="bi bi-star-half text-warning"></i>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <i class="bi bi-star text-warning"></i>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:forEach>
                                            </span>
                                            <span class="score"><fmt:formatNumber value="${product.score}" pattern="#.#" /></span>
                                            <span class="review-count">(${product.reviewCount})</span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </c:forEach>
                </div>
                <div class="swiper-scrollbar"></div>
            </div>
        </div>
    </div>
</section>




<!-- 특가섹션 -->
<div class="timedeal-header">
	<div class="inner">
		<div class="timedeal-logo">
			<img width="50" height="50"
				src="https://img.icons8.com/pastel-glyph/50/ffc107/conflict--v1.png"
				alt="conflict--v1" />오늘의 특가
		</div>
		<div class="timedeal-timer" id="timer"></div>
	</div>
</div>
<div class="container">
	<div class="inner">
		<div class="row timedeal-product-grid">
<c:forEach var="item" items="${specialList}" varStatus="status">
    <div class="col-md-3 col-sm-6">
        <a href="${pageContext.request.contextPath}/product/details?productNum=${item.productNum}">
            <div class="timedeal-product-card position-relative" data-end-time="${specialEndTime}">
                <img src="${pageContext.request.contextPath}/uploads/product/${item.thumbnail}"
                     alt="${item.productName}" class="timedeal-product-image">
                <div class="timedeal-product-info">
                    <div class="timedeal-timer"></div>
                    <div class="timedeal-product-title">${item.productName}</div>
                    <div class="timedeal-product-price">
                        <span class="original-price">
                            <fmt:formatNumber value="${item.price}" pattern="#,###원" />
                        </span>
                        <span class="discount-rate badge bg-danger">
                            ${item.discountRate}% 할인
                        </span>
                    </div>
                    <div class="sale-price fw-bold text-danger">
                        <fmt:formatNumber value="${item.salePrice}" pattern="#,###원" />
                    </div>
                </div>
            </div>
        </a>
    </div>
</c:forEach>
		</div>
	</div>
	
	<!-- 최신 상품 -->
<section class="recommended-products">
    <div class="inner">
        <h2>최신 상품</h2>
        <div class="swiper latest-products-slider">
            <div class="swiper-wrapper">
                <c:forEach var="product" items="${latestProducts}">
                    <div class="swiper-slide">
                        <div class="product-item">
                            <a href="${pageContext.request.contextPath}/product/details?productNum=${product.productNum}">
                                <div class="image-wrapper">
                                    <img src="${pageContext.request.contextPath}/uploads/product/${product.thumbnail}"
                                         alt="${product.productName}">
                                    <div class="bookmark" data-product-id="${product.productNum}"></div>
                                </div>
						<span class="product-info"> <span class="product-name"
										title="${product.productName}">${product.productName}</span> <span
										class="price"> <fmt:formatNumber
												value="${product.salePrice}" pattern="#,###원" />
									</span> 
								</span> 
                            </a>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <div class="swiper-button-next"></div>
            <div class="swiper-button-prev"></div>
            <div class="swiper-pagination"></div>
        </div>
    </div>
</section>

	<section class="featured-products">
        <div class="inner">
            <h2>꿀잠을 위한 필수 아이템</h2>
            <div class="product-grid">
                <c:forEach var="regular" items="${regularProductsList}">
                    <div class="product-item">
                        <a href="${pageContext.request.contextPath}/product/details?productNum=${regular.productNum}">
                            <div class="image-wrapper">
                                <img src="${pageContext.request.contextPath}/uploads/product/${regular.thumbnail}"
                                    alt="${regular.productName}">
                                <div class="bookmark" data-product-id="${regular.productNum}"></div>
                            </div> 
                            <span class="product-info"> 
                                <span class="product-name">${regular.productName}</span>
                                <span class="discount"> ${regular.discountRate}% 
                                    <span class="price"> 
                                        <fmt:formatNumber value="${regular.salePrice}" pattern="#,###원" />
                                    </span>
                                </span> 
                                <span class="rating"> 
                                    ★ <fmt:formatNumber value="${regular.score}" pattern="#.#" /> 
                                    <span class="review-count">리뷰 ${regular.reviewCount}</span>
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


    // 모든 초기화 함수를 여기서 호출
    /* initProductSlider(); */
    initSwiper();
    initWishlistButtons();
    startCountdown();
});

let productItemWidth = 200;
let productCurrentIndex = 0;

/* 
function initProductSlider() {
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
} */

function slideProducts(direction) {
    const productList = document.getElementById('productList');
    if (!productList) {
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
    if (typeof Swiper === 'undefined') {
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
    
    // 최신 상품 슬라이더
    new Swiper('.latest-products-slider', {
        slidesPerView: 8,
        spaceBetween: 10,
        loop: true,
        autoplay: {
            delay: 3000,
            disableOnInteraction: false,
        },
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        },
        pagination: {
            el: '.swiper-pagination',
            clickable: true,
        },
        breakpoints: {
            320: {
                slidesPerView: 2,
                spaceBetween: 10
            },
            768: {
                slidesPerView: 4,
                spaceBetween: 15
            },
            1024: {
                slidesPerView: 6,
                spaceBetween: 15
            },
            1440: {
                slidesPerView: 8,
                spaceBetween: 20
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

function startCountdown() {
    document.querySelectorAll('.timedeal-product-card').forEach((card, index) => {
        const timerElement = card.querySelector('.timedeal-timer');
        const endTimeStr = card.getAttribute('data-end-time');
        
        if (!endTimeStr) {
            timerElement.textContent = "시간 정보 없음";
            return;
        }
        
        const endTime = new Date(endTimeStr).getTime();

        function updateTimer() {
            const now = new Date().getTime();
            const distance = endTime - now;


            if (distance < 0) {
                timerElement.textContent = "종료됨";
                return;
            }

            const days = Math.floor(distance / (1000 * 60 * 60 * 24));
            const hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
            const minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
            const seconds = Math.floor((distance % (1000 * 60)) / 1000);

            let timerText = '🔥';
            if (days > 0) timerText += days + "일 ";
            if (hours > 0 || days > 0) timerText += hours + "시간 ";
            if (minutes > 0 || hours > 0 || days > 0) timerText += minutes + "분 ";
            timerText += seconds + "초";

            timerElement.textContent = timerText;
        }
        updateTimer();
        setInterval(updateTimer, 1000);
    });
}
</script>