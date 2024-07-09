<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- CSS: 상품상세페이지 전용 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/page/details.css"
	type="text/css">
  
  <div class="container-fluid">
    <div class="container my-5">
      <div class="row">
        <div class="col-md-6">
          <div class="product-images d-flex">
            <div class="thumbnail-list me-3">
              <img src="https://via.placeholder.com/80x80/FFE4E1/000000?text=Image+1" alt="썸네일 1"
                class="img-thumbnail mb-2"
                data-main-img="https://via.placeholder.com/500x500/FFE4E1/000000?text=Main+Image+1">
              <img src="https://via.placeholder.com/80x80/E0FFFF/000000?text=Image+2" alt="썸네일 2"
                class="img-thumbnail mb-2"
                data-main-img="https://via.placeholder.com/500x500/E0FFFF/000000?text=Main+Image+2">
              <img src="https://via.placeholder.com/80x80/F0E6FA/000000?text=Image+3" alt="썸네일 3"
                class="img-thumbnail mb-2"
                data-main-img="https://via.placeholder.com/500x500/F0E6FA/000000?text=Main+Image+3">
              <img src="https://via.placeholder.com/80x80/FAFAE0/000000?text=Image+4" alt="썸네일 4"
                class="img-thumbnail mb-2"
                data-main-img="https://via.placeholder.com/500x500/FAFAE0/000000?text=Main+Image+4">
            </div>
            <div class="main-image-container">
              <img src="https://via.placeholder.com/500x500/FFE4E1/000000?text=Main+Image+1" alt="메인 이미지"
                class="img-fluid rounded main-image" id="mainImage">
            </div>
          </div>
        </div>
        <div class="col-md-6">
          <div class="product-info">
            <h1 class="product-title mb-3">${dto.productName}</h1>
            <div class="product-rating mb-3">
              <i class="bi bi-star-fill text-warning"></i>
              <i class="bi bi-star-fill text-warning"></i>
              <i class="bi bi-star-fill text-warning"></i>
              <i class="bi bi-star-fill text-warning"></i>
              <i class="bi bi-star-half text-warning"></i>
              <span class="ms-2 text-muted">${dto.reviewCount}개 리뷰</span>
            </div>
            <div class="product-price mb-3">
              <span class="badge bg-primary me-2">${dto.discountRate}%</span>
              <span class="fs-3 fw-bold">
              <fmt:formatNumber value="${dto.price * (1 - dto.discountRate / 100)}" pattern="#,###원" />
              </span>
             <span class="text-muted text-decoration-line-through">
              <fmt:formatNumber value="${dto.price}" pattern="#,###원" />
            </span>
            </div>
            <div class="product-benefits mb-3">
              <p class="text-muted"><i class="bi bi-gift me-2"></i>혜택: ${dto.savedMoney} 적립</p>
            </div>
            <div class="delivery-info mb-3">
              <p class="mb-1"><i class="bi bi-truck me-2"></i>배송비 : ${dto.delivery}</p>
              <p><i class="bi bi-clock me-2"></i>12:00 까지 결제시 오늘 출발</p>
              <p><i class="bi bi-box-seam me-2"></i>제주도/도서산간 지역 8,000원</p>
            </div>
            
            
          <div class="product-options mb-3">
    
          <!-- 옵션 시작 -->
		<c:choose>
		<c:when test="${dto.optionCount == 0}">
		  <p>단품</p>
		</c:when>
    <c:when test="${dto.optionCount == 1}">
      <select class="form-select mb-2 requiredOption" id="option1" data-optionNum="${listOption[0].optionNum}" ${dto.totalStock < 1 ? 'disabled':''}>
        <option selected>${listOption[0].optionName} 선택</option>
        <c:forEach var="vo" items="${listOptionDetail}">
          <option value="${vo.detailNum}" 
                  data-stockNum="${vo.stockNum}" 
                  data-totalStock="${vo.totalStock}" 
                  data-optionValue="${vo.optionValue}">
            ${vo.optionValue}${vo.totalStock<5?' 재고 - '+= vo.totalStock:''}
          </option>
        </c:forEach>
      </select>
    </c:when>
		  <c:when test="${dto.optionCount == 2}">
		 <select class="form-select mb-2 requiredOption" id="option1" data-optionNum="${listOption[0].optionNum}" ${dto.totalStock < 1 ? 'disabled':''}>
		   <option selected>${listOption[0].optionName} 선택</option>
		   <c:forEach var="vo" items="${listOptionDetail}">
		     <option value="${vo.detailNum}">${vo.optionValue}</option>
		   </c:forEach>
		 </select>
		 
		 <select class="form-select mb-2 requiredOption2" id="option2" data-optionNum2="${listOption[1].optionNum}" ${dto.totalStock < 1 ? 'disabled':''}>
		   <option selected>${listOption[1].optionName} 선택</option>
		   <c:forEach var="vo" items="${listOptionDetail2}">
		     <option value="${vo.detailNum}">${vo.optionValue}</option>
		   </c:forEach>
		 </select>
		</c:when>
  </c:choose>
</div>
            <div class="quantity-selector d-flex align-items-center mb-3">
              <button class="btn btn-outline-secondary" id="decreaseQuantity">-</button>
              <input type="number" class="form-control mx-2" id="quantity" value="1" min="1" style="width: 60px;">
              <button class="btn btn-outline-secondary" id="increaseQuantity">+</button>
            </div>
				<div class="total-price mb-3">
				    <span class="fs-5">주문금액</span>
				    <span class="fs-5 fw-bold" id="totalPrice" data-base-price="${dto.price * (1 - dto.discountRate / 100)}">
				       <fmt:formatNumber value="${dto.price * (1 - dto.discountRate / 100)}" pattern="#,###원" />
				    </span>
				</div>
            <div class="purchase-buttons">
              <button class="btn btn-outline-primary btn-lg me-2 flex-grow-1" id="addToCart"><i
                  class="bi bi-cart-plus me-2"></i>장바구니</button>
              <button class="btn btn-primary btn-lg flex-grow-1" id="buyNow"><i
                  class="bi bi-bag-check me-2"></i>바로구매</button>
                  <button class="btn btn-primary btn-lg w-100" id="stockAlert" style="display: none;"><i class="bi bi-bell me-2"></i>재입고 알림 신청</button>
            </div>
          </div>
        </div>
      </div>

      <!-- 상품 정보 탭 -->
      <div class="product-tabs mt-5">
        <ul class="nav nav-tabs" id="productTabs" role="tablist">
          <li class="nav-item" role="presentation">
            <button class="nav-link active" id="info-tab" data-bs-toggle="tab" data-bs-target="#info" type="button"
              role="tab" aria-controls="info" aria-selected="true">상품정보</button>
          </li>
          <li class="nav-item" role="presentation">
            <button class="nav-link" id="review-tab" data-bs-toggle="tab" data-bs-target="#review" type="button"
              role="tab" aria-controls="review" aria-selected="false">리뷰 ${dto.reviewCount}</button>
          </li>
          <li class="nav-item" role="presentation">
            <button class="nav-link" id="qna-tab" data-bs-toggle="tab" data-bs-target="#qna" type="button" role="tab"
              aria-controls="qna" aria-selected="false">문의 ${dto.questionCount}</button>
          </li>
          <li class="nav-item" role="presentation">
            <button class="nav-link" id="delivery-tab" data-bs-toggle="tab" data-bs-target="#delivery" type="button"
              role="tab" aria-controls="delivery" aria-selected="false">배송/환불</button>
          </li>
        </ul>

        <div class="tab-content" id="productTabsContent">
          <div class="tab-pane fade show active" id="info" role="tabpanel" aria-labelledby="info-tab">
            <!-- 상품 상세 정보 -->
            <div class="container my-5 px-0">
              <div class="row">
                <div class="col-12 px-0">
                  <img src="https://via.placeholder.com/1200x600" alt="상품 상세 이미지" class="img-fluid w-100 mb-4">
                  <div class="container">
                    <h3>상품 설명</h3>
                    <p>오마이갓 오마이갓 오마이갓</p>
                    <h3>주요 특징</h3>
                    <ul>
                      <li>뭔가</li>
                      <li>를</li>
                      <li>지어내서 요로캐</li>
                      <li>작성을 해요,,,</li>
                    </ul>
                  </div>
                  <img src="https://via.placeholder.com/1200x800" alt="제품 상세 설명" class="img-fluid w-100 mt-4">
                </div>
              </div>
            </div>
          </div>

          <!--리뷰시작!-->
          <div class="tab-pane fade" id="review" role="tabpanel" aria-labelledby="review-tab">
            <div class="d-flex justify-content-between align-items-center mb-4">
              <h3>리뷰 ${dto.reviewCount}</h3>
              <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#reviewModal">리뷰쓰기</button>
            </div>


            <div class="review-summary mb-4">
              <div class="row">
                <div class="col-md-3">
                  <!--평점 계산 하는 함수를...만들어야-->
                  <h2 class="display-4">11</h2>
                  <div class="stars">
                    <i class="bi bi-star-fill text-warning"></i>
                    <i class="bi bi-star-fill text-warning"></i>
                    <i class="bi bi-star-fill text-warning"></i>
                    <i class="bi bi-star-fill text-warning"></i>
                    <i class="bi bi-star-half text-warning"></i>
                  </div>
                </div>
                <!--리뷰 평점 별로 갯수...를 표현-->
                <div class="col-md-9">
                  <div class="progress mb-2" style="height: 20px;">
                    <div class="progress-bar bg-primary" role="progressbar" style="width: 80%;" aria-valuenow="80"
                      aria-valuemin="0" aria-valuemax="100">5점 (15)</div>
                  </div>
                  <div class="progress mb-2" style="height: 20px;">
                    <div class="progress-bar bg-primary" role="progressbar" style="width: 15%;" aria-valuenow="15"
                      aria-valuemin="0" aria-valuemax="100">4점 (22)</div>
                  </div>
                  <div class="progress mb-2" style="height: 20px;">
                    <div class="progress-bar bg-primary" role="progressbar" style="width: 3%;" aria-valuenow="3"
                      aria-valuemin="0" aria-valuemax="100">3점 (41)</div>
                  </div>
                  <div class="progress mb-2" style="height: 20px;">
                    <div class="progress-bar bg-primary" role="progressbar" style="width: 1%;" aria-valuenow="1"
                      aria-valuemin="0" aria-valuemax="100">2점 (9)</div>
                  </div>
                  <div class="progress mb-2" style="height: 20px;">
                    <div class="progress-bar bg-primary" role="progressbar" style="width: 1%;" aria-valuenow="1"
                      aria-valuemin="0" aria-valuemax="100">1점 (5)</div>
                  </div>
                </div>
              </div>
            </div>


            <!--리뷰 필터-->
            <div class="review-filters mb-4">
              <button class="btn btn-outline-primary me-2">베스트순</button>
              <button class="btn btn-outline-primary me-2">최신순</button>
              <button class="btn btn-outline-primary">사진리뷰</button>
            </div>

            <div class="review-list">
              <!-- 리뷰 예시로 하나 넣어놈 -->
              <div class="review-item border-bottom pb-4 mb-4">
                <div class="d-flex align-items-center mb-2">
                  <img src="https://via.placeholder.com/40" alt="User" class="rounded-circle me-2">
                  <strong>진태만두</strong>
                  <div class="stars ms-auto">
                    <i class="bi bi-star-fill text-warning"></i>
                    <i class="bi bi-star-fill text-warning"></i>
                    <i class="bi bi-star-fill text-warning"></i>
                    <i class="bi bi-star-fill text-warning"></i>
                    <i class="bi bi-star-fill text-warning"></i>
                  </div>
                </div>
                <p class="mb-2">2024.06.13 · 새근새근 구매</p>
                <div class="review-content">
                  <p>오예 ...</p>
                  <img src="https://via.placeholder.com/200x200" alt="Review Image" class="img-fluid mb-2">
                </div>
                <!--도움 돼요..가 꼭있어야 하는지-->
                <button class="btn btn-sm btn-outline-secondary">도움이 돼요</button>
              </div>
              <!-- 추가 리뷰 나올곳... -->
            </div>
          </div>
          <div class="tab-pane fade" id="qna" role="tabpanel" aria-labelledby="qna-tab">
            <!-- 문의 내용 -->
            <p>상품에 대한 문의 내용....</p>
          </div>
          <div class="tab-pane fade" id="delivery" role="tabpanel" aria-labelledby="delivery-tab">
            <!-- 배송/환불 정보 -->
            <p>배송 및 환불에 관한 정보.</p>
          </div>
        </div>
      </div>
    </div>
</div>




    <!-- 스크롤 시 나타나는 옵션 선택 영역 -->
    <div id="scrollOptionArea" class="scroll-option-area">
      <h6 class="mb-2" id="scrollProductName">집이나 가고싶다..</h6>
      <p class="mb-2">가격: <span id="scrollProductPrice">69,800원</span></p>
      <select class="form-select mb-2" id="scrollOption1">
        <option selected>옵션 1 선택</option>
        <option value="1">옵션 1-1</option>
        <option value="2">옵션 1-2</option>
      </select>
      <select class="form-select mb-2" id="scrollOption2">
        <option selected>옵션 2 선택</option>
        <option value="1">옵션 2-1</option>
        <option value="2">옵션 2-2</option>
      </select>
      <div class="d-flex justify-content-between align-items-center mb-2">
        <span>수량:</span>
        <div class="input-group" style="width: 120px;">
          <button class="btn btn-outline-secondary btn-sm" id="scrollDecreaseQuantity">-</button>
          <input type="number" class="form-control form-control-sm" id="scrollQuantity" value="1" min="1"
            style="text-align: center;">
          <button class="btn btn-outline-secondary btn-sm" id="scrollIncreaseQuantity">+</button>
        </div>
      </div>
      <p class="mb-2">총 가격: <span id="scrollTotalPrice">69,800원</span></p>
      <div class="d-flex justify-content-between">
        <button class="btn btn-outline-primary btn-sm flex-grow-1 me-2" id="scrollAddToCart">장바구니</button>
        <button class="btn btn-primary btn-sm flex-grow-1" id="scrollBuyButton">구매하기</button>
      </div>
    </div>


    <!-- 리뷰 작성 모달 -->
    <div class="modal fade" id="reviewModal" tabindex="-1" aria-labelledby="reviewModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="reviewModalLabel">리뷰 작성</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <form>
              <div class="mb-3">
                <label for="reviewRating" class="form-label">평점</label>
                <select class="form-select" id="reviewRating">
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
                <label for="reviewImage" class="form-label">이미지 첨부</label>
                <input type="file" class="form-control" id="reviewImage">
              </div>
            </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
            <button type="button" class="btn btn-primary">리뷰 등록</button>
          </div>
        </div>
      </div>
    </div>


    <!--챗봇-->
    <div id="live-chat-widget" class="live-chat-widget">
      <button id="chat-toggle" class="chat-toggle">
        <i class="bi bi-chat-dots"></i>
      </button>
      <div id="chat-window" class="chat-window">
        <div class="chat-header">
          <h5>실시간 상담</h5>
          <button id="chat-close" class="chat-close">
            <i class="bi bi-x"></i>
          </button>
        </div>
        <div id="chat-messages" class="chat-messages">
          <!-- 메시지 추가되는곳 -->
        </div>
        <div class="chat-input">
          <input type="text" id="chat-input-field" placeholder="메시지를 입력하세요...">
          <button id="chat-send">
            <i class="bi bi-send"></i>
          </button>
        </div>
      </div>
    </div>


    <!--토스트 메시지-->
 <div class="toast" id="cartToast" role="alert" aria-live="assertive" aria-atomic="true">
  <div class="toast-header">
    <strong class="me-auto">알림</strong>
    <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
  </div>
  <div class="toast-body">
    장바구니에 상품이 추가되었습니다.
  </div>
</div>


<%-- TODO: 자바스크립트--%>
<script type="text/javascript">
	
$(document).ready(function () {
    console.log('문서 준비 완료~');
    
    // 기본 변수들 선언
    const basePrice = parseFloat($('#totalPrice').data('base-price'));
    const $scrollOptionArea = $('#scrollOptionArea');
    const $productInfo = $('.product-info');
    let productInfoBottom = 0;
    let isOutOfStock = false; // 품절 상태 변수
    let lastScrollTop = $(window).scrollTop();

    // 채팅 관련 변수들
    const $chatToggle = $('#chat-toggle');
    const $chatWindow = $('#chat-window');
    const $chatClose = $('#chat-close');
    const $chatMessages = $('#chat-messages');
    const $chatInputField = $('#chat-input-field');
    const $chatSend = $('#chat-send');

    // 가격 유효성 검사
    if (isNaN(basePrice)) {
        console.error('기본 가격이 유효하지 않습니다.');
        return;
    }
    console.log('기본 가격:', basePrice);

    // 가격 업데이트 함수
    function updatePrice(quantity) {
        const totalPrice = basePrice * quantity;
        console.log('가격 업데이트:', totalPrice);
        $('#totalPrice, #scrollTotalPrice').text(totalPrice.toLocaleString() + '원');
    }

    // 수량 변경 핸들러
    function handleQuantityChange() {
        const quantity = parseInt($('#quantity').val());
        console.log('수량 변경:', quantity);
        updatePrice(quantity);
    }

    // 스크롤 옵션 정보 업데이트
    function updateScrollInfo() {
        console.log('스크롤 정보 업데이트');
        $('#scrollProductName').text($('.product-title').text());
        $('#scrollProductPrice').text($('.product-price .fw-bold').text());
        updatePrice($('#quantity').val());
    }

    // 상품 상태 업데이트
    function updateProductStatus(outOfStock) {
        console.log('상품 상태 업데이트, 품절:', outOfStock);
        isOutOfStock = outOfStock;
        if (isOutOfStock) {
            $('.quantity-selector, .total-price, #addToCart, #buyNow').hide();
            $('#stockAlert').show();
            $scrollOptionArea.hide();
        } else {
            $('.quantity-selector, .total-price, #addToCart, #buyNow').show();
            $('#stockAlert').hide();
        }
        toggleScrollOption();
    }

    // 스크롤 옵션 토글
    function toggleScrollOption() {
        const currentScrollTop = $(window).scrollTop();
        if (currentScrollTop === lastScrollTop) return;
        
        lastScrollTop = currentScrollTop;
        console.log('스크롤 옵션 토글');
        if (isOutOfStock) {
            $scrollOptionArea.hide();
        } else if (currentScrollTop > productInfoBottom) {
            $scrollOptionArea.addClass('visible');
            updateScrollInfo();
        } else {
            $scrollOptionArea.removeClass('visible');
        }
    }

    // 상품 정보 위치 업데이트
    function updateProductInfoBottom() {
        console.log('상품 정보 위치 업데이트');
        if ($productInfo.length) {
            productInfoBottom = $productInfo.offset().top + $productInfo.outerHeight();
            console.log('상품 정보 하단 위치:', productInfoBottom);
        }
    }

    // 토스트 메시지 표시
    function showCartToast() {
        console.log('토스트 메시지 표시 시도');
        if (toastList.length > 0) {
            toastList[0].show();
            console.log('토스트 메시지 표시됨');
        } else {
            console.error('토스트 요소를 찾을 수 없음');
        }
    }

    // 이벤트 리스너 등록
    $('#quantity').on('change', handleQuantityChange);
    
    // 수량 증감 버튼
    $('#decreaseQuantity, #scrollDecreaseQuantity').click(function () {
        let quantity = parseInt($('#quantity').val());
        if (quantity > 1) {
            quantity--;
            $('#quantity, #scrollQuantity').val(quantity);
            updatePrice(quantity);
        }
    });

    $('#increaseQuantity, #scrollIncreaseQuantity').click(function () {
        let quantity = parseInt($('#quantity').val()) + 1;
        $('#quantity, #scrollQuantity').val(quantity);
        updatePrice(quantity);
    });

    // 옵션 선택 동기화
    $('#option1, #option2, #scrollOption1, #scrollOption2').change(function () {
        const isScroll = $(this).attr('id').includes('scroll');
        const optionNumber = $(this).attr('id').slice(-1);
        const targetId = isScroll ? `option${optionNumber}` : `scrollOption${optionNumber}`;
        $(`#${targetId}`).val($(this).val());
    });

    // 토스트 초기화
    var toastElList = [].slice.call(document.querySelectorAll('.toast'))
    var toastList = toastElList.map(function(toastEl) {
        return new bootstrap.Toast(toastEl)
    })

    // 장바구니 추가
    $('#addToCart, #scrollAddToCart').click(function () {
        console.log('장바구니에 추가');
        showCartToast();
    });

    // 구매 버튼
    $('#buyNow, #scrollBuyButton').click(function () {
        console.log('구매 버튼 클릭');
        alert('구매 페이지로 이동합니다.');
    });

    // 재입고 알림
    $('#stockAlert').click(function () {
        console.log('재입고 알림 신청');
        alert('재입고 시 알림을 보내드리겠습니다.');
    });

    // 채팅 관련 함수
    function addMessage(message, isUser = false) {
        const messageClass = isUser ? 'user-message' : 'agent-message';
        const messageElement = document.createElement('div');
        messageElement.className = `message ${messageClass}`;
        
        const messageContent = document.createElement('div');
        messageContent.innerHTML = message;
        
        const timestamp = document.createElement('div');
        timestamp.className = 'timestamp';
        timestamp.textContent = new Date().toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' });
        
        messageElement.appendChild(messageContent);
        messageElement.appendChild(timestamp);
        
        $chatMessages.append(messageElement);
        $chatMessages.scrollTop($chatMessages[0].scrollHeight);
    }

    // 인사말 생성
    function getGreeting() {
        const now = new Date();
        const hour = now.getHours();
        const isBusinessHours = hour >= 9 && hour < 18;
        
        if (isBusinessHours) {
            return `
                <strong>안녕하세요! 새근새근 고객센터입니다.</strong><br>
                무엇을 도와드릴까요?<br>
                <span style="color: #4CAF50;">현재 상담 가능 시간입니다. (평일 오전 9시 ~ 오후 6시)</span>
            `;
        } else {
            return `
                <strong>안녕하세요! 새근새근 고객센터입니다.</strong><br>
                <span style="color: #FF5722;">현재는 상담 가능 시간이 아닙니다.</span><br>
                상담 가능 시간은 평일 오전 9시부터 오후 6시까지입니다.<br>
                그 외 시간에는 문의 내용을 남겨주시면 상담 가능 시간에 순차적으로 답변 드리겠습니다.<br>
                감사합니다!
            `;
        }
    }

    // 초기 인사 메시지 추가
    function addInitialMessage() {
        const greeting = getGreeting();
        addMessage(greeting);
    }

    // 메시지 전송
    function sendMessage() {
        const message = $chatInputField.val().trim();
        if (message) {
            addMessage(message, true);
            $chatInputField.val('');
            setTimeout(() => {
                addMessage('감사합니다. 곧 상담원이 응답드리겠습니다.');
            }, 1000);
        }
    }

    // 채팅창 토글
    $chatToggle.click(function () {
        $chatWindow.show();
        $(this).hide();
        if ($chatMessages.children().length === 0) {
            addInitialMessage();
        }
    });

    // 채팅창 닫기
    $chatClose.click(function () {
        $chatWindow.hide();
        $chatToggle.show();
    });

    // 메시지 전송 이벤트
    $chatSend.on('click', sendMessage);
    $chatInputField.on('keypress', function (e) {
        if (e.which === 13) {
            e.preventDefault();
            sendMessage();
        }
    });

    // 윈도우 이벤트
    $(window).scroll(toggleScrollOption);
    $(window).resize(function() {
        console.log('창 크기 변경');
        updateProductInfoBottom();
        toggleScrollOption();
    });

    // 초기화
    updateProductInfoBottom();
    updatePrice($('#quantity').val());

    // 품절 상태 설정 (테스트용)
    isOutOfStock = false;
    updateProductStatus(isOutOfStock);
    
    
    //옵션개수 
    
    
});

</script>