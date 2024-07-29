<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새근새근</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<style type="text/css">
.pic-container {
	width: 1200px;
	height: 300px;
}


.table-style {
	border: 1px solid #ddd; 
    border-radius: 20px;
    padding: 20px;
    margin: 30px 0; 
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3); 
    background-color: #fff;
    height: 130px; 
}


@keyframes move {
	0% {transform: translateY(0px);}
	100% {transform: translateY(-10px);}  
}

.table-style:hover {
	animation: move 0.5s forwards;
	transition: transform 0.5s; 
} 

 
.radio-label {
    display: inline-block;
    padding: 10px 20px; 
    margin: 25px;
    border: 2px solid #35c5f0;
    border-radius: 10px;
    background-color: white;
    color: #35c5f0;
    cursor: pointer;
    transition: background-color 0.3s, color 0.3s;
} 



/* .container {
    display: flex;
    justify-content: center;
    align-items: center;
} */

.radio-container {
    display: flex;
    justify-content: center;
    align-items: center; 
}

.slide-container {
	display: flex;
    justify-content: center;
    align-items: center;
}


/* 숨겨진 기본 라디오 버튼 */
.radio-input {
    display: none;
}

 
/* 선택된 라벨 스타일 */
.radio-input:checked + .radio-label {
    background-color: #35c5f0;
    color: white;
}

/* 라벨 hover 스타일 */
.radio-label:hover {
    background-color: #35c5f0;
    color: white;
}


.btn-12 {
  position: relative;
  right: 20px;
  bottom: 20px;
  border:none; 
  width: 130px;
  line-height: 40px;
  -webkit-perspective: 230px;
  perspective: 230px;
}
.btn-12 span {
  display: block;
  position: absolute;
  width: 130px;
  height: 40px;
  border: 2px solid #35c5f0;  
  margin: 0;
  border-radius: 5px;
  text-align: center;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
  -webkit-transition: all .3s;
  transition: all .3s;
}
.btn-12 span:nth-child(1) {
  box-shadow:
   -7px -7px 20px 0px #fff9,
   -4px -4px 5px 0px #fff9,
   7px 7px 20px 0px #0002,
   4px 4px 5px 0px #0001;
  -webkit-transform: rotateX(90deg);
  -moz-transform: rotateX(90deg);
  transform: rotateX(90deg);
  -webkit-transform-origin: 50% 50% -20px;
  -moz-transform-origin: 50% 50% -20px;
  transform-origin: 50% 50% -20px;
}
.btn-12 span:nth-child(2) {
  -webkit-transform: rotateX(0deg);
  -moz-transform: rotateX(0deg);
  transform: rotateX(0deg);
  -webkit-transform-origin: 50% 50% -20px;
  -moz-transform-origin: 50% 50% -20px;
  transform-origin: 50% 50% -20px;
}
.btn-12:hover span:nth-child(1) {
  -webkit-transform: rotateX(0deg);
  -moz-transform: rotateX(0deg);
  transform: rotateX(0deg);
}
.btn-12:hover span:nth-child(2) {
  background: #e0e5ec;
  color: #e0e5ec;
  -webkit-transform: rotateX(-90deg);
  -moz-transform: rotateX(-90deg);
  transform: rotateX(-90deg);
}

/*추가*/
.container-clinic {
  display: flex;
    justify-content: center;
    align-items: center;
}

</style>

<script type="text/javascript">
function searchList() {
	const f = document.searchForm;
	f.submit();
}


function submitForm() {
    document.getElementById('categoryForm').submit();
}


document.addEventListener('DOMContentLoaded', function () { 
	  // Swiper 초기화
	  const swiper = new Swiper('.swiper-container', {
		  slidesPerView: 'auto',
		  centeredSlides: true,
		  spaceBetween: 30,
		  loop: true,
		  grabCursor: true,
		  effect: 'coverflow',
		  coverflowEffect: {
		    rotate: 0,
		    stretch: 0,
		    depth: 100,
		    modifier: 1,
		    slideShadows: false,
		  },
		  pagination: {
		    el: '.swiper-pagination',
		    clickable: true,
		  },
		  navigation: {
		    nextEl: '.swiper-button-next',
		    prevEl: '.swiper-button-prev',
		  },
		   autoplay: {
		    delay: 5000,
		    disableOnInteraction: false,
		  }, 
	  });
	 });
	 
	 
	

</script>

</head>
<body>
<hr>



	<section class="main-banner">
		<div class="container slide-container swiper-container">
			<div class="swiper-wrapper">
				<div class="slide-container swiper-slide">
				<c:choose>
					<c:when test="${sessionScope.member.membership > 90 || sessionScope.member.membership < 50}">
						<a href="${pageContext.request.contextPath}/expertapply/apply">
						<img src="${pageContext.request.contextPath}/uploads/etc/전문가신청배너.png"
							alt="수면클리닉 배너 1">
						</a>
					</c:when>
					<c:otherwise>
						<img src="${pageContext.request.contextPath}/uploads/etc/전문가신청배너.png"
							alt="수면클리닉 배너 1">
					</c:otherwise>
				</c:choose>
				</div>  
				<div class="slide-container swiper-slide">
					<img src="${pageContext.request.contextPath}/uploads/etc/질문홍보배너.png"
						alt="수면클리닉 배너 2">
				</div>
				<div class="slide-container swiper-slide">
					<a href="${pageContext.request.contextPath}/promotion/progress/article?page=1&&num=15">
					<img src="${pageContext.request.contextPath}/uploads/etc/졸음껌배너.png"
						alt="수면클리닉 배너 3"> 
					</a>
				</div>
			</div>
			<div class="swiper-pagination"></div>
			<div class="swiper-button-next"></div>
			<div class="swiper-button-prev"></div>
		</div>
	</section>


<div class="container-clinic">
	<div>
		<br> 
		<div class="body-title">
			<h2 style="color: #35c5f0; font-weight: bold;">수면클리닉</h2>  
		</div>
		<div>
			<h5 style="color: #35c5f0;">총 ${dataCount}개의 질문이 올라왔어요</h5>
		</div>
		
		<div class="body-main">
				<!-- <thead class=""> 
					<tr>
						<th width="60">번호</th>     
						<th width="100">제목</th>   
						<th width="100">카테고리</th>   
						<th width="100">작성자</th>
						<th width="100">작성일</th> 
						<th width="60">파일</th>
					</tr>
				</thead> -->  
				<div class="radio-button-group radio-container"> 
				    <form id="categoryForm" method="get" action="${pageContext.request.contextPath}/clinic/list">
				        <input type="radio" id="option1" name="category" value="all" class="radio-input" ${category == 'all' ? 'checked' : ''} onclick="submitForm()">
				        <label for="option1" class="radio-label" style="width: 150px; text-align: center; font-size: 20px;">전체</label>
				
				        <input type="radio" id="option2" name="category" value="수면" class="radio-input" ${category == '수면' ? 'checked' : ''} onclick="submitForm()">
				        <label for="option2" class="radio-label" style="width: 150px; text-align: center; font-size: 20px;">수면</label>
				
				        <input type="radio" id="option3" name="category" value="불면" class="radio-input" ${category == '불면' ? 'checked' : ''} onclick="submitForm()">
				        <label for="option3" class="radio-label" style="width: 150px; text-align: center; font-size: 20px;">불면</label>
				
				        <input type="radio" id="option4" name="category" value="건강" class="radio-input" ${category == '건강' ? 'checked' : ''} onclick="submitForm()">
				        <label for="option4" class="radio-label" style="width: 150px; text-align: center; font-size: 20px;">건강</label>
				
				        <input type="radio" id="option5" name="category" value="기타" class="radio-input" ${category == '기타' ? 'checked' : ''} onclick="submitForm()">
				        <label for="option5" class="radio-label" style="width: 150px; text-align: center; font-size: 20px;">기타</label>
				    </form>
				</div>
				
				<div class="radio-container"> 
					<form class="row" name="searchForm" action="${pageContext.request.contextPath}/clinic/list" method="post">
						<div class="col-auto p-1"> 
							<select name="schType" class="form-select">
								<option value="all" ${schType=="all"?"selected":""}>제목+내용</option>
								<option value="title" ${schType=="title"?"selected":""}>제목</option>
								<option value="content" ${schType=="content"?"selected":""}>내용</option>
							</select>
						</div>
						<div class="col-auto p-1">
							<input type="text" name="kwd" value="${kwd}" class="form-control" style="width: 600px;" placeholder="원하는 키워드를 입력하실래요?">  
						</div>
						<div class="col-auto p-1">
							<button type="button" class="btn btn-light" onclick="searchList()" title="검색"> <i class="bi bi-search"></i> </button>
						</div>
					</form> 
						<div class="col-auto p-2 text-end"> 
							<button class="custom-btn btn-12" onclick="location.href='${pageContext.request.contextPath}/clinic/write';" style="margin-left: 100px;"><span>Go!</span><span>질문하기</span></button>
						</div> 
				</div>
				  
					<c:forEach var="dto" items="${list}" varStatus="status">
						<div class="table-style" onclick="location.href='${articleUrl}&num=${dto.question_id}'">
						<table class="table">
						<tr> 
							<!-- <td width="60">${dataCount-(page-1)*size-status.index}</td> -->
							<td width="60" style="color: white; background: #35c5f0; line-height: 50px; border-radius: 10px; font-size: 22px; padding-top: 30px;">
								${dto.category_name} 
							</td>    
							<td class="left">
								<span style="font-size: 30px; padding-left: 20px; padding-top: 10px;">
									${dto.title}
									<c:if test="${not empty dto.saveFilename}">
										<span style="color: #8C8C8C; font-size: 20px;"><i class="bi bi-archive"></i></span>
									</c:if>
									<span style="color: orange; font-size: 20px;">&nbsp;&nbsp;[답변 ${dto.answerCount}]</span><br><span style="font-size: 18px; padding-left: 25px;">질문자 : ${dto.userId}</span>
								</span>
							</td>
							<td style="text-align: right;">${dto.created_date}</td>  
							<!-- <td>
								<c:if test="${not empty dto.saveFilename}">
									<a href="${pageContext.request.contextPath}/clinic/download?question_id=${dto.question_id}" class="text-reset"><i class="bi bi-file-arrow-down"></i></a>
								</c:if> 
							</td> -->
						</tr>
						</table>
						</div>
					</c:forEach>
					
	
			
			<div class="page-navigation">
				${dataCount==0? "등록된 게시글이 없습니다." : paging }
			</div>

			
			
		</div>
	</div>
</div>
<!-- <br><br><hr>
</body>
</html>	    -->