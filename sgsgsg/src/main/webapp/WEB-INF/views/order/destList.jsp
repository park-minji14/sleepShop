<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<table class="text-center table">
	<thead>
		<tr>
			<th>&nbsp;</th>
			<th class="col-2">받는 사람</th>
			<th class="col-3">기본주소</th>
			<th class="col-2">상세주소</th>
			<th class="col-3">전화번호</th>
			<th class="col-3">메모</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="dto" items="${deliveries}">
			<tr>
				<td><input type="radio" name="radioDest" data-destnum="${dto.destinationNum}"
					data-default="${dto.defaultDest}"></td>
				<td class="sRecipientName">${dto.recipientName}</td>
				<td>${dto.addr1}</td>
				<td>${dto.addr2}</td>
				<td>${dto.tel}</td>
				<td>${dto.destMemo}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
					