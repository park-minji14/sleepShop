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
			
				<table class="table table-striped ">
					<tr>
						<td align="left" width="50%" valign="middle">
							${dataCount}개(${page}/${total_page} 페이지)
						</td>
						<td align="right">
							<select id="selectEnabled" class="form-select" onchange="searchList();" style="width: 200px;">
								<option value="" ${enabled=="" ? "selected":""}>::계정상태::</option>
								<option value="0" ${enabled=="0" ? "selected":""}>잠금 계정</option>
								<option value="1" ${enabled=="1" ? "selected":""}>활성 계정</option>
							</select>
						</td>
					</tr>
				</table>
					
				<table class="table table-border board-list" >
					<thead class="table-light" style="height: 50px;">
						<tr> 
							<th width="60">번호</th>
							<th width="130">아이디</th>
							<th width="100">이름</th>
							<th width="180">생년월일</th>
							<th width="150">전화번호</th>
							<th width="180">회원구분</th>
							<th width="50">상태</th>
							<th >이메일</th>
						</tr>
					</thead>
					
					<tbody>
						<c:forEach var="dto" items="${list}" varStatus="status">
							<tr class="hover member-list-tr" onclick="profile('${dto.memberIdx}');"> 
								<td>${dataCount - (page-1) * size - status.index}</td>
								<td>${dto.userId}</td>
								<td>${dto.userName}</td>
								<td>${dto.birth}</td>
								<td>${dto.tel}</td>
								<td>${dto.membership==1?"일반회원":(dto.membership==99?"관리자":"일반")}</td>
								<td>${dto.enabled==1?"활성":"잠금"}</td>
								<td>${dto.email}</td>
							</tr>
						</c:forEach>
				</tbody>
			</table>
					 
			<div class="page-navigation">
				${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}
			</div>
					
			<div class="row">
				<div class="col">
					&nbsp;
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
						</div>
						<div class="col-auto p-1">
							<button type="button" class="btn btn-light" onclick="searchList()" title="검색"> <i class="bi bi-search"></i> </button>
						</div>
					</form>
				</div>
				<div class="col text-end">
					<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/adminManagement/memberManage/list';" title="새로고침"><i class="bi bi-arrow-counterclockwise"></i></button>
				</div>
			</div>
		
		</div>

