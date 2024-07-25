<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
			
			
<style>
.css-ow22sl {
    overflow: hidden;
    width: 100%; /* or any specific width */
    padding: 20px;
    box-sizing: border-box;
   
}

.table-style6 {
    max-width: 100%;
    overflow-x: auto;
    padding-bottom: 150px;
    box-shadow: none;
}

.table-header, .table-content {
    justify-content: space-between;
    flex-wrap: nowrap;
}

.table-header > div, .table-content > div {
    padding: 10px;
}


.navi{
	margin-bottom: 80px;
}


.radio-input:checked + .radio-label {
    background-color: fff;
    color: #35c5f0;
}
.radio-input:checked + .radio-label {
    background-color: #ffff; 
    color: #35c5f0;
}


.content {
	color: gray;
}




</style>
			
			
			
			
		
<div class="css-ow22sl e1v2ggz01">
	
	<!-- 1:1 문의 탭 -->
		<div class="tab-pane fade show active" id="inquiry">
			<h4 class="mb-4" style=" text-align: center;  font-size: 33px;  font-weight: 600; margin: 50px;">1:1 문의</h4>
		</div>
		<dl>
			<!--  <dt><img src="https://atimg.sonyunara.com/2023/renew/list/mypage_1.png" class="icon" alt="">주문관리</dt>  -->
			<div class="navi" style="text-align: center; margin-bottom: 100px;" >
				<a href="${pageContext.request.contextPath}">홈 &gt;</a> 
				<a href="${pageContext.request.contextPath}/mypage/main">마이페이지 &gt; </a>
			<a style="font: light-gray;">1:1 문의</a></div>
		</dl>
		
		<div style="display: flex; justify-content: space-between;">
    <div style="flex: 1;">
        <input type="radio" id="option4" name="category" value="돌아가기" class="radio-input" ${category == '돌아가기' ? 'checked' : ''} onclick="listInquiry('${pageNo}')" >
        <label for="option4" class="radio-label" style="width: 150px; text-align: center; font-size: 20px;">돌아가기</label>
    </div>
    <div style="flex: 1; text-align: right;">
        <input type="radio" id="option5" name="category2" value="삭제" class="radio-input" ${category == '삭제' ? 'checked' : ''} onclick="deleteInquiry('${dto.num}', '${pageNo}')" >
        <label for="option5" class="radio-label" style="width: 150px; text-align: center; font-size: 20px;">삭제</label>
    </div>
</div>
		
		<div class="table-style6">
				<div>
					<span>
						<div class="table-header" >
								<div class="inquiry">문의내용</div>
							
						</div>
					</span>
				</div>
				<hr>
				<div>
					<span>
						<div class="table-content" >
							<div class="cont">
								<div class="content">${dto.content}</div>
							</div>
						</div>
					</span>
				</div>
		</div>
		
		<c:if test="${not empty dto.response_date}">
		</c:if>
			<div class="table-style6">
					<div>
						<span>
							<div class="table-header" >
								
									<div class="answer">답변내용</div>
								
							</div>
						</span>
					</div>
					<hr>
					<div>
						<span>
							<div class="table-content" >
								<div class="cont">
									<div class="content">상담원 "◎새근새근◎"에서 답변드립니다.<br>안녕하세요, 새근새근 입니다~(❁´◡`❁)<br><br>${dto.response_content}</div>
								</div>
							</div>
						</span>
					</div>
			</div>

</div>
