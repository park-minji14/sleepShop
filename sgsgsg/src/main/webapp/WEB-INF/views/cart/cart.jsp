<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/cart.css" type="text/css">
	
<style type="text/css">
.body-container {
	max-width: 1100px;
	position: relative;
	margin: 0 auto;
	display: flex;
	padding-top: 30px;
}
</style>


<div class="container">
	<div class="body-container">
		<form class="cart-body" name="cartForm" method="post">
			<div class="cart-header">
				<label class="label">
					<input type="checkbox" class="chkAll">
					<span>모두선택</span>
				</label>
				<span class="text-right">
					<button class="cart-checked_delete" type="button">선택삭제</button>
				</span>
				<input type="hidden" name="mode" value="cart">
			</div>
			<div class="top-notification">
				<div class="ms-3">쿠폰 적용된 가격은 결제할 때 확인 가능</div>
				<button type="button" aria-label="삭제" class="notification_delete">
					<svg width="12" height="12" viewBox="0 0 12 12" fill="currentColor" preserveAspectRatio="xMidYMid meet">
						<path fill-rule="nonzero" d="M6 4.6L10.3.3l1.4 1.4L7.4 6l4.3 4.3-1.4 1.4L6 7.4l-4.3 4.3-1.4-1.4L4.6 6 .3 1.7 1.7.3 6 4.6z"/>
					</svg>
				</button>
			</div>
			<div class="cart-list">
				<!-- 상품 시작 -->
				<c:forEach var="dto" items="${list}">
				<div class="cart-box">
					<article class="cart-item">
						<div class="checkbox-wrap">
							<input type="checkbox" name="stockNum" value="${dto.stockNum}" class="checkbox">
						</div>
						<a class="item-link" href="${pageContext.request.contextPath}/product/details/${dto.productNum}">
							<span class="item-img">
								<img alt="상품 이미지" src="${pageContext.request.contextPath}/uploads/product/${dto.thumbnail}">
							</span>
							<span class="item-content">
								<h1 class="item-title">${dto.productName}</h1>
								<span class="delivery-info">배송비: ${dto.delivery}원</span>
							</span>
						</a>
						<button class="item_delete" type="button" onclick="deleteProduct($(this).closest('.cart-box'));" aria-label="삭제">
							<svg width="12" height="12" viewBox="0 0 12 12" fill="currentColor" preserveAspectRatio="xMidYMid meet">
								<path fill-rule="nonzero" d="M6 4.6L10.3.3l1.4 1.4L7.4 6l4.3 4.3-1.4 1.4L6 7.4l-4.3 4.3-1.4-1.4L4.6 6 .3 1.7 1.7.3 6 4.6z"/>
							</svg>
						</button>
						<div class="option-box">
							<h2 class="option-title">
								<c:if test="${dto.optionCount>=1}">${dto.optionName}: ${dto.optionValue}</c:if>
								<c:if test="${dto.optionCount>=2}">/ ${dto.optionName2}: ${dto.optionValue2}</c:if>
							</h2>
							<div class="option-subBox">
								<div class="option-qty">
									<span class="minus_qty bi bi-dash-lg"></span>
									<button type="button" class="chage_qty">${dto.qty}</button>
									<span class="plus_qty bi bi-plus-lg"></span>
								</div>
								<div class="option-price">
									<span class="number"><fmt:formatNumber value="${dto.price*(1-dto.discountRate/100)*dto.qty}" pattern="#,###" /></span>원
								</div> 
							</div>
							<input type="hidden" data-stock-num="${dto.stockNum}">
							<input type="hidden" name="qty" value="${dto.qty}">
							<input type="hidden" name="productPrice" value="${dto.price}">
							<input type="hidden" name="salePrice" value="${Math.ceil(dto.price*(1-dto.discountRate/100))}">
							<input type="hidden" name="delivery" value="${dto.delivery}">
							<input type="hidden" name="totalPrice">
						</div>
						<button class="item_order" type="button">이 상품만 구매</button>
					</article>
				</div>
				</c:forEach>
				<!-- 모바일 대응 금액 출력 -->
				<div class="cart-summary cart-summary_m">
					<dl class="productSummary">
						<dt>총 상품금액</dt>
						<dd>
							<span class="number">0</span>원
						</dd>
					</dl>
					<dl class="deliverySummary">
						<dt>총 배송비</dt>
						<dd>
							+ <span class="number">0</span>원
						</dd>
					</dl>
					<dl class="saleSummary">
						<dt>총 할인금액</dt>
						<dd>
							- <span class="number">0</span>원
						</dd>
					</dl>
					<dl class="totalSummary">
						<dt>결제금액</dt>
						<dd>
							<span class="number">0</span>원
						</dd>
					</dl>
				</div>
			</div>
		</form>
		<!-- 사이드바 결제금액 + 결제 버튼 -->
		<div class="cart-side">
			<div class="cart-sidebar" style="position: sticky; top: 150px; transition: top 0.1s ease 0s;">
				<div class="cart-summary">
					<dl class="productSummary">
						<dt>총 상품금액</dt>
						<dd>
							<span class="number">0</span>원
						</dd>
					</dl>
					<dl class="deliverySummary">
						<dt>총 배송비</dt>
						<dd>
							+ <span class="number">0</span>원
						</dd>
					</dl>
					<dl class="saleSummary">
						<dt>총 할인금액</dt>
						<dd>
							- <span class="number">0</span>원
						</dd>
					</dl>
					<dl class="totalSummary">
						<dt>결제금액</dt>
						<dd>
							<span class="number">0</span>원
						</dd>
					</dl>
				</div>
				<button class="order_btn sidebar_order_btn" type="button">구매하기</button>
			</div>
		</div>
	</div>
</div>
<!-- 모바일 대응 결제버튼 -->
<div class="cart-footer-container">
	<div class="cart-footer">
		<div class="cart-footer-total">
			<span class="count">0개 </span>
			<span class="cost">0원</span>
		</div>
		<button class="order_btn footer_order_btn" type="button">바로구매</button>
	</div>
</div>

<script type="text/javascript">
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
        settings.processData = false;
        settings.contentType = false;
    }
    
    $.ajax(url, settings);
}

function deleteProduct($box) {
	console.log($box)
	if(! confirm('해당 상품을 삭제하시겠습니까?')){
		return;
	}
	const f = document.cartForm;
	f.action = "${pageContext.request.contextPath}/cart/deleteCart";
	f.submit();
	
	let url = "${pageContext.request.contextPath}/cart/deleteCartItem";
	let stockNum = parseInt($box.find('input[name="stockNum"]').val());
	let query = "stockNum="+stockNum;
	
	const fn = function(data) {
		if(data.state === 'true'){
			$($box).closest('.cart-box').remove();
			summary();
			return;
		}
    };
	ajaxFun(url, "post", query, "json", fn);
}

function changeQty($box, query) {
	let url = "${pageContext.request.contextPath}/cart/updateQty";
	let qty = query.qty;
	
	const fn = function(data) {
		if(data.state === 'true'){
			let totalPrice = $($box).find('input[name="salePrice"]').val() * qty;
			$($box).find('.chage_qty').text(qty.toLocaleString());
			$($box).find('input[name="qty"]').val(qty);
			$($box).find('input[name="totalPrice"]').val(totalPrice);
			$($box).find('.option-price .number').text(totalPrice.toLocaleString());
			
			summary();
		}
    };
    ajaxFun(url, "get", query, "json", fn);
}

$(function() {
	let cartSize = "${list.size()}";
	if(cartSize!=="" && cartSize!=="0") {
		$('.chkAll').prop('checked', true);
		$('input.checkbox').prop('checked', true);
		summary();
	}

	$('.chkAll').click(function() {
		$('input.checkbox').prop('checked', $(this).is(":checked"));
		summary();
	});
	
	$('input.checkbox').click(function() {
		if(parseInt(cartSize) === $('.cart-item input.checkbox:checked').length){
			$('.chkAll').prop('checked', true);
		} else {
			$('.chkAll').prop('checked', false);
		}
		summary();
	});
	
	$('.order_btn').click(function() {
		if($('input.checkbox').length === 0){
			alert('선택된 상품이 없습니다.')
			return;
		}
		
		const f = document.cartForm;
		f.action = "${pageContext.request.contextPath}/order/payment";
		f.submit();
		
	});
	
	$('.item_order').click(function() {
		let url = "${pageContext.request.contextPath}/order/payment";
		
		let num = $(this).closest('.cart-item').find('input[name="stockNum"]').val();
		let qty = $(this).closest('.cart-item').find('input[name="qty"]').val();
		let query = "stockNum="+num+"&qty="+qty+"&mode=item";
		
		location.href = url+"?"+query;
	});
});

function summary() {
	let productSummary=0;
	let deliverySummary=0;
	let saleSummary=0;
	let totalSummary=0;
	let count = $('input.checkbox:checked').length;
	$('input.checkbox:checked').each(function() {
		let $items = $(this).closest('.cart-item');
		let productPrice = parseInt($($items).find('input[name=productPrice]').val());
		let qty = parseInt($($items).find('input[name="qty"]').val());
		let delivery = parseInt($($items).find('input[name="delivery"]').val());
		let salePrice = parseInt($($items).find('input[name="salePrice"]').val());
		
		
		productSummary += productPrice * qty;
		deliverySummary += delivery;
		saleSummary += (productPrice - salePrice) * qty;
		totalSummary += salePrice * qty;
	});
	$('.productSummary .number').text(productSummary.toLocaleString());
	$('.deliverySummary .number').text(deliverySummary.toLocaleString());
	$('.saleSummary .number').text(saleSummary.toLocaleString());
	$('.totalSummary .number').text((totalSummary+deliverySummary).toLocaleString());
	
	if(count > 0){
		$('.sidebar_order_btn').text(count+"개 구매하기");
	} else {
		$('.sidebar_order_btn').text("구매하기");
	}
	$('.cart-footer-total .count').text(count+"개");
	$('.cart-footer-total .cost').text((totalSummary+deliverySummary).toLocaleString()+"원");
	
}

$('.cart-list').on('click', function(e) {
	if(! $(e.target.parentNode).hasClass("option-qty")){
		return;
	}
	let $box = $(e.target).closest('.option-box');
	let qty = $($box).find('input[name="qty"]').val();
	let stockNum = $box.find('input[data-stock-num]').attr('data-stock-num');

	if($(e.target).hasClass("chage_qty")){
		let result = parseInt(window.prompt('변경하실 수량을 입력하세요. ( 1 ~ 99 )')) || undefined;
		
		if(result === undefined){
			return;
		}
		if(result <= 0 || result > 99){
			alert('1 ~ 99까지의 수를 입력하세요.');
			return;
		}
		qty = result;
	}
	if($(e.target).hasClass("plus_qty")){
		qty++;
	}
	if($(e.target).hasClass("minus_qty")){
		qty--;
		if(qty === 0){
			deleteProduct($box);
			return;
		}
	}
	changeQty($box, {stockNum:stockNum, qty:qty});
});

$(function() {
	$('.notification_delete').click(function() {
		$(this).closest('.top-notification').remove();
	});
	
	$('.cart-checked_delete').click(function() {
		let cnt = $('.checkbox:checked').length;
	    if (cnt === 0) {
			alert("삭제할 상품을 먼저 선택 하세요 !!!");
			return;
	    }
	    
		if(! confirm('선택한 상품을 삭제하시겠습니까?')){
			return;
		}
		const f = document.cartForm;
		f.action = "${pageContext.request.contextPath}/cart/deleteCart";
		f.submit();
		
	});
});
//window.innerWidth
</script>