<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- CSS: 상품상세페이지 전용 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/page/details.css"
	type="text/css">

<style>
.pagination {
    background-color: rgba(255, 255, 255, 0.8);
    border-radius: 50px;
    padding: 5px;
    display: inline-flex;
    align-items: center;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.pagination .page-item:first-child .page-link,
.pagination .page-item:last-child .page-link {
    border-radius: 50%;
    width: 40px;
    height: 40px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 1.2rem;
    margin: 0 5px;
    background-color: #f8f9fa;
    border: none;
    color: #6c757d;
}

.pagination .page-item:not(:first-child):not(:last-child) .page-link {
    border: none;
    background-color: transparent;
    color: #6c757d;
    font-weight: bold;
    padding: 0.5rem 0.8rem;
}

.pagination .page-item.active .page-link {
    background-color: #4CAF50;
    color: white;
    border-radius: 50%;
    width: 30px;
    height: 30px;
    display: flex;
    align-items: center;
    justify-content: center;
}

.pagination .page-link:focus {
    box-shadow: none;
}

.pagination .page-link:hover {
    background-color: #e9ecef;
}
</style>
  
  <div class="container-fluid">
    <div class="container my-5">
      <div class="row">
        <div class="col-md-6" >
          <div class="product-images d-flex">
			  <div class="thumbnail-list me-3">
			    <c:forEach var="image" items="${listFile}" varStatus="status">
			    <img src="${pageContext.request.contextPath}/uploads/product/${image.img_name}" 
			         alt="썸네일 ${status.index+1}"
			         class="img-thumbnail mb-2"
			         data-main-img="${pageContext.request.contextPath}/uploads/product/${image.img_name}">
			  </c:forEach>
			</div>
			
		<div class="main-image-container">
		  <c:choose>
		    <c:when test="${not empty listFile}">
		      <img src="${pageContext.request.contextPath}/uploads/product/${listFile[0].img_name}"
		           class="img-fluid rounded main-image" id="mainImage" alt="메인 상품 이미지">
		    </c:when>
		  </c:choose>
		</div>
         </div>
       </div>
        
           
        <div class="col-md-6">
          <div class="product-info">
            <h1 class="product-title mb-3">${dto.productName}</h1>
             <input type="hidden" id="productNum" value="${dto.productNum}">
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
            
			<div class="product-options mb-3" data-option-count="${dto.optionCount}" data-stock-num="${dto.stockNum}">
			    <c:if test="${dto.optionCount > 0}">
			        <div class="mt-2">
			            <select class="form-select requiredOption" id="option1" data-option-num="${listOption[0].optionNum}" ${dto.totalStock < 1 ? 'disabled':''}>
			                <option value="">${listOption[0].optionName} 선택</option>
			                <c:forEach var="vo" items="${listOptionDetail}">
			                    <c:if test="${vo.optionValue != prevOptionValue}">
			                        <option value="${vo.detailNum}" data-stock-num="${vo.stockNum}" data-total-stock="${vo.totalStock}" data-option-value="${vo.optionValue}">
			                            ${vo.optionValue}
			                        </option>
			                        <c:set var="prevOptionValue" value="${vo.optionValue}" />
			                    </c:if>
			                </c:forEach>
			            </select>
			        </div>
			    </c:if>
			    <c:if test="${dto.optionCount > 1}">
			        <div class="mt-2">
			            <select class="form-select requiredOption2" id="option2" data-option-num2="${listOption[1].optionNum}" disabled>
			                <option value="">${listOption[1].optionName} 선택</option>
			            </select>
			        </div>
			    </c:if>
			</div>
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
	            <button class="btn btn-outline-secondary btn-lg me-2 flex-grow-1 btn-gift" id="gift"><i class="bi bi-gift me-2"></i>선물하기</button>
	            <button class="btn btn-outline-primary btn-lg me-2 flex-grow-1 btn-cart" id="addToCart"><i class="bi bi-cart-plus me-2"></i>장바구니</button>
	            <button class="btn btn-primary btn-lg flex-grow-1 btn-buy" id="buyNow"><i class="bi bi-bag-check me-2"></i>바로구매</button>
	            <button class="btn btn-primary btn-lg w-100" id="stockAlert" style="display: none;"><i class="bi bi-bell me-2"></i>재입고 알림 신청</button>
	        </div>
          </div>
        </div>
      </div>
      
   <div class="container mt-5">
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
            <div class="tab-content mb-4" id="productTabsContent">
                <!-- 상품 정보 탭 내용 -->
                <div class="tab-pane fade show active mb-4" id="info" role="tabpanel" aria-labelledby="info-tab">
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

                <!-- 리뷰 탭 내용 -->
                <div class="tab-pane fade mb-4" id="review" role="tabpanel" aria-labelledby="review-tab">
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <h3>리뷰 ${dto.reviewCount}</h3>
                        <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#reviewModal">리뷰쓰기</button>
                    </div>
                    <div class="review-summary mb-4">
                        <div class="row">
                            <div class="col-md-3">
                                <!-- 평점 계산 하는 함수를... 만들어야 -->
                                <h2 class="display-4">${dto.reviewCount}</h2>
                                <div class="stars">
                                    <i class="bi bi-star-fill text-warning"></i>
                                    <i class="bi bi-star-fill text-warning"></i>
                                    <i class="bi bi-star-fill text-warning"></i>
                                    <i class="bi bi-star-fill text-warning"></i>
                                    <i class="bi bi-star-half text-warning"></i>
                                </div>
                            </div>
                            <!-- 리뷰 평점 별로 갯수...를 표현 -->
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
                    <div class="review-list">
                        <!-- 리뷰 예시 -->
                        <div class="review-item">
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
                            <button class="btn btn-sm btn-outline-secondary">도움이 돼요</button>
                        </div>
                        <!-- 추가 리뷰 나올 곳 -->
                    </div>
                </div>

                <!-- 상품문의 탭 내용 -->
				<div class="tab-pane fade mb-4" id="qna" role="tabpanel" aria-labelledby="qna-tab">
				    <div class="container">
				        <div class="row mb-4">
				            <div class="col-12">
				                <h3 class="border-bottom pb-2">상품 문의</h3>
				            </div>
				        </div>
				        <div class="row mb-3">
				            <div class="col-12">
				                <div class="alert alert-info" role="alert">
				                    <h5 class="alert-heading">
				                        <i class="bi bi-info-circle me-2"></i>
				                        문의 안내사항
				                    </h5>
				                    <ul class="mb-0">
				                        <li>상품과 관련 없는 문의나 욕설, 비방 내용은 답변이 거부될 수 있습니다.</li>
				                        <li>개인정보가 포함된 문의는 비밀글로 작성해 주세요.</li>
				                        <li>답변은 영업일 기준 2~3일 내에 등록됩니다.</li>
				                    </ul>
				                </div>
				            </div>
				        </div>
				        <div class="row mb-4" style="padding: 0;">
				            <div class="col-12 text-end">
				                <button id="showQnaForm" class="btn btn-outline-dark rounded-pill" data-bs-toggle="modal" data-bs-target="#qnaModal">
				                    <i class="bi bi-pencil-square me-2"></i>문의하기
				                </button>
				            </div>
				        </div>
				        <div class="row">
				            <div class="col-12">
				                <div id="qnaList" class="list-question border p-3 rounded">
				                    <!-- 상품문의 리스트 -->
				                </div>
				            </div>
				        </div>
				    </div>
				</div>
                <!-- 배송/환불 탭 내용 -->
                <div class="tab-pane fade mb-4" id="delivery" role="tabpanel" aria-labelledby="delivery-tab">
                    <h2>배송/교환/환불</h2>

                    <div class="policy-card">
                        <h5><i class="bi bi-truck"></i> 배송</h5>
                        <table>
                            <tr>
                                <th>배송</th>
                                <td>일반택배</td>
                            </tr>
                            <tr>
                                <th>배송비</th>
                                <td>${dto.delivery}</td>
                            </tr>
                            <tr>
                                <th>도서산간 추가 배송비</th>
                                <td>3,000원</td>
                            </tr>
                            <tr>
                                <th>배송불가 지역</th>
                                <td>배송불가 지역이 없습니다.</td>
                            </tr>
                        </table>
                    </div>

                    <div class="policy-card">
                        <h5><i class="bi bi-arrow-repeat"></i> 교환/환불</h5>
                        <table>
                            <tr>
                                <th>반품 배송비</th>
                                <td>3,000원 (최초 배송비가 무료인 경우 6,000원 부과)</td>
                            </tr>
                            <tr>
                                <th>교환 배송비</th>
                                <td>6,000원</td>
                            </tr>
                            <tr>
                                <th>보내실 곳</th>
                                <td>쌍용교육센터</td>
                            </tr>
                        </table>
                    </div>

                    <div class="policy-card">
                        <h5><i class="bi bi-clock-history"></i> 반품/교환 사유에 따른 요청 가능 기간</h5>
                        <div class="policy-list">
                            <ol>
                                <li>구매자 단순 변심은 상품 수령 후 7일 이내</li>
                                <li>표시/광고와 상이, 계약내용과 다르게 이행된 경우 상품 수령 후 3개월 이내, 그 사실을 안 날 또는 알 수 있었던 날부터 30일 이내</li>
                            </ol>
                        </div>
                    </div>

                    <div class="policy-card">
                        <h5><i class="bi bi-x-circle"></i> 반품/교환 불가능 사유</h5>
                        <div class="policy-list">
                            <ol>
                                <li>반품 요청 기간이 지난 경우</li>
                                <li>구매자의 책임 있는 사유로 상품 등이 멸실 또는 훼손된 경우</li>
                                <li>포장을 개봉하였으나 포장이 훼손되어 상품 가치가 현저히 상실된 경우</li>
                                <li>구매자의 사용 또는 일부 소비에 의해 상품의 가치가 현저히 감소한 경우</li>
                                <li>시간이 경과되어 재판매가 곤란할 정도로 상품 등의 가치가 현저히 감소한 경우</li>
                                <li>복제가 가능한 상품의 포장이 훼손된 경우</li>
                            </ol>
                        </div>
                    </div>

                    <div class="policy-card">
                        <h5><i class="bi bi-cash"></i> 환불 정책</h5>
                        <div class="policy-list">
                            <ul>
                                <li>신청 기간: 상품 수령 후 7일 이내 (미사용, 미개봉 상품에 한함)</li>
                                <li>환불 방법: 마이페이지 또는 고객센터를 통해 신청</li>
                                <li>환불 금액: 상품 구매가 + 배송비 (단, 무료배송 상품이 아닌 경우 초기 배송비 제외)</li>
                                <li>환불 처리 기간: 상품 회수 확인 후 3영업일 이내</li>
                                <li>환불 배송비: 고객 변심의 경우 왕복 배송비 고객 부담, 상품 하자 시 판매자 부담</li>
                                <li>사용/개봉 상품: 훼손 정도에 따라 환불 금액 차감될 수 있음</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
<%--문의하기 모달 --%>
<div class="modal fade" id="qnaModal" tabindex="-1" aria-labelledby="qnaModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="qnaModalLabel">상품 문의하기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form id="qnaForm">
          <div class="mb-3">
            <label class="form-label">문의 유형</label>
            <div>
              <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="qnaType" id="qnaTypeProduct" value="상품" checked>
                <label class="form-check-label" for="qnaTypeProduct">상품</label>
              </div>
              <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="qnaType" id="qnaTypeDelivery" value="배송">
                <label class="form-check-label" for="qnaTypeDelivery">배송</label>
              </div>
              <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="qnaType" id="qnaTypeReturn" value="반품/교환">
                <label class="form-check-label" for="qnaTypeReturn">반품/교환</label>
              </div>
              <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="qnaType" id="qnaTypeRefund" value="환불">
                <label class="form-check-label" for="qnaTypeRefund">환불</label>
              </div>
              <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="qnaType" id="qnaTypeOther" value="기타">
                <label class="form-check-label" for="qnaTypeOther">기타</label>
              </div>
            </div>
          </div>
          <div class="mb-3">
            <label for="qnaContent" class="form-label">문의 내용</label>
            <textarea class="form-control" id="qnaContent" name="question" rows="5" required placeholder=""></textarea>
            <div id="qnaContentGuide" class="form-text">
              문의 내용을 자세히 작성해 주세요. 답변은 확인 후 순차적으로 처리되며, 
              마이페이지에서도 확인 가능합니다. 개인정보는 문의 처리 후 안전하게 폐기됩니다.
            </div>
          </div>
          <div class="mb-3">
            <label for="qnaFile" class="form-label">파일 첨부</label>
            <input type="file" class="form-control" id="qnaFile" name="file" accept="image/*" multiple>
            <div class="form-text">이미지 파일만 첨부 가능합니다. (최대 5개, 각 5MB 이하)</div>
          </div>
          <div id="fileList" class="mt-2"></div>
          <div class="mb-3 form-check">
            <input type="checkbox" class="form-check-input" id="qnaPrivate" name="isPrivate">
            <label class="form-check-label" for="qnaPrivate">비밀글로 문의하기</label>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary" id="submitQna">문의하기</button>
      </div>
    </div>
  </div>
</div>
    <!-- 스크롤 시 나타나는 옵션 선택 영역 -->
<div id="scrollOptionArea" class="scroll-option-area">
  <h6 class="mb-2" id="scrollProductName">${dto.productName}</h6>
  <p class="mb-2">가격: <span id="scrollProductPrice"><fmt:formatNumber value="${dto.price * (1 - dto.discountRate / 100)}" pattern="#,###원" /></span></p>
  
  <c:choose>
    <c:when test="${dto.optionCount == 0}">
      <p>단품</p>
    </c:when>
    <c:when test="${dto.optionCount == 1}">
      <select class="form-select mb-2 requiredOption" id="scrollOption1" data-option-num="${listOption[0].optionNum}" ${dto.totalStock < 1 ? 'disabled':''}>
        <option selected>${listOption[0].optionName} 선택</option>
        <c:forEach var="vo" items="${listOptionDetail}">
          <option value="${vo.detailNum}" 
                  data-stock-num="${vo.stockNum}" 
                  data-total-stock="${vo.totalStock}" 
                  data-option-value="${vo.optionValue}">
            ${vo.optionValue}${vo.totalStock < 5 ? ' 재고 - ' + vo.totalStock : ''}
          </option>
        </c:forEach>
      </select>
    </c:when>
    <c:when test="${dto.optionCount == 2}">
      <select class="form-select mb-2 requiredOption" id="scrollOption1" data-option-num="${listOption[0].optionNum}" ${dto.totalStock < 1 ? 'disabled':''}>
        <option selected>${listOption[0].optionName} 선택</option>
        <c:forEach var="vo" items="${listOptionDetail}">
          <option value="${vo.detailNum}">${vo.optionValue}</option>
        </c:forEach>
      </select>
      
      <select class="form-select mb-2 requiredOption2" id="scrollOption2" data-option-num2="${listOption[1].optionNum}" disabled>
        <option selected>${listOption[1].optionName} 선택</option>
      </select>
    </c:when>
  </c:choose>

  <div class="d-flex justify-content-between align-items-center mb-2">
    <span>수량:</span>
    <div class="input-group" style="width: 120px;">
      <button class="btn btn-outline-secondary btn-sm" id="scrollDecreaseQuantity">-</button>
      <input type="number" class="form-control form-control-sm" id="scrollQuantity" value="1" min="1" style="text-align: center;">
      <button class="btn btn-outline-secondary btn-sm" id="scrollIncreaseQuantity">+</button>
    </div>
  </div>
  <p class="mb-2">총 가격: <span id="scrollTotalPrice"><fmt:formatNumber value="${dto.price * (1 - dto.discountRate / 100)}" pattern="#,###원" /></span></p>
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
<div class="toast-container position-fixed top-50 start-50 translate-middle" style="z-index: 9999;">
  <div class="toast" id="cartToast" role="alert" aria-live="assertive" aria-atomic="true">
    <div class="toast-header">
      <strong class="me-auto">알림</strong>
      <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
    </div>
    <div class="toast-body">
    </div>
  </div>
  <div class="toast" id="cartConfirmToast" role="alert" aria-live="assertive" aria-atomic="true">
    <div class="toast-header">
      <strong class="me-auto">알림</strong>
      <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
    </div>
    <div class="toast-body">
      장바구니로 이동하시겠습니까?
      <div class="mt-2 pt-2 border-top">
        <button type="button" class="btn btn-primary btn-sm" id="goToCartBtn">이동</button>
        <button type="button" class="btn btn-secondary btn-sm" data-bs-dismiss="toast">취소</button>
      </div>
    </div>
  </div>
</div>

<script type="text/javascript">
function ajaxFun(url, method, query, dataType, fn) {
    console.log("ajaxFun 호출됨:", url, method, dataType);
    $.ajax({
        type: method,
        url: url,
        data: query,
        dataType: dataType,
        processData: false, 
        contentType: false, 
        success: function(data) {
            console.log("Ajax 성공:", data);
            fn(data);
        },
        error: function(jqXHR, textStatus, errorThrown) {
            console.log("Ajax 오류:", textStatus, errorThrown);
            console.log("응답 텍스트:", jqXHR.responseText);
            alert("오류가 발생했습니다: " + textStatus);
        }
    });
}

$(document).ready(function () {
    // 기본 변수들 선언
    const basePrice = parseFloat($('#totalPrice').data('base-price'));
    const $scrollOptionArea = $('#scrollOptionArea');
    const $productInfo = $('.product-info');
    let productInfoBottom = 0;
    let isOutOfStock = false;
    let lastScrollTop = $(window).scrollTop();

    // 채팅 관련 변수들
    const $chatToggle = $('#chat-toggle');
    const $chatWindow = $('#chat-window');
    const $chatClose = $('#chat-close');
    const $chatMessages = $('#chat-messages');
    const $chatInputField = $('#chat-input-field');
    const $chatSend = $('#chat-send');

    // 썸네일 이미지 변경
    $('.thumbnail-list img').click(function() {
        var mainImgSrc = $(this).data('main-img');
        $('#mainImage').attr('src', mainImgSrc);
    });

    // 가격 유효성 검사
    if (isNaN(basePrice)) {
        console.error('기본 가격이 유효하지 않습니다.');
        return;
    }
    console.log('기본 가격:', basePrice);

    // 가격 업데이트 함수
    function updatePrice(quantity) {
        const totalPrice = basePrice * quantity;
        $('#totalPrice, #scrollTotalPrice').text(totalPrice.toLocaleString() + '원');
    }

    // 스크롤 옵션 정보 업데이트
    function updateScrollInfo() {
        $('#scrollProductName').text($('.product-title').text());
        $('#scrollProductPrice').text($('.product-price .fw-bold').text());
        $('#scrollQuantity').val($('#quantity').val());
        updatePrice($('#quantity').val());
    }

    // 스크롤 옵션 토글
    function toggleScrollOption() {
        const currentScrollTop = $(window).scrollTop();
        if (currentScrollTop === lastScrollTop) return;

        lastScrollTop = currentScrollTop;
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
        if ($productInfo.length) {
            productInfoBottom = $productInfo.offset().top + $productInfo.outerHeight();
        }
    }

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

    const productNum = ${dto.productNum};
    const optionCount = ${dto.optionCount};

    // 옵션 선택 이벤트 핸들러
    function onOptionChange(firstOptionSelector, secondOptionSelector, salePrice) {
        $(firstOptionSelector).change(function() {
            let detailNum = $(this).val();
            if (!detailNum) {
                resetSecondOption(secondOptionSelector);
                return false;
            }

            console.log("선택된 첫 번째 옵션:", detailNum); // 디버깅 로그

            // 옵션이 1개인 경우
            if (optionCount === 1) {
                let stockNum = $(this).find(":selected").data("stock-num");
                buyQuantity(stockNum, salePrice, detailNum, 0);
                return false;
            }

            // 옵션이 2개인 경우
            loadSecondOption(detailNum, secondOptionSelector);
        });

        $(secondOptionSelector).change(function() {
            if (!$(this).val()) {
                return false;
            }

            let detailNum = $(firstOptionSelector).val();
            let detailNum2 = $(this).val();

            console.log("선택된 두 번째 옵션:", detailNum2); // 디버깅 로그

            let stockNum = $(this).find(":selected").data("stock-num");
            buyQuantity(stockNum, salePrice, detailNum, detailNum2);
        });
    }

    // 두 번째 옵션 로드 함수
    function loadSecondOption(detailNum, secondOptionSelector) {
        const $secondOption = $(secondOptionSelector);
        $secondOption.find('option:gt(0)').remove();

        console.log("두 번째 옵션 업데이트 시작"); // 디버깅 로그

        let url = "${pageContext.request.contextPath}/product/listOptionDetailStock";
        $.get(url, { productNum: productNum, detailNum: detailNum }, function(data) {
            $(data).each(function(index, item) {
                let detailNum2 = item.detailNum2;
                let optionValue2 = item.optionValue2;
                let stockNum = item.stockNum;
                let totalStock = item.totalStock;

                console.log("옵션 데이터:", { detailNum2, optionValue2, stockNum, totalStock }); // 디버깅 로그

                if (optionValue2) {
                    let optionText = optionValue2;
                    if (totalStock < 5) {
                        optionText += ` - 재고 ${totalStock}`;
                    }

                    console.log($secondOption)
                    $secondOption.append("<option value="+detailNum2 
                        +" data-option-value=" + optionValue2 + 
                        " data-stock-num=" + stockNum + 
                        " data-total-stock="+totalStock+">"
                        + optionText 
                    +"</option>");
                }
            });

            console.log("두 번째 옵션 업데이트 완료"); // 디버깅 로그
            console.log("두 번째 옵션 HTML:", $secondOption.html()); // 디버깅 로그

            $secondOption.prop('disabled', false);
        });
    }

    // 두 번째 옵션 초기화 함수
    function resetSecondOption(secondOptionSelector) {
        const $secondOption = $(secondOptionSelector);
        $secondOption.find('option:gt(0)').remove();
        $secondOption.prop('disabled', true);
    }

    // 옵션 선택 이벤트 핸들러 설정
    onOptionChange("#option1", "#option2", ${dto.salePrice});
    onOptionChange("#scrollOption1", "#scrollOption2", ${dto.salePrice});
    
	 function buyQuantity(stockNum, salePrice, detailNum, detailNum2) {
        console.log("구매 수량 함수 호출:", { stockNum, salePrice, detailNum, detailNum2 }); 
        
    } 
 
//장바구니 
$(function() {
    $('#addToCart, #scrollAddToCart').click(function() {
        console.log('장바구니 버튼 클릭됨');
        
        let stockNum = $('.product-options').data('stock-num');
        if (!stockNum) {
            showToast('옵션을 선택해주세요.');
            return;
        }
        
        let qty = $('#quantity').val();
        let option1 = $('#option1').val();
        let option2 = $('#option2').val();
        
        let url = "${pageContext.request.contextPath}/cart/insertCart";
        let query = {
            qty: qty,
            stockNum: stockNum,
            option1: option1,
            option2: option2
        };
        
        $.ajax({
            url: url,
            type: "post",
            data: query,
            dataType: "json",
            
            success: function(data) {
                let state = data.state;
                if (state === "duplicate") {
                    showToast('이미 장바구니에 들어있는 상품입니다');
                } else if (state === "true") {
                    showToast('장바구니에 상품이 추가되었습니다');
                    showConfirmToast();
                } else if (state === "login") {
                    showToast('로그인이 필요합니다.');
                } else {
                    showToast('장바구니 담기에 실패했습니다.');
                }
            },
            error: function(xhr, status, error) {
                console.error("에지작스 오류!");
                showToast("장바구니 추가 중 오류가 발생했습니다.");
            }
        });
    });

    function showToast(message) {
        $('#cartToast .toast-body').text(message);
        $('#cartToast').toast('show');
    }

    function showConfirmToast() {
        $('#cartConfirmToast').toast('show');
    }

    $('#goToCartBtn').click(function() {
        location.href = '${pageContext.request.contextPath}/cart/list';
    });

    // 옵션 변경 시 stockNum 업뎃
    $('.requiredOption, .requiredOption2').change(function() {
        updateStockNum();
    });

    function updateStockNum() {
        let option1 = $('#option1').val();
        let option2 = $('#option2').val();
        
        if (option1 && (option2 || $('.product-options').data('option-count') == 1)) {
            let selectedOption = $('#option1').find(':selected');
            let stockNum = selectedOption.data('stock-num');
            if (!stockNum && $('#option2').length) {
                selectedOption = $('#option2').find(':selected');
                stockNum = selectedOption.data('stock-num');
            }
            $('.product-options').data('stock-num', stockNum);
            console.log("Updated Stock Number:", stockNum);
        }
    }
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
    


function updateGuideText() {
    var selectedType = $('input[name="qnaType"]:checked').val();
    console.log('선택된 유형:', selectedType);
    var guideText = '';
    switch(selectedType) {
        case '상품':
            guideText = '상품에 대해 궁금하신 내용을 자세히 적어주세요.';
            break;
        case '배송':
            guideText = '배송 관련 문의 사항을 적어주세요.';
            break;
        case '반품/교환':
            guideText = '반품 또는 교환 사유를 자세히 적어주세요.';
            break;
        case '환불':
            guideText = '환불 사유와 원하시는 처리 방법을 적어주세요.';
            break;
        case '기타':
            guideText = '문의 사항을 자세히 적어주세요.';
            break;
        default:
            guideText = '문의 유형을 선택해주세요.';
    }
    console.log('설정할 가이드 텍스트:', guideText);
    
    var $textarea = $('#qnaContent');
    if ($textarea.length) {
        $textarea.attr('placeholder', guideText);
        console.log('가이드 텍스트 설정 완료');
    } else {
        console.error('#qnaContent 요소를 찾을 수 없습니다.');
    }
}

// 문의 유형 변경 시 이벤트 핸들러
$(document).on('change', 'input[name="qnaType"]', function() {
    console.log('문의 유형 변경:', $(this).val());
    updateGuideText();
});

   // 모달이 열릴 때 초기 가이드 텍스트 설정
   $('#qnaModal').on('shown.bs.modal', function () {
       updateGuideText();
   });

// 문의하기 버튼 클릭 시
   $('#showQnaForm').click(function(){
       $("#qnaModal").modal("show");
   });

   // 파일 선택 시
   $('#qnaFile').on('change', function() {
       var files = this.files;
       updateFileList(files);
   });

// 파일 목록 업데이트 함수
function updateFileList(files) {
    $('#fileList').empty();
    if (files.length > 5) {
        alert('최대 5개의 파일만 선택할 수 있습니다.');
        $('#qnaFile').val('');
        return;
    }
    for (var i = 0; i < files.length; i++) {
        $('#fileList').append('<p>' + files[i].name + ' <button type="button" class="btn btn-sm btn-danger remove-file" data-index="' + i + '">삭제</button></p>');
    }
}

// 파일 삭제 버튼 클릭 시
$(document).on('click', '.remove-file', function() {
    var index = $(this).data('index');
    var files = $('#qnaFile')[0].files;
    var newFileList = new DataTransfer();
    for (var i = 0; i < files.length; i++) {
        if (i !== index) {
            newFileList.items.add(files[i]);
        }
    }
    $('#qnaFile')[0].files = newFileList.files;
    updateFileList($('#qnaFile')[0].files);
});


// 문의하기 제출 버튼 클릭 시
$('#submitQna').click(function() {
    console.log("문의하기 제출 버튼 클릭");
    const f = document.getElementById('qnaForm');
    let content = $('#qnaContent').val().trim();
    
    if (!content) {
        alert("문의 내용을 입력하세요.");
        $('#qnaContent').focus();
        return false;
    }
    
    let files = $('#qnaFile')[0].files;
    if (files.length > 5) {
        alert("이미지는 최대 5개까지 가능합니다.");
        return false;
    }
    
    let productNum = $('#productNum').val();
    if (!productNum) {
        console.error("상품 번호가 없습니다.");
        alert("상품 정보를 불러올 수 없습니다. 페이지를 새로고침 후 다시 시도해주세요.");
        return false;
    }
    
    let formData = new FormData(f);
    
    // 여러 파일 추가
    for (let i = 0; i < files.length; i++) {
        formData.append('file', files[i]);
        console.log('File ' + i + ':', files[i].name);
    }
    
    formData.append('secret', $('#qnaPrivate').is(':checked') ? 0 : 1);
    formData.append('inquiryType', $('input[name=qnaType]:checked').val());
    formData.append('productNum', productNum);
    
    // FormData 내용 로깅 (디버깅용)
    for (let pair of formData.entries()) {
        console.log(pair[0] + ': ' + pair[1]);
    }
    
    let url = "${pageContext.request.contextPath}/question/write";
    console.log("요청 URL:", url);
    
    ajaxFun(url, "POST", formData, "json", function(data) {
        console.log("서버 응답:", data);
        if(data.state === "true") {
            f.reset();
            $("#qnaModal").modal("hide");
            
            alert('문의가 성공적으로 등록되었습니다.');
            // 문의 목록 새로고침 (필요시 구현)
            // listQuestion(1);
        } else {
            alert('문의 등록에 실패했습니다. 다시 시도해주세요.');
        }
    });
});
    
    listQuestion(1);
});

//상품 리스트 출력
function listQuestion(page) {
    let productNum = '${dto.productNum}';
    let url = '${pageContext.request.contextPath}/question/list';
    let query = 'productNum=' + productNum + '&pageNo=' + page;

    const fn = function(data) {
        printQuestion(data);
    };
    ajaxFun(url, 'get', query, 'json', fn);
}

    
//상품 문의 
function printQuestion(data) {
    console.log('Data to be processed:', data);
    let dataCount = data.dataCount;
    $('.title-qnaCount').html('(' + dataCount + ')');
    let out = '';
    if (Array.isArray(data.list)) {
        for (let item of data.list) {
        	console.log('Item:', item); 
            let userName = item.userName || '';
            let question = item.question || '';
            let questionDate = item.question_Date || '';
            let answer = item.answer || '';
            let answerDate = item.answer_Date || '';
            let answerState = answer ? 
                '<span class="badge bg-success">답변완료</span>' : 
                '<span class="badge bg-warning text-dark">답변대기</span>';

                out += '<div class="qna-item">';
                out += '    <div class="d-flex justify-content-between align-items-center mb-2">';
                out += '        <strong>' + userName + '</strong>';
                out += '        ' + answerState;
                out += '    </div>';
                out += '    <p class="mb-1">' + question + '</p>';
                out += '    <small class="text-muted">작성일: ' + questionDate + '</small>';
                
                if (answer) {
                    out += '    <div class="qna-answer mt-2">';
                    out += '        <strong>장남균</strong>';
                    out += '        <p class="mb-1">' + answer + '</p>';
                    out += '        <small class="text-muted">답변일: ' + answerDate + '</small>';
                    out += '    </div>';
                }      
            out += '</div>';
        }
    } else {
        console.error('data.list is not an array:', data.list);
    }
    if (dataCount > 0) {
        out += '<div class="page-navigation">' + data.paging + '</div>';
    }
    $('.list-question').html(out);
}

</script>