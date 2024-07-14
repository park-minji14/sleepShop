<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="unique-main-content">
    <!-- 메인 콘텐츠 내용 -->
    
    
    <table class="table text-center">
    	<thead>
    		<tr>
    			<td>주문번호</td>
	    		<td>상품명</td>
	    		<td>주문자</td>
	    		<td>주문일</td>
	    		<td>주문상태</td>
	    		<td>결제금액</td>
    		</tr>
    	</thead>
    	<tbody>
    	<c:forEach var="dto" items="${orderList}">
    		<tr>
    			<td>${dto.orderNum}</td>
    			<td></td>
    			<td>${dto.userName}</td>
    			<td>${dto.orderDate}</td>
    			<td>${dto.orderState}</td>
    			<td>${dto.payment}</td>
    		</tr>
    	</c:forEach>
    	</tbody>
    </table>
    
    
</div>