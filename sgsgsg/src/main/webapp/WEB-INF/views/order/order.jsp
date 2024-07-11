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
</style>

<div class="container">
	<div class="body-container">	
		<div class="body-title">
			<h3><i class="bi bi-receipt-cutoff"></i> 주문/결제 </h3>
		</div>
		
		<div class="body-main">
			<form name="paymentForm" method="post">
				<div class="cart-list p-3 border rounded order_box">
					<div class="fs-6 fw-semibold border-bottom pb-1">상품 정보</div>
					<div class="cart-box">
						<div class="cart-item">
							<a class="item-link" href="${pageContext.request.contextPath}/product/details/${dto.productNum}">
								<span class="item-img">
									<img alt="상품 이미지" src="${pageContext.request.contextPath}/uploads/product/${dto.thumbnail}">
								</span>
								<span class="item-content">
									<h1 class="item-title">${dto.productName}상품 이름</h1>
									<div class="option-price">
										<span class="number">19,475</span>원
										<span class="">${dto.price}</span>
									</div>
								</span>
							</a>
							<div>
								<h2 class="option-title">색상: 그레이 / 사이즈: L</h2>
								<span>2개 (38,950원)</span>
							</div>
							<div>
								<span class=""><i class="bi bi-truck"></i>230원</span>
							</div>
						</div>
					</div>
				</div>
				<input type="hidden" name="orderNum" value="${productOrderNumber}">
				<input type="hidden" name="totalMoney" value="${totalMoney}">
				<input type="hidden" name="deliveryCharge" value="${deliveryCharge}">
				<input type="hidden" name="payment" value="${totalPayment}">

				<input type="hidden" name="mode" value="${mode}">

				<input type="hidden" name="payMethod" value="">
				<input type="hidden" name="cardName" value="">
				<input type="hidden" name="authNumber" value="">
				<input type="hidden" name="authDate" value="">

				<div class="p-3 border rounded order_box">
					<div class="fs-6 fw-semibold border-bottom pb-1">배송지 정보</div>
					<div class="row ps-2 pt-2">
						<div class="col-auto pe-2 mt-2">
							<label class="fw-semibold">김자바</label> <label class="text-primary">기본배송지</label>
						</div>
						<div class="col-auto">
							<button type="button" class="btn border"> 배송지변경 </button>
						</div>
					</div>
					<div class="ps-2 pt-2">
						<div class="pt-2">서울특별시 마포구 월드컵북로 21 풍성빌딩 2층</div>
						<div class="pt-2">010-1111-1111</div>
						<div class="pt-2 w-50">
							<input type="hidden" name="recipientName" value="김자바">
							<input type="hidden" name="tel" value="010-1111-2222">
							<input type="hidden" name="zip" value="111-111">
							<input type="hidden" name="addr1" value="서울특별시 마포구 월드컵북로">
							<input type="hidden" name="addr2" value="21 풍성빌딩 2층">
							<input type="text" name="destMeno" class="form-control" placeholder="요청사항을 입력합니다.">
						</div>
					</div>
				</div>
				
				<div class="p-3 border rounded order_box">
					<div class="fs-6 fw-semibold border-bottom pb-1">쿠폰 사용</div>
				</div>
				
				<div class="p-3 border mt-3 rounded order_box">
					<div class="fs-6 fw-semibold border-bottom pb-1">포인트</div>
					<div class="ps-2 pt-2">
						<div class="pt-2 fw-semibold">보유 <fmt:formatNumber value="${empty userPoint ? 0 : userPoint.balance}"/>원</div>
					</div>
					<div class="row ps-2 pt-2">
						<div class="col-6">
							<div class="input-group">
								<input type="number" class="form-control" name="usedSaved" value="0" min="0" max="${empty userPoint ? 0 : userPoint.balance}">
								<button type="button" class="input-group-text btn-usedSaved" data-balance="${empty userPoint ? 0 : userPoint.balance}">전액사용</button>
							</div>
						</div>
					</div>
				</div>				
				
				<div class="cart-summary">
					<dl class="productSummary">
						<dt>총 상품금액</dt>
						<dd>
							<span class="number">62,131</span>원
						</dd>
					</dl>
					<dl class="deliverySummary">
						<dt>총 배송비</dt>
						<dd>
							+ <span class="number">3,230</span>원
						</dd>
					</dl>
					<dl class="saleSummary">
						<dt>총 할인금액</dt>
						<dd>
							- <span class="number">6,655</span>원
						</dd>
					</dl>
					<dl class="">
						<dt>포인트사용액</dt>
						<dd>
							- <span class="number">6,655</span>원
						</dd>
					</dl>
					<dl class="totalSummary">
						<dt>결제금액</dt>
						<dd>
							<span class="number">58,706</span>원
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