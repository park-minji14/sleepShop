<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<style>
/* 전체 페이지 스타일 */
body {
	background-color: #f8f9fa;
}

.container {
	background-color: #fff;
	border-radius: 8px;
	box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
	padding: 30px;
	margin-top: 30px;
}

/* 네비게이션 탭 스타일 */
.nav-tabs .nav-link {
	color: #495057;
	border: none;
	border-bottom: 2px solid transparent;
}

.nav-tabs .nav-link.active {
	color: #007bff;
	font-weight: bold;
	border-bottom: 2px solid #007bff;
	background-color: transparent;
}

/* 카드 스타일 */
.card {
	border: none;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.05);
	transition: all 0.3s ease;
}

.card:hover {
	transform: translateY(-5px);
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
}

.card-title {
	font-size: 1.1rem;
	font-weight: bold;
	color: #333;
}

/* 뱃지 스타일 */
.badge {
	font-size: 0.9rem;
	padding: 0.5em 0.7em;
}

/* 폼 요소 스타일 */
.form-select {
	border-color: #ced4da;
}

/* 리뷰, 위시리스트, 최근 본 상품, 문의 아이템 스타일 */
.review-item, .wishlist-item, .recent-item, .inquiry-item {
	border-bottom: 1px solid #eee;
	padding: 20px 0;
}

.review-item:last-child, .wishlist-item:last-child, .recent-item:last-child,
	.inquiry-item:last-child {
	border-bottom: none;
}

.review-item img, .wishlist-item img, .recent-item img {
	max-width: 100px;
	border-radius: 4px;
}

/* 버튼 스타일 */
.btn-write-review {
	background-color: #007bff;
	color: white;
	border: none;
	padding: 8px 15px;
	border-radius: 4px;
	transition: background-color 0.3s ease;
}

.btn-write-review:hover {
	background-color: #0056b3;
}

/* 아이콘 스타일 */
.icon {
	width: 24px;
	height: 24px;
	margin-right: 8px;
}

/* 회원 등급 스타일 */
.member-grade {
	background-color: #f8f9fa;
	border-radius: 8px;
	padding: 20px;
	margin-bottom: 20px;
}

main{
}



.css-77kc86 {
    padding: 24px 16px;
    border: 1px solid rgb(234, 237, 239);
    color: rgb(47, 52, 56);
    width: 100%;
    box-sizing: border-box;
    border-radius: 8px;
    text-align: center;
}



.css-1irwz7g {
    font-size: 24px;
    line-height: 32px;
    font-weight: 700;
    color: rgb(53, 197, 240);
    margin-top: 4px;
}


/* 포인트 한칸별 */
.css-8zjtuo {
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    border-top: 1px solid rgb(234, 237, 239);
    padding: 20px 10px;
}



h2 {
    display: block;
    font-size: 1.5em;
    margin-block-start: 0.83em;
    margin-block-end: 0.83em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bold;
    unicode-bidi: isolate;
}


li {
    display: list-item;
    text-align: -webkit-match-parent;
    unicode-bidi: isolate;
}


.css-1yj5lcs.accumulate {
    background-color: rgb(239, 251, 255);
    color: rgb(53, 197, 240);
}

.css-1yj5lcs {
    font-size: 12px;
    line-height: 20px;
    padding: 2px 6px;
    border-radius: 4px;
    font-weight: 700;
}


.col-md-2 {

font-size: 14px;
    line-height: 18px;
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    color: rgb(194, 200, 204);
}


/* 폼 요소 스타일 */
.form-select {
	border-color: #ced4da;
}


.product-grid {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 20px;
    margin-top: 30px;
}


.product-info {
    padding: 15px;
    flex-grow: 1;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
}


.product-item {
    display: flex;
    flex-direction: column;
    border: 1px solid #eee;
    border-radius: 8px;
    overflow: hidden;
}



</style>
</head>
<body>

<div class="inner">
	<div class="container">
		<!-- 네비게이션 탭 -->
		<ul class="nav nav-tabs mb-4">
			<li class="nav-item"><a class="nav-link " id="orders-tab"
				data-bs-toggle="tab" href="#orders">나의 쇼핑</a></li>
			<li class="nav-item"><a class="nav-link" id="reviews-tab"
				data-bs-toggle="tab" href="#reviews">나의 리뷰</a></li>
			<li class="nav-item"><a class="nav-link  active" id="wishlist-tab"
				data-bs-toggle="tab" href="#wishlist">찜한 상품</a></li>
			<li class="nav-item"><a class="nav-link" id="recent-tab"
				data-bs-toggle="tab" href="#recent ">최근 본 상품</a></li>
			<li class="nav-item"><a class="nav-link" id="inquiry-tab"
				data-bs-toggle="tab" href="#inquiry">1:1 문의</a></li>
				
			<li class="nav-item"><a class="nav-link " id="inquiry-tab"
				data-bs-toggle="tab" href="#point">포인트</a></li>	
			
			<li class="nav-item"><a class="nav-link" id="settings-tab"
				data-bs-toggle="tab" href="#settings">설정</a></li>
		</ul>


		
				
				
				
				
				
			
			<!-- 최근 본 상품 탭 -->
			<div class="tab-pane fade show active" id="recent">
				<h4 class="mb-4">찜한 상품</h4>
			
			
			
			
			<div class="col-md-6">
				<select class="form-select" style=" width: 200px; ">
					<option>카테고리</option>
					<option>침구</option>
					<option>가전</option>
					<option>의류</option>
					<option>향초</option>
					<option>조명</option>
					<option>영양제</option>
					<option>수면용품</option>
					<option>졸음방지용품</option>
				</select>
			</div>
			
			
			<section class="featured-products">
			    <div class="inner">
			        <div class="product-grid">
			            
			                <div class="product-item">
			                    <a href="/dra/product/details/18">
			                        <img src="/dra/uploads/product/test1.png" alt="ㅌㅅㅌ">
			                        <span class="product-info">
			                            <span>ㅌㅅㅌ</span>
			                            <span class="discount">
			                                5% 
			                                <span class="price">
			                                    30,000원
			                                </span>
			                            </span>
			                            <span class="rating">
			                                ★ 0.0 
			                                <span class="review-count">리뷰 0</span>
			                            </span>
			                        </span>
			                    </a>
			                </div>
			            
			                <div class="product-item">
			                    <a href="/dra/product/details/16">
			                        <img src="/dra/uploads/product/test1.png" alt="민지쿤">
			                        <span class="product-info">
			                            <span>민지쿤</span>
			                            <span class="discount">
			                                10% 
			                                <span class="price">
			                                    30,000원
			                                </span>
			                            </span>
			                            <span class="rating">
			                                ★ 0.0 
			                                <span class="review-count">리뷰 0</span>
			                            </span>
			                        </span>
			                    </a>
			                </div>
			            
			                <div class="product-item">
			                    <a href="/dra/product/details/15">
			                        <img src="/dra/uploads/product/test1.png" alt="김치테스트">
			                        <span class="product-info">
			                            <span>김치테스트</span>
			                            <span class="discount">
			                                2% 
			                                <span class="price">
			                                    2,000,000원
			                                </span>
			                            </span>
			                            <span class="rating">
			                                ★ 0.0 
			                                <span class="review-count">리뷰 0</span>
			                            </span>
			                        </span>
			                    </a>
			                </div>
			            
			                <div class="product-item">
			                    <a href="/dra/product/details/14">
			                        <img src="/dra/uploads/product/test1.png" alt="호랑">
			                        <span class="product-info">
			                            <span>호랑</span>
			                            <span class="discount">
			                                10% 
			                                <span class="price">
			                                    30,000원
			                                </span>
			                            </span>
			                            <span class="rating">
			                                ★ 0.0 
			                                <span class="review-count">리뷰 0</span>
			                            </span>
			                        </span>
			                    </a>
			                </div>
			            
			                <div class="product-item">
			                    <a href="/dra/product/details/3">
			                        <img src="/dra/uploads/product/test1.png" alt="룰루랄라">
			                        <span class="product-info">
			                            <span>룰루랄라</span>
			                            <span class="discount">
			                                10% 
			                                <span class="price">
			                                    30,000원
			                                </span>
			                            </span>
			                            <span class="rating">
			                                ★ 0.0 
			                                <span class="review-count">리뷰 0</span>
			                            </span>
			                        </span>
			                    </a>
			                </div>
			            
			                <div class="product-item">
			                    <a href="/dra/product/details/2">
			                        <img src="/dra/uploads/product/test1.png" alt="쿨에어 이불">
			                        <span class="product-info">
			                            <span>쿨에어 이불</span>
			                            <span class="discount">
			                                10% 
			                                <span class="price">
			                                    40,000원
			                                </span>
			                            </span>
			                            <span class="rating">
			                                ★ 0.0 
			                                <span class="review-count">리뷰 0</span>
			                            </span>
			                        </span>
			                    </a>
			                </div>
			            
			                <div class="product-item">
			                    <a href="/dra/product/details/1">
			                        <img src="/dra/uploads/product/test1.png" alt="럭셔리 킹사이즈 침대">
			                        <span class="product-info">
			                            <span>럭셔리 킹사이즈 침대</span>
			                            <span class="discount">
			                                10% 
			                                <span class="price">
			                                    2,000,000원
			                                </span>
			                            </span>
			                            <span class="rating">
			                                ★ 0.0 
			                                <span class="review-count">리뷰 0</span>
			                            </span>
			                        </span>
			                    </a>
			                </div>
            
        </div>
    </div>
</section>
			
			
				<!-- 최근 본 상품 목록 -->
				<div class="recent-item">
					<!-- 상품 정보 및 다시 보기 버튼 -->
				</div>
				<!-- 추가 최근 본 상품 아이템... -->
			</div>
														
	</div>
</div>








	<script>
		$(document).ready(function() {
			// 탭 전환 로직
			$('a[data-bs-toggle="tab"]').on('shown.bs.tab', function(e) {
				// 필요한 경우 여기에 탭 전환 시 실행할 코드를 추가하세요
			});

			// 리뷰 등록 버튼 클릭 이벤트
			$('.modal-footer .btn-primary').on('click', function() {
				alert('리뷰가 등록되었습니다.');
				$('#reviewModal').modal('hide');
			});

			// 찜한 상품 장바구니 담기 버튼 클릭 이벤트
			$('.wishlist-item .btn-primary').on('click', function() {
				alert('상품이 장바구니에 담겼습니다.');
			});

			// 찜한 상품 삭제 버튼 클릭 이벤트
			$('.wishlist-item .btn-outline-danger').on('click', function() {
				if (confirm('정말로 이 상품을 찜 목록에서 삭제하시겠습니까?')) {
					$(this).closest('.wishlist-item').remove();
				}
			});

			// 새 문의 등록 버튼 클릭 이벤트
			$('#inquiryModal .btn-primary').on('click', function() {
				alert('새 문의가 등록되었습니다.');
				$('#inquiryModal').modal('hide');
			});

			// 새 배송지 등록 버튼 클릭 이벤트
			$('#addressModal .btn-primary').on('click', function() {
				alert('새 배송지가 등록되었습니다.');
				$('#addressModal').modal('hide');
			});
		});
	</script>