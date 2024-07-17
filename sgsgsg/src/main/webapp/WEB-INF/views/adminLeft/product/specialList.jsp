<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style type="text/css">
.body-container {
	max-width: 1000px;
}

.custom-title {
    font-size: 1.3rem;
    font-weight: bold;
    color: #fff; 
    background-color: #3d3d4f; 
    padding: 10px 20px; 
    border-radius: 5px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.custom-nav-tabs {
    border-bottom: none; 
    display: flex;
    align-items: center;
    justify-content: space-between; 
}

.custom-nav-pills {
    display: flex;
    gap: 10px; 
}

.custom-nav-link {
    min-width: 170px;
    background: #f3f5f7;
    border-radius: 0;
    border-right: 1px solid #dbdddf;
    color: #333;
    font-weight: 600;
    border: none; 
    background-color: transparent; 
}

.custom-nav-link.active {
    background: #3d3d4f;
    color: #fff;
}

.tab-pane {
    min-height: 300px;
}

.table-list {
    width: 100%;
}

.table-list thead {
    color: #787878;
}

.table-list tr > th {
    padding-top: 10px;
    padding-bottom: 10px;
    background-color: #f8f9fa;
    border: 1px solid #dee2e6;
}

.table-list tr > th, .table-list tr > td {
    text-align: center;
    border: 1px solid #dee2e6;
    vertical-align: middle;
}

.table-list .left {
    text-align: left;
    padding-left: 5px;
}

.table-list a {
    color: #007bff;
    text-decoration: none;
}

.table-list a:hover {
    text-decoration: underline;
}

.page-navigation {
    font-size: 1rem;
    color: #6c757d;
}

.btn-light {
    background-color: #f8f9fa;
    border-color: #dee2e6;
    color: #000;
}

.btn-light:hover {
    background-color: #e2e6ea;
    border-color: #dae0e5;
}

.btn-primary {
    background-color: #007bff;
    border-color: #007bff;
}

.btn-primary:hover {
    background-color: #0056b3;
    border-color: #004085;
}
</style>

<script type="text/javascript">
function searchList() {
	const f = document.searchForm;
	f.submit();
}

// 탭
$(function(){
	$("button[role='tab']").on('click', function(){
		const tab = $(this).attr("aria-controls");
		
		let url = "${pageContext.request.contextPath}/adminManagement/productManage/specialList";
		if(tab !== "1") {
			url += "?state=" + tab;
		}
		location.href = url;
	});
});
</script>

<div class="mt-4 unique-main-content">
	<div class="body-container">
		
			<div class="body-main">
			    <ul class="custom-nav-tabs mt-5 align-items-center justify-content-between" id="myTab" role="tablist">
			        <h4 class="custom-title mb-0">오늘의 특가</h4>
			        <div class="custom-nav-pills">
			            <li class="nav-item" role="presentation" style="list-style: none">
			                <button class="custom-nav-link ${state==1?'active':''}" id="tab-1" data-bs-toggle="tab" data-bs-target="#tab-pane" type="button" role="tab" aria-controls="1" aria-selected="${state==1?'true':'false'}">진행 중</button>
			            </li>
			            <li class="nav-item" role="presentation" style="list-style: none">
			                <button class="custom-nav-link ${state==2?'active':''}" id="tab-2" data-bs-toggle="tab" data-bs-target="#tab-pane" type="button" role="tab" aria-controls="2" aria-selected="${state==2?'true':'false'}">특가 예정</button>
			            </li>
			            <li class="nav-item" role="presentation" style="list-style: none">
			                <button class="custom-nav-link ${state==3?'active':''}" id="tab-3" data-bs-toggle="tab" data-bs-target="#tab-pane" type="button" role="tab" aria-controls="3" aria-selected="${state==3?'true':'false'}">특가 종료</button>
			            </li>
			        </div>
			    </ul>
			</div>
			
			<div class="tab-content pt-4" id="myTabContent">
			    <div class="tab-pane fade show active" id="tab-pane" role="tabpanel" aria-labelledby="tab-1" tabindex="0">
			        <div class="row mb-3 justify-content-between align-items-center">
			            <div class="col-auto">
			                <span class="text-muted">${dataCount}개 (${page}/${total_page} 페이지)</span>
			            </div>
			        </div>
			
			        <table class="table table-bordered table-hover table-list">
			            <thead class="table-light">
			                <tr>
			                    <th width="60">번호</th>
			                    <th>제목</th>
			                    <th width="130">시작일자</th>
			                    <th width="130">종료일자</th>
			                    <th width="70">상품수</th>
			                    <th width="60">출력</th>
			                </tr>
			            </thead>
			            <tbody>
			                <c:forEach var="dto" items="${list}" varStatus="status">
			                    <tr>
			                        <td>${dataCount - (page-1) * size - status.index}</td>
			                        <td>
			                            <a href="${articleUrl}&specialNum=${dto.specialNum}" class="text-decoration-none">${dto.subject}</a>
			                        </td>
			                        <td>${dto.startDate}</td>
			                        <td>${dto.endDate}</td>
			                        <td>${dto.productCount}</td>
			                        <td>${dto.showSpecial == 1 ? "표시" : "숨김"}</td>
			                    </tr>
			                </c:forEach>
			            </tbody>
			        </table>
			
			        <div class="page-navigation text-center my-3">
			            ${dataCount == 0 ? "등록된 정보가 없습니다." : paging}
			        </div>
			
			        <div class="row justify-content-between align-items-center">
			            <div class="col-auto">
			                <button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/adminManagement/productManage/specialList';">
			                    <i class="bi bi-arrow-clockwise"></i> 새로고침
			                </button>
			            </div>
			            <div class="col-auto">
			                <form class="row align-items-center" name="searchForm" action="${pageContext.request.contextPath}/adminManagement/productManage/specialList" method="post">
			                    <div class="col-auto">
			                        <select name="schType" class="form-select">
			                            <option value="all" ${schType == "all" ? "selected" : ""}>제목+내용</option>
			                            <option value="subject" ${schType == "subject" ? "selected" : ""}>제목</option>
			                            <option value="content" ${schType == "content" ? "selected" : ""}>내용</option>
			                        </select>
			                    </div>
			                    <div class="col-auto">
			                        <input type="text" name="kwd" value="${kwd}" class="form-control">
			                    </div>
			                    <div class="col-auto">
			                        <input type="hidden" name="state" value="${state}">
			                        <button type="button" class="btn btn-light" onclick="searchList()">
			                            <i class="bi bi-search"></i> 검색
			                        </button>
			                    </div>
			                </form>
			            </div>
			            <div class="col-auto">
			                <button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/adminManagement/productManage/specialWrite';">등록하기</button>
			            </div>
			        </div>
			    </div>
			</div><!-- tab-content _ end -->

		</div> <!-- body-main -->
	</div>
	
