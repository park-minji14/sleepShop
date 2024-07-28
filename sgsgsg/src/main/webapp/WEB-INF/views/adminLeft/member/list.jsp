<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<style type="text/css">
.body-container {
	max-width: 1200px;
}

.member-list-tr { cursor: pointer; }
</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/boot-board.css" type="text/css">

<script type="text/javascript">
function searchList() {
	var f = document.searchForm;
	f.enabled.value = $("#selectEnabled").val();
	f.submit();
}

function profile(memberIdx) {
	let query = "memberIdx="+memberIdx+"&page=${page}";
	let enabled = "${enabled}";
	if(enabled) {
		query += "&enabled=" + enabled;
	}
	let kwd = "${kwd}";
	if( kwd ) {
		query += "&schType=${schType}&kwd="+encodeURIComponent(kwd);
	}
	
	location.href = "${pageContext.request.contextPath}/adminManagement/memberManage/details?" + query;
}
</script>

	
<div class="body-container" style="padding: 20px 10px 0;">
			<h2 class="mb-4 subtitle">회원관리</h2>
	<table class="table table-borderless mt-2 mb-0">
		<tr>
			<td align="left" width="50%" valign="bottom">
				<p class="form-control-plaintext p-0">
					${dataCount}개(${page}/${total_page} 페이지)
				</p>
			</td>
			<td align="right">
				<select id="selectEnabled" class="form-select" style="width: 230px;" onchange="searchList();">
					<option value="" ${enabled=="" ? "selected":""}>::계정상태::</option>
					<option value="0" ${enabled=="0" ? "selected":""}>잠금 계정</option>
					<option value="1" ${enabled=="1" ? "selected":""}>활성 계정</option>
				</select>
			</td>
		</tr>
	</table>
		
	<table class="table table-hover board-list">
		<thead class="table-light">
			<tr> 
				<th width="80">번호</th>
				<th width="130">아이디</th>
				<th width="130">이름</th>
				<th width="130">생년월일</th>
				<th min-width="140">전화번호</th>
				<th width="100">회원구분</th>
				<th width="80">상태</th>
				<th>이메일</th>
			</tr>
		</thead>
		
		<tbody>
			<c:forEach var="dto" items="${list}" varStatus="status">
				<tr class="hover" onclick="profile('${dto.memberIdx}');"> 
					<td>${dataCount - (page-1) * size - status.index}</td>
					<td>${dto.userId}</td>
					<td>${dto.userName}</td>
					<td>${dto.birth}</td>
					<td>${dto.tel}</td>
					<td>
						<c:choose>
							<c:when test="${dto.membership == 1}">일반회원</c:when>
							<c:when test="${dto.membership == 55}">전문가</c:when>
							<c:when test="${dto.membership == 77}">사원</c:when>
							<c:when test="${dto.membership == 99}">관리자</c:when>
						</c:choose>					
					</td>
					<td>${dto.enabled==1?"활성":"잠금"}</td>
					<td>${dto.email}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
			 
	<div class="page-navigation">
		${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}
	</div>

	<div class="row board-list-footer">
		<div class="col">
			<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/adminManagement/memberManage/list';" title="새로고침"><i class="bi bi-arrow-counterclockwise"></i></button>
		</div>
		<div class="col-6 text-center">
			<form class="row" name="searchForm" action="${pageContext.request.contextPath}/adminManagement/memberManage/list" method="post">
				<div class="col-auto p-1">
					<select name="schType" class="form-select">
						<option value="userId"     ${schType=="userId" ? "selected":""}>아이디</option>
						<option value="userName"   ${schType=="userName" ? "selected":""}>이름</option>
						<option value="email"      ${schType=="email" ? "selected":""}>이메일</option>
						<option value="tel"        ${schType=="tel" ? "selected":""}>전화번호</option>
					</select>
				</div>
				<div class="col-auto p-1">
					<input type="text" name="kwd" value="${kwd}" class="form-control">
					<input type="hidden" name="enabled" value="${enabled}">
					<input type="hidden" name="page" value="1">
				</div>
				<div class="col-auto p-1">
					<button type="button" class="btn btn-light" onclick="searchList()"> <i class="bi bi-search"></i> </button>
				</div>
			</form>
		</div>
		<div class="col text-end">
			&nbsp;
		</div>
	</div>
		
</div>
