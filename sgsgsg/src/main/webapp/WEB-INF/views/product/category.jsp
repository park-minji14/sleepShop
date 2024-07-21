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

/* 반응형 그리드 */
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

/* 메인 상품 섹션 스타일 */
.featured-products .inner {
    max-width: 1200px;
    margin: 0 auto;
    padding: 20px;
}

.featured-products {
    margin-top: 20px;
    margin-bottom: 20px;
}

.featured-products .product-item {
    margin-bottom: 20px;
}

/* 카테고리 아이콘 스타일 */
.category-icon {
    transition: transform 0.3s ease;
    max-width: 100%; 
    height: auto; 
}

.category-icon:hover {
    transform: scale(1.1);
}

/* 기타 섹션 스타일 */
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

/* 리뷰 캐러셀 */
.review-carousel .carousel-item {
    height: 200px;
}

/* 카드 스와이퍼 */
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

/* 고객 리뷰 */
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

/* 배너 스와이퍼 */
.banner-swiper {
    width: 100%;
    height: 300px;
    overflow: hidden;
    margin-bottom: 20px;
    position: relative !important;
}

.banner-swiper .swiper-slide img {
    width: 100%;
    height: 100%;
    object-fit: cover;
}

.banner-swiper .swiper-button-next,
.banner-swiper .swiper-button-prev {
    color: #fff;
    background-color: rgba(0,0,0,0.5);
    padding: 10px;
    width: 40px;
    height: 40px;
    border-radius: 50%;
}

.banner-swiper .swiper-pagination-bullet {
    background: #6c757d;
    opacity: 0.5;
}

.banner-swiper .swiper-pagination-bullet-active {
    opacity: 1;
}

@media (max-width: 768px) {
    .banner-swiper {
        height: 200px;
    }
}

/* 반응형 그리드 조정 */
@media (max-width: 576px) {
    .col-auto {
        flex: 0 0 25%; 
        max-width: 25%;
    }
}

.banner-swiper{
position: relative !important;
}

/* 네비게이션 */
ul.nav.nav-pills li + li {
    margin-left: 10px;
}

a {
    color: #000000;
    text-decoration: none;
}

a:hover {
    color: #000000;
      text-decoration: none;
}

</style>

<!-- 메인 카테고리 -->
<div class="container mt-4">
	<section class="main-category mb-4">
		<div class="category-list row text-center custom-grid">
			<c:forEach var="mainCat" items="${mainCategories}">
				<div class="col">
					<a
						href="${pageContext.request.contextPath}/product/category?categoryNum=${mainCat.categoryNum}"
						class="category-link text-decoration-none text-dark"
						data-category-num="${mainCat.categoryNum}"> <img
						src="${pageContext.request.contextPath}/uploads/icon/${mainCat.categoryImage}"
						alt="${mainCat.categoryName}" class="category-icon mb-2">
						<p class="mb-0 small">${mainCat.categoryName}</p>
					</a>
				</div>
			</c:forEach>
		</div>
	</section>

	<!-- 배너 슬라이더 -->
	<section class="banner-swiper mb-4">
		<div class="swiper-container">
			<div class="swiper-wrapper">
				<!-- 기존 슬라이드 내용 -->
				<div class="swiper-slide">
					<img
						src="${pageContext.request.contextPath}/uploads/etc/categorybanner1.png">
				</div>
				<div class="swiper-slide">
					<img
						src="${pageContext.request.contextPath}/uploads/etc/categorybanner2.png">
				</div>
				<div class="swiper-slide">
					<img
						src="${pageContext.request.contextPath}/uploads/etc/categorybanner3.png">
				</div>
			</div>
			<div class="swiper-pagination"></div>
		</div>
	</section>

	<!-- <section class="featured-products mb-4">
    <h2 class="mb-3">추천 상품</h2>
    <div class="row" style="min-height: 100px;">
        여기에 추천 상품 아이템을 추가
        <p>추천 상품이 곧 제공될 예정입니다.</p>
    </div>
</section> -->

	<!-- 하위 카테고리 및 정렬 필터 -->
	<section class="sub-category mb-4">
		<div class="row align-items-center">
			<div class="col-md-8">
				<ul class="nav nav-pills">
					<!-- 서브 동적으로 로드 -->
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
		<h2 class="mb-3" id="categoryName">${category.categoryName}상품목록</h2>
		<div class="product-grid" id="productList">
			<!-- 상품 목록 로드됨-->
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
							<img src="https://via.placeholder.com/80x80" alt="프로필 이미지"
								class="profile-img">
							<h5 class="card-title">최고의 베개!</h5>
							<p class="card-text">이 메모리폼 베개를 사용한 후로 목 통증이 사라졌어요. 정말 추천합니다!</p>
							<div class="text-warning">
								★★★★★ <small class="text-muted">5.0</small>
							</div>
							<p class="card-text">
								<small class="text-muted">김OO님</small>
							</p>
						</div>
					</div>
				</div>
				<div class="swiper-slide">
					<div class="card">
						<div class="card-body">
							<img src="https://via.placeholder.com/80x80" alt="프로필 이미지"
								class="profile-img">
							<h5 class="card-title">편안한 이불</h5>
							<p class="card-text">가볍고 따뜻해서 좋아요. 세탁도 편리하고 건조도 빨라요.</p>
							<div class="text-warning">
								★★★★☆ <small class="text-muted">4.5</small>
							</div>
							<p class="card-text">
								<small class="text-muted">이OO님</small>
							</p>
						</div>
					</div>
				</div>
				<div class="swiper-slide">
					<div class="card">
						<div class="card-body">
							<img src="https://via.placeholder.com/80x80" alt="프로필 이미지"
								class="profile-img">
							<h5 class="card-title">수면 안대 최고</h5>
							<p class="card-text">빛 차단이 완벽해요. 여행갈 때도 항상 가지고 다녀요.</p>
							<div class="text-warning">
								★★★★★ <small class="text-muted">5.0</small>
							</div>
							<p class="card-text">
								<small class="text-muted">박OO님</small>
							</p>
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
    var bannerSwiper = new Swiper('.banner-swiper .swiper-container', {
        slidesPerView: 1,
        spaceBetween: 0,
        loop: true,
        autoHeight: false, // autoHeight를 false로 변경
        pagination: {
            el: '.swiper-pagination',
            clickable: true,
        },
/*        autoplay: {
            delay: 5000,
        },   */
    });
   
		// 초기 로드
		var initialCategoryNum = ${category.categoryNum};
		if(initialCategoryNum) {
		    loadProducts(initialCategoryNum);
		}

        // 메인 카테고리 클릭 이벤트
        $('.category-link').on('click', function(e) {
            e.preventDefault();
            var categoryNum = $(this).data('category-num');
            console.log('Main category clicked:', categoryNum);
            loadProducts(categoryNum);
        });

        // 서브 카테고리 클릭 이벤트
        $(document).on('click', '.sub-category-link', function(e) {
            e.preventDefault();
            var mainCategoryNum = $(this).data('main-category-num');
            var subCategoryNum = $(this).data('sub-category-num');
            console.log('Sub category clicked:', mainCategoryNum, subCategoryNum);
            loadProducts(mainCategoryNum, subCategoryNum);
        });

        function loadProducts(categoryNum, subCategoryNum) {
            var url = '${pageContext.request.contextPath}/product/category/products?categoryNum=' + categoryNum;
            if (subCategoryNum) {
                url += '&subCategoryNum=' + subCategoryNum;
            }
            console.log('Loading products from URL:', url);
            
            $.ajax({
                url: url,
                type: 'GET',
                dataType: 'json',
                success: function(data) {
                    console.log('Received data:', data);
                    updateCategoryInfo(data.category);
                    updateSubCategories(data.subCategories, categoryNum);
                    updateProductList(data.products);
                },
                error: function(xhr, status, error) {
                    console.error('AJAX Error:', status, error);
                    console.error('Response:', xhr.responseText);
                }
            });
        }
        function updateCategoryInfo(category) {
            console.log('Updating category info:', category);
            $('#categoryName').text(category.categoryName + ' 상품 목록');
        }

        function updateSubCategories(subCategories, mainCategoryNum) {
            console.log('Updating sub categories:', subCategories, mainCategoryNum);
            var $subCategoryList = $('.sub-category ul');
            $subCategoryList.empty();
            
            $subCategoryList.append('<li><a href="#" class="sub-category-link" data-main-category-num="' + mainCategoryNum + '">전체</a></li>');
            
            $.each(subCategories, function(index, subCategory) {
                $subCategoryList.append('<li class="nav-li"><a href="#" class="sub-category-link" data-main-category-num="' + mainCategoryNum + '" data-sub-category-num="' + subCategory.categoryNum + '">' + subCategory.categoryName + '</a></li>');
            });
        }

        function updateProductList(products) {
            console.log('Updating product list:', products);
            var $productList = $('#productList');
            $productList.empty();

            if (products && products.length > 0) {
                $.each(products, function(index, product) {
                    var productHtml = 
                        '<div class="product-item" data-product-id="' + product.productNum + '">' +
                            '<a href="${pageContext.request.contextPath}/product/details?productNum=' + product.productNum + '">' +
                                '<img src="${pageContext.request.contextPath}/uploads/product/' + product.thumbnail + '" alt="' + product.productName + '">' +
                                '<span class="product-info">' +
                                    '<span>' + product.productName + '</span>' +
                                    '<span class="discount">' +
                                        product.discountRate + '% ' +
                                        '<span class="price">' +
                                            new Intl.NumberFormat('ko-KR', { style: 'currency', currency: 'KRW' }).format(product.price * (1 - product.discountRate / 100)) +
                                        '</span>' +
                                    '</span>' +
                                    '<span class="rating">' +
                                        '★ ' + product.score + 
                                        '<span class="review-count">리뷰 ' + product.reviewCount + '</span>' +
                                    '</span>' +
                                '</span>' +
                            '</a>' +
                        '</div>';
                    $productList.append(productHtml);
                });
            } else {
                $productList.append('<h2>이 카테고리에는 상품이 없습니다.</h2>');
            }
        }
    });
</script>