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
							<option value=""></option>
							<option value=""></option>
							<option value=""></option>
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
								<span class="orderDetailStatus-update"
									data-returnExchangeNum="${dto.return_exchange_num}"
									data-detailStatus="${dto.detail_status}" 
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
