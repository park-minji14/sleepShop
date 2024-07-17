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


/*-----찜한 상품,최근 본 상품------------------*/
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
/*--------------------------------*/



/*--------------포인트--------------*/
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
/*--------------------------------*/


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

.cont {
	margin-bottom: 30px;
	margin-top: 30px;
}

.hover { cursor: pointer; }
.hover: hover {	color: #0d6efd; }
</style>

<div class="inner">
	<div class="container">
		<!-- 네비게이션 탭 -->
		<ul class="nav nav-tabs mb-4">
			<li class="nav-item"><a class="nav-link active" id="myshop-tab"
				data-bs-toggle="tab" href="#orders" aria-controls="myshop">나의 쇼핑</a></li>
			<li class="nav-item"><a class="nav-link" id="reviews-tab"
				data-bs-toggle="tab" aria-controls="review">나의 리뷰</a></li>
			<li class="nav-item"><a class="nav-link" id="wishlist-tab"
				data-bs-toggle="tab" href="#wishlist" aria-controls="wishlist">찜한 상품</a></li>
			<li class="nav-item"><a class="nav-link" id="recent-tab"
				data-bs-toggle="tab" href="#recent" aria-controls="recent">최근 본 상품</a></li>
			<li class="nav-item"><a class="nav-link" id="oneToone-tab"
				data-bs-toggle="tab" href="#inquiry" aria-controls="oneToone">1:1 문의</a></li>
				
			<li class="nav-item"><a class="nav-link" id="point-tab"
				data-bs-toggle="tab" href="#point" aria-controls="point">포인트</a></li>	
			
			<li class="nav-item"><a class="nav-link" id="settings-tab"
				data-bs-toggle="tab" href="#settings" aria-controls="settings">설정</a></li>
			<c:if test="${sessionScope.member.membership > 50}">
			<li class="nav-item"><a class="nav-link" id="expert-tab"
				data-bs-toggle="tab" href="#expert" aria-controls="expert">전문가 프로필</a></li>
			</c:if>
		</ul>

		<!-- 탭 컨텐츠 -->
		<div class="tab-content"></div>
	</div>
</div>

<!-- Modal -->
<div class="modal fade" id="myPageDialogModal" tabindex="-1" aria-labelledby="myPageDialogModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="myPageDialogModalLabel">마이페이지</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body"></div>
		</div>
	</div>
</div>

	<script>
		function login() {
			location.href = '${pageContext.request.contextPath}/member/login';
		}
	
		function ajaxFun(url, method, formData, dataType, fn, file = false) {
			const settings = {
					type: method, 
					data: formData,
					dataType:dataType,
					success:function(data) {
						fn(data);
					},
					beforeSend: function(jqXHR) {
						jqXHR.setRequestHeader('AJAX', true);
					},
					complete: function () {
					},
					error: function(jqXHR) {
						if(jqXHR.status === 403) {
							login();
							return false;
						} else if(jqXHR.status === 400) {
							alert('요청 처리가 실패 했습니다.');
							return false;
				    	}
				    	
						console.log(jqXHR.responseText);
					}
			};
			
			if(file) {
				settings.processData = false;  // file 전송시 필수. 서버로전송할 데이터를 쿼리문자열로 변환여부
				settings.contentType = false;  // file 전송시 필수. 서버에전송할 데이터의 Content-Type. 기본:application/x-www-urlencoded
			}
			
			$.ajax(url, settings);
		}	
	
		$(document).ready(function() {
			loadContent('myshop')
			
			// 탭 전환 로직
			$('a[data-bs-toggle="tab"]').on('shown.bs.tab', function(e) {
				const tab = $(this).attr("aria-controls");
				
				loadContent(tab)
			});
			
			function loadContent(tab) {
				let url = "${pageContext.request.contextPath}/mypage/" + tab;
				let selector = ".tab-content";
				
				if(tab === "oneToone") {
					// 1:1 문의
					listInquiry(1);
					return;
				}
				
				
				const fn = function(data){
					$(selector).html(data);
				};
				ajaxFun(url, "get", null, "text", fn);		
			}

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
	
	<script>
	  // 1:1 문의 -----------------
	  function listInquiry(page) { // 리스트
		  let url = "${pageContext.request.contextPath}/inquiry/list";
		  let selector = ".tab-content";
		  
		  const fn = function(data){
				$(selector).html(data);
			};
			ajaxFun(url, "get", {pageNo:page}, "text", fn);
	  }
	  
	  function inquiryModalOpen() { // 등록 모달창
		  $('#inquiryModal').modal('show');
	  }
	
	  function inquirySave() { // 문의 등록
			let url = '${pageContext.request.contextPath}/inquiry/write';
			let formData = $('form[name=inquiryForm]').serialize();
			
			const fn = function(data) {
				$('form[name=inquiryForm]')[0].reset();
				
				$('#inquiryModal').modal('hide');
				
				listInquiry(1);
			};
			
			ajaxFun(url, 'post', formData, 'json', fn);
	  }
	  
	  function detialsInquiry(num, pageNo) { // 문의 상세 보기
			let url = '${pageContext.request.contextPath}/inquiry/article';
			
			const fn = function(data) {
				$('.tab-content').html(data);
			};
			
			ajaxFun(url, 'get', {num:num, pageNo:pageNo}, 'text', fn);
	  }
	  
	  function deleteInquiry(num, pageNo) { // 문의 삭제
		  
	  }
	  
	</script>
	
	
	