<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div>
	<div class="mt-3">
		<div class="p-3 shadow bg-body rounded">
			<p class="fs-6 fw-semibold mb-0">주문 정보</p> 
		</div>
		<div class="mt-3 p-2">
			<table class="table table-bordered mb-1">
				<tr>
					<td class="table-light" width="105">주문번호</td>
					<td width="150">${order.orderNum}</td>
					<td class="table-light" width="105">주문자</td>
					<td width="150">${order.userName}</td>
					<td class="table-light" width="105">주문일자</td>
					<td width="150">${order.orderDate}</td>
					<td class="table-light" width="110">주문상태</td>
					<td width="150">${order.orderStateInfo}</td>
				</tr>
				<tr>
					<td class="table-light">총금액</td>
					<td class="text-primary"><fmt:formatNumber value="${order.totalMoney}"/></td>
					<td class="table-light">적림금사용액</td>
					<td class="text-primary"><fmt:formatNumber value="${order.usedSaved}"/></td>
					<td class="table-light">결제금액</td>
					<td class="text-primary"><fmt:formatNumber value="${order.payment}"/></td>
					<td class="table-light">취소금액</td>
					<td class="text-warning order-cancelAmount" data-cancelAmount="${order.cancelAmount}">
						<fmt:formatNumber value="${order.cancelAmount}"/>
					</td>
				</tr>
				<tr>
					<td class="table-light">배송비</td>
					<td class="text-primary"><fmt:formatNumber value="${order.deliveryCharge}"/></td>
					<td class="table-light">배송업체</td>
					<td>${order.deliveryName}</td>
					<td class="table-light">송장번호</td>
					<td>${order.invoiceNumber}</td>
					<td class="table-light">상태변경일</td>
					<td>${order.orderStateDate}</td>
				</tr>
				<tr>
					<td class="table-light">결제구분</td>
					<td>${order.payMethod}</td>
					<td class="table-light">결제카드</td>
					<td>${order.cardName}</td>
					<td class="table-light">결제승인번호</td>
					<td>${order.authNumber}</td>
					<td class="table-light">승인일자</td>
					<td>${order.authDate}</td>
				</tr>
			</table>
			<table class="table table-borderless mb-1">
				<tr>
					<td width="50%">
						<c:if test="${order.orderState < 3}">
							<button type="button" class="btn btn-light btn-cancel-order" data-orderNum="${order.orderNum}">판매취소</button>
						</c:if>
						<c:if test="${order.orderState > 4 && order.orderState < 8}">
							<div class="row justify-content-start last-update-area">
								<div class="col-auto">
										<select class="form-select last-select">
											<option value="8">구매확정</option>
											<option value="10">반품접수</option>
											<option value="12">환불접수</option>
											<option value="14">교환접수</option>
										</select>
									</div>
									<div class="col-auto">
										<button type="button" class="btn btn-light btn-last-order" data-orderNum="${order.orderNum}"
											data-orderState="${order.orderState}" data-deliveryNum="${order.deliveryNum}"
											data-memberIdx="${order.memberIdx}" data-usedSaved="${order.usedSaved}">상태변경</button>
									</div>
								</div>
						</c:if>
					</td>
					<td class="text-end">
						<c:if test="${order.orderState == 1}">
							<button type="button" class="btn btn-light btn-prepare-order" data-orderNum="${order.orderNum}">발송처리</button>
						</c:if>
					
						<div class="row justify-content-end delivery-update-area">
							<c:if test="${order.orderState > 1 && order.orderState < 5}">
								<div class="col-auto">
									<select class="form-select delivery-select">
										<option value="2" ${order.orderState==2?"selected":"" }>발송준비</option>
										<option value="3" ${order.orderState==3?"selected":"" }>배송시작</option>
										<option value="4" ${order.orderState==4?"selected":"" }>배송중</option>
										<option value="5" ${order.orderState==5?"selected":"" }>배송완료</option>
									</select>
								</div>
								<div class="col-auto">
									<button type="button" class="btn btn-light btn-delivery-order" data-orderNum="${order.orderNum}" data-orderState="${order.orderState}" data-deliveryNum="${order.deliveryNum}">배송변경</button>
								</div>
							</c:if>
							<c:if test="${order.orderState == 5}">
								<div class="col-auto">
									<label>배송완료 일자 : ${order.orderStateDate}</label>
								</div>
							</c:if>
							
						</div>
					</td>
				</tr>
			</table>
		</div>
	</div>
	
	<div class="mt-2 border-top pt-2">	
		<div class="p-3 shadow bg-body rounded">
			<p class="fs-6 fw-semibold mb-0">주문 상세정보</p> 
		</div>
		<div class="mt-3 p-3">
			
			<table class="table board-list order-detail-list text-center">
				<thead class="table-light">
					<tr>
						<th>상세번호</th>
						<th>상품명</th>
						<th>상품가격</th>
						<th>할인가격</th>
						<th>옵션</th>
						<th>주문수량</th>
						<th>주문총금액</th>
						<th>적립금</th>
						<th>주문상태</th>
						<th style="display: none;">변경</th>
					</tr>
				</thead>
				
				<tbody>
					<c:forEach var="dto" items="${listDetail}" varStatus="status">
						<tr valign="middle" id="orderDetail-list${dto.orderDetailNum}">
							<td>${dto.orderDetailNum}</td>
							<td>${dto.productName}</td>
							<td><fmt:formatNumber value="${dto.price}"/></td>
							<td><fmt:formatNumber value="${dto.salePrice}"/></td>
							<td>
								<c:choose>
									<c:when test="${dto.optionCount==0}">&nbsp;</c:when>
									<c:when test="${dto.optionCount==1}">${dto.optionValue}</c:when>
									<c:when test="${dto.optionCount==2}">${dto.optionValue} / ${dto.optionValue2}</c:when>
								</c:choose>
							</td>
							<td>${dto.qty}</td>
							<td><fmt:formatNumber value="${dto.productMoney}"/></td>
							<td><fmt:formatNumber value="${dto.savedMoney}"/></td>
							<td>${order.orderState == 1? "상품준비중":order.orderStateInfo}</td>
							<td style="display: none;">
								<span class="orderDetailStatus-update" 
									data-orderNum="${order.orderNum}" 
									data-orderState="${order.orderState}"
									data-usedSaved="${order.usedSaved}"
									data-userId="${order.userId}"
									data-payment="${order.payment}"
									data-orderDate="${order.orderDate}"
									data-productMoney="${dto.productMoney}"
									data-orderDetailNum="${dto.orderDetailNum}"
									data-productNum="${dto.productNum}"
									data-optionCount="${dto.optionCount}"
									data-detailNum="${dto.detailNum}"
									data-detailNum2="${dto.detailNum2}"
									data-savedMoney="${dto.savedMoney}"
									data-qty="${dto.qty}">수정</span>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		
		</div>
	</div>
</div>

<div class="modal fade" id="prepareDialogModal" tabindex="-1" aria-labelledby="prepareDialogModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="prepareDialogModalLabel">발송처리</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body pt-1">
				<form class="row text-center" name="invoiceNumberForm">
					<div class="col-auto p-1">
						<select name="deliveryName" class="form-select">
							<c:forEach var="vo" items="${deliveryCompanyList}">
								<option data-company-num="${vo.companyNum}">${vo.deliveryName}</option>
							</c:forEach>
						</select>
					</div>
					<div class="col p-1">
						<input name="invoiceNumber" type="text" class="form-control" placeholder="송장번호입력">
					</div>
					<div class="col-auto p-1">
						<input type="hidden" name="orderNum" value="">
						<input type="hidden" name="orderState" value="2">
						<button type="button" class="btn btnInvoiceNumberOk">변경완료</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="canceledOrderModal" tabindex="-1" aria-labelledby="canceledOrderModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="prepareDialogModalLabel">판매취소</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body pt-1">
				<form class="row text-center" name="canceledOrderForm">
					<div class="col p-1">
						<input name="cancel_reason" type="text" class="form-control" placeholder="취소사유 입력">
					</div>
					<div class="col-auto p-1">
						<input type="hidden" name="memberIdx" value="${order.memberIdx}">
						<input type="hidden" name="orderNum" value="${order.orderNum}">
						<input type="hidden" name="cancelAmount" value="${order.totalMoney}">
						<input type="hidden" name="usedSaved" value="${order.usedSaved}">
						<input type="hidden" name="orderState" value="9">
						<button type="button" class="btn btnCanceledOrderOk">취소완료</button>
					</div>
				</form>
			</div>
		</div>
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
					location.href = '${pageContext.request.contextPath}/member/login';
					return false;
				} else if(jqXHR.status === 400) {
					alert('요청 처리가 실패 했습니다.');
					return false;
		    	}
		    	
				console.log(jqXHR.responseText);
			}
	};
	$.ajax(url, settings);
}
$(function(){
	$("body").on("click", ".btn-prepare-order",function(){
		let orderNum = $(this).attr("data-orderNum");
		
		document.invoiceNumberForm.orderNum.value = orderNum;
		
		$("#prepareDialogModal").modal("show");
	});
});

$(function(){
	$(".btnInvoiceNumberOk").click(function(){
		const f = document.invoiceNumberForm;
		if(! f.invoiceNumber.value.trim()) {
			alert('송장 번호를 입력하세요');
			return false;
		}
		
		let companyNum="&companyNum="+$(f).find("select :selected").attr("data-company-num");
		let qs = $(f).serialize()+companyNum;
		let url = '${pageContext.request.contextPath}/adminManagement/orderManage/order/detail';
		
		const fn = function(data) {
			if(data.state === "true") {
				let query = new URL(location.href).search;
				url = url+query;
				location.href = url;
			} else {
				alert("발송처리가 실패 했습니다.");
			}
		};
		
		ajaxFun(url, "post", qs, "json", fn);
	});
});

$(function(){
	$("body").on("click", ".btn-delivery-order", function(){
		const $EL = $(this);
		let orderNum = $EL.attr("data-orderNum");
		let deliveryNum = $EL.attr("data-deliveryNum");
		let preState = $EL.attr("data-orderState");
		
		let orderState = $EL.closest(".delivery-update-area").find("select").val();
		let orderStateInfo = $EL.closest(".delivery-update-area").find("select option:selected").text();
		
		if(preState >= orderState) {
			alert('배송 변경은 현 배송 단계보다 적거나 같을수 없습니다.');
			return false;
		}
		
		let qs = 'orderNum=' + orderNum + '&orderState=' + orderState+"&deliveryNum="+deliveryNum;
		let url = '${pageContext.request.contextPath}/adminManagement/orderManage/order/delivery';

		const fn = function(data) {
			if(data.state === "true") {
				let curUrl = new URL(location.href);
				let query = curUrl.search.substring(0,curUrl.search.lastIndexOf("&"));
				url = '${pageContext.request.contextPath}/adminManagement/orderManage/order'+query;
				location.href = url;
			}else {
				alert("변경이 실패 했습니다.");
			}
		};
		
		ajaxFun(url, "post", qs, "json", fn);
	});
});

$(function(){
	$("body").on("click", ".btn-last-order", function(){
		const $EL = $(this);
		let orderNum = $EL.attr("data-orderNum");
		let deliveryNum = $EL.attr("data-deliveryNum");
		let memberIdx = $EL.attr("data-memberIdx");
		let usedSaved = $EL.attr("data-usedSaved");
		
		let orderState = $EL.closest(".last-update-area").find("select").val();
		
		let qs = 'orderNum=' + orderNum + '&orderState=' + orderState+"&memberIdx="+memberIdx;
		if(orderState === "12"){
			qs +="&cancleAmount="+${order.payment}+"&usedSaved="+usedSaved;
		}
		
		let orderDetailNums=[];
		let productMoneys=[]
		$(".orderDetailStatus-update").each(function() {
			orderDetailNums.push($(this).attr("data-orderDetailNum"));
			productMoneys.push($(this).attr("data-productMoney"));
		})
		qs += "&orderDetailNums="+orderDetailNums+"&productMoneys="+productMoneys;
		
		let url ="";
		if(orderState > 8){
			url = '${pageContext.request.contextPath}/adminManagement/orderManage/order/cancelOrder';
		} else {
			url = '${pageContext.request.contextPath}/adminManagement/orderManage/order/confirmed';
		}

		const fn = function(data) {
			if(data.state === "true") {
				let curUrl = new URL(location.href);
				let query = curUrl.search.substring(0,curUrl.search.lastIndexOf("&"));
				url = '${pageContext.request.contextPath}/adminManagement/orderManage/order'+query;
				location.href = url;
			}else {
				alert("변경이 실패 했습니다.");
			}
		};
		
		ajaxFun(url, "post", qs, "json", fn);
	});
});

$(function(){
	$('body').on('click', '.btn-cancel-order',function(){
		let orderNum = $(this).attr('data-orderNum');
		
		$("#canceledOrderModal").modal("show");
	});
	
	$('body').on('click', '.btnCanceledOrderOk',function(){
		const f = document.canceledOrderForm;
		if (! f.cancel_reason.value.trim()) {
			alert('취소사유를 입력하세요');
			return false;
		}
		
		let qs = $(f).serialize();
		let url = '${pageContext.request.contextPath}/adminManagement/orderManage/order/cancelOrder';

		const fn = function(data) {
			if(data.state === "true") {
				let curUrl = new URL(location.href);
				let query = curUrl.search.substring(0,curUrl.search.lastIndexOf("&"));
				url = '${pageContext.request.contextPath}/adminManagement/orderManage/order'+query;
				location.href = url;
			} else {
				alert("취소처리가 실패 했습니다.");
				console.log(data)
			}
		};
		
		ajaxFun(url, "post", qs, "json", fn);
	});
});
</script>
