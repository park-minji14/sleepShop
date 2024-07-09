<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class='reply-info'>
	<span class='reply-count'>답변 ${answerCount}개</span>
</div>

<table class='table table-borderless'>
	<c:forEach var="vo" items="${listClinicAnswer}">
		<tr class='border table-light'>
			<td width='50%'>
				<div class='row reply-writer'>
					<div class='col-1'><i class='bi bi-person-circle text-muted icon'></i></div>
					<div class='col-auto align-self-center'>
						<div class='name'>${vo.userName}</div>
						<div class='date'>${vo.created_date}</div>
					</div>
				</div>
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

		<tr>
			<!-- <td>
				<button type='button' class='btn btn-light btnReplyAnswerLayout' data-answer_num='${vo.answer_num}'>답글 <span id="answerCount${vo.answer_num}">${vo.answerCount}</span></button>
			</td> -->
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
</table>

<div class="page-navigation">
	${paging}
</div>			
