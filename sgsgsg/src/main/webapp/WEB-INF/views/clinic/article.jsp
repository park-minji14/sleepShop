<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
@import url('https://fonts.googleapis.com/css?family=Rubik:700&display=swap');

.container {
    display: flex;
    justify-content: center;
    align-items: center;
}


.body-container {
	width: 1000px;
}


.table-style1 {
	border: 5px solid #35c5f0; 
    border-radius: 30px;
    padding: 20px;
    margin: 30px 0; 
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3); 
    background-color: #fff;
    width: 1100px; 
    height: 80px;
}


.table-style2 {
	border: 1px solid #ddd; 
    border-radius: 20px;
    padding: 10px;
    margin: 30px 0; 
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3); 
    background-color: #fff;
    width: 1100px;
}


.table-style3 {
	border: 1px solid #ddd;  
    border-radius: 30px; 
    padding: 10px;
    margin: 30px 0; 
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3); 
    background-color: #fff;
    width: 1100px;
    height: 400px;
}


.table-style4 {
	border: 1px solid #ddd; 
    border-radius: 30px;
    padding: 20px;
    margin: 30px 0; 
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3); 
    background-color: #fff;
    width: 1100px; 
    height: 60px; 
}


.table-style5 {
	padding: 10px;
    margin: 30px 0; 
    background-color: #fff;
    width: 1100px;
}


.table-style6 {
	border: 1px solid #ddd; 
    border-radius: 30px;
    padding: 20px;
    margin: 30px 0; 
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3); 
    background-color: #fff;
    width: 1100px;
}

@keyframes btncolor {
	0% {}
	100% {background: #35c5f0; color: white; transform: translateY(4px);}
}


@keyframes btncolor2 {
	0% {}
	100% {background: #00A500; color: white; transform: translateY(4px);}
}

.btn1 {
	width: 80px;
	height: 40px;
	background-color: white;
	border-radius: 10px;
	border: 2px solid #35c5f0;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3); 
}

.btn1:hover {
	animation: btncolor 0.3s forwards;
}

 
.btn2 {
	width: 80px;
	height: 40px;
	background-color: white;
	border-radius: 10px;
	border: 2px solid #35c5f0;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3); 
}


.btn3 {
	width: 180px;
	height: 60px;
	background-color: white;
	border-radius: 10px;
	border: 2px solid #00A500;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3); 
}

.btn3:hover {
	animation: btncolor2 0.3s forwards;
}


.btn4 {
	width: 180px;
	height: 60px;
	background-color: white;
	border-radius: 10px;
	border: 2px solid #00A500;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3); 
}



</style>


<div class="container">
	<div class="body-container"> 
		<div class="body-title">
			<h2 style="color: #35c5f0; font-weight: bold;"> 수면클리닉 </h2>
		</div>
		
		<!-- 
		<div class="body-main">
			<div class="table-style">
			<table class="table mt-3 mb-0 board-article"> 
				<thead>
					<tr> 
						<td colspan="2" align="center">
							${dto.title}
						</td>
					</tr>
				</thead>
				
				<tbody>
					<tr>
						<td width="50%">
							질문자 : ${dto.userId}
						</td>
						<td align="right">
							${dto.created_date}
						</td>
					</tr>
					
					<tr>
						<td colspan="2" valign="top" height="200" style="border-bottom: none;">
							${dto.content}
						</td>
					</tr>
					
					
					<tr>
						<td colspan="2">
							<c:if test="${not empty dto.saveFilename}">
								<p class="border text-secondary my-1 p-2">
									<i class="bi bi-folder2-open"></i>
									<a href="${pageContext.request.contextPath}/clinic/download?question_id=${dto.question_id}">${dto.originalFilename}</a>
								</p>
							</c:if>
						</td>
					</tr>

					<tr>
						<td colspan="2">
							이전글 :
							<c:if test="${not empty prevDto}">
								<a href="${pageContext.request.contextPath}/clinic/article?${query}&question_id=${prevDto.question_id}">${prevDto.subject}</a>
							</c:if>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							다음글 :
							<c:if test="${not empty nextDto}">
								<a href="${pageContext.request.contextPath}/clinic/article?${query}&question_id=${nextDto.question_id}">${nextDto.subject}</a>
							</c:if>
						</td>
					</tr>

				</tbody>
			</table>
			
			<table class="table table-borderless">
				<tr>
					<td width="50%">
						<c:choose>
							<c:when test="${sessionScope.member.userId==dto.userId}">
								<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/clinic/update?num=${dto.question_id}&page=${page}';">수정</button>
							</c:when>
							<c:otherwise>
								<button type="button" class="btn btn-light" disabled>수정</button>
							</c:otherwise>
						</c:choose>
						
						<c:choose>
							<c:when test="${sessionScope.member.userId==dto.userId || sessionScope.member.membership>50}">
								<button type="button" class="btn btn-light" onclick="deleteBoard();">삭제</button>
							</c:when>
							<c:otherwise>
								<button type="button" class="btn btn-light" disabled>삭제</button>
							</c:otherwise>
						</c:choose>
				    			
					</td>
					<td class="text-end">
						<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/clinic/list?${query}';">리스트</button>
					</td>
				</tr>
			</table>
			</div>
			
			<div class="reply">
				<form name="replyForm" method="post">
					<div class='form-header'>
						<span class="bold">답변</span>
					</div>
					
					<table class="table table-borderless reply-form">
						<tr>
							<td>
								<textarea class='form-control' name="content"></textarea>
							</td>
						</tr>
						<tr>
						   <td align='right'>
						        <button type='button' class='btn btn-light btnSendReply'>답변 등록</button>
						    </td>
						 </tr>
					</table>
				</form>
				
				<div id="listReply"></div>
			</div>
			
		</div> -->
		
		
		<div class="table-style1">
			<span style="font-size: 25px; color: #35c5f0; border-radius: 10px;">&nbsp;[${dto.category_name}] </span>
			<span style="font-size: 30px;">&nbsp;${dto.title}</span> 
		</div>
		
		<div class="table-style2">
			<div>
				질문자 : ${dto.userId}
				<span style="float: right;">
					${dto.created_date}
				</span>
			</div>
		</div>
		
		<div class="table-style3">
			<span style="border-bottom: none; valign: top;">
				${dto.content}
			</span>
		</div>
		
		
		<div class="table-style4">
			<span>
				<c:choose>
					<c:when test="${not empty dto.saveFilename}">
						<p class="border text-secondary my-1 p-2" style="line-height: 0px;"> 
							<i class="bi bi-folder2-open"></i>
							<a href="${pageContext.request.contextPath}/clinic/download?num=${dto.question_id}">${dto.originalFilename}</a>
						</p> 
					</c:when>
					<c:otherwise>
			            <p class="text-secondary my-1 p-2" style="line-height: 10px;">첨부 파일이 없습니다.</p>
			        </c:otherwise>
				</c:choose>
			</span>
		</div>
		
		
		<div class="table-style6">
			<div>
				<span>
					이전글 :
					<c:if test="${not empty prevDto}">
						<a href="${pageContext.request.contextPath}/clinic/article?${query}&num=${prevDto.question_id}">${prevDto.title}</a>
					</c:if>
				</span>
			</div>
			<hr>
			<div>
				<span>
					다음글 :
					<c:if test="${not empty nextDto}">
						<a href="${pageContext.request.contextPath}/clinic/article?${query}&num=${nextDto.question_id}">${nextDto.title}</a>
					</c:if>
				</span>
			</div>
		</div>
		
		
		<div class="table-style5">
			<span style="width: 50%;">
				<c:choose>
					<c:when test="${sessionScope.member.userId==dto.userId}">
						<button type="button" class="btn1" onclick="location.href='${pageContext.request.contextPath}/clinic/update?num=${dto.question_id}&page=${page}';">수정</button>
					</c:when> 
					<c:otherwise> 
						<button type="button" class="btn2" disabled>수정</button>
					</c:otherwise>
				</c:choose>
						
				<c:choose>
					<c:when test="${sessionScope.member.userId==dto.userId || sessionScope.member.membership>50}">
						<button type="button" class="btn1" onclick="location.href='${pageContext.request.contextPath}/clinic/delete?num=${dto.question_id}&page=${page}';">삭제</button>
					</c:when>
					<c:otherwise>
						<button type="button" class="btn2" disabled>삭제</button>
					</c:otherwise>
				</c:choose>
				    			
			</span>
			<span class="text-end" style="float: right;">
				<button type="button" class="btn1" onclick="location.href='${pageContext.request.contextPath}/clinic/list?${query}';">리스트</button>
			</span> 
		</div>
		
		<div class="col-auto p-2"> 
		<c:choose>
			<c:when test="${sessionScope.member.membership>50}">
				<button class="btn3" onclick="location.href='${pageContext.request.contextPath}/clinic/writeanswer?num=${dto.question_id}&page=${page}';">답 변 하 기</button> 
			</c:when>
			<c:otherwise>
				<button class="btn4" disabled>답 변 하 기</button>
			</c:otherwise>
		</c:choose>
		</div>
		
		<br>
		
		<div id="listanswer"></div>
		
		
		
		
		
		
		
		
	</div>
</div>  
<br><br><hr>

<script>
function login() {
	location.href = '${pageContext.request.contextPath}/member/login';
}

$(function() {
	let url = "${pageContext.request.contextPath}/clinic/listanswer";
	let query = "num=${dto.question_id}&pageNo=1";
	let selector = "#listanswer";
	
	const fn = function(data) {
		$(selector).html(data);
	}
	
	ajaxFun(url, "get", query, "text", fn);
});


function ajaxFun(url, method, formData, dataType, fn, file = false) {
	const settings = {
			type: method, 
			data: formData,
			dataType:dataType,
			success:function(data) {
				fn(data);
			},
			beforeSend: function(jqXHR) {
				jqXHR.setRequestHeader('AJAX', true);
			},
			complete: function () {
			},
			error: function(jqXHR) {
				if(jqXHR.status === 403) {
					login();
					return false;
				} else if(jqXHR.status === 400) {
					alert('요청 처리가 실패 했습니다.');
					return false;
		    	}
		    	
				console.log(jqXHR.responseText);
			}
	};
	
	if(file) {
		settings.processData = false;  // file 전송시 필수. 서버로전송할 데이터를 쿼리문자열로 변환여부
		settings.contentType = false;  // file 전송시 필수. 서버에전송할 데이터의 Content-Type. 기본:application/x-www-urlencoded
	}
	
	$.ajax(url, settings);
}




</script>






