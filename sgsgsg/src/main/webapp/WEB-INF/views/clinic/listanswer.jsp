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


 


</style>


<c:if test="${sessionScope.member.membership > 90 || dto.userId == sessionScope.member.userId}">
    <script type="text/javascript">
    function deleteClinicAnswer(form) {
    	console.log(form);
        if(confirm("답변을 삭제하시겠습니까 ? ")) {
            form.submit();
        }
    }
    
    
    function toggleAdoptForm(answer_num) {
        var adoptForm = document.getElementById("adoptForm_" + answer_num);
        if (adoptForm) {
            if (adoptForm.style.display === "block") {
                adoptForm.style.display = "none";
            } else {
                adoptForm.style.display = "block";
            }
        } else {
            console.error('Form not found:', adoptForm);
        }
    }
    
    
    function submitAdoptForm(answer_num) {
        var comment = document.getElementById("content2_" + answer_num).value;
        if (comment.trim() === "") {
            alert("코멘트를 입력해주세요.");
            return;
        }

        var form = document.getElementById("adoptForm_" + answer_num);
        console.log(form);  // 확인용 로그

        if (form && form.tagName === 'FORM') {
            // 폼 제출을 시도하는 대신 폼의 내용을 로깅하여 확인합니다.
            console.log('Submitting form:', form);
            form.submit();  // HTMLFormElement.prototype.submit.call(form); 대신 form.submit() 사용
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
                                <button type="button" class="btn btn-like" onclick="toggleAdoptForm(${vo.answer_num});">채택하기</button>
                            </c:if>
                            <!-- <c:if test="${vo.pickup == 1}"> -->
                                <span class="adopted-comment">${vo.content2}</span>
                            <!-- </c:if> -->
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
			
			
			<div id="adoptForm_${vo.answer_num}" class="adopt-form" style="display:none;">
                <form id="adoptForm_${vo.answer_num}" action="${pageContext.request.contextPath}/clinic/likeAnswer" method="post">
                    <input type="hidden" name="answer_num" value="${vo.answer_num}">
                    <input type="hidden" name="question_id" value="${vo.question_id}">
                    <textarea id="content2_${vo.answer_num}" name="content2" class="form-control m-2" placeholder="답변자에게 감사인사를 전하세요!"></textarea>
                    <div class='text-end pe-2 pb-1'>
                        <button type='button' class='btn btn-light' onclick="submitAdoptForm(${vo.answer_num});">등록하기</button>
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
