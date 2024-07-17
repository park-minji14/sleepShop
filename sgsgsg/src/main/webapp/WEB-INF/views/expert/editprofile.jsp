<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
.container {
    display: flex;
    justify-content: center;
    align-items: center;
}

.edit-container {
	width: 700px;
}


.edit-style {
	border: 3px solid #35c5f0;  
    border-radius: 30px;
    padding: 20px;
    margin: 10px 0; 
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);  
    background-color: #fff;
    width: 500px;  
    height: 40px;
    font-size: 16px;
}


.edit-style2 {
	border: 3px solid #35c5f0;  
    border-radius: 30px;
    padding: 20px;
    margin: 10px 0; 
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);  
    background-color: #fff;
    width: 800px;  
    height: 400px; 
    font-size: 16px;
}


.profile-update {
	width: 110px;
	height: 40px;
	background-color: white;
	border-radius: 10px;
	border: 2px solid #35c5f0;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3); 
}


</style>

<div class="container">
    <div class="body-container">
        <div class="body-title">
            <h2 style="color: #35c5f0; font-weight: bold;"> 프로필 수정 </h2>
        </div>
		<br><br>
        <form id="editProfileForm" action="${pageContext.request.contextPath}/expert/editprofile" method="post">
            <input type="hidden" name="userId" value="${dto.userId}">
            <div class="edit-container">
	            <div>
	                <h4>취득 자격증</h4>
	            </div>
	            <div>
	                <input type="text" name="license1" class="edit-style" value="${dto.license1}">
	            </div>
	            <div>
	                <input type="text" name="license2" class="edit-style" value="${dto.license2}">
	            </div>
	            <div>
	                <input type="text" name="license3" class="edit-style" value="${dto.license3}">
	            </div>
            </div>
            
            <br><br>
            
            <div class="edit-container">
	            <div>
	                <h4>경력 사항</h4>
	            </div>
	            <div> 
	                <input type="text" name="career1" class="edit-style" value="${dto.career1}">       
	            </div>
	            <div> 
	                <input type="text" name="career2" class="edit-style" value="${dto.career2}">         
	            </div>
	            <div> 
	                <input type="text" name="career3" class="edit-style" value="${dto.career3}">         
	            </div>
            </div>
            
            <br><br>
            
            <div class="edit-container">
	            <div>
	                <h4>자기소개</h4>
	            </div>
	            <div> 
	                <textarea name="exposed_content" class="edit-style2">${dto.exposed_content}</textarea>        
	            </div> 
            </div>
            
            <br><br>
            
            <button type="submit" class="profile-update" onclick="submitProfileUpdate()">업데이트</button>
        </form>
    </div>
</div>


<div style="height: 200px;">

</div>

<script>
function submitProfileUpdate() {
    document.getElementById('editProfileForm').submit();
}

</script>

<br><br><hr>