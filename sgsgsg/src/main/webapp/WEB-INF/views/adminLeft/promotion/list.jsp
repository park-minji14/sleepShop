<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script>
$(function(){
	$('#tab-${category}').addClass('active');

	$('ul.tabs li').click(function() {
		let category = $(this).attr('data-category');
		
		location.href = '${pageContext.request.contextPath}/adminLeft/promotion/'+category+'/list';
	});
});


</script>

<div id="tab-content" style="padding: 15px 10px 5px; clear: both;">
	<table class="table">
		<tr>
			<td align="left" width="50%">
				${dataCount}개(${page}/${total_page} 페이지)
			</td>
			<td align="right">
				&nbsp;
			</td>
		</tr>
	</table>
	
	<table class="table table-border table-list">
		<thead>
			<tr>
				<th width="30">번호</th>
				<th width="130">제목</th>
				<th width="60">이벤트 시작일</th>
				<th width="60">이벤트 종료일</th>
				<th width="120">${category=="winner" ? "발표" : "응모자수"}</th>
			</tr>
		</thead>
	 
	 	<tbody>
			<c:forEach var="dto" items="${list}" varStatus="status">
				<tr> 
					<td>${dataCount - (page-1) * size - status.index}</td>
					<td class="left">
						<a href="${articleUrl}&num=${dto.num}">${dto.title}</a>
					</td>
					<td>${dto.startDate}</td>
					<td>${dto.endDate}</td>
					<td>${category=="winner" ? (dto.winnerCount==0?"예정":"완료") : (dto.winnerNumber == 0 ? "-" : dto.applyCount) }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	 
	<div class="page-navigation">
		${dataCount == 0 ? "등록된 이벤트가 없습니다." : paging}
	</div>
	<br>
	<table class="table">
		<tr>
			<td align="left" width="50">
				<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/admin/eventManage/${category}/list';" title="새로고침"><i class="fa-solid fa-arrow-rotate-left"></i></button>
			</td>
			<td>
				<form name="searchForm" action="${pageContext.request.contextPath}/adminLeft/promotion/${category}/list" method="post">
					<select name="schType" class="col-auto p-1" style="width: 100px;">
						<option value="all" ${schType=="all"?"selected":""}>모두</option>
						<option value="startDate" ${schType=="startDate"?"selected":""}>시작일</option>
						<option value="endDate" ${schType=="endDate"?"selected":""}>종료일</option>
						<option value="winningDate" ${schType=="winningDate"?"selected":""}>발표일</option>
					</select>
					<input type="text" name="kwd" value="${kwd}" class="col-auto p-1" style="width: 500px;">
					<button type="button" class="btn" onclick="searchList()">검색</button>
				</form>
			</td> 
			<td width="100">
				<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/adminLeft/promotion/${category}/write';">이벤트등록</button>
			</td> 
		</tr>
	</table>
</div> 