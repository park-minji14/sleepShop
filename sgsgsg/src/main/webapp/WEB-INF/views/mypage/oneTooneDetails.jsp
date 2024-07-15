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



.member .tab_mp li.on a {
    border: 1px solid var(--season_color_11);
    color: var(--season_color_11);
    background-color: var(--season_color_12);
}


.member .tab_mp li a {
    display: block;
    height: 59px;
    border: 0px solid #e9e9e9;
    border-bottom: 0;
    background: #fff;
    font-size: 15px;
    line-height: 59px;
    border-radius: 8px;
}


.tbl_col > thead > tr > th {
    border-top: 0;
    padding: 20px 0;
}


.tbl_col > thead > tr > th {
    padding: 12px 0 16px;
    border-top: 1px solid #333;
    border-bottom: 1px solid #e9e9e9;
    color: #404040;
    font-family: Malgun Gothic, '맑은 고딕';
    font-size: 13px;
    font-weight: bold;
    text-align: center;
    vertical-align: middle;
}

.paging {
    margin-top: 34px;
    font-size: 0;
    text-align: center;
}



td.date {
    color: #888 !important;
    font-family: 'Poppins' !important;
    font-size: 13px !important;
    font-weight: 300 !important;
}


.tbl_col > tbody > tr > td {
    border: 0;
    padding: 20px 0;
}


.table-style6 {
	border: 1px solid #ddd; 
    border-radius: 30px;
    padding: 20px;
    margin: 20px 0; 
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3); 
    background-color: #fff;
    width: 1100px;
}

.date { width: 20%; }
.inquiry { width: 14%; }
.subject { flex-grow: 1; }
.answer { width: 20%; }

.table-header {
	display: flex;
	font-size: 18px;
}



.cont {
	display: flex;
}

/* 숨겨진 기본 라디오 버튼 */
.radio-input {
    display: none;
}

 
/* 선택된 라벨 스타일 */
.radio-input:checked + .radio-label {
    background-color: #35c5f0;
    color: white;
}


element.style {
    text-align: center;
    font-size: 20px;
}
.radio-input:checked + .radio-label {
    background-color: #35c5f0;
    color: white;
}
.radio-label {
    display: inline-block;
    padding: 10px 20px;
    border: 2px solid #35c5f0;
    border-radius: 10px;
    background-color: white;
    color: #35c5f0;
    cursor: pointer;
    transition: background-color 0.3s, color 0.3s;
}


#option4 {
	margin: 100px;
}


</style>
</head>
<body>

<div class="inner">
	<div class="container">
		



		<!-- 탭 컨텐츠 -->
		<div class="tab-content">
			
			<div class="css-ow22sl e1v2ggz01">
				
				<!-- 1:1 문의 탭 -->
					<div class="tab-pane fade show active" id="inquiry">
						<h4 class="mb-4" style="text-align: center;   font-size: 40px; margin: 50px;">1:1 문의 내역</h4>
					</div>
					
					
					
					<input type="radio" id="option4" name="category" value="돌아가기" class="radio-input" ${category == '돌아가기' ? 'checked' : ''} onclick="location.href='${pageContext.request.contextPath}/mypage/main';" >
				        <label for="option4" class="radio-label" style="width: 150px; text-align: center; font-size: 20px;">돌아가기</label>
					
					<input type="radio" id="option4" name="category" value="삭제" style="float: right;" class="radio-input" ${category == '삭제' ? 'checked' : ''} onclick="location.href='${pageContext.request.contextPath}/mypage/oneToone';" >
				        <label for="option4" class="radio-label" style="width: 150px; text-align: center; font-size: 20px;">삭제</label>
					
					
				
					
					<div class="table-style6">
							<div>
								<span>
									<div class="table-header" >
										
											<div class="inquiry">문의내용</div>
										
									</div>
								</span>
							</div>
							<hr>
							<div>
								<span>
									<div class="table-content" >
										<div class="cont">
											<div class="date">2024-07-12</div>
											<div class="inquiry">배송문의</div>
											<div class="subject">혹시 배송 얼마나 걸리나요?</div>
											<div class="answer">답변완료</div>
										</div>
										<div class="cont">
											<div class="date">2024-07-12</div>
											<div class="inquiry">배송문의</div>
											<div class="subject">혹시 배송 얼마나 걸리나요?</div>
											<div class="answer">답변완료</div>
										</div>
									</div>
								</span>
							</div>
					</div>
					
					
					
					<div class="table-style6">
							<div>
								<span>
									<div class="table-header" >
										
											<div class="answer">답변내용</div>
										
									</div>
								</span>
							</div>
							<hr>
							<div>
								<span>
									<div class="table-content" >
										<div class="cont">
											<div class="date">2024-07-12</div>
											<div class="inquiry">배송문의</div>
											<div class="subject">혹시 배송 얼마나 걸리나요?</div>
											<div class="answer">답변완료</div>
										</div>
										<div class="cont">
											<div class="date">2024-07-12</div>
											<div class="inquiry">배송문의</div>
											<div class="subject">혹시 배송 얼마나 걸리나요?</div>
											<div class="answer">답변완료</div>
										</div>
									</div>
								</span>
							</div>
					</div>
					
					
		
		
			</div>
		</div>
		
		
	</div>
</div>




<!-- 새 문의 작성 모달 -->
	<div class="modal fade" id="inquiryModal" tabindex="-1"
		aria-labelledby="inquiryModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="inquiryModalLabel">새 문의 작성</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form>
						<div class="mb-3">
							<label for="inquiryType" class="form-label">문의 유형</label> <select
								class="form-select" id="inquiryType">
								<option>배송 관련</option>
								<option>상품 관련</option>
								<option>결제 관련</option>
								<option>기타</option>
							</select>
						</div>
						<div class="mb-3">
							<label for="inquiryTitle" class="form-label">제목</label> <input
								type="text" class="form-control" id="inquiryTitle">
						</div>
						<div class="mb-3">
							<label for="inquiryContent" class="form-label">문의 내용</label>
							<textarea class="form-control" id="inquiryContent" rows="3"></textarea>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary">문의 등록</button>
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