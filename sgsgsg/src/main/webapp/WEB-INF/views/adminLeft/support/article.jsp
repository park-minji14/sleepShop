<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css" type="text/css">

<style type="text/css">
.body-main {
	max-width: 900px;
}

.row-flex { display: flex; justify-content: space-between; }
.left-item {
	width:40px; margin-right: 1px; padding:10px 10px;
    text-align: center;
	font-weight: 600;
	color: #fff;
}
.right-item {
	flex-grow: 1;
    overflow: hidden;
    text-overflow: ellipsis;
    word-spacing: nowrap;
    box-sizing: border-box;
    padding: 10px 7px;
	font-weight: 600;
	color: #fff;
}
.left-question { background: #0d6efd; }
.right-question { background: #0d6efd; }

.left-answer { background: #198754; }
.right-answer { background: #198754; }
</style>

<script type="text/javascript">
function deleteInquiry(num) {
	if(confirm("문의를 삭제 하시겠습니까 ?")) {
		let query = "num="+num+"&${query}";
		let url = "${pageContext.request.contextPath}/adminManagement/supportManage/supportDelete?"+query;
		location.href = url;
	}
}

function deleteAnswer(num) {
	if(confirm("답변을 삭제 하시겠습니까 ?")) {
		let query = "num="+num+"&${query}";
		let url = "${pageContext.request.contextPath}/adminManagement/supportManage/supportDeleteAnswer?"+query;
		location.href = url;
	}
}

function sendAnswerOk() {
	const f = document.answerForm;
	if(!f.response_content.value.trim()) {
		alert("답변을 입력 하세요");
		f.answer.focus();
		return;
	}
	
	f.action = "${pageContext.request.contextPath}/adminManagement/supportManage/supportAnswer";
	f.submit();
}
</script>

<div class="mt-4">    
	<h2 class="mb-4 subtitle">1:1 문의 답변</h2>
    <div class="body-main">
		<table class="table table-border table-article">
			<tbody>
				<tr style="border: none;">
					<td colspan="2" style="padding: 10px 0 0 0;">
						<div class="row-flex">
							<div class="left-item left-question">Q.</div>
							<div class="right-item right-question">${dto.title}</div>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						분 류 : ${dto.category}
				</tr>
				<tr>
					<td width="50%" align="left">
						작성자 : ${dto.userId}
					</td>
					<td width="50%" align="right">
						문의일자 : ${dto.created_date}
					</td>
				</tr>
				
				<tr style="${not empty dto.response_content ? 'border: none;':''}">
					<td colspan="2" valign="top" height="150">
						${dto.content}
					</td>
				</tr>
			</tbody>
		</table>
		
		<c:if test="${not empty dto.response_content}">
			<table class="table table-border table-article" style="margin-top: 0;">
				<tbody>
					<tr style="border: none;">
						<td colspan="2" style="padding: 0 0 0 0;">
							<div class="row-flex">
								<div class="left-item left-answer">A.</div>
								<div class="right-item right-answer">${dto.title}</div>
							</div>
						</td>
					</tr>
					<tr>
						<td width="50%" align="left">
							담당자 :  ${dto.userId2}
						</td>
						<td width="50%" align="right">
							답변일자 :  ${dto.response_date}
						</td>
					</tr>
					
					<tr>
						<td colspan="2" valign="top" height="150">
							${dto.response_content}
						</td>
					</tr>
				</tbody>
			</table>
		</c:if>
		
		<table class="table">
			<tr>
				<td width="50%" align="left">
					<button type="button" class="btn" onclick="deleteInquiry('${dto.num}');">질문삭제</button>
					<c:if test="${not empty dto.response_date}">
						<button type="button" class="btn" onclick="deleteAnswer('${dto.num}');">답변삭제</button>
					</c:if>
				</td>
			
				<td align="right">
					<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/adminManagement/supportManage/supportList?${query}';">리스트</button>
				</td>
			</tr>
		</table>
		
		<c:if test="${empty dto.response_content}">
			<div class="reply">
				<form name="answerForm" method="post">
					<div class='form-header'>
						<span class="bold">답변달기</span><span> - 문의에 대한 답변을 입력 하세요</span>
					</div>
					
					<table class="table reply-form">
						<tr>
							<td>
								<textarea class='form-control' name='response_content'></textarea>
							</td>
						</tr>
						<tr>
						   <td align='right'>
						        <button type='button' class='btn' onclick="sendAnswerOk()">답변 등록</button>
						        <input type="hidden" name="num" value="${dto.num}">
						        <input type="hidden" name="page" value="${page}">
						        <input type="hidden" name="schType" value="${schType}">
						        <input type="hidden" name="kwd" value="${kwd}">
						    </td>
						 </tr>
					</table>
				</form>
			</div>
		</c:if>
	</div>
</div>
