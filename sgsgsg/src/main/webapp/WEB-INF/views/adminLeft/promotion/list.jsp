<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<style>
.table thead th {
    background-color: #3949ab;
    color: #ffffff;
    border-color: #303f9f;
}

.text-center {
    vertical-align: middle;
}

.btn {
	border: 1px solid gray;
}


.btn:hover {
	background: gray;
	color: black;
}

</style>


<script>
function searchList() {
	const f = document.searchForm;
	f.submit();
}


$(function() {
    // Set the span text initially based on the category
    let activeCategoryText = $('.nav-item.active a').text();
    $('#category-span').text(activeCategoryText);

    $('.nav-item').click(function() {
        let categoryName = $(this).find('a').text(); // a 태그의 텍스트 가져오기

        // Update the span text with the category name
        $('#category-span').text(categoryName);
    });
});

</script>

<div style="padding: 15px 10px 5px; clear: both; width: 1020px;">

	<span id="category-span" style="color: #3949ab; font-size: 24px; font-weight: bold;">${category}</span>	

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
	
	<table class="table table-border table-list" style="width: 1000px;"> 
		<thead>
			<tr>
				<th width="20" class="text-center">번호</th>
				<th width="100">제목</th>
				<th width="60" class="text-center">이벤트 시작일</th>
				<th width="60" class="text-center">이벤트 종료일</th>
				<th width="20">${category=="winner" ? "발표" : "응모자수"}</th>
			</tr>
		</thead>
	 
	 	<tbody>
			<c:forEach var="dto" items="${list}" varStatus="status">
				<tr> 
					<td class="text-center">${dataCount - (page-1) * size - status.index}</td>
					<td class="left">
						<a href="${articleUrl}&num=${dto.event_num}">${dto.title}</a>
					</td>
					<td class="text-center">${dto.startDate}</td>
					<td class="text-center">${dto.endDate}</td>
					<td style="padding-left: 30px;">${category=="winner" ? (dto.winnerCount==0?"예정":"완료") : (dto.winnerNumber == 0 ? "-" : dto.applyCount) }</td>
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
				<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/adminManagement/promotionManage/${category}/list';" title="새로고침"><i class="fa-solid fa-arrow-rotate-left"></i></button>
			</td>
			<td>
				<form name="searchForm" action="${pageContext.request.contextPath}/adminManagement/promotionManage/${category}/list" method="post" style="margin-left: 150px;">
					<select name="schType" class="col-auto p-1" style="width: 100px;">
						<option value="all" ${schType=="all"?"selected":""}>모두</option>
						<option value="startDate" ${schType=="startDate"?"selected":""}>시작일</option>
						<option value="endDate" ${schType=="endDate"?"selected":""}>종료일</option>
						<option value="winningDate" ${schType=="winningDate"?"selected":""}>발표일</option>
					</select>
					<input type="text" name="kwd" value="${kwd}" class="col-auto p-1" style="width: 400px;">
					<button type="button" class="btn" onclick="searchList()">검색</button>
				</form>
			</td> 
			<td>
				<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/adminManagement/promotionManage/${category}/write';">이벤트등록</button>
			</td> 
		</tr>
	</table>
</div> 