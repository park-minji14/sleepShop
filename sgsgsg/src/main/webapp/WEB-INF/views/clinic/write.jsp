<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<style type="text/css">
.body-container {
	width: 900px;
}


.container {
    display: flex;
    justify-content: center;
    align-items: center;
}


.table-style {
	border: 1px solid #ddd; 
    border-radius: 20px;
    padding: 20px;
    margin: 30px 0; 
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3); 
    background-color: #fff;
    height: 130px; 
    width: 1000px; 
} 

</style>

<script type="text/javascript">
function check() {
    const f = document.boardForm;
	let str;
	
	if(! f.category_id.value) {
        alert("카테고리를 선택하세요. ");
        f.category_id.focus();
        return;
	}
	
    str = f.title.value.trim();
    if(!str) {
        alert("제목을 입력하세요. ");
        f.title.focus();
        return false;
    }

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

</head>
<body>
<hr>
<div class="container">
	<div class="body-container">	
		<div class="body-title">
			<h2 style="color: #35c5f0; font-weight: bold;"> 질문하기 </h2> 
		</div>
		
		<div class="body-main">
		
			<form name="boardForm" method="post" enctype="multipart/form-data">
				<table class="table mt-5 table-style"> 
				
					<tr>
						<td class="bg-light col-sm-2" scope="row">카테고리</td>
						<td>
							<div class="row">
								<div class="col-sm-4 pe-1">
									<select name="category_id" class="form-select">
										<option value="1" ${category_id=="1"?"selected":""}>수면</option>
										<option value="2" ${category_id=="2"?"selected":""}>불면</option>
										<option value="3" ${category_id=="3"?"selected":""}>건강</option>
										<option value="4" ${category_id=="4"?"selected":""}>기타</option>
									</select>
								</div>
							</div>
						</td>
					</tr> 
					
					<tr>
						<td class="bg-light col-sm-2" scope="row">제 목</td>
						<td>
							<input type="text" name="title" class="form-control" value="${dto.title}">
						</td>
					</tr> 
					
					<tr>
						<td class="bg-light col-sm-2" scope="row">공개여부</td>
						<td class="py-3"> 
							<input type="radio" name="is_public" id="is_public1" class="form-check-input" 
								value="0" ${empty dto || dto.is_public==0?"checked":"" }>
							<label class="form-check-label" for="is_public1">공개</label>
							<input type="radio" name="is_public" id="is_public2" class="form-check-input"
								value="1" ${dto.is_public==1?"checked":"" }>
							<label class="form-check-label" for="is_public2">비공개</label>
						</td>
					</tr>

					<tr>
						<td class="bg-light col-sm-2" scope="row">내 용</td>
						<td>
							<textarea name="content" id="ir1" class="form-control" style="width: 99%; height: 300px;">${dto.content}</textarea>
						</td>
					</tr>
					
					<tr>
						<td class="bg-light col-sm-2">첨&nbsp;&nbsp;&nbsp;&nbsp;부</td>
						<td> 
							<input type="file" name="selectFile" class="form-control">
						</td>
					</tr>
					
					<c:if test="${mode=='update'}">
						<tr>
							<td class="bg-light col-sm-2" scope="row">첨부된파일</td>
							<td> 
								<p class="form-control-plaintext">
									<c:if test="${not empty dto.saveFilename}">
										<a href="javascript:deleteFile('${dto.num}');"><i class="bi bi-trash"></i></a>
										${dto.originalFilename}
									</c:if>
									&nbsp;
								</p>
							</td>
						</tr>
					</c:if>
				</table>
				
				<table class="table table-borderless">
 					<tr>
						<td class="text-center">
							<button type="button" class="btn btn-dark" onclick="submitContents(this.form);">${mode=='update'?'수정완료':'등록하기'}&nbsp;<i class="bi bi-check2"></i></button>
							<button type="reset" class="btn btn-light">다시입력</button>
							<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/clinic/list';">${mode=='update'?'수정취소':'등록취소'}&nbsp;<i class="bi bi-x"></i></button>
							<c:if test="${mode=='update'}">
								<input type="hidden" name="num" value="${dto.num}">
								<input type="hidden" name="saveFilename" value="${dto.saveFilename}">
								<input type="hidden" name="originalFilename" value="${dto.originalFilename}">
								<input type="hidden" name="page" value="${page}">
							</c:if>
						</td>
					</tr>
				</table>
			</form>
		
		</div>
	</div>
</div>

<c:if test="${mode=='update'}">
	<script type="text/javascript">
		function deleteFile(quesion_id) {
			if( ! confirm("파일을 삭제하시겠습니까 ?") ) {
				return;
			}
			let url = "${pageContext.request.contextPath}/clinic/deleteFile?quesion_id=" + quesion_id + "&page=${page}";
			location.href = url;
		}
	</script>
</c:if>

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
</script>
<br><br><hr>
</body>
</html>	   