<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.jmy-body-container {
	max-width: 1100px;
}

.notice-board-main {
    max-width: 900px;
    margin: auto;
}

.notice-item .text-truncate {
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
}

.notice-item .fw-medium {
    font-weight: 500;
}

.notice-item .text-muted {
    color: #6c757d !important;
}

.notice-item .text-danger {
    color: #dc3545 !important;
    font-weight: 700;
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
.notice-item {
    transition: background-color 0.3s ease, box-shadow 0.3s ease, transform 0.3s ease;
}

.notice-item:hover {
    background-color: #e9ecef;
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
    transform: scale(1.03);
}
</style>

<div class="inner">
	<h1 class="text-center">공지사항</h1>
	<div class="jmy-body-container">
	
        <div class="body-title">
 			<ul class="custom-nav-tabs mt-5 d-flex align-items-center justify-content-between" id="myTab" role="tablist">
                <li class="flex-shrink-0 ms-5" style="list-style: none">
                    <c:choose>
                        <c:when test="${status == 1}">
                            <p class="mb-0 text-danger fw-bold">중요</p>
                        </c:when>
                        <c:otherwise>
                            <p class="mb-0 text-primary fw-bold">일반</p>
                        </c:otherwise>
                    </c:choose>
                </li>
                <div class="d-flex">
                    <li class="nav-item" role="presentation" style="list-style: none">
                        <button class="custom-nav-link ${status==0?'active':''} p-1 nav-link" id="tab-1" data-bs-toggle="tab" data-bs-target="#tab-pane" type="button" role="tab" aria-controls="0" aria-selected="${status==0?'true':'false'}">일반 공지</button>
                    </li>
                    <li class="nav-item" role="presentation" style="list-style: none">
                        <button class="custom-nav-link ${status==1?'active':''} p-1 nav-link" id="tab-2" data-bs-toggle="tab" data-bs-target="#tab-pane" type="button" role="tab" aria-controls="1" aria-selected="${status==1?'true':'false'}">중요 공지</button>
                    </li>
                </div>
            </ul>
        </div>

	    <div class="container mt-4">
	        <div class="notice-board-main mx-auto">
		   	    <div class="col-auto text-start mb-4">
		   	    	(${page}/${total_page} 페이지)
		   	    </div>
		        <c:forEach items="${list}" var="dto">
		            <div class="notice-item d-flex align-items-center gap-3 bg-white p-1 border-bottom"
		            	onclick="location.href='${pageContext.request.contextPath}/notice/userArticle?articleNum=${dto.num}&status=${status}&page=${page}'"
		            	style="cursor: pointer;">
		            
		                <div class="flex-grow-1">
		                    <p class="mb-0 fw-medium text-truncate" style="text-overflow: ellipsis; white-space: nowrap;">${dto.title}</p>
		                    <p class="mb-0 text-muted">${dto.userNickname}</p>
		                </div>
		                <div class="flex-shrink-0">
		                    <p class="mb-0 text-muted">${dto.created_date}</p>
		                </div>
		            </div>
	            </c:forEach>
	            <div class="row d-flex">
       	    	    <div class="page-navigation text-center mt-3">
	       				${dataCount == 0 ? "등록된 상품이 없습니다." : paging}
	    			</div>
	            </div>
	        </div>
	    </div>
		
	</div>
</div>

<script type="text/javascript">
$(function(){
    $("button[role='tab']").on('click', function(){
        const tab = $(this).attr("aria-controls");
        
        let url = "${pageContext.request.contextPath}/notice/userNotice";
        if(tab !== "0") {
            url += "?status=" + tab;
        }
        location.href = url;
        
        $("button[role='tab']").removeClass("active");
        $(this).addClass("active");
    });
});

</script>