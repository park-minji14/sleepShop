<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<style>
.container {
	display: flex;
    justify-content: center;
    align-items: center; 
}

.body-container {
	width: 1000px; 
}


.nav-tabss .nav-link {
	min-width: 170px;
	background: #f3f5f7;
	border: 2px solid #D5D5D5;
	border-radius: 20px;
	color: #333;
	font-weight: 600;
	margin-left: 120px;
}

.nav-tabss .nav-link:hover {
	background: #35c5f0;
	color: #fff;
}

.nav-tabss .nav-link.active { 
	background: #35c5f0;
	color: #fff;
}
.tab-pane { min-height: 300px; }


.event-container {
	display: flex;
	flex-wrap: wrap;
	justify-content: space-between;
}


.event-style {
	border: 1px solid #ddd; 
    border-radius: 20px;
    padding: 20px;
    margin: 30px 0; 
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3); 
    background-color: #fff;
    width: calc(33% - 30px);
    width: 450px; 
    background: white; 
}



.event-style:hover {
	transform: translateY(-10px);
	transition: transform 0.5s; 
} 


.category-progress {
	color: green;
}

.category-winner {
	color: blue;
}

.category-ended {
	color: #B70000;
}



</style>

<script>
$(function(){
	let menu = "${category}";
	$("#tab-"+menu).addClass("active");
	
    $("button[role='tab']").on("click", function(e){
		const tab = $(this).attr("data-tab");
		let url = "${pageContext.request.contextPath}/promotion/"+tab+"/list";
		location.href = url;
    });
    
  

});




function searchList() {
	const f = document.searchForm;
	f.submit();
}

function getImageUrl(imagePath) {
    return "${pageContext.request.contextPath}/upload/" + imagePath;
}


</script>

<c:choose>
    <c:when test="${category == 'progress'}">
        <c:set var="categoryText" value="[진행중]" />
        <c:set var="categoryClass" value="category-progress" />
    </c:when>
    <c:when test="${category == 'winner'}">
        <c:set var="categoryText" value="[발표]" />
        <c:set var="categoryClass" value="category-winner" />
    </c:when>
    <c:when test="${category == 'ended'}">
        <c:set var="categoryText" value="[종료]" />
        <c:set var="categoryClass" value="category-ended" />
    </c:when>
    <c:otherwise>
        <c:set var="categoryText" value="${category}" />
        <c:set var="categoryClass" value="" />
    </c:otherwise>
</c:choose>

<div class="container">
	<div class="body-container">
		<br> 
		<div class="body-title">
			<h2 style="color: #35c5f0; font-weight: bold;">이벤트 목록</h2>  
		</div>
		<br>
		<div class="body-main">

			<ul class="nav nav-tabss" id="myTab" role="tablist">
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="tab-progress" data-bs-toggle="tab" data-bs-target="#nav-content" type="button" role="tab" aria-controls="progress" aria-selected="true" data-tab="progress">진행중인 이벤트</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="tab-winner" data-bs-toggle="tab" data-bs-target="#nav-content" type="button" role="tab" aria-controls="winner" aria-selected="true" data-tab="winner">당첨자 발표</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="tab-ended" data-bs-toggle="tab" data-bs-target="#nav-content" type="button" role="tab" aria-controls="ended" aria-selected="true" data-tab="ended">종료된 이벤트</button>
				</li>
			</ul>
			<br>
			
			<div class="text-center">
				<form class="row" name="searchForm" action="${pageContext.request.contextPath}/promotion/${category}/list" method="post">
					<div class="col-auto p-1">
						<select name="schType" class="form-select">
							<option value="all" ${schType=="all"?"selected":""}>제목+내용</option>
							<option value="startDate" ${schType=="startDate"?"selected":""}>시작일</option>
							<option value="endDate" ${schType=="endDate"?"selected":""}>종료일</option>
							<option value="winningDate" ${schType=="winningDate"?"selected":""}>발표일</option>
						</select>
					</div>
					<div class="col-auto p-1">
						<input type="text" name="kwd" value="${kwd}" class="form-control" style="width: 300px;">
					</div>
					<div class="col-auto p-1">
						<button type="button" class="btn btn-light" onclick="searchList()"> <i class="bi bi-search"></i> </button>
					</div>
				</form>
			</div>
			<br>
			<div class="tab-content pt-2" id="nav-tabContent">
		        <div class="row board-list-header">
		            <div class="col-auto me-auto">
		            	${dataCount}개(${page}/${total_page} 페이지)
		            </div>
		            <div class="col-auto">&nbsp;</div>
		        </div>				

				<div class="event-container">
					<c:forEach var="dto" items="${list}" varStatus="status">
						<div class="event-style" onclick="location.href='${articleUrl}&num=${dto.event_num}'"> 
							<div> 
								<img src="<c:out value='${imagePath}' escapeXml='false'/>" style="width: 410px; height: 350px;"> 
							</div>
							<br>
							<div style="text-align: center; font-size: 25px;">   
								<a href="${articleUrl}&num=${dto.event_num}" class="text-reset"><span class="${categoryClass}">${categoryText} </span> ${dto.title}</a> 
							</div>
							<div style="text-align: center; margin-top: 10px;">시작일 : ${dto.startDate}</div>
							<div style="text-align: center;">종료일 : ${dto.endDate}</div>
							<div style="text-align: center; margin-top: 10px; font-size: 20px;">발표 : ${dto.winnerCount == 0 ? "추후 예정" : "완료"}</div>
						</div>
					</c:forEach>
				</div>
				
				<div class="page-navigation">
					${dataCount == 0 ? "등록된 이벤트가 없습니다." : paging}
				</div>
				<br>
				<div class="row board-list-footer">
					<div class="col">
						<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/promotion/${category}/list';" title="새로고침"><i class="bi bi-arrow-counterclockwise"></i></button>
					</div>
					
					
					
					<div class="col text-end">
						&nbsp;
					</div>
				</div>
			
			</div>
		</div>
	
	</div>
</div>