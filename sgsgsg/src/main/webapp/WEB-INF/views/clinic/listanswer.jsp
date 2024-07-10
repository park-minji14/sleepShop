<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<style>
.container {
	display: flex;
    justify-content: center;
    align-items: center;
}


.answer-list-table {
	border: 5px solid #35c5f0; 
    border-radius: 20px;
    padding: 10px;
    margin: 30px 0; 
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3); 
    background-color: #fff;
    width: 1100px;
}


.answer-list-table2 {
	border: 1px solid #ddd; 
    border-radius: 20px;
    padding: 10px;
    margin: 30px 0; 
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3); 
    background-color: #fff;
    width: 1100px;
}
 


</style>

<br><br>
<div class='reply-info'>
	<span class='reply-count'>답변 ${answerCount}개</span>
</div>

<div class="container">
	<div class="body-container">

		
		<!-- 
			<c:forEach var="vo" items="${listanswer}">
				<tr class='border table-light'>
					<td width='50%'>
						<div class='row reply-writer'>
							<div class='col-1'><i class='bi bi-person-circle text-muted icon'></i></div>
							<div class='col-auto align-self-center'>
								<div class='name'>${vo.userId}</div>
								<div class='date'>${vo.created_date}</div>
							</div>
						</div>
						<div>${vo.content}</div>
					</td>
					<td width='50%' align='right' class='align-middle'>
						<span class='reply-dropdown'><i class='bi bi-three-dots-vertical'></i></span>
						<div class="reply-menu">
							<c:choose>
								<c:when test="${sessionScope.member.userId==vo.userId}">
									<div class='deleteReply reply-menu-item' data-answer_num='${vo.answer_num}' data-pageNo='${pageNo}'>삭제</div>
								</c:when>
								<c:when test="${sessionScope.member.membership>50}">
									<div class='deleteReply reply-menu-item' data-answer_num='${vo.answer_num}' data-pageNo='${pageNo}'>삭제</div>
								</c:when>
								<c:otherwise>
									<div class='notifyReply reply-menu-item'>신고</div>
									<div class='blockReply reply-menu-item'>차단</div>
								</c:otherwise>
							</c:choose>
						</div>
					</td>
				</tr>
		
			
			    <tr class='reply-answer'>
			        <td colspan='2'>
			        	<div class='border rounded'>
				            <div id='listReplyAnswer3' class='answer-list'></div>
				            <div>
				                <textarea class="form-control m-2"></textarea>
				            </div>
							<div class='text-end pe-2 pb-1'>
								<button type='button' class='btn btn-light btnSendReplyAnswer' data-answer_num='${vo.answer_num}'>답글 등록</button>
				            </div>
			            </div>
					</td>
			    </tr>
			</c:forEach>
		-->
		<c:forEach var="vo" items="${listanswer}">
			<div class="answer-list-table">
				<div class='row reply-writer'>
					<div class='col-1'><i class='bi bi-person-circle text-muted icon' style="font-size: 30px;"></i></div>
					<div class='col-auto align-self-center'>
						<div class='name' style="font-size: 25px;">${vo.userId}</div>
						<div class='date'>${vo.created_date}</div>
					</div>
				</div>
			</div>
			
			<div class="answer-list-table2">
				<div>${vo.content}</div>
			</div>
			
		</c:forEach>
		</div>
		
		
	</div>


<div class="page-navigation">
	${paging}
</div>			
