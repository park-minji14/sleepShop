<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="body-container">
    <div class="body-title">
		<h2> 환불 / 반품 요청 </h2>
    </div>
    
    <div class="body-main">
    	<div class="mt-2 border-top pt-2">	
		<div class="p-3 shadow bg-body rounded">
			<p class="fs-6 fw-semibold mb-0">환불 및 반품 요청 정보</p> 
		</div>
		<div class="mt-3 p-3">
			
			<table class="table board-list order-detail-list text-center">
				<thead class="table-light">
					<tr>
						<th width="80">상세번호</th>
						<th>상품명</th>
						<th width="130">옵션</th>
						<th width="90">환불금액</th>
						<th width="90">요청일자</th>
						<th width="80">처리상태</th>
						<th width="100">메모</th>
						<th width="60">변경</th>
					</tr>
				</thead>
				
				<tbody>
					<c:forEach var="dto" items="${list}" varStatus="status">
						<tr valign="middle" id="orderDetail-list${dto.orderDetailNum}">
							<td>${dto.return_exchange_num}</td>
							<td>${dto.productName}</td>
							<td>
								<c:choose>
									<c:when test="${dto.optionCount==0}">&nbsp;</c:when>
									<c:when test="${dto.optionCount==1}">${dto.optionValue}</c:when>
									<c:when test="${dto.optionCount==2}">${dto.optionValue} / ${dto.optionValue2}</c:when>
								</c:choose>
							</td>
							<td><fmt:formatNumber value="${dto.refund_amount}"/></td>
							<td>${dto.request_date}</td>
							<td>${dto.detail_status}</td>
							<td>${dto.inspection_result}</td>
							<td>
								<span class="orderDetailStatus-update"
									data-returnExchangeNum="${dto.return_exchange_num}"
									data-orderNum="${dto.orderNum}" 
									data-orderDetailNum="${dto.orderDetailNum}"
									data-productNum="${dto.productNum}"
									data-optionCount="${dto.optionCount}"
									data-detailNum="${dto.detailNum}"
									data-detailNum2="${dto.detailNum2}">수정</span>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		
		</div>
	</div>
	</div>
</div>
