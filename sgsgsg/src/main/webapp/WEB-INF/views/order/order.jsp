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

input[type="checkbox"]{
	margin-right: 0;
}

</style>

<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script type="text/javascript">
function sendOk() {
	const f = document.paymentForm;
	
	
	if($('.destBox .recipientName').text() && 
			($('.destBox .recipientName').val().trim() === '' || ! $('.destBox .recipientName').val().trim())){
		f.recipientName.value = $('.destBox .recipientName').text();
	} else {
		f.recipientName.value = $('.destBox .recipientName').val().trim();
	}
	
	if($('.destBox .addr1').text() && 
			($('.destBox .addr1').val().trim() === '' || ! $('.destBox .addr1').val().trim())){
		f.addr1.value = $('.destBox .addr1').text();
	} else {
		f.addr1.value = $('.destBox .addr1').val().trim();
	}
	
	if($('.destBox .addr2').text() && 
			($('.destBox .addr2').val().trim() === '' || ! $('.destBox .addr2').val().trim())){
		f.addr2.value = $('.destBox .addr2').text();
	} else {
		f.addr2.value = $('.destBox .addr2').val().trim();
	}
	
	if($('.destBox .zip').text() && 
			($('.destBox .zip').val().trim() === '' || ! $('.destBox .zip').val().trim())){
		f.zip.value = $('.destBox .zip').text();
	} else {
		f.zip.value = $('.destBox .zip').val().trim();
	}
	
	if($('.destBox .tel').text() && 
			($('.destBox .tel').val().trim() === '' || ! $('.destBox .tel').val().trim())){
		f.tel.value = $('.destBox .tel').text();
	} else {
		f.tel.value = $('.destBox .tel').val().trim();
	}
	
	if(! f.recipientName.value) {
		alert("먼저 배송지를 등록하세요..");
		return;
	}
	
	if(! /^\d{3}-\d{4}-\d{4}$/.test(f.tel.value)) {
		alert("010-1234-5678 형식으로 입력하세요");
		return;
	}
	
	if(! /^\d+$/.test(f.usedSaved.value)) {
		alert("숫자만 입력 가능합니다.");
		return;
	}

	let balance = Number($('.btn-usedSaved').attr('data-balance')) || 0;
	let usedSaved = Number(f.usedSaved.value);

	if(usedSaved > balance) {
		alert("사용 가능 포인트는 보유 포인트를 초과 할수 없습니다.");
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
	const koreaNow = new Date((new Date()).getTime() + 1000 * 60 * 60 * 9)
	authDate = koreaNow.toISOString().replace('T', ' ').slice(0, -5); // YYYY-MM-DD HH:mm:ss

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
	
	/*
	// 결제 API로 결제 진행
	var IMP = window.IMP;
	IMP.init("imp키");
	
	
	IMP.request_pay({
		pg : 'html5_inicis.INIpayTest', // 테스트 시 html5_inicis.INIpayTest 기재 
		pay_method : 'card',
		merchant_uid: merchant_uid, // 상점에서 생성한 고유 주문번호
		name : productName,
		amount : f.payment.value,                           // 금액
		buyer_email : buyer_email,
		buyer_name : buyer_name,
		buyer_tel : buyer_tel,   // 필수 파라미터
		buyer_addr : buyer_addr,
		buyer_postcode : buyer_postcode,
	}, function(resp) { // callback
			if(resp.success) {
				
				let pg_tid = resp.pg_tid.replace('StdpayCARDINIpayTest','').slice(0, -5);
				
				f.payMethod.value = resp.pay_method;
				f.cardName.value = resp.card_name;
				f.authNumber.value = resp.apply_num;
				f.authDate.value = pg_tid;
				
				
				f.action = "${pageContext.request.contextPath}/order/paymentOk"
				f.submit();
				
				alert('success...');
				console.log(resp);
			} else {
				alert('fail...');
				console.log(resp);
			}
	});
	*/
	
	
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

<div class="container" style="position: relative; background-color: #f5f5f5; width: 100%; max-width: 100%;">
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
				<input type="hidden" name="productOrderName" value="${productOrderName}">

				<input type="hidden" name="mode" value="${mode}">

				<input type="hidden" name="payMethod" value="">
				<input type="hidden" name="cardName" value="">
				<input type="hidden" name="authNumber" value="">
				<input type="hidden" name="authDate" value="">

				<div class="p-3 border rounded order_box destInfo">
					<div class="fs-6 border-bottom pb-1">
						<span class="fw-semibold">배송지 정보 </span>
						<span>
							<input type="radio" name="mainDest" style="display: none;" id="mainCD">
							<label for="mainCD" class="btn border btn-outline-primary" id="changeDest">배송지변경</label>
							<input type="radio" name="mainDest" style="display: none;" id="mainDI">
							<label for="mainDI" class="btn border btn-outline-warning"> 직접입력 </label>
						</span>
						<button type="button" class="btn btn-outline-warning fade" id="directDest">우편번호 검색</button>
					</div>
					<div class="ps-2 pt-2 w-50 destBox"></div>
					<span class="pt-2">
						<input type="hidden" name="destinationNum" value="${defaultDest.destinationNum}">
						<input type="hidden" name="recipientName" value="${defaultDest.recipientName}">
						<input type="hidden" name="tel" value="${defaultDest.tel}">
						<input type="hidden" name="zip" value="${defaultDest.zip}">
						<input type="hidden" name="addr1" value="${defaultDest.addr1}">
						<input type="hidden" name="addr2"  value="${defaultDest.addr2}">
					</span>
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
				<div class="changeDest-list"></div>
			</div>
			<div class="modal-footer">
		        <button type="button" class="btn btn-danger deleteDest">삭제</button>
		        <button type="button" class="btn btn-primary selectDest">선택</button>
		      </div>
		</div>
	</div>
</div>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
$(function() {
	let isDefault = ${not empty defaultDest};
	$('input[name=mainDest]').change(function(e) {
		let out="";
		if(e.target.id==="mainDI"){
			out = '<input class="form-control recipientName" placeholder="이름">';
			out += '<input class="form-control mt-2 addr1" placeholder="기본주소 (우편번호 검색을 해주세요)" readonly>';
			out += '<input class="form-control mt-2 zip" placeholder="우편번호" readonly>';
			out += '<input class="form-control mt-2 addr2" placeholder="상세주소">';
			out += '<input class="form-control mt-2 tel" placeholder="전화번호 (010-1234-5678 형식으로 입력하세요)">';
			out += '<input type="text" name="destMemo" class="form-control my-2" placeholder="요청사항을 입력합니다">';
			out += '<span class="pt-2">';
			out += '	<label>';
			out += '		<input type="checkbox" name="insertDest" value="1" onchange="$(\'.destInfo input[name=defaultDest]\').prop(\'disabled\', !$(this).is(\':checked\'));">';
			out += '		<span>배송지 등록</span>';
			out += '	</label>';
			out += '	<label>';
			out += '		<input type="checkbox" name="defaultDest" value="1" disabled>';
			out += '		<span>기본 배송지로 변경</span>';
			out += '	</label>';
			out += '</span>';
		} else {
			out = '<div class="fw-semibold">';
			out += '	<span class="recipientName">${defaultDest.recipientName}</span>';
			out += '	<span class="isDefault">${defaultDest.defaultDest == 1? "(기본배송지)":""}</span>';
			out += '</div>';
			out += '<span class="mt-2 addr1">${defaultDest.addr1}</span> ';
			out += '(<span class="pt-2 zip">${defaultDest.zip}</span>)';
			out += '<div class="pt-2 addr2">${defaultDest.addr2}</div>';
			out += '<div class="pt-2 tel">${defaultDest.tel}</div>';
			out += '<input type="text" name="destMemo" class="form-control my-2" placeholder="요청사항을 입력합니다." value="${defaultDest.destMemo}">';
			out += '<span class="pt-2">';
			out += '	<label>';
			out += '		<input type="checkbox" name="defaultDest" value="1">';
			out += '		<span>기본 배송지로 변경</span>';
			out += '	</label>';
			out += '</span>';
		}
		
		let info = $(e.target).closest('.destInfo');
		$('.destInfo .destBox').html(out);
		
		if(e.target.id==="mainCD"){
			$('#directDest').removeClass('show');
		}
		if(e.target.id==="mainDI"){
			$('input[name=destinationNum]').val('0');
			info.find('.fade').addClass('show');
		}
		
	});
	isDefault ? mainCD.click() : mainDI.click();
	
	$('#changeDest').on('click', function() {
		$('.changeDest-list').load('${pageContext.request.contextPath}/order/allDest');
		$('#changeDestModal').modal("show");
	});
	
	let modal = document.getElementById('changeDestModal');
	modal.addEventListener('show.bs.modal', function () {
		$('.selectDest').click(function() {
			let dest = $('.changeDest-list input[type=radio]:checked');
			let $tr = dest.closest('tr')
			if(dest.length !=1){
				alert('변경할 배송지를 선택해주세요.');
				return;
			}
			
			let name = $tr.find('.recipientName').text();
			if(dest.attr('data-default')==1){
				$('.destBox .isDefault').css("display", "inline");
				$('.destBox .isDefault').text("(기본 배송지)");
			} else {
				$('.destBox .isDefault').css("display", "none");
				$('.destBox .isDefault').text("");
			}
			
			$('input[name=destinationNum]').val(dest.attr('data-destnum'));
			$('.destBox .recipientName').text(name);
			$('.destBox .addr1').text($tr.find('.addr1').text());
			$('.destBox .addr2').text($tr.find('.addr2').text());
			$('.destBox .tel').text($tr.find('.tel').text());
			$('.destBox input[name=destMemo]').val($tr.find('.destMemo').text());
			$('.destBox .zip').text($tr.find('.zip').text());
			
			$('#changeDestModal').modal("hide");
		});
		
		$('.deleteDest').click(function() {
			let destNum = "destinationNum="+ $('.changeDest-list input[type=radio]:checked').attr('data-destnum');
			let url = '${pageContext.request.contextPath}/order/deleteDest';
			
			$.ajax({
				url: url,
				method: "post",
				data: destNum,
				dataType: "json",
				success: function(data) {
					if(data.state === 'true'){
						$('.changeDest-list input[type=radio]:checked').closest('tr').remove();
					}
				},
				error: function(jqXHR) {
	                if(jqXHR.status === 403) {
	                	location.href = '${pageContext.request.contextPath}/member/login';
	                    return false;
	                } else if(jqXHR.status === 400) {
	                    alert('요청 처리가 실패 했습니다.');
	                    return false;
	                }
	            }
			});
			
		});
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

document.querySelector('#directDest').addEventListener('click', function(e) {
	if($(e.target).hasClass('show')){
		new daum.Postcode(
			{
				oncomplete : function(data) {
					var fullAddr = '';
					var extraAddr = '';
					if (data.userSelectedType === 'R') {
						fullAddr = data.roadAddress;
					} else {
						fullAddr = data.jibunAddress;
					}

					if (data.userSelectedType === 'R') {
						if (data.bname !== '') {
							extraAddr += data.bname;
						}
						if (data.buildingName !== '') {
							extraAddr += (extraAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						fullAddr += (extraAddr !== '' ? ' (' + extraAddr
								+ ')' : '');
					}

					document.getElementsByClassName('zip')[0].value = data.zonecode;
					document.getElementsByClassName('addr1')[0].value = fullAddr;

					document.getElementsByClassName('addr2')[0].focus();
				}
		}).open();
	}
});

</script>