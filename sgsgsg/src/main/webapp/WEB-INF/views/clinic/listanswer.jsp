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
    position: relative;
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


@keyframes btnlikecolor {
	0% {}
	100% {background: #FF9436; color: white; transform: translateY(2px);}
}


.btn-like {
	width: 100px;
	height: 40px;
	background-color: white;
	border-radius: 10px;
	border: 2px solid #FF9436;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3); 
}


.btn-like:hover {
	animation: btnlikecolor 0.3s forwards;
}


.comment-style {
	height: 40px;
	color: #ED4C00; 
	border: 3px solid #368AFF;  
	background: #E6FFFF; 
	border-radius: 20px;
}


.adopted-badge {
    position: absolute;
    top: 10px;
    right: 10px;
    background-color: #35c5f0;
    color: white;
    border: 3px solid #35c5f0;
    border-radius: 30px;
    padding: 5px 10px;
    font-size: 20px;
    font-weight: bold;
}




</style>


<c:if test="${sessionScope.member.membership > 90 || dto.userId == sessionScope.member.userId}">
    <script type="text/javascript">
    function deleteClinicAnswer(form) {
    	console.log(form);
        if(confirm("답변을 삭제하시겠습니까 ? ")) {
            form.submit();
        }
    }
    
    
    function toggleForm(answer_num) {
        var form = document.getElementById("form_" + answer_num);
        if (form) {
            form.style.display = (form.style.display === "block") ? "none" : "block";
        } else {
            console.error('Form not found:', form);
        }
    }

    function submitForm(answer_num) {
        var textarea = document.getElementById("textarea_" + answer_num);
        if (textarea.value.trim() === "") {
            alert("코멘트를 입력해주세요.");
            return;
        }
        
        if (!confirm("이 답변을 채택하시겠습니까?")) {
            return;
        }

        var form = document.getElementById("submitForm_" + answer_num);
        if (form && form.tagName === 'FORM') {
            var xhr = new XMLHttpRequest();
            xhr.open("POST", form.action, true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xhr.onreadystatechange = function() {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    document.getElementById("comment_" + answer_num).textContent = textarea.value;
                    form.style.display = "none";
                    
                    var adoptButtons = document.getElementsByClassName('adopt-btn');
                    for (var i = 0; i < adoptButtons.length; i++) {
                        adoptButtons[i].style.display = 'none';
                    }
                }
            };

            var formData = new FormData(form);
            var queryString = new URLSearchParams(formData).toString();
            xhr.send(queryString);
        } else { 
            console.error('Form not found or not a form element:', form);
        }
    }

    window.onload = function() {
        var adoptedComments = document.querySelectorAll('.adopted-comment');
        adoptedComments.forEach(function(comment) {
            var parent = comment.closest('.answer-list-table');
            var adoptForm = parent.querySelector('.adopt-form');
            if (adoptForm) {
                adoptForm.style.display = 'none';
            }
        });
        
        
        <c:forEach var="adopted" items="${adoptedAnswers}">
        document.getElementById("comment_${adopted.answer_num}").textContent = "${adopted.content2}";
        var adoptButtons = document.getElementsByClassName('adopt-btn');
        for (var i = 0; i < adoptButtons.length; i++) {
            adoptButtons[i].style.display = 'none';
        }
    	</c:forEach>
    	
    };
    </script> 
</c:if>


<br><br>
<div class='reply-info'>
	<span class='reply-count' style="font-size: 22px; color: #6799FF;">전문가의 뜨거운 손길 ${answerCount}개</span>
</div>

<div class="container">
	<div class="body-container">
				
		<c:forEach var="vo" items="${listanswer}">
			<div class="answer-list-table">
				<div class='row reply-writer'>
					<div class='col-1'><i class='bi bi-person-circle text-muted icon' style="font-size: 30px;"></i></div>
					<div class='col-auto align-self-center'>
						<div class='name' style="font-size: 25px;">${vo.userId}
						    <c:if test="${vo.pickup != 1 && sessionScope.member.membership > 90}">
						        <button type="submit" class="btn btn-like adopt-btn" onclick="toggleForm(${vo.answer_num});">채택하기</button>
						    </c:if>
						    
						    <c:if test="${vo.pickup == 1}">
							    <span class="adopted-comment comment-style" id="comment_${vo.answer_num}" style="font-size: 22px;">
							    	<span style="color: #6F6F6F;">&nbsp;👑 [질문자의 인사]</span>  
							    	<span>&nbsp;${vo.content2}&nbsp;</span>
							    </span>  
							    <span class="text-end adopted-badge">채택</span>
						    </c:if>
						</div>
						<div class='date'>${vo.created_date}</div>
						<div class="">
							<div class="answer-list">
					
							        <div class="answer-item">
							            <c:if test="${sessionScope.member.userId == vo.userId || sessionScope.member.membership > 90}">
							                <form action="${pageContext.request.contextPath}/clinic/deleteAnswer" method="post">
							                    <input type="hidden" name="answer_num" value="${vo.answer_num}">
							                    <input type="hidden" name="question_id" value="${vo.question_id}">
							                    <input type="hidden" name="page" value="${page}">
							                    <button type="button" class="btn1" onclick="deleteClinicAnswer(this.form);">삭제</button>
							                </form>
							            </c:if>
							            
							        </div>
							          
		                        
							</div>
						
						</div>
					</div>
				</div>
			</div>
			
			<div class="answer-list-table2">
				<div>${vo.content}</div>
			</div>
			
			
			<div id="form_${vo.answer_num}" class="adopt-form" style="display:none;">
			    <form id="submitForm_${vo.answer_num}" action="${pageContext.request.contextPath}/clinic/insertClinicAnswerComment" method="post">
			        <input type="hidden" name="answer_num" value="${vo.answer_num}">
			        <input type="hidden" name="question_id" value="${vo.question_id}">
			        <textarea id="textarea_${vo.answer_num}" name="content2" class="form-control m-2" placeholder="답변자에게 감사인사를 전하세요!"></textarea>
			        <div class='text-end pe-2 pb-1'>
			            <button type='button' class='btn btn-light' onclick="submitForm(${vo.answer_num});">등록하기</button>
			        </div> 
			    </form> 
			</div>
			
			<br><br>
			
		</c:forEach> 
	</div>	
</div>
	


<div class="page-navigation">
	${paging}
</div>			
