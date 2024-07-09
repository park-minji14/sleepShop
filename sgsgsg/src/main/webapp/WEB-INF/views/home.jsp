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

	<!-- 카테고리 섹션 -->
<section class="category-section">
    <div class="inner">
        <h2>카테고리</h2>
        <div class="category-list">
            <c:forEach var="category" items="${categoryList}">
                <div class="category-item">
                    <img
                        src="${pageContext.request.contextPath}/uploads/icon/${category.categoryImage}"
                        alt="${category.categoryName}">
                    <p>${category.categoryName}</p>
                </div>
            </c:forEach>
        </div>
    </div>
</section>

<section class="featured-products">
    <div class="inner">
        <h2>꿀잠을 위한 필수 아이템</h2>
        <div class="product-grid">
            <c:forEach var="product" items="${list}">
                <div class="product-item">
                    <a href="${pageContext.request.contextPath}/product/details/${product.productNum}">
                        <img src="${pageContext.request.contextPath}/uploads/product/${product.thumbnail}"
                             alt="${product.productName}">
                        <span class="product-info">
                            <span>${product.productName}</span>
                            <span class="discount">
                                ${product.discountRate}% 
                                <span class="price">
                                    <fmt:formatNumber value="${product.price}" pattern="#,###원" />
                                </span>
                            </span>
                            <span class="rating">
                                ★ ${product.score} 
                                <span class="review-count">리뷰 ${product.reviewCount}</span>
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

let productItemWidth = 200; 
let productCurrentIndex = 0;

document.addEventListener('DOMContentLoaded', () => {
  const prevButton = document.querySelector('.product-nav.prev');
  const nextButton = document.querySelector('.product-nav.next');
  
  prevButton.style.display = 'none';
  slideProducts(0); // 초기 상태 설정

  prevButton.addEventListener('click', () => slideProducts(-1));
  nextButton.addEventListener('click', () => slideProducts(1));
});

function slideProducts(direction) {
    const productList = document.getElementById('productList');
    const productsCount = productList.children.length;
    const containerWidth = productList.parentElement.offsetWidth;
    const itemsPerView = Math.floor(containerWidth / productItemWidth);
    const maxIndex = productsCount - itemsPerView;

    productCurrentIndex += direction;
    if (productCurrentIndex < 0) productCurrentIndex = 0;
    if (productCurrentIndex > maxIndex) productCurrentIndex = maxIndex;

    productList.style.transform = `translateX(-${productCurrentIndex * productItemWidth}px)`;

    // 네비게이션 버튼 상태 업데이트
    const prevButton = document.querySelector('.product-nav.prev');
    const nextButton = document.querySelector('.product-nav.next');
    prevButton.style.display = productCurrentIndex > 0 ? 'block' : 'none';
    nextButton.style.display = productCurrentIndex < maxIndex ? 'block' : 'none';
}

//상품 하트 
$(document).on('click', '.product-item .wishlist-btn', function(e) {
    e.preventDefault();
    const $this = $(this);
    $this.toggleClass('active');
    const $icon = $this.find('i');
    if ($this.hasClass('active')) {
      $icon.removeClass('bi-heart').addClass('bi-heart-fill').css('color', 'red');
    } else {
      $icon.addClass('bi-heart').removeClass('bi-heart-fill').css('color', '');
    }
  });
	
	
 document.addEventListener('DOMContentLoaded', function () {
	 

  // Swiper 초기화
  const swiper = new Swiper('.swiper-container', {
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
 });


</script>