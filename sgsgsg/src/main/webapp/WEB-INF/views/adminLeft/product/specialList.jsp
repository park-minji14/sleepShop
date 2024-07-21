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

.card {
    margin-bottom: 20px;
    border: 1px solid #dee2e6;
    border-radius: 5px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    cursor: pointer;
}

.card img {
    border-top-left-radius: 5px;
    border-top-right-radius: 5px;
    height: 150px; /* 이미지 높이 조정 */
    object-fit: cover; /* 이미지가 카드에 맞게 조정됨 */
}

.card-body {
    padding: 15px;
    text-align: center;
}

.card-title {
    font-size: 1.1rem;
    font-weight: bold;
    color: #333;
}

.card-text {
    font-size: 0.9rem;
    color: #666;
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
    
    f.method = "get";
    
    f.action = "${pageContext.request.contextPath}/adminManagement/productManage/specialList";
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

    // 카드 클릭 시 링크로 이동
    $(".card").on('click', function(){
        window.location = $(this).find("a").attr("href");
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

                <div class="row">
                    <c:forEach var="dto" items="${list}" varStatus="status">
                        <div class="col-md-3">
                            <div class="card">
                                <img src="${pageContext.request.contextPath}/uploads/specials/${dto.imageFilename}" class="card-img-top" alt="${dto.subject}">
                                <div class="card-body">
                                    <h5 class="card-title">
                                        <a href="${articleUrl}&specialNum=${dto.specialNum}" class="text-decoration-none">${dto.subject}</a>
                                    </h5>
                                    <p class="card-text">시작일자: ${dto.startDate}</p>
                                    <p class="card-text">종료일자: ${dto.endDate}</p>
                                    <p class="card-text">상품수: ${dto.productCount}</p>
                                    <p class="card-text">출력: ${dto.showSpecial == 1 ? "표시" : "숨김"}</p>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>

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
