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

</style>
</head>
<body>

<div class="inner">
    <div class="container">
        <!-- 네비게이션 탭 -->
        <ul class="nav nav-tabs mb-4">
            <li class="nav-item"><a class="nav-link" id="orders-tab"
                data-bs-toggle="tab" href="#orders">나의 쇼핑</a></li>
            <li class="nav-item"><a class="nav-link active" id="reviews-tab"
                data-bs-toggle="tab" href="#reviews">나의 리뷰</a></li>
            <li class="nav-item"><a class="nav-link" id="wishlist-tab"
                data-bs-toggle="tab" href="#wishlist">찜한 상품</a></li>
            <li class="nav-item"><a class="nav-link" id="recent-tab"
                data-bs-toggle="tab" href="#recent">최근 본 상품</a></li>
            <li class="nav-item"><a class="nav-link" id="inquiry-tab"
                data-bs-toggle="tab" href="#inquiry">1:1 문의</a></li>
            <li class="nav-item"><a class="nav-link" id="point-tab"
                data-bs-toggle="tab" href="#point">포인트</a></li>
            <li class="nav-item"><a class="nav-link" id="settings-tab"
                data-bs-toggle="tab" href="#settings">설정</a></li>
        </ul>

        <!-- 탭 컨텐츠 -->
        <div class="tab-content">
            <!-- 나의 리뷰 탭 -->
            <div class="tab-pane fade show active" id="reviews">
                <h4 class="mb-4" style="text-align: center;   font-size: 40px; margin: 50px;">구매한 상품</h4>
                
                <div class="col-md-6">
					<select class="form-select" style=" width: 200px; ">
						
						<option>상품 리뷰 작성</option>
						<option>내가 작성한 리뷰</option>
					</select>
				</div>
                
                
                <div class="review-item">
                    <div class="row align-items-center">
                        <div class="col-md-2">
                            <img src="https://via.placeholder.com/100" alt="Product"
                                class="img-fluid">
                        </div>
                        <div class="col-md-7">
                            <h5>메모리폼 베개</h5>
                            <p class="text-muted">구매일: 2024-07-07</p>
                        </div>
                        <div class="col-md-3 text-end">
                            <button class="btn btn-write-review" data-bs-toggle="modal"
                                data-bs-target="#reviewModal">리뷰 작성하기</button>
                        </div>
                    </div>
                </div>
                <div class="review-item">
                    <div class="row align-items-center">
                        <div class="col-md-2">
                            <img src="https://via.placeholder.com/100" alt="Product"
                                class="img-fluid">
                        </div>
                        <div class="col-md-7">
                            <h5>수면 안대</h5>
                            <p class="text-muted">구매일: 2024-07-07</p>
                        </div>
                        <div class="col-md-3 text-end">
                            <button class="btn btn-write-review" data-bs-toggle="modal"
                                data-bs-target="#reviewModal">리뷰 작성하기</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        
    </div>
</div>
        
        
        
        
    <!-- 리뷰 작성 모달 -->
	<div class="modal fade" id="reviewModal" tabindex="-1"
		aria-labelledby="reviewModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="reviewModalLabel">리뷰 작성하기</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form>
						<div class="mb-3">
							<label for="reviewRating" class="form-label">평점</label> <select
								class="form-select" id="reviewRating">
								<option value="5">5점</option>
								<option value="4">4점</option>
								<option value="3">3점</option>
								<option value="2">2점</option>
								<option value="1">1점</option>
							</select>
						</div>
						<div class="mb-3">
							<label for="reviewContent" class="form-label">리뷰 내용</label>
							<textarea class="form-control" id="reviewContent" rows="3"></textarea>
						</div>
						<div class="mb-3">
							<label for="reviewImage" class="form-label">이미지 첨부</label> <input
								type="file" class="form-control" id="reviewImage">
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary">리뷰 등록</button>
				</div>
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

</body>
</html>