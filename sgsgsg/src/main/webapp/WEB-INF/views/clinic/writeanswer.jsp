<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta charset="UTF-8">
<title>답변 작성</title>
<style>
.container {
	display: flex;
    justify-content: center;
    align-items: center;
}


.answer-write-table {
	border: 5px solid #35c5f0; 
    border-radius: 30px;
    padding: 20px;
    margin: 30px 0; 
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3); 
    background-color: #fff;
    width: 1000px; 
    height: 570px;
}


.form-group {
    margin-bottom: 20px;
}
.form-group label {
    display: block;
    font-weight: bold;
}
.form-group textarea {
    width: 100%;
    height: 150px;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
}
.form-group button {
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    background-color: #35c5f0;
    color: #fff;
    cursor: pointer;
}
.form-group button:hover {
    background-color: #1aa3d1;
}
</style>
<script>
function check() {
    const f = document.boardAnswerForm;
	let str;
	

	str = f.content.value;
	if( !str || str === "<p><br></p>" ) {
        alert("내용을 입력하세요. ");
        f.content.focus();
        return false;
    }

    f.action = "${pageContext.request.contextPath}/clinic/${mode}";
    
    return true;
}



</script>


<div class="container">
	<div class="body-container">
	
	
        <h2 style="color: #35c5f0; font-weight: bold;">답변 작성</h2>
        <h5>소중한 답변은 질문자에게 큰 힘이 됩니다.</h5>
        <div class="answer-write-table">
	        <form name="boardAnswerForm" method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath}/clinic/writeanswer" method="post">
	            <input type="hidden" name="question_id" value="${dto.question_id}">
	            <input type="hidden" name="page" value="${page}">
	            <div class="form-group">
	                <br>
	                <div style="text-align: center; font-size: 20px; color: #C90000;"> 
	                	RE:&nbsp;${dto.title}
	                </div>
	                <br>
	                <div>
						<textarea name="content" id="ir1" class="form-control" style="width: 99%; height: 300px;"></textarea>
					</div>
	            </div>
	            <div class="form-group text-center">
	            	
	                <button type="button" class="btn3 btnSendAnswer" onclick="submitContents(this.form);" style="font-size: 18px;">${mode=='update'?'수정완료':'등록하기'}&nbsp;<i class="bi bi-check2"></i></button>
	                <button type="button" class="btn3" onclick="location.href='${pageContext.request.contextPath}/clinic/article?num=${dto.question_id}&page=${page}';" style="font-size: 18px;">${mode=='update'?'수정취소':'등록취소'}&nbsp;<i class="bi bi-x"></i></button>
	            </div> 
	        </form>
        </div>
        
        
    </div>
  </div>
  

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "ir1",
	sSkinURI: "${pageContext.request.contextPath}/resources/vendor/se2/SmartEditor2Skin.html",
	fCreator: "createSEditor2"
});

function submitContents(elClickedObj) {
	 oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
	 try {
		if(! check()) {
			return;
		}
		
		elClickedObj.submit();
		
	} catch(e) {
	}
}

function setDefaultFont() {
	var sDefaultFont = '돋움';
	var nFontSize = 12;
	oEditors.getById["ir1"].setDefaultFont(sDefaultFont, nFontSize);
}



// 답변 등록
/*
$(function() {
	$(".btnSendAnswer").click(function() {
		// num, content, answer
		let question_id = "${dto.question_id}";
		const $tb = $(this).closest("form");
		let content = $tb.find("textarea").val().trim();
		if (! content) {
			$tb.find("textarea").focus();
			return false;
		}
		
		let url = "${pageContext.request.contextPath}/clinic/insertClinicAnswer";
		let query = {question_id:question_id, content:content};
		
		const fn = function(data) {
			$tb.find("textarea").val("");
			let state = data.state;
			if (state === "true") {
				listPage(1);
			} else {
				alert("댓글 등록이 실패했습니다.");
			}
			
		}
		ajaxFun(url, "post", query, "json", fn);
		
	})
})
*/
</script>
  

<br><br><hr>