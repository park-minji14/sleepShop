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
						<c:forEach var="image" items="${listFile}" varStatus="status">
							<img
								src="${pageContext.request.contextPath}/uploads/product/${image.img_name}"
								alt="썸네일 ${status.index+1}" class="img-thumbnail mb-2"
								data-main-img="${pageContext.request.contextPath}/uploads/product/${image.img_name}">
						</c:forEach>
					</div>
					<div class="main-image-container">
						<c:choose>
							<c:when test="${not empty listFile}">
								<img
									src="${pageContext.request.contextPath}/uploads/product/${listFile[0].img_name}"
									class="img-fluid rounded main-image" id="mainImage"
									alt="메인 상품 이미지">
							</c:when>
						</c:choose>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="product-info">
					<h1
						class="product-title mb-3 d-flex align-items-start justify-content-between"
						style="position: relative;">
						${dto.productName}
						<div class="bookmark" data-product-id="${dto.productNum}"
							title="${isBookmarked ? '북마크 해제' : '북마크 추가'}">
							<span class="bookmark-count" style="font-size: 0.8rem;">
								${totalBookmarkCount > 0 ? totalBookmarkCount : ''} </span>
						</div>
					</h1>
					<input type="hidden" id="productNum" value="${dto.productNum}">
					<div class="product-rating mb-3">
						<c:forEach begin="1" end="5" var="i">
							<c:choose>
								<c:when test="${i <= avgScore}">
									<i class="bi bi-star-fill text-warning"></i>
								</c:when>
								<c:when test="${i > avgScore && i - 1 < avgScore}">
									<i class="bi bi-star-half text-warning"></i>
								</c:when>
								<c:otherwise>
									<i class="bi bi-star text-warning"></i>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<span class="ms-2 text-muted"> <span
							id="productReviewCount">${dto.reviewCount}</span>개 리뷰
						</span>
					</div>
					<div class="product-price mb-3">
						<span class="badge bg-primary me-2">${dto.discountRate}%</span> <span
							class="fs-3 fw-bold"> <fmt:formatNumber
								value="${dto.salePrice}" pattern="#,###원" />
						</span> <span class="text-muted text-decoration-line-through"> <fmt:formatNumber
								value="${dto.price}" pattern="#,###원" />
						</span>
					</div>
					<div class="product-benefits mb-3">
						<p class="text-muted">
							<i class="bi bi-gift me-2"></i>혜택: ${dto.savedMoney} 적립
						</p>
					</div>
					<div class="delivery-info mb-3">
						<p class="mb-1">
							<i class="bi bi-truck me-2"></i>배송비 : ${dto.delivery}
						</p>
						<p>
							<i class="bi bi-clock me-2"></i>12:00 까지 결제시 오늘 출발
						</p>
						<p>
							<i class="bi bi-box-seam me-2"></i>제주도/도서산간 지역 8,000원
						</p>
					</div>
					<!-- 옵션 -->
					<div class="product-options mb-3"
						data-option-count="${dto.optionCount}"
						data-stock-num="${dto.stockNum}"
						data-total-stock="${dto.totalStock}">
						<c:choose>
							<c:when test="${dto.optionCount == 0}">
								<!-- 단품 상품인 경우 -->
								<p>단품 상품 (재고: ${dto.totalStock})</p>
							</c:when>
							<c:otherwise>
								<!-- 옵션이 있는 상품인 경우 -->
								<c:if test="${dto.optionCount > 0}">
									<div class="mt-2">
										<select class="form-select requiredOption" id="option1"
											data-option-num="${listOption[0].optionNum}"
											${dto.totalStock < 1 ? 'disabled':''}>
											<option value="">${listOption[0].optionName}선택</option>
											<c:forEach var="vo" items="${listOptionDetail}">
												<c:if test="${vo.optionValue != prevOptionValue}">
													<option value="${vo.detailNum}"
														data-stock-num="${vo.stockNum}"
														data-total-stock="${vo.totalStock}"
														data-option-value="${vo.optionValue}">
														${vo.optionValue}${dto.optionCount == 1 ? ' (재고 '.concat(vo.totalStock).concat(')') : ''}
													</option>
													<c:set var="prevOptionValue" value="${vo.optionValue}" />
												</c:if>
											</c:forEach>
										</select>
									</div>
								</c:if>
								<c:if test="${dto.optionCount > 1}">
									<div class="mt-2">
										<select class="form-select requiredOption2" id="option2"
											data-option-num2="${listOption[1].optionNum}">
											<option value="">${listOption[1].optionName}선택</option>
										</select>
									</div>
								</c:if>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<div class="quantity-selector d-flex align-items-center mb-3">
					<button class="btn btn-outline-secondary" id="decreaseQuantity"
						disabled>-</button>
					<input type="text" class="form-control mx-2" id="quantity"
						value="1" readonly style="width: 60px; text-align: center;">
					<button class="btn btn-outline-secondary" id="increaseQuantity"
						disabled>+</button>
				</div>
				<div class="total-price mb-3">
					<span class="fs-5">주문금액</span> <span class="fs-5 fw-bold"
						id="totalPrice" data-base-price="${dto.salePrice}"> <fmt:formatNumber
							value="${dto.salePrice}" pattern="#,###원" />
					</span>
				</div>
				<div class="purchase-buttons">
					<c:choose>
						<c:when test="${dto.optionCount == 0}">
							<!-- 단품 상품인 경우 -->
							<div id="singleProductButtons">
								<c:choose>
									<c:when test="${dto.totalStock > 0}">
										<!-- 재고가 있는 경우 -->
										<button
											class="btn btn-outline-secondary btn-lg me-2 flex-grow-1 btn-gift"
											id="gift">
											<i class="bi bi-gift me-2"></i>선물하기
										</button>
										<button
											class="btn btn-outline-primary btn-lg me-2 flex-grow-1 btn-cart"
											id="addToCart">
											<i class="bi bi-cart-plus me-2"></i>장바구니
										</button>
										<button class="btn btn-primary btn-lg flex-grow-1 btn-buy"
											id="buyNow">
											<i class="bi bi-bag-check me-2"></i>바로구매
										</button>
									</c:when>
									<c:otherwise>
										<!-- 재고가 없는 경우 -->
										<button class="btn btn-primary btn-lg w-100" id="stockAlert">
											<i class="bi bi-bell me-2"></i>재입고 알림 신청
										</button>
									</c:otherwise>
								</c:choose>
							</div>
						</c:when>
						<c:otherwise>
							<!-- 옵션이 있는 상품인 경우 -->
							<div id="optionButtons">
								<button
									class="btn btn-outline-secondary btn-lg me-2 flex-grow-1 btn-gift"
									id="gift">
									<i class="bi bi-gift me-2"></i>선물하기
								</button>
								<button
									class="btn btn-outline-primary btn-lg me-2 flex-grow-1 btn-cart"
									id="addToCart">
									<i class="bi bi-cart-plus me-2"></i>장바구니
								</button>
								<button class="btn btn-primary btn-lg flex-grow-1 btn-buy"
									id="buyNow">
									<i class="bi bi-bag-check me-2"></i>바로구매
								</button>
							</div>
							<button class="btn btn-primary btn-lg w-100" id="stockAlert"
								style="display: none;">
								<i class="bi bi-bell me-2"></i>재입고 알림 신청
							</button>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>

	<div class="container mt-5">
		<!-- 상품 정보 탭 -->
		<div class="product-tabs mt-5">
			<ul class="nav nav-tabs" id="productTabs" role="tablist">
				<li class="nav-item" role="presentation">
					<button class="nav-link active" id="info-tab" data-bs-toggle="tab"
						data-bs-target="#info" type="button" role="tab"
						aria-controls="info" aria-selected="true">상품정보</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="review-tab" data-bs-toggle="tab"
						data-bs-target="#review" type="button" role="tab"
						aria-controls="review" aria-selected="false">
						리뷰 <span id="tabReviewCount">${dto.reviewCount}</span>
					</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="qna-tab" data-bs-toggle="tab"
						data-bs-target="#qna" type="button" role="tab" aria-controls="qna"
						aria-selected="false">문의 ${dto.questionCount}</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="delivery-tab" data-bs-toggle="tab"
						data-bs-target="#delivery" type="button" role="tab"
						aria-controls="delivery" aria-selected="false">배송/환불</button>
				</li>
			</ul>
			<div class="tab-content mb-4" id="productTabsContent">
				<!-- 상품 정보 탭 내용 -->
				<div class="tab-pane fade show active mb-4" id="info"
					role="tabpanel" aria-labelledby="info-tab">
					<!-- 상품 상세 정보 -->
					<div class="container my-5 px-0">
						<div class="row">
							<div class="col-12 px-0">
								<img src="https://via.placeholder.com/1200x600" alt="상품 상세 이미지"
									class="img-fluid w-100 mb-4">
								<div class="container">
									<h3>상품 설명</h3>
									<p>오마이갓 오마이갓 오마이갓</p>
									<h3>주요 특징</h3>
									<div>${dto.content}</div>
								</div>
								<img src="https://via.placeholder.com/1200x800" alt="제품 상세 설명"
									class="img-fluid w-100 mt-4">
							</div>
						</div>
					</div>
				</div>
				<!-- 리뷰 탭 내용 -->
				<div class="tab-pane fade mb-4" id="review" role="tabpanel"
					aria-labelledby="review-tab">
					<div class="container">
						<div class="row mb-4">
							<div class="col-12">
								<h3 class="border-bottom pb-2">
									리뷰 <span id="reviewCount">${reviewCount}</span>
								</h3>
							</div>
						</div>

						<div class="row mb-3">
							<div class="col-12">
								<div class="alert alert-info" role="alert">
									<h5 class="alert-heading">
										<i class="bi bi-info-circle me-2"></i> 리뷰 안내사항
									</h5>
									<ul class="mb-0">
										<li>구매하신 상품에 대한 정직한 리뷰를 남겨주세요.</li>
										<li>상품과 무관한 내용이나 욕설, 비방 등은 삭제될 수 있습니다.</li>
										<li>리뷰 작성시 포인트가 적립됩니다.</li>
									</ul>
								</div>
							</div>
						</div>

						<div class="row mb-4">
							<div class="col-md-6">
								<div class="card">
									<div class="card-body text-center">
										<h2 class="display-4" id="avgScore">${avgScore}</h2>
										<div class="stars mb-3" id="avgScoreStars">
											<!-- 별점은 AJAX로 업데이트됩니다 -->
										</div>
										<p class="mb-0">
											<span id="reviewCountBottom">${reviewCount}</span>개의 리뷰 기준
										</p>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="card">
									<div class="card-body">
										<h5 class="card-title">구매자 만족도</h5>
										<div class="d-flex align-items-center mb-2">
											<span class="me-2">품질</span>
											<div class="progress flex-grow-1" style="height: 10px;">
												<div class="progress-bar bg-success" role="progressbar"
													style="width: 85%;" aria-valuenow="85" aria-valuemin="0"
													aria-valuemax="100"></div>
											</div>
											<span class="ms-2">85%</span>
										</div>
										<div class="d-flex align-items-center mb-2">
											<span class="me-2">가격</span>
											<div class="progress flex-grow-1" style="height: 10px;">
												<div class="progress-bar bg-info" role="progressbar"
													style="width: 75%;" aria-valuenow="75" aria-valuemin="0"
													aria-valuemax="100"></div>
											</div>
											<span class="ms-2">75%</span>
										</div>
										<div class="d-flex align-items-center">
											<span class="me-2">배송</span>
											<div class="progress flex-grow-1" style="height: 10px;">
												<div class="progress-bar bg-warning" role="progressbar"
													style="width: 90%;" aria-valuenow="90" aria-valuemin="0"
													aria-valuemax="100"></div>
											</div>
											<span class="ms-2">90%</span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-12">
								<div id="reviewList" class="review-list border p-3 rounded">
									<!-- 리뷰 목록은 AJAX로 로드됩니다 -->
								</div>

								<!-- 페이징 처리 -->
								<div class="row mt-3">
									<div class="col-12">
										<nav id="reviewPaging"></nav>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- 상품문의 탭 내용 -->
				<div class="tab-pane fade mb-4" id="qna" role="tabpanel"
					aria-labelledby="qna-tab">
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
										<i class="bi bi-info-circle me-2"></i> 문의 안내사항
									</h5>
									<ul class="mb-0">
										<li>상품과 관련 없는 문의나 욕설, 비방 내용은 답변이 거부될 수 있습니다.</li>
										<li>개인정보가 포함된 문의는 비밀글로 작성해 주세요.</li>
										<li>답변은 영업일 기준 2~3일 내에 등록됩니다.</li>
									</ul>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-12">
								<div id="qnaList" class="list-question border p-3 rounded">
									<!-- 상품문의 리스트 -->
								</div>
							</div>
						</div>
						<div class="row mb-4" style="padding: 0;">
							<div class="col-12 text-end">
								<button id="showQnaForm"
									class="btn btn-outline-dark rounded-pill"
									data-bs-toggle="modal" data-bs-target="#qnaModal">
									<i class="bi bi-pencil-square me-2"></i>문의하기
								</button>
							</div>
						</div>
					</div>
				</div>
				<!-- 배송/환불 탭 내용 -->
				<div class="tab-pane fade mb-4" id="delivery" role="tabpanel"
					aria-labelledby="delivery-tab">
					<h2 style="padding-bottom: 30px;">배송/교환/환불</h2>

					<div class="policy-card">
						<h5>
							<i class="bi bi-truck"></i> 배송
						</h5>
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
						<h5>
							<i class="bi bi-arrow-repeat"></i> 교환/환불
						</h5>
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
						<h5>
							<i class="bi bi-clock-history"></i> 반품/교환 사유에 따른 요청 가능 기간
						</h5>
						<div class="policy-list">
							<ol>
								<li>구매자 단순 변심은 상품 수령 후 7일 이내</li>
								<li>표시/광고와 상이, 계약내용과 다르게 이행된 경우 상품 수령 후 3개월 이내, 그 사실을 안 날
									또는 알 수 있었던 날부터 30일 이내</li>
							</ol>
						</div>
					</div>

					<div class="policy-card">
						<h5>
							<i class="bi bi-x-circle"></i> 반품/교환 불가능 사유
						</h5>
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
						<h5>
							<i class="bi bi-cash"></i> 환불 정책
						</h5>
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
<div class="modal fade" id="qnaModal" tabindex="-1"
	aria-labelledby="qnaModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="qnaModalLabel">상품 문의하기</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">


				<form id="qnaForm" enctype="multipart/form-data" method="post"
					action="${pageContext.request.contextPath}/question/write">
					<div class="mb-3">
						<label class="form-label">문의 유형</label>
						<div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="qnaType"
									id="qnaTypeProduct" value="상품" checked> <label
									class="form-check-label" for="qnaTypeProduct">상품</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="qnaType"
									id="qnaTypeDelivery" value="배송"> <label
									class="form-check-label" for="qnaTypeDelivery">배송</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="qnaType"
									id="qnaTypeReturn" value="반품/교환"> <label
									class="form-check-label" for="qnaTypeReturn">반품/교환</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="qnaType"
									id="qnaTypeRefund" value="환불"> <label
									class="form-check-label" for="qnaTypeRefund">환불</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="qnaType"
									id="qnaTypeOther" value="기타"> <label
									class="form-check-label" for="qnaTypeOther">기타</label>
							</div>
						</div>
					</div>
					<div class="mb-3">
						<label for="qnaContent" class="form-label">문의 내용</label>
						<textarea class="form-control" id="qnaContent" name="question"
							rows="5" required placeholder=""></textarea>
						<div id="qnaContentGuide" class="form-text">문의 내용을 자세히 작성해
							주세요. 답변은 확인 후 순차적으로 처리되며, 마이페이지에서도 확인 가능합니다. 개인정보는 문의 처리 후 안전하게
							폐기됩니다.</div>
					</div>
					<div class="mb-3">
						<label for="qnaFile" class="form-label">파일 첨부</label>
						<!--  <input type="file" class="form-control" id="qnaFile" name="file" accept="image/*" multiple> -->
						<input type="file" class="form-control" id="qnaFile"
							name="selectFile" accept="image/*" multiple>
						<div class="form-text">이미지 파일만 첨부 가능합니다. (최대 5개, 각 5MB 이하)</div>
					</div>
					<div id="fileList" class="mt-2"></div>
					<div class="mb-3 form-check">
						<input type="checkbox" class="form-check-input" id="qnaPrivate"
							name="isPrivate"> <label class="form-check-label"
							for="qnaPrivate">비밀글로 문의하기</label>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">취소</button>
				<button type="button" class="btn btn-primary" id="submitQna">문의하기</button>
			</div>
		</div>
	</div>
</div>
<!-- 스크롤 시 나타나는 옵션 선택 영역 -->
<div id="scrollOptionArea" class="scroll-option-area">
	<h6 class="mb-2" id="scrollProductName">${dto.productName}</h6>
	<p class="mb-2">
		가격: <span id="scrollProductPrice"><fmt:formatNumber
				value="${dto.price * (1 - dto.discountRate / 100)}" pattern="#,###원" /></span>
	</p>

	<c:choose>
		<c:when test="${dto.optionCount == 0}">
			<p>단품</p>
			<c:choose>
				<c:when test="${dto.totalStock > 0}">
					<div class="d-flex justify-content-between align-items-center mb-2">
						<span>수량:</span>
						<div class="input-group" style="width: 120px;">
							<button class="btn btn-outline-secondary btn-sm"
								id="scrollDecreaseQuantity">-</button>
							<input type="number" class="form-control form-control-sm"
								id="scrollQuantity" value="1" min="1"
								style="text-align: center;">
							<button class="btn btn-outline-secondary btn-sm"
								id="scrollIncreaseQuantity">+</button>
						</div>
					</div>
					<p class="mb-2">
						총 가격: <span id="scrollTotalPrice"><fmt:formatNumber
								value="${dto.price * (1 - dto.discountRate / 100)}"
								pattern="#,###원" /></span>
					</p>
					<div class="d-flex justify-content-between" id="scrollButtonArea">
						<button class="btn btn-outline-primary btn-sm flex-grow-1 me-2"
							id="scrollAddToCart">장바구니</button>
						<button class="btn btn-primary btn-sm flex-grow-1"
							id="scrollBuyButton">구매하기</button>
					</div>
				</c:when>
				<c:otherwise>
					<button class="btn btn-primary btn-sm w-100" id="scrollStockAlert">
						재입고 알림 신청</button>
				</c:otherwise>
			</c:choose>
		</c:when>
		<c:when test="${dto.optionCount == 1}">
			<select class="form-select mb-2 requiredOption" id="scrollOption1"
				data-option-num="${listOption[0].optionNum}"
				${dto.totalStock < 1 ? 'disabled':''}>
				<option selected>${listOption[0].optionName}선택</option>
				<c:forEach var="vo" items="${listOptionDetail}">
					<option value="${vo.detailNum}" data-stock-num="${vo.stockNum}"
						data-total-stock="${vo.totalStock}"
						data-option-value="${vo.optionValue}">${vo.optionValue}
						${vo.totalStock > 0 ? '재고 '.concat(vo.totalStock) : '재입고 알림 신청'}</option>
				</c:forEach>
			</select>
		</c:when>
		<c:when test="${dto.optionCount == 2}">
			<select class="form-select mb-2 requiredOption" id="scrollOption1"
				data-option-num="${listOption[0].optionNum}"
				${dto.totalStock < 1 ? 'disabled':''}>
				<option selected>${listOption[0].optionName}선택</option>
				<c:forEach var="vo" items="${listOptionDetail}">
					<option value="${vo.detailNum}">${vo.optionValue}</option>
				</c:forEach>
			</select>

			<select class="form-select mb-2 requiredOption2" id="scrollOption2"
				data-option-num2="${listOption[1].optionNum}" disabled>
				<option selected>${listOption[1].optionName}선택</option>
			</select>
		</c:when>
	</c:choose>

	<c:if test="${dto.optionCount > 0}">
		<div class="d-flex justify-content-between align-items-center mb-2">
			<span>수량:</span>
			<div class="input-group" style="width: 120px;">
				<button class="btn btn-outline-secondary" id="decreaseQuantity"
					disabled>-</button>
				<input type="text" class="form-control mx-2" id="quantity" value="1"
					readonly style="width: 60px; text-align: center;">
				<button class="btn btn-outline-secondary" id="increaseQuantity"
					disabled>+</button>
			</div>
		</div>
		<p class="mb-2">
			총 가격: <span id="scrollTotalPrice"><fmt:formatNumber
					value="${dto.price * (1 - dto.discountRate / 100)}"
					pattern="#,###원" /></span>
		</p>
		<div class="d-flex justify-content-between" id="scrollButtonArea">
			<button class="btn btn-outline-primary btn-sm flex-grow-1 me-2"
				id="scrollAddToCart">장바구니</button>
			<button class="btn btn-primary btn-sm flex-grow-1"
				id="scrollBuyButton">구매하기</button>
		</div>
		<button class="btn btn-primary btn-sm w-100" id="scrollStockAlert"
			style="display: none;">재입고 알림 신청</button>
	</c:if>
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
<div
	class="toast-container position-fixed top-50 start-50 translate-middle"
	style="z-index: 9999;">
	<div class="toast" id="cartToast" role="alert" aria-live="assertive"
		aria-atomic="true">
		<div class="toast-header">
			<strong class="me-auto">알림</strong>
			<button type="button" class="btn-close" data-bs-dismiss="toast"
				aria-label="Close"></button>
		</div>
		<div class="toast-body"></div>
	</div>
	<div class="toast" id="cartConfirmToast" role="alert"
		aria-live="assertive" aria-atomic="true">
		<div class="toast-header">
			<strong class="me-auto">알림</strong>
			<button type="button" class="btn-close" data-bs-dismiss="toast"
				aria-label="Close"></button>
		</div>
		<div class="toast-body">
			<!--자바스크립트로 채움 -->
		</div>
	</div>
	<div class="toast cute-toast" id="cuteToast" role="alert"
		aria-live="assertive" aria-atomic="true">
		<div class="toast-header bg-pink text-white">
			<strong class="me-auto">알림</strong>
			<button type="button" class="btn-close btn-close-white"
				data-bs-dismiss="toast" aria-label="Close"></button>
		</div>
		<div class="toast-body bg-light-pink"></div>
	</div>
</div>
<script type="text/javascript">

/* let optionCount = ${dto.optionCount}; */

//-------------------전역 범위 ajax 선언-------------------// 
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

const productNum = ${dto.productNum};

function updateButtonState(stockNum, totalStock, optionCount) {
 
    const hasStock = totalStock > 0;
    const option1Selected = $('#option1').val() !== '';
    const option2Selected = optionCount === 2 ? $('#option2').val() !== '' : true;
    const allOptionsSelected = (optionCount === 0) || (option1Selected && option2Selected);

    if (optionCount === 0) {
        // 단품 상품인 경우
        $('#singleProductButtons .btn-gift, #singleProductButtons .btn-cart, #singleProductButtons .btn-buy').toggle(hasStock);
        $('#stockAlert').toggle(!hasStock);
    } else {
        // 옵션이 있는 경우
        $('#optionButtons').show();
        $('#stockAlert').hide();

        if (allOptionsSelected) {
            if (hasStock) {
                $('#optionButtons').show();
                $('#stockAlert').hide();
            } else {
                $('#optionButtons').hide();
                $('#stockAlert').show();
            }
        }

        // 옵션 2개일 때 두 번째 옵션 활성화/비활성화
        if (optionCount === 2) {
            $('#option2').prop('disabled', !option1Selected);
        }
    }
}
function buyQuantity(stockNum, salePrice, detailNum, detailNum2) {
    const $productOptions = $('.product-options');
    $productOptions.data('stock-num', stockNum);
    let optionCount = $productOptions.data('option-count');
    let totalStock = $productOptions.data('total-stock');
    updateButtonState(stockNum, totalStock, optionCount);
}

//-------------------리뷰 에이작스-------------------------//
function loadReviews(page) {
    // 중복 실행 방지
    if (loadReviews.isLoading) return;
    loadReviews.isLoading = true;

    let url = "${pageContext.request.contextPath}/product/reviews";
    let query = "productNum=${dto.productNum}&pageNo=" + (page || 1);

    ajaxFun(url, "GET", query, "json", function(data) {
        if (data.error) {
            console.error(data.error);
            return;
        }
        updateReviewSection(data);
        loadReviews.isLoading = false;
    });
}

function updateReviewSection(data) {
    console.log("Received review data:", data);

    let reviewCount = data.dataCount || 0;
    $('#reviewCount, #reviewCountBottom, #tabReviewCount, #productReviewCount').text(reviewCount);
    console.log("Review count:", reviewCount);
    $('#reviewCount, #reviewCountBottom, #tabReviewCount').text(reviewCount);

    if (data.avgScore !== undefined) {
        let avgScore = parseFloat(data.avgScore).toFixed(1);
        console.log("Average score:", avgScore);
        $('#avgScore').text(avgScore);
        updateStars(data.avgScore);
    } else {
        console.log("Average score is undefined, setting to 0.0");
        $('#avgScore').text('0.0');
        updateStars(0);
    }

    let reviewHtml = '';
    if (!data.reviewList || data.reviewList.length === 0) {
        console.log("No reviews found");
        reviewHtml = '<p>등록된 리뷰가 없습니다.</p>';
    } else {
        console.log("Number of reviews:", data.reviewList.length);
        for (let review of data.reviewList) {
            console.log("Processing review:", review);
            reviewHtml += '<div class="review-item border-bottom pb-3 mb-3">';
            reviewHtml += '<div class="d-flex align-items-center mb-2">';
            reviewHtml += '<img src="https://via.placeholder.com/40" alt="User" class="rounded-circle me-2">';
            reviewHtml += '<strong>' + (review.userName || 'Anonymous') + '</strong>';
            reviewHtml += '<div class="stars ms-auto">' + getStarHtml(review.score) + '</div>';
            reviewHtml += '</div>';
            reviewHtml += '<p class="mb-2">' + (review.review_Date || 'N/A') + ' · ' + (review.productName || 'N/A') + ' 구매';
            if (review.optionNames) {
                reviewHtml += '<br><small class="text-muted">옵션: ' + review.optionNames + '</small>';
            }
            reviewHtml += '</p>';
            reviewHtml += '<div class="review-content"><p>' + (review.review || 'No review content') + '</p></div>';
            if (review.imageUrls && review.imageUrls.length > 0) {
                reviewHtml += '<div class="review-images mb-2">';
                for (let imageUrl of review.imageUrls) {
                    reviewHtml += '<img src="' + imageUrl + '" alt="Review Image" class="img-thumbnail me-2" style="width: 100px; height: 100px; object-fit: cover;">';
                }
                reviewHtml += '</div>';
            }
            reviewHtml += '<div style="text-align: right;">';
            reviewHtml += '<button class="btn btn-sm btn-outline-secondary rounded-pill">';
            reviewHtml += '<i class="bi bi-hand-thumbs-up me-1"></i>도움이 돼요';
            reviewHtml += '</button>';
            reviewHtml += '</div>';
            reviewHtml += '</div>';
        }
    }
    
    $('#reviewList').html(reviewHtml);

    if (data.paging) {
        $('#reviewPaging').html(data.paging);
    } else {
        $('#reviewPaging').empty();
    }
}
function getStarHtml(score) {
    let starsHtml = '';
    for (let i = 1; i <= 5; i++) {
        starsHtml += '<i class="bi bi-star' + (i <= score ? '-fill' : '') + ' text-warning"></i>';
    }
    return starsHtml;
}

function updateStars(score) {
    let starsHtml = getStarHtml(score);
    $('#avgScoreStars').html(starsHtml);
}

$(document).on('click', '.page-link', function(e) {
    e.preventDefault();
    var page = $(this).data('page');
    if (page) {
        loadReviews(page);
    }
});

//---------------------------DOM 로드 완료 후 실행--------------------------//

$(document).ready(function () {
    $('#optionButtons').show();
    $('#stockAlert').hide();
    
    $('#review-tab').on('shown.bs.tab', function (e) {
        loadReviews(1);
    });
    
    //북마크
    initBookmarkStatus();
    
    $(document).off('click', '#reviewPaging a').on('click', '#reviewPaging a', function(e) {
        e.preventDefault();
        var page = $(this).data('page');
        if (page) {
            loadReviews(page);
        }
    });
	
    
//---------------------------- 오늘 본 상품 목록에 추가--------------------------//
   
	let pnum = "${dto.productNum}";
    let pname = "${dto.productName}";
    let pimg = "${dto.thumbnail}";
    
    let product = JSON.parse(localStorage.getItem("product")) || [];
    
    product = product.filter(item => item.pnum !== pnum);
    
    // 9개 이상이면 마지막 데이터 삭제
    if (product.length >= 9) {
        product.pop();
    }
    
    // 저장할 데이터
    let obj = {pnum: pnum, pname: pname, pimg: pimg};
    product.unshift(obj); // 배열 가장 앞에 추가
    
    // 웹스토리지에 저장
    localStorage.setItem("product", JSON.stringify(product));
	
//----------------------------------------------------------------------//    
    
    let optionCount = $('.product-options').data('option-count');
    console.log("옵션 개수:", optionCount);

    if (optionCount > 0) {
        console.log("onOptionChange 함수 호출");
        onOptionChange("#option1", optionCount > 1 ? "#option2" : null, ${dto.salePrice});
        onOptionChange("#scrollOption1", optionCount > 1 ? "#scrollOption2" : null, ${dto.salePrice});
    }
	
    // 여기서 optionCount를 재할당 (let 키워드 제거)
    optionCount = $('.product-options').data('option-count') || 0;
    let stockNum = $('.product-options').data('stock-num') || 0;
    let totalStock = $('.product-options').data('total-stock');
    if (typeof totalStock === 'undefined' || totalStock === null) {
        totalStock = 0;
    }

    console.log('옵션 개수:', optionCount);
    console.log('초기 재고 번호:', stockNum);
    console.log('초기 총 재고:', totalStock);

    updateButtonState(stockNum, totalStock, optionCount);
    
   
	
    // 기본 변수들 선언
    const basePrice = parseFloat($('#totalPrice').data('base-price'));
    const $scrollOptionArea = $('#scrollOptionArea');
    const $productInfo = $('.product-info');
    let productInfoBottom = 0;
    let lastScrollTop = $(window).scrollTop();
    let isOutOfStock = false;

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
    updateStockStatus(); 
    if (isOutOfStock) {
        $scrollOptionArea.hide();
    } else if (currentScrollTop > productInfoBottom) {
        $scrollOptionArea.addClass('visible');
        updateScrollInfo();
    } else {
        $scrollOptionArea.removeClass('visible');
    }
}
    
function updateStockStatus() {
    let totalStock = $('.product-options').data('total-stock');
    isOutOfStock = totalStock <= 0;
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
        let quantity = parseInt($('#quantity').val());
        let totalStock = $('.product-options').data('total-stock');
        
        if (quantity < totalStock) {
            quantity++;
            $('#quantity, #scrollQuantity').val(quantity);
            updatePrice(quantity);
        } else {
            showToast('현재 재고량을 초과할 수 없습니다.');
        }
    });


 //----------------------- 옵션 변경 이벤트 처리하기----------------//
    function onOptionChange(firstOptionSelector, secondOptionSelector, salePrice) {
        // 첫 번째 옵션 변경 시 이벤트
        $(firstOptionSelector).change(function() {
            let detailNum = $(this).val();
            
            if (!detailNum) {
                resetSecondOption(secondOptionSelector);
                updateButtonState(0, 0, $('.product-options').data('option-count'));
                return false;
            }
            
            if (secondOptionSelector) {
                loadSecondOption(detailNum, secondOptionSelector);
            } else {
                let stockNum = $(this).find(":selected").data("stock-num");
                let totalStock = $(this).find(":selected").data("total-stock");
                updateButtonState(stockNum, totalStock, 1);
                buyQuantity(stockNum, salePrice, detailNum, 0);
            }
        });

        // 두 번째 옵션 있을 때 변경 이벤트
        if (secondOptionSelector) {
            $(secondOptionSelector).change(function() {
                let selectedOption = $(this).find(':selected');
                if (!selectedOption.val() || selectedOption.prop('disabled')) {
                    return false;
                }
                let detailNum = $(firstOptionSelector).val();
                let detailNum2 = selectedOption.val();
                let stockNum = selectedOption.data("stock-num");
                let totalStock = selectedOption.data("total-stock");
                updateButtonState(stockNum, totalStock, 2);
                buyQuantity(stockNum, salePrice, detailNum, detailNum2);
            });
        }
    }
//-----------------------상품 옵션 2단계 로딩 함수--------------------//

// 두 번째 옵션 불러오기

// 두 번째 옵션 불러오기
function loadSecondOption(detailNum, secondOptionSelector) {
    const $secondOption = $(secondOptionSelector);
    $secondOption.find('option:gt(0)').remove();
    $secondOption.prop('disabled', true);
    let url = "${pageContext.request.contextPath}/product/listOptionDetailStock";
    let params = { productNum: productNum, detailNum: detailNum };

    $.ajax({
        url: url,
        type: "GET",
        data: params,
        dataType: "json",
        success: function(data) {
            if (data && data.length > 0) {
                data.forEach(function(item) {
                    let optionText = item.optionValue2;
                    if (item.totalStock <= 0) {
                        optionText += ' (품절)\u2003\🔔재입고 알림 신청';
                    } else {
                        optionText += " (재고 " + item.totalStock + ")";
                    }
                    let $option = $('<option>', {
                        value: item.detailNum2,
                        'data-option-value': item.optionValue2,
                        'data-stock-num': item.stockNum,
                        'data-total-stock': item.totalStock,
                        text: optionText,
                        disabled: item.totalStock <= 0
                    });
                    $secondOption.append($option);
                });
            } else {
                $secondOption.append('<option value="">옵션 없음</option>');
            }
        },
        error: function(jqXHR, textStatus, errorThrown) {
            $secondOption.append('<option value="">옵션 로드 실패</option>');
        },
        complete: function() {
            $secondOption.prop('disabled', false);
        }
    });
}
//옵션 텍스트 생성 함수
/* function createOptionText(optionValue, totalStock) {
    if (totalStock <= 0) {
        return `${optionValue} (품절)     🔔재입고 알림 신청`;
    }
    return `${optionValue} (재고 ${totalStock})`;
} */
//옵션 선택 처리 함수
function handleOptionSelection(stockNum, totalStock, detailNum, detailNum2, salePrice, optionCount) {
    // 버튼 상태 업데이트 (구매 가능 여부 등)
    updateButtonState(stockNum, totalStock, optionCount);

    // 구매 수량 관련 정보 처리
    buyQuantity(stockNum, salePrice, detailNum, detailNum2 || 0);
}


//----------------------------
   function showCuteToast(message) {    
       // 토스트 본문 업데이트
       $('#cuteToast .toast-body').html(message);
       
       // Bootstrap 토스트 초기화 및 표시
       var cuteToast = new bootstrap.Toast(document.getElementById('cuteToast'));
       cuteToast.show();
   }

   // 재입고 알림 버튼 클릭 이벤트
   $('#stockAlert').on('click', function() {
       showCuteToast('재입고되면 깨워드릴게요! 😴💤 달달한 꿈 꾸세요~');
   });
   
   
  //------------------------------------------ 구매하기
$('#buyNow, #scrollBuyButton').click(function () {
    let stockNum, qty, option1, option2, totalStock;
    let optionCount = $('.product-options').data('option-count');

    // 옵션 값 동기화
    if (this.id === 'scrollBuyButton') {
        $('#option1').val($('#scrollOption1').val());
        $('#option2').val($('#scrollOption2').val());
        $('#quantity').val($('#scrollQuantity').val());
    } else {
        $('#scrollOption1').val($('#option1').val());
        $('#scrollOption2').val($('#option2').val());
        $('#scrollQuantity').val($('#quantity').val());
    }

    stockNum = $('.product-options').data('stock-num');
    qty = $('#quantity').val();
    option1 = $('#option1').val();
    option2 = $('#option2').val();
    totalStock = $('.product-options').data('total-stock');

    // 옵션이 있는 경우에만 체크
    if (optionCount > 0) {
        if (!option1) {
            showToast('첫 번째 옵션을 선택해주세요.');
            return;
        }
        if (optionCount == 2 && !option2) {
            showToast('두 번째 옵션을 선택해주세요.');
            return;
        }
    }

    // 재고 확인
    if (parseInt(qty) > totalStock) {
        showToast('선택한 수량이 재고량을 초과합니다.');
        return;
    }

    // URL 생성
    let url = "${pageContext.request.contextPath}/order/payment";
    let query = "?stockNum=" + stockNum + "&qty=" + qty;
    
    // 옵션 정보 추가
    if (option1) query += "&option1=" + option1;
    if (option2) query += "&option2=" + option2;
    
    console.log('생성된 URL:', url + query);
    
    // 바로 페이지 이동
    location.href = url + query;
});

/*       // 토스트 메시지 표시 후 페이지 이동
      showToast('구매 페이지로 이동합니다.', function() {
          location.href = url + query;
      });
  });

  function showToast(message, callback) {
      $('#cartToast .toast-body').text(message);
      var toast = new bootstrap.Toast($('#cartToast')[0], {
          autohide: true,
          delay: 2000 // 2초 후 자동으로 사라짐
      });
      toast.show();
      
      if (callback) {
          $('#cartToast').on('hidden.bs.toast', function () {
              callback();
              $('#cartToast').off('hidden.bs.toast');
          });
      }
  } */

    // 동기화
function syncOptions() {
    console.log('syncOptions 함수 호출됨');
    let option1Val = $('#option1').val();
    let option2Val = $('#option2').val();
    $('#scrollOption1').val(option1Val);
    $('#scrollOption2').val(option2Val);
    $('#scrollQuantity').val($('#quantity').val());
    
    let stockNum = 0;
    let totalStock = 0;
    let optionCount = $('.product-options').data('option-count');

    if (optionCount === 2 && option2Val) {
        let selectedOption = $('#option2').find(':selected');
        stockNum = selectedOption.data('stock-num') || 0;
        totalStock = selectedOption.data('total-stock') || 0;
    } else if (option1Val) {
        let selectedOption = $('#option1').find(':selected');
        stockNum = selectedOption.data('stock-num') || 0;
        totalStock = selectedOption.data('total-stock') || 0;
    }
    
    $('#scrollOptionArea').data('stock-num', stockNum);
    $('.product-options').data('stock-num', stockNum);
    $('.product-options').data('total-stock', totalStock);

    console.log('동기화된 값들:', {
        option1: option1Val,
        option2: option2Val,
        quantity: $('#scrollQuantity').val(),
        stockNum: stockNum,
        totalStock: totalStock,
        optionCount: optionCount
    });
    updateScrollInfo();
    updateButtonState(stockNum, totalStock, optionCount);
}
    // 메인 옵션이 변경될 때마다 동기화
    $('#option1, #option2, #quantity').change(syncOptions);

    // 스크롤 옵션 변경 시에도 동기화
    $('#scrollOption1, #scrollOption2, #scrollQuantity').change(function() {
        let id = $(this).attr('id');
        let mainId = id.replace('scroll', '').toLowerCase();
        $('#' + mainId).val($(this).val()).trigger('change');
    });

// -----------------------------장바구니-----------------------------//
	$('#addToCart, #scrollAddToCart').click(function() {
	    
	    let stockNum = $('.product-options').data('stock-num');
	    let qty = $('#quantity').val();
	    let optionCount = $('.product-options').data('option-count');
	    
	    // 옵션이 있는 경우 선택 여부 확인
	    if (optionCount > 0) {
	        let option1 = $('#option1').val();
	        let option2 = $('#option2').val();
	        
	        if (!option1) {
	            showToast('첫 번째 옵션을 선택해주세요.');
	            return;
	        }
	        
	        if (optionCount == 2 && !option2) {
	            showToast('두 번째 옵션을 선택해주세요.');
	            return;
	        }
	    }
	    
	    if (!stockNum) {
	        showToast('상품 정보를 불러올 수 없습니다.');
	        return;
	    }
        
        let url = "${pageContext.request.contextPath}/cart/insertCart";
        let query = {
            qty: qty,
            stockNum: stockNum
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
                    showCartConfirmToast();
                } else if (state === "login") {
                    showToast('로그인이 필요합니다.');
                } else {
                    showToast('장바구니 담기에 실패했습니다.');
                }
            },
            error: function(xhr, status, error) {
                showToast("장바구니 추가 중 오류가 발생했습니다.");
            }
        });
    });

    function showToast(message) {
        $('#cartToast .toast-body').text(message);
        $('#cartToast').toast('show');
    }

    function showCartConfirmToast() {
        $('#cartConfirmToast .toast-body').html(`
                🛒 상품을 장바구니에 담았어요!<br>
                지금 확인해 보시겠어요?
            <div class="mt-2 pt-2 border-top">
                <button type="button" class="btn btn-primary btn-sm goToCartBtn">이동</button>
                <button type="button" class="btn btn-secondary btn-sm" data-bs-dismiss="toast">취소</button>
            </div>
        `);
        $('#cartConfirmToast').toast('show');
    }

    // 이벤트 위임을 사용하여 동적으로 생성된 버튼에 대한 클릭 이벤트 처리
    $(document).on('click', '.goToCartBtn', function() {
        location.href = '${pageContext.request.contextPath}/cart/list';
    });
    updateStockStatus();

    //-----------------------------장바구니-----------------------------//

	function showToast(message, isConfirm = false) {
	    if (isConfirm) {
	        $('#cartConfirmToast .toast-body').html(message);
	        $('#cartConfirmToast').toast('show');
	    } else {
	        $('#cartToast .toast-body').text(message);
	        $('#cartToast').toast('show');
	    }
	}
        $('#goToCartBtn').click(function() {
            location.href = '${pageContext.request.contextPath}/cart/list';
        });

        // 옵션 변경 시 stockNum 업뎃
        $('.requiredOption, .requiredOption2').change(function() {
        	updateStockStatus();
            updateStockNum();
            
            //옵션 선택 상태에 따라 수량 조절 버튼의 활성화/비활성화 
            updateQuantityButtons();
            //옵션이 변경될 때마다 수량을 초기값(보통 1)으로 재설정함ㅁ
            resetQuantity();
        });
        
        function updateQuantityButtons() {
            let isOptionSelected = ($('.product-options').data('option-count') == 0) || 
                                   ($('#option1').val() && 
                                   ($('.product-options').data('option-count') == 1 || $('#option2').val()));

            $('#decreaseQuantity, #increaseQuantity').prop('disabled', !isOptionSelected);
            $('#scrollDecreaseQuantity, #scrollIncreaseQuantity').prop('disabled', !isOptionSelected);
        }

        function resetQuantity() {
            $('#quantity, #scrollQuantity').val(1);
            updatePrice(1);
        }

        function updateStockNum() {
            let option1 = $('#option1').val();
            let option2 = $('#option2').val();
            let optionCount = $('.product-options').data('option-count');
            
            if (optionCount > 0) {
                if (optionCount == 1 && option1) {
                    let selectedOption = $('#option1').find(':selected');
                    let stockNum = selectedOption.data('stock-num');
                    $('.product-options').data('stock-num', stockNum);
                } else if (optionCount == 2 && option1 && option2) {
                    let selectedOption = $('#option2').find(':selected');
                    let stockNum = selectedOption.data('stock-num');
                    $('.product-options').data('stock-num', stockNum);
                } else {
                    $('.product-options').data('stock-num', null);
                }
            }            
        }

//----------------------------- 채팅---------------------------//
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
        updateProductInfoBottom();
        toggleScrollOption();
    });

    // 초기화
    updateProductInfoBottom();
    updatePrice($('#quantity').val());
    
    
 //------------------------------상품문의------------------------------//
 
    function updateGuideText() {
        var selectedType = $('input[name="qnaType"]:checked').val();
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
        
        var $textarea = $('#qnaContent');
        if ($textarea.length) {
            $textarea.attr('placeholder', guideText);
        } else {
            console.error('#qnaContent 요소를 찾을 수 없습니다.');
        }
    }

    // 문의 유형 변경 시 이벤트 핸들러
    $(document).on('change', 'input[name="qnaType"]', function() {
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
     /*    formData.append('selectFile', files[i]); */
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
    
    $.ajax({
        url: url,
        type: "POST",
        data: formData,
        processData: false,
        contentType: false,
        dataType: "json",
        success: function(data) {
            console.log("서버 응답:", data);
            if(data.state === "true") {
                f.reset();
                $("#qnaModal").modal("hide");
                
                alert('문의가 성공적으로 등록되었습니다.');
                
            } else {
                alert('문의 등록에 실패했습니다. 다시 시도해주세요.');
            }
        },
        error: function(xhr, status, error) {
            console.error("AJAX 오류:", status, error);
            alert("문의 등록 중 오류가 발생했습니다. 다시 시도해주세요.");
        }
    });
});
    
    listQuestion(1);
});

//-------------------DOM 로드 완료 후 실행 끝-------------------//


//-------------------상품문의 리스트 / 등록 -------------------//

function listQuestion(page) {
    let productNum = '${dto.productNum}';
    let url = '${pageContext.request.contextPath}/question/list';
    let query = 'productNum=' + productNum + '&pageNo=' + page;

    const fn = function(data) {
        printQuestion(data);
    };
    ajaxFun(url, 'get', query, 'json', fn);
}

function printQuestion(data) {
    // 문의 갯수 업데이트
    let dataCount = data.dataCount;
    $('.title-qnaCount').html('(' + dataCount + ')');
    $('#qna-tab').text('문의 ' + dataCount);

    let out = '';
    if (Array.isArray(data.list)) {
        for (let item of data.list) {
            // 문의 항목 데이터 준비
            let userName = item.userName || '';
            let question = item.question || '';
            let questionDate = item.question_Date || '';
            let answer = item.answer || '';
            let answerDate = item.answer_Date || '';
            let answerState = answer ? 
                '<span class="badge bg-success">답변완료</span>' : 
                '<span class="badge bg-warning text-dark">답변대기</span>';
            
            // 문의 항목 HTML 생성
            out += '<div class="qna-item">';
            out += '    <div class="d-flex justify-content-between align-items-center mb-2">';
            out += '        <strong>' + userName + '</strong>';
            out += '        ' + answerState;
            out += '    </div>';
            out += '    <p class="mb-1">' + question + '</p>';
            out += '    <small class="text-muted">작성일: ' + questionDate + '</small>';
				
            // 질문 첨부 파일 출력
            if (item.listFilename && Array.isArray(item.listFilename) && item.listFilename.length > 0) {
                out += '    <div class="attached-files mt-2">';
                out += '        <p><strong>첨부 파일:</strong></p>';
                out += '        <ul>';
                for (let fileName of item.listFilename) {
                    let fileUrl = '${pageContext.request.contextPath}/uploads/question/' + fileName;
                    out += '    <li><a href="' + fileUrl + '" target="_blank">' + fileName + '</a></li>';
                }
                out += '        </ul>';
                out += '    </div>';
            } 

            // 답변 출력 (있는 경우)
            if (answer) {
                out += '    <div class="qna-answer mt-2">';
                out += '        <strong>관리자</strong>';
                out += '        <p class="mb-1">' + answer + '</p>';
                out += '        <small class="text-muted">답변일: ' + answerDate + '</small>';
                out += '    </div>';
            }
            out += '</div>';
        }
    }
    
    // 페이징 처리
    if (dataCount > 0) {
        out += '<div class="page-navigation">' + data.paging + '</div>';
    }
    
    // 생성된 HTML을 페이지에 삽입
    $('.list-question').html(out);
}
</script>
