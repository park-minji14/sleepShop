<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="body-container mt-4">
    <div class="body-title">
		<h2> 환불 / 반품 요청 </h2>
    </div>
    
    <div class="body-main">
	    <form class="mb-4" name="searchForm">
	    	<div class="border border-secondary-subtle p-3">
	    		<div class="row mb-3">
	    			<div class="col p-1">
	    				<span>카테고리</span>
	    				<select name="schType" class="form-select">
							<option value="orderNum">주문번호</option>
							<option value="invoiceNumber">송장번호</option>
							<option value="orderDate">주문일</option>
							<option value="userName">주문자</option>
						</select>
	    			</div>
	    			<div class="col p-1">
	    				<span>검색어</span>
						<input type="text" name="kwd" value="${kwd}" class="form-control">
					</div>
					<div class="col p-1">
					</div>
	    		</div>
	    		<div class="d-flex justify-content-end">
	                <button type="reset" class="btn btn-secondary me-2" onclick="location.href='${pageContext.request.contextPath}/adminManagement/returnManage/return'">초기화</button>
	                <button type="submit" class="btn btn-primary">검색</button>
	            </div>
	    	</div>
	    </form>
	    
	    <div class="d-flex justify-content-between align-items-center mt-3">
		    <div class="col-auto"></div>
		    <div class="page-navigation text-center">
		        ${dataCount == 0 ? "등록된 상품이 없습니다." : paging}
		    </div>
		    <div class="col-auto text-end">
		        ${dataCount}개(${page}/${total_page} 페이지)
		    </div>
		</div>
	
    	<div class="mt-2 pt-2">	
		<div class="p-3 shadow bg-body rounded">
			<p class="fs-6 fw-semibold mb-0">환불 및 반품 요청 정보</p> 
		</div>
		<div class="mt-3 p-3">
			
			<table class="table board-list order-detail-list text-center">
				<thead class="table-light">
					<tr>
						<th>번호</th>
						<th>요청종류</th>
						<th>상품명</th>
						<th>옵션</th>
						<th>환불금액</th>
						<th>주문자</th>
						<th>요청일자</th>
						<th>처리상태</th>
						<th>메모</th>
						<th>변경</th>
					</tr>
				</thead>
				
				<tbody>
					<c:forEach var="dto" items="${list}" varStatus="status">
						<tr valign="middle" id="orderDetail-list${dto.orderDetailNum}">
							<td>${dataCount-(page-1)*size-status.index}</td>
							<td>${dto.request_type}</td>
							<td>${dto.productName}</td>
							<td>
								<c:choose>
									<c:when test="${dto.optionCount==0}">&nbsp;</c:when>
									<c:when test="${dto.optionCount==1}">${dto.optionValue}</c:when>
									<c:when test="${dto.optionCount==2}">${dto.optionValue} / ${dto.optionValue2}</c:when>
								</c:choose>
							</td>
							<td><fmt:formatNumber value="${dto.refund_amount}"/></td>
							<td>${dto.userName}</td>
							<td>${dto.request_date}</td>
							<td>${dto.detailStatusInfo}</td>
							<td>${dto.inspection_result}</td>
							<td>
								<c:if test="${dto.detail_status} != 11 || ${dto.detail_status} !=13 || ${dto.detail_status} != 15">
									<span class="orderDetailStatus-update"
										data-returnExchangeNum="${dto.return_exchange_num}"
										data-detailStatus="${dto.detail_status}" 
										data-orderNum="${dto.orderNum}" 
										data-orderDetailNum="${dto.orderDetailNum}"
										data-productNum="${dto.productNum}"
										data-optionCount="${dto.optionCount}"
										data-detailNum="${dto.detailNum}"
										data-detailNum2="${dto.detailNum2}">수정</span>
								
								</c:if>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		
		</div>
	</div>
	</div>
</div>

<div class="modal fade" id="returnDialogModal" tabindex="-1" aria-labelledby="returnDialogModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="returnDialogModalLabel">환불처리</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body pt-1">
				<form class="row text-center" name="returnForm">
					<div class="col-auto p-1">
						<select name="detail_status" class="form-select">
							<option></option>
							<option value="16">요청취소</option>
						</select>
					</div>
					<div class="col p-1">
						<input name="inspection_result" type="text" class="form-control" placeholder="메모 입력">
					</div>
					<div class="col-auto p-1">
						<input type="hidden" name="orderdetailnum">
						<input type="hidden" name="return_exchange_num">
						<button type="button" class="btn btnReturnOk">처리완료</button>
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

function optionText(state) {
	switch (state) {
	case 10: return "반품완료";
	case 12: return "환불완료";
	case 14: return "교환완료"
	default: return "";
	}
}
$(function(){
	$("body").on("click", ".orderDetailStatus-update",function(){
		const f = document.returnForm;
		let sbox = f.querySelector('select[name="detail_status"]');
		sbox.length=0;
		
		let orderdetailnum = $(this).attr("data-orderdetailnum");
		let detailStatus = parseInt($(this).attr("data-detailstatus"));
		let returnExchangeNum = $(this).attr("data-returnExchangeNum");
		
		if(optionText(detailStatus) === ""){
			alert("에러가 발생했습니다.");
			return;
		}
		sbox.add(new Option(optionText(detailStatus), ++detailStatus));
		sbox.add(new Option("요청취소", 16));
		
		
		f.orderdetailnum.value = orderdetailnum;
		f.return_exchange_num.value = returnExchangeNum;
		
		
		$("#returnDialogModal").modal("show");
	});
});

$(function(){
	$(".btnReturnOk").click(function(){
		const f = document.returnForm;
		
		let url = "${pageContext.request.contextPath}/adminManagement/returnManage/confirm";
		let qs = $(f).serialize();
		
		const fn = function(data) {
			if(data.state === "true") {
				location.reload();
			} else {
				alert("처리가 실패 했습니다.");
			}
		};
		
		ajaxFun(url, "post", qs, "json", fn);
	});
});
</script>