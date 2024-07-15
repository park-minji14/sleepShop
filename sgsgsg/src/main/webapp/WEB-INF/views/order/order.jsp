<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/cart.css" type="text/css">

<style type="text/css">
.body-container {
	max-width: 1100px;
	margin: 0 auto;
    padding-top: 30px;
}
.cart-item {
	border-top: 0;
}
.md-img {
    width: 80px;
    height: 80px;
}
.order_box{
    background: #fff;
    border-radius: 6px;
    border: 1px solid #ededed;
    margin-bottom: 12px;
}

.cart-box {
	border-top: 1px solid #dee2e6;
    margin-bottom: 12px;
    font-size: 14px;
}

.item-summary {
	color: rgb(107, 109, 110);
}
</style>

<script type="text/javascript">
function sendOk() {
	const f = document.paymentForm;
	
	/*
	if(! f.recipientName.value) {
		alert("먼저 배송지를 등록하세요..");
		return;
	}
	
	if(! /^\d+$/.test(f.usedSaved.value)) {
		alert("숫자만 입력 가능합니다.");
		return;
	}

	*/
	let balance = Number($('.btn-usedSaved').attr('data-balance')) || 0;
	let usedSaved = Number(f.usedSaved.value);

	if(usedSaved > balance) {
		alert("사용 가능 포인터는 보유 포인터를 초과 할수 없습니다.");
		return;
	}
	
	// 결제 금액 = 총금액 - 포인트사용금액
	let p = Number(f.payment.value) - usedSaved;
	f.payment.value = p;
	// 결제 API에서 응답 받을 파라미터
	let payMethod = "카드결제"; // 결제유형
	let cardName = "BC 카드";  // 카드 이름
	let authNumber = "1234567890"; // 승인번호
	let authDate = ""; // 승인 날짜
	// toISOString() : "YYYY-MM-DDTHH:mm:ss.sssZ" 형식
	authDate = new Date().toISOString().replace('T', ' ').slice(0, -5); // YYYY-MM-DD HH:mm:ss

	// 결제 API에 요청할 파라미터
	let payment = f.payment.value; // 결제할 금액
	let merchant_uid = "${productOrderNumber}";  // 고유 주문번호
	let productName = "${productOrderName}";  // 주문상품명
	let buyer_email = "${orderUser.email}";  // 구매자 이메일
	let buyer_name = "${orderUser.userName}";  // 구매자 이름
	let buyer_tel = "${orderUser.tel}";   // 구매자 전화번호(필수)
	let buyer_addr = "${orderUser.addr1}" + " " + "${orderUser.addr2}";  // 구매자 주소
	buyer_addr = buyer_addr.trim();
	let buyer_postcode = "${orderUser.zip}"; // 구매자 우편번호
	
	// 결제 API로 결제 진행
	
	
	
	// 결제가 성공한 경우 ------------------------
	
	// 결제 방식, 카드번호, 승인번호, 결제 날짜
	f.payMethod.value = payMethod;
	f.cardName.value = cardName;
	f.authNumber.value = authNumber;
	f.authDate.value = authDate;
	
	
	f.action = "${pageContext.request.contextPath}/order/paymentOk"
	f.submit();
}
</script>

<div class="container">
	<div class="body-container">	
		<div class="body-title">
			<h3><i class="bi bi-receipt-cutoff"></i> 주문/결제 </h3>
		</div>
		
		<div class="body-main">
			<form name="paymentForm" method="post">
				<div class="order-list p-3 border rounded order_box">
					<div class="fs-6 fw-semibold border-bottom pb-1">상품 정보</div>
					<c:forEach items="${productList}" var="dto">
						<div class="cart-box ps-2 pt-2">
							<div class="cart-item">
								<a class="item-link" href="${pageContext.request.contextPath}/product/details/${dto.productNum}">
									<span class="item-img">
										<img alt="상품 이미지" src="${pageContext.request.contextPath}/uploads/product/${dto.thumbnail}">
									</span>
									<span class="item-content">
										<h1 class="item-title">${dto.productName}</h1>
										<div class="option-price">
											<span class="number"><fmt:formatNumber value="${dto.salePrice}" pattern="#,###" />원</span>
											<c:if test="${dto.discountRate != 0}">
												<span class="text-decoration-line-through"><fmt:formatNumber value="${dto.price}" pattern="#,###" />원</span>
											</c:if>
										</div>
									</span>
								</a>
								<div class="item-summary">
									<div class="option">
										<c:if test="${dto.optionCount>=1}">${dto.optionName}: ${dto.optionValue}</c:if>
										<c:if test="${dto.optionCount>=2}">/ ${dto.optionName2}: ${dto.optionValue2}</c:if>
									</div>
									<div>수량: ${dto.qty}개 (<fmt:formatNumber value="${dto.price*(1-dto.discountRate/100)*dto.qty}" pattern="#,###" />원)</div>
								</div>
								<div>
									<span class=""><i class="bi bi-truck"></i> 
										<c:if test="${deliveryCharge==0}">
											무료
										</c:if>
										<c:if test="${deliveryCharge!=0}">
											${dto.delivery}원
										</c:if>
									</span>
								</div>
								<div>
									<input type="hidden" name="stockNums" value="${dto.stockNum}">
									<input type="hidden" name="qtys" value="${dto.qty}">
									<input type="hidden" name="productMoneys" value="${dto.salePrice * dto.qty}">
									<input type="hidden" name="prices" value="${dto.price}">
									<input type="hidden" name="salePrices" value="${dto.salePrice}">
									<input type="hidden" name="savedMoneys" value="${dto.savedMoney}">
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
				<input type="hidden" name="orderNum" value="${orderNum}">
				<input type="hidden" name="totalMoney" value="${totalProduct - totalDiscountPrice}">
				<input type="hidden" name="deliveryCharge" value="${deliveryCharge}">
				<input type="hidden" name="payment" value="${totalPayment}">
				<input type="hidden" name="savedMoney" value="${totalSavedMoney}">

				<input type="hidden" name="mode" value="${mode}">

				<input type="hidden" name="payMethod" value="">
				<input type="hidden" name="cardName" value="">
				<input type="hidden" name="authNumber" value="">
				<input type="hidden" name="authDate" value="">

				<div class="p-3 border rounded order_box">
					<div class="fs-6 fw-semibold border-bottom pb-1">배송지 정보</div>
					<div class="row ps-2 pt-2">
						<div class="col-auto pe-2 mt-2">
							<label class="fw-semibold">${defaultDest.recipientName}</label>
							<label class="text-primary">${defaultDest.defaultDest==1? '기본배송지':''}</label>
						</div>
						<div class="col-auto">
							<button type="button" class="btn border" id="changeDest"> 배송지변경 </button>
						</div>
					</div>
					<div class="ps-2 pt-2">
						<div class="pt-2">${defaultDest.addr1} ${defaultDest.addr2}</div>
						<div class="pt-2">${defaultDest.tel}</div>
						<div class="pt-2 w-50">
							<input type="hidden" name="destinatioNnum" value="${defaultDest.destinationNum}">
							<input type="hidden" name="recipientName" value="${defaultDest.recipientName}">
							<input type="hidden" name="tel" value="${defaultDest.tel}">
							<input type="hidden" name="zip" value="${defaultDest.zip}">
							<input type="hidden" name="addr1" value="${defaultDest.addr1}">
							<input type="hidden" name="addr2" value="${defaultDest.addr2}">
							<input type="hidden" name="productOrderName" value="${productOrderName}">
							<input type="text" name="destMemo" class="form-control" placeholder="요청사항을 입력합니다." value="${defaultDest.destMemo}">
						</div>
					</div>
				</div>
				
				<div class="p-3 border rounded order_box">
					<div class="fs-6 fw-semibold border-bottom pb-1">쿠폰 사용</div>
					<div class="row ps-2 pt-2 col-6">
						<select class="form-select" id="couponSelect">
							<option>사용 안함</option>
							<option value="">첫 결제 할인 쿠폰</option>
						</select>
					</div>
				</div>
				
				<div class="p-3 border mt-3 rounded order_box">
					<div class="fs-6 fw-semibold border-bottom pb-1">포인트</div>
					<div class="ps-2 pt-2">
						<span class="pt-2 fw-semibold">보유 <fmt:formatNumber value="${empty userPoint ? 0 : userPoint.remain_points}"/>원</span>
						<span class="pt-2">(<fmt:formatNumber value="${totalSavedMoney}" pattern="#,###" /> 적립 예정)</span>
					</div>
					<div class="row ps-2 pt-2">
						<div class="col-6">
							<div class="input-group">
								<input type="number" class="form-control" name="usedSaved" style="text-align: right;" value="0" min="0" max="${empty userPoint ? 0 : userPoint.remain_points}">
								<button type="button" class="input-group-text btn-usedSaved" data-balance="${empty userPoint ? 0 : userPoint.remain_points}">전액사용</button>
							</div>
						</div>
					</div>
				</div>				
				
				<div class="cart-summary">
					<dl class="productSummary">
						<dt>총 상품금액</dt>
						<dd>
							<span class="number"><fmt:formatNumber value="${totalProduct}" pattern="#,###" /></span>원
						</dd>
					</dl>
					<dl class="deliverySummary">
						<dt>총 배송비</dt>
						<dd>
							+ <span class="number"><fmt:formatNumber value="${deliveryCharge}" pattern="#,###" /></span>원
						</dd>
					</dl>
					<dl class="saleSummary">
						<dt>총 할인금액</dt>
						<dd>
							- <span class="number"><fmt:formatNumber value="${totalDiscountPrice}" pattern="#,###" /></span>원
						</dd>
					</dl>
					<dl class="pointUsed">
						<dt>포인트사용액</dt>
						<dd>
							- <span class="number">0</span>원
						</dd>
					</dl>
					<dl class="totalSummary">
						<dt>결제금액</dt>
						<dd>
							<span class="number"><fmt:formatNumber value="${totalPayment}" pattern="#,###" /></span>원
						</dd>
					</dl>
				</div>
				
				<div class="pt-3 pb-3 text-center">
					<button type="button" class="btn btn-primary btn-lg" style="width: 250px;" onclick="sendOk()">결제하기</button>
					<button type="button" class="btn btn-light btn-lg" style="width: 250px;" onclick="location.href='${pageContext.request.contextPath}/';">결제취소</button>
				</div>
			</form>
		</div>
	</div>
</div>
<div class="modal fade" id="changeDestModal" tabindex="-1" aria-labelledby="orderDialogModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" style="max-width: 80%;">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="orderDialogModalLabel">배송지 변경</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body pt-1">
				<div class="modal-order-detail">
					<table class="text-center table">
						<tr>
							<th>&nbsp;</th>
							<th class="col-2">받는 사람</th>
							<th class="col-4">기본주소</th>
							<th class="col-3">상세주소</th>
							<th class="col-3">전화번호</th>
						</tr>
						<tr>
							<td><input type="checkbox"></td>
							<td>홍길동</td>
							<td>서울특별시 마포구 월드컵북로 21</td>
							<td>풍성빌딩 2층</td>
							<td>010-0000-0000</td>
						</tr>
					</table>
				</div>
			</div>
			<div class="modal-footer">
		        <button type="button" class="btn btn-secondary">수정</button>
		        <button type="button" class="btn btn-primary">선택</button>
		      </div>
		</div>
	</div>
</div>
<script type="text/javascript">
$(function() {
	$('#changeDest').on('click', function() {
		//$('#changeDestModal').addClass('show');
		$('#changeDestModal').modal("show");
	});
	
	let modal = document.getElementById('changeDestModal');
	modal.addEventListener('show.bs.modal', function () {
		
	});
	
	$('.btn-usedSaved').click(function(){
		const f = document.paymentForm;
		
		let balance = Number($(this).attr('data-balance')) || 0;
		f.usedSaved.value = balance;
		
		let payment = Number(f.payment.value) - balance;
		
		$('.totalSummary .number').text(payment.toLocaleString());
		$('.pointUsed .number').text(balance.toLocaleString());
	});
	
	$('form[name=paymentForm] input[name=usedSaved]').on('keyup mouseup', function() {                                                                                                                     
		const f = document.paymentForm;
		let balance = Number($('.btn-usedSaved').attr('data-balance')) || 0;
		let usedSaved = Number(f.usedSaved.value);
		
		if(usedSaved > balance) {
			usedSaved = balance;
			f.usedSaved.value = balance;
		}
		
		let payment = Number(f.payment.value) - usedSaved;
		
		$('.totalSummary .number').text(payment.toLocaleString());
		$('.pointUsed .number').text(usedSaved.toLocaleString());
	});
});


</script>