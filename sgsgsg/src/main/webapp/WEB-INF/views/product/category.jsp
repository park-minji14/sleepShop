<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
/* 공통 스타일 */
.product-grid {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 20px;
}

.product-item {
    width: 100%;
    margin-bottom: 40px;
    box-sizing: border-box;
    overflow: hidden;
    display: flex;
    flex-direction: column;
    border: 1px solid #eee;
    border-radius: 8px;
    transition: all 0.3s ease;
}

.product-item:hover {
    box-shadow: 0 0 10px rgba(0,0,0,0.1);
    transform: translateY(-5px);
}

.product-item img {
    width: 100%;
    height: 200px;
    object-fit: cover;
    transition: transform 0.3s ease;
}

.product-item:hover img {
    transform: scale(1.05);
}

.product-item a {
    text-decoration: none;
    color: inherit;
    display: block;
}

/* 공통 상품 정보 스타일 */
.product-info {
    padding: 15px;
    flex-grow: 1;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
}

.product-info span {
    display: block;
}

.product-info .discount {
    color: #35c5f0;
    font-weight: bold;
    margin-bottom: 5px;
}

.product-info .price {
    font-size: 18px;
    color: #000;
}

.product-info .rating {
    color: #424242;
    font-size: 14px;
}

.product-info .review-count {
    color: #757575;
    font-size: 12px;
}

/* 반응형 디자인 수정 */
@media (max-width: 1200px) {
    .product-grid {
        grid-template-columns: repeat(3, 1fr);
    }
}

@media (max-width: 900px) {
    .product-grid {
        grid-template-columns: repeat(2, 1fr);
    }
}

@media (max-width: 600px) {
    .product-grid {
        grid-template-columns: 1fr;
    }
}

/*메인 상품 섹션 스타일 */
.featured-products .inner {
    max-width: 1200px;
    margin: 0 auto;
    padding: 20px;
}


.category-icon {
    transition: transform 0.3s ease;
}

.category-icon:hover {
    transform: scale(1.1);
}

.sleep-tips {
    background-color: #f8f9fa;
    padding: 20px;
    border-radius: 8px;
    margin-bottom: 20px;
}

.sleep-quiz {
    background-color: #e9ecef;
    padding: 20px;
    border-radius: 8px;
    margin-bottom: 20px;
}

.newsletter {
    background-color: #d1ecf1;
    padding: 20px;
    border-radius: 8px;
    margin-bottom: 20px;
}

.review-carousel .carousel-item {
    height: 200px;
}

.featured-products {
    margin-bottom: 20px;
}

.featured-products .product-item {
    margin-bottom: 20px;
}
.card-swiper .swiper-slide {
    height: 300px;
    display: flex;
    align-items: center;
    justify-content: center;
    border-radius: 8px;
    font-size: 22px;
    font-weight: bold;
    color: #fff;
    background-size: cover;
    background-position: center;
}

.card-swiper .card-content {
    background: rgba(0,0,0,0.5);
    padding: 20px;
    border-radius: 8px;
}

.customer-reviews .card {
    border: none;
    box-shadow: 0 4px 8px rgba(0,0,0,0.1);
}

.customer-reviews .card-body {
    display: flex;
    flex-direction: column;
    align-items: center;
    text-align: center;
}

.customer-reviews .profile-img {
    width: 80px;
    height: 80px;
    border-radius: 50%;
    object-fit: cover;
    margin-bottom: 15px;
}

.sleep-tips, .sleep-quiz, .newsletter {
    background-color: #f8f9fa;
    padding: 20px;
    border-radius: 8px;
    margin-bottom: 20px;
}

.sleep-tips img, .sleep-quiz img {
    max-width: 100%;
    height: auto;
    border-radius: 8px;
    margin-bottom: 15px;
}

</style>

<!-- 메인 카테고리 -->
<div class="container mt-4">
    <section class="main-category mb-4">
        <div class="category-list row text-center custom-grid">
            <c:forEach var="mainCat" items="${mainCategories}">
                <div class="col">
                    <a href="${pageContext.request.contextPath}/product/category/${mainCat.categoryNum}" class="text-decoration-none text-dark">
                        <img src="${pageContext.request.contextPath}/uploads/icon/${mainCat.categoryImage}" alt="${mainCat.categoryName}" class="category-icon mb-2">
                        <p class="mb-0 small">${mainCat.categoryName}</p>
                    </a>
                </div>
            </c:forEach>
        </div>
    </section>
</div>

 <!-- 수정된 배너 슬라이드 -->
<div class="container mt-4">
    <section class="banner-slide mb-4">
        <div class="swiper-container card-swiper">
            <div class="swiper-wrapper">
                <div class="swiper-slide" style="background-image: url('https://via.placeholder.com/600x300/87CEEB/000000')">
                </div>
                <div class="swiper-slide" style="background-image: url('https://via.placeholder.com/600x300/4682B4/FFFFFF')">
                </div>
                <div class="swiper-slide" style="background-image: url('https://via.placeholder.com/600x300/1E90FF/000000')">
                </div>
            </div>
            <div class="swiper-pagination"></div>
            <div class="swiper-button-next"></div>
            <div class="swiper-button-prev"></div>
        </div>
    </section>

    <!-- 추천 상품 섹션 -->
    <section class="featured-products mb-4">
        <h2 class="mb-3">추천 상품</h2>
        <div class="row">
            <!-- 여기에 추천 상품 아이템을 추가 -->
        </div>
    </section>


        <!-- 하위 카테고리 및 정렬 필터 -->
    <section class="sub-category mb-4">
        <div class="row align-items-center">
            <div class="col-md-8">
                <ul class="nav nav-pills">
                    <li class="nav-item">
                        <a class="nav-link ${empty subCategoryNum ? 'active' : ''}" href="${pageContext.request.contextPath}/product/category/${category.categoryNum}">전체</a>
                    </li>
                    <c:forEach var="subCat" items="${subCategories}">
                        <li class="nav-item">
                            <a class="nav-link ${subCat.categoryNum == subCategoryNum ? 'active' : ''}" href="${pageContext.request.contextPath}/product/category/${category.categoryNum}?subCategoryNum=${subCat.categoryNum}">
                                ${subCat.categoryName}
                            </a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
            <div class="col-md-4">
                <select class="form-select" id="sortOrder">
                    <option value="newest">최신순</option>
                    <option value="priceAsc">가격 낮은순</option>
                    <option value="priceDesc">가격 높은순</option>
                    <option value="popular">인기순</option>
                </select>
            </div>
        </div>
    </section>

    <!-- 상품 목록 -->
<section class="product-list">
    <h2 class="mb-3">${category.categoryName} 상품 목록</h2>
    <div class="product-grid" id="productList">
        <c:forEach var="product" items="${products}">
            <div class="product-item">
                <a href="${pageContext.request.contextPath}/product/details/${product.productNum}">
                    <img src="${pageContext.request.contextPath}/uploads/product/${product.thumbnail}" alt="${product.productName}">
                    <div class="product-info">
                        <span>${product.productName}</span>
                        <div class="discount">
                            ${product.discountRate}% 
                            <span class="price">
                                <fmt:formatNumber value="${product.price}" pattern="#,###원" />
                            </span>
                        </div>
                        <div class="rating">
                            ★ ${product.score} 
                            <span class="review-count">리뷰 ${product.reviewCount}</span>
                        </div>
                    </div>
                </a>
            </div>
        </c:forEach>
    </div>
</section>

    <!-- 고객 리뷰 섹션 -->
    <section class="customer-reviews mb-4">
        <h2 class="mb-3">고객 리뷰</h2>
        <div class="review-carousel swiper-container">
            <div class="swiper-wrapper">
                <div class="swiper-slide">
                    <div class="card">
                        <div class="card-body">
                            <img src="https://via.placeholder.com/80x80" alt="프로필 이미지" class="profile-img">
                            <h5 class="card-title">최고의 베개!</h5>
                            <p class="card-text">이 메모리폼 베개를 사용한 후로 목 통증이 사라졌어요. 정말 추천합니다!</p>
                            <div class="text-warning">
                                ★★★★★ <small class="text-muted">5.0</small>
                            </div>
                            <p class="card-text"><small class="text-muted">김OO님</small></p>
                        </div>
                    </div>
                </div>
                <div class="swiper-slide">
                    <div class="card">
                        <div class="card-body">
                            <img src="https://via.placeholder.com/80x80" alt="프로필 이미지" class="profile-img">
                            <h5 class="card-title">편안한 이불</h5>
                            <p class="card-text">가볍고 따뜻해서 좋아요. 세탁도 편리하고 건조도 빨라요.</p>
                            <div class="text-warning">
                                ★★★★☆ <small class="text-muted">4.5</small>
                            </div>
                            <p class="card-text"><small class="text-muted">이OO님</small></p>
                        </div>
                    </div>
                </div>
                <div class="swiper-slide">
                    <div class="card">
                        <div class="card-body">
                            <img src="https://via.placeholder.com/80x80" alt="프로필 이미지" class="profile-img">
                            <h5 class="card-title">수면 안대 최고</h5>
                            <p class="card-text">빛 차단이 완벽해요. 여행갈 때도 항상 가지고 다녀요.</p>
                            <div class="text-warning">
                                ★★★★★ <small class="text-muted">5.0</small>
                            </div>
                            <p class="card-text"><small class="text-muted">박OO님</small></p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="swiper-pagination"></div>
        </div>
    </section>
</div>
<script>
$(document).ready(function() {
    // 카드 스와이퍼 초기화
    var cardSwiper = new Swiper('.card-swiper', {
        effect: 'cards',
        grabCursor: true,
        pagination: {
            el: '.swiper-pagination',
            clickable: true,
        },
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        },
    });

    // 리뷰 스와이퍼 초기화
    var reviewSwiper = new Swiper('.review-carousel', {
        slidesPerView: 3,
        spaceBetween: 30,
        pagination: {
            el: '.swiper-pagination',
            clickable: true,
        },
        breakpoints: {
            640: {
                slidesPerView: 1,
                spaceBetween: 20,
            },
            768: {
                slidesPerView: 2,
                spaceBetween: 30,
            },
            1024: {
                slidesPerView: 3,
                spaceBetween: 30,
            },
        }
    });
});
</script>