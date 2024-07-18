<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="mt-4">
    <!-- 메인 콘텐츠 내용 -->
    
    <form class="mb-4">
    	<div class="border border-secondary-subtle p-3">
    		<div class="row mb-3">
    			<div class="col-auto p-1">
    				<select name="schType" class="form-select">
						<option value="orderNum" ${schType=="orderNum"?"selected":""}>주문번호</option>
						<option value="invoiceNumber" ${schType=="invoiceNumber"?"selected":""}>송장번호</option>
						<option value="userName" ${schType=="userName"?"selected":""}>주문자</option>
						<option value="orderDate" ${schType=="orderDate"?"selected":""}>주문일자</option>
					</select>
    			</div>
    			<div class="col-auto p-1">
					<input type="text" name="kwd" value="${kwd}" class="form-control">
				</div>
    		</div>
    		<div class="d-flex justify-content-end">
                <button type="reset" class="btn btn-secondary me-2">초기화</button>
                <button type="submit" class="btn btn-primary">검색</button>
            </div>
    	</div>
    </form>
    
    <table class="table text-center">
    	<thead class="table-light">
    		<tr>
    			<th>주문번호</th>
	    		<th>상품명</th>
	    		<th>주문자</th>
	    		<th>주문일</th>
	    		<th>주문상태</th>
	    		<th>결제금액</th>
	    		<th>변경</th>
    		</tr>
    	</thead>
    	<tbody>
    	<c:forEach var="dto" items="${orderList}">
    		<tr>
    			<td>${dto.orderNum}</td>
    			<td>${dto.productOrderName}</td>
    			<td>${dto.userName}</td>
    			<td>${dto.orderDate}</td>
    			<td>${dto.orderStateInfo}</td>
    			<td><fmt:formatNumber value="${dto.payment}" pattern="#,###" />원</td>
    			<td><a href="${pageContext.request.contextPath}/adminManagement/orderManage/order/detail?orderNum=${dto.orderNum}">상태변경</a></td>
    		</tr>
    	</c:forEach>
    	</tbody>
    </table>
    
    
</div>