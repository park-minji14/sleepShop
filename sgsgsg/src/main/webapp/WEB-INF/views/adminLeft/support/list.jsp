<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css" type="text/css">


<style type="text/css">
.body-main {
	max-width: 900px;
}

.badge { display: inline-block; padding:2px 3px; background: #0d6efd; color: #fff; font-weight: 500; font-size: 11px; }s


/* 글 리스트 */
.table-list thead { color: #787878; }
.table-list thead>tr:first-child { background: #f8f9fa; border-top: 2px solid #454545; }
.table-list tr>th, .table-list tr>td { text-align: center; }
.table-list .left { text-align: left; padding-left: 5px; }

.form-select {
    border: 1px solid #999;
    border-radius: 4px;
    background-color: #fff;
    padding: 4px 5px;
    font-family: "맑은 고딕", 나눔고딕, 돋움, sans-serif;
    vertical-align: baseline;
}

.table th, .table td {
    padding-top: 10px;
    padding-bottom: 10px;
}


.table {
    width: 100%;
    border-spacing: 0;
    border-collapse: collapse;
}


</style>

<script type="text/javascript">
function searchList() {
	const f = document.searchForm;
	f.submit();
}
</script>

<div class="mt-4">

    
    
    <div class="body-main">
		
		<table class="table text-center">
    	<thead class="table-light">
    		<tr>
    			<th>분류</th>
	    		<th>제목</th>
	    		<th>작성자</th>
	    		<th>문의일자</th>
	    		<th>처리결과</th>
    		</tr>
    	</thead>
    	<tbody>
    	<c:forEach var="dto" items="${list}">
    		<tr>
    			<td>${dto.category}</td>
    			<td class="left">
					<a href="${articleUrl}&num=${dto.num}">${dto.title}</a>
				</td>
				<td>${dto.userId}</td>
    			<td>${dto.created_date }</td>
				<td>${(empty dto.response_date)?"답변대기":"답변완료"}</td>
    		</tr>
    	</c:forEach>
    	</tbody>
    </table>
		 
		 
		 
		 
		 
		 
		<div class="page-navigation">
			${dataCount == 0 ? "등록된 문의가 없습니다." : paging}
		</div>
		
		<table class="table">
			<tr>
				<td align="left" width="100">
					<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/admin/inquiryManage/list';" title="새로고침"><i class="fa-solid fa-arrow-rotate-left"></i></button>
				</td>
				<td align="center">
					<form name="searchForm" action="${pageContext.request.contextPath}/admin/inquiryManage/list" method="post">
						<select name="schType" class="form-select">
							<option value="all" ${schType=="all"?"selected":""}>제목+내용</option>
							<option value="userId" ${schType=="userId"?"selected":""}>아이디</option>
							<option value="userName" ${schType=="userName"?"selected":""}>작성자</option>
							<option value="reg_date" ${schType=="reg_date"?"selected":""}>등록일</option>
							<option value="subject" ${schType=="subject"?"selected":""}>제목</option>
							<option value="content" ${schType=="content"?"selected":""}>내용</option>
						</select>
						<input type="text" name="kwd" value="${kwd}" class="form-control">
						<button type="button" class="btn" onclick="searchList()">검색</button>
					</form>
				</td>
				<td align="right" width="100">
					&nbsp;
				</td>
			</tr>
		</table>

	</div>
</div>