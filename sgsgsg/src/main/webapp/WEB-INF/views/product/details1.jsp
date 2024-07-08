<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
.product-title {
	font-size: 1.5rem;
	font-weight: 700;
	color: #343a40;
}

.product-rating .bi-star-fill, .product-rating .bi-star-half {
	font-size: 0.9rem;
}

.product-price .badge {
	font-size: 1rem;
}

.delivery-info p {
	font-size: 0.9rem;
}

.total-price {
	border-top: 1px solid #dee2e6;
	border-bottom: 1px solid #dee2e6;
	padding: 1rem 0;
}

.purchase-buttons {
	display: flex;
}

.purchase-buttons .btn {
	padding: 0.75rem 1.5rem;
}

.color-options .btn {
	border: 2px solid #ced4da;
}

.color-options .btn:hover, .color-options .btn:focus {
	border-color: #6c757d;
}

@media ( max-width : 768px) {
	.product-images {
		margin-bottom: 2rem;
	}
}

.thumbnail-list {
	display: flex;
	flex-direction: column;
}

.thumbnail-list img {
	width: 80px;
	height: 80px;
	object-fit: cover;
	cursor: pointer;
	transition: opacity 0.3s ease;
}

.thumbnail-list img:hover {
	opacity: 0.7;
}

.main-image-container {
	flex-grow: 1;
}

.main-image {
	width: 100%;
	height: auto;
	object-fit: contain;
}

.details {
	padding-top: 100px
}
</style>
<div class="container my-5 details">
	<div class="row">
		<div class="col-md-6">
			<div class="product-images d-flex">
				<div class="thumbnail-list me-3">
					<c:forEach var="image" items="${listFile}">
						<img
							src="${pageContext.request.contextPath}/uploads/product/${product.thumbnail}"
							alt="썸네일" class="img-thumbnail mb-2"
							data-main-img="${pageContext.request.contextPath}/uploads/product/${product.thumbnail}">
					</c:forEach>
				</div>
				<div class="main-image-container">
					<img
						src="${pageContext.request.contextPath}/uploads/product/${product.thumbnail}"
						alt="메인 이미지" class="img-fluid rounded main-image" id="mainImage">
				</div>
			</div>
		</div>
		<div class="col-md-6">
			<div class="product-info">
				<h1 class="product-title mb-3">${dto.productName}</h1>
				<div class="product-rating mb-3">
					<i class="bi bi-star-fill text-warning"></i> <i
						class="bi bi-star-fill text-warning"></i> <i
						class="bi bi-star-fill text-warning"></i> <i
						class="bi bi-star-fill text-warning"></i> <i
						class="bi bi-star-half text-warning"></i> <span
						class="ms-2 text-muted">${dto.reviewCount}개 리뷰</span>
				</div>
				<div class="product-price mb-3">
					<span class="badge bg-primary me-2">${dto.discountRate}%</span> 
					<span class="fs-3 fw-bold"><fmt:formatNumber value="${dto.price}"
							pattern="#,###원" /></span> <span
						class="text-muted text-decoration-line-through"><fmt:formatNumber
							value="${dto.price / (1 - dto.discountRate/100)}"
							pattern="#,###원" /></span>
				</div>
				<div class="product-benefits mb-3">
					<p class="text-muted">
						<i class="bi bi-gift me-2"></i>혜택: 포인트 나오는곳
					</p>
					<p class="text-muted">
						<i class="bi bi-credit-card me-2"></i>월 13,960원 (5개월) 무이자할부
					</p>
				</div>
				<div class="delivery-info mb-3">
					<p class="mb-1">
						<i class="bi bi-truck me-2"></i>무료배송
					</p>
					<p>
						<i class="bi bi-clock me-2"></i>12:00 까지 결제시 오늘 출발
					</p>
					<p>
						<i class="bi bi-box-seam me-2"></i>잼얘잼얘!!!
					</p>
				</div>
				<div class="product-options mb-3">
					<select class="form-select mb-2">
						<option selected>SMITH-5 무광 그레이화이트</option>
					</select>
				</div>
				<div class="quantity-selector d-flex align-items-center mb-3">
					<button class="btn btn-outline-secondary" id="decreaseQuantity">-</button>
					<input type="number" class="form-control mx-2" id="quantity"
						value="1" min="1" style="width: 60px;">
					<button class="btn btn-outline-secondary" id="increaseQuantity">+</button>
				</div>
				<div class="total-price mb-3">
					<span class="fs-5">주문금액</span> <span class="fs-5 fw-bold">오예
						금요일</span>
				</div>
				<div class="purchase-buttons">
					<button class="btn btn-outline-primary btn-lg me-2 flex-grow-1">
						<i class="bi bi-cart-plus me-2"></i>장바구니
					</button>
					<button class="btn btn-primary btn-lg flex-grow-1">
						<i class="bi bi-bag-check me-2"></i>바로구매
					</button>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
    
    //상품 이미지 호버 / 체인지 
      document.addEventListener('DOMContentLoaded', function() {
          const mainImage = document.getElementById('mainImage');
          const thumbnails = document.querySelectorAll('.thumbnail-list img');
      
          thumbnails.forEach(thumb => {
              thumb.addEventListener('mouseenter', function() {
                  mainImage.src = this.getAttribute('data-main-img');
              });
      
              thumb.addEventListener('mouseleave', function() {
                  mainImage.src = thumbnails[0].getAttribute('data-main-img');
              });
          });
      });
      </script>