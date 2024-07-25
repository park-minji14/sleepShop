<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	
<style type="text/css">
.jmy-body-container {
	max-width: 1000px;
	width: 100%;
}
</style>

        <div class="jmy-body-container py-3 mx-auto">
			<header class="d-flex justify-content-between align-items-center border-bottom border-2 py-3">
			    <button class="btn btn-light rounded-xl" onclick="location.href='${pageContext.request.contextPath}/notice/userNotice?page=${page}&status=${status}'">
					<i class="bi bi-arrow-left" style="font-weight: bold;"></i>&nbsp;돌아가기
			    </button>
			    <div class="d-flex gap-2">
			    	<c:if test="${empty prevDTO}">
			    		<button class="btn btn-light rounded-xl">이전글 없음</button>
			    	</c:if>
			    	<c:if test="${not empty prevDTO}">
			        <a class="btn btn-light rounded-xl" 
			        	href="${pageContext.request.contextPath}/notice/userArticle?articleNum=${prevDTO.num}&status=${dto.status}&${query}"> 
			        		&lt; 이전글</a>
			    	</c:if>
			    	<c:if test="${empty nextDTO}">
			    		<button class="btn btn-light rounded-xl">다음글 없음</button>
	        		</c:if>
			    	<c:if test="${not empty nextDTO}">
			        <a class="btn btn-light rounded-xl" 
			        	href="${pageContext.request.contextPath}/notice/userArticle?articleNum=${nextDTO.num}&status=${dto.status}&${query}"> 
			        		다음글 &gt;</a>
			    	</c:if>
			    </div>
			</header>
            
            <div class="mx-auto mt-4">
				<div class="d-flex justify-content-between align-items-center p-2 mb-2">
				    <h1 class="h4 mb-0 flex-grow-1">&nbsp;${dto.title}</h1>
				    <div class="text-end" style="list-style: none">
				        <c:choose>
				            <c:when test="${status == 1}">
				                <p class="mb-0 text-danger fw-bold">중요</p>
				            </c:when>
				            <c:otherwise>
				                <p class="mb-0 text-primary fw-bold">일반</p>
				            </c:otherwise>
				        </c:choose>
				    </div>
				</div>
                <p class="text-muted px-3">${dto.created_date}</p>
                <p class="text-muted px-3">${dto.userNickname}</p>
                
                <div class="card my-3 mx-3">
                    <div class="card-body">
                        <p class="card-text py-2 px-1">
                        	${dto.content}
                        </p>
                        <!-- 
                        <c:if test="${not empty dto.updated_date}">
                        	<p class="card-text">수정일자: ${dto.updated_date}</p>
                        </c:if>
                         -->
                    </div>
                </div>

            </div>
        </div>
    
    