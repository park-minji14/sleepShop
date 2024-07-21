<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
.container {
	display: flex;
    justify-content: center;
    align-items: center;
}


.submit-style {
	border: 3px solid #35c5f0;  
    border-radius: 30px;
    padding: 20px;
    margin: 10px 0; 
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);  
    background-color: #fff;
    width: 650px;  
    height: 300px; 
    font-size: 24px;
    display: flex;
    justify-content: center; 
    align-items: center;
    text-align: center;
}



@keyframes btncolor {
	0% {}
	100% {background: #35c5f0; color: white; transform: translateY(2px);}
}

.return-btn {
	width: 100px;
	height: 40px;
	background-color: white;
	border-radius: 10px;
	border: 2px solid #35c5f0;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
	display: flex;
    justify-content: center; 
    align-items: center;
    text-align: center;
} 

.return-btn:hover {
	animation: btncolor 0.3s forwards;
}


</style>


<div class="container">
    <div class="body-container">
    
    	<form id="editProfileForm" action="${pageContext.request.contextPath}/expertapply/submit" method="post">
	    	<div class="submit-style">
	    		<span>성공적으로 신청이 완료되었습니다.</span>
	    	</div>
	    	<br>
	    	
	    	
    	</form>
    	
    	<button type="button" class="return-btn" onclick="location.href='${pageContext.request.contextPath}/clinic/list';">돌아가기</button>
    	
		<div style="height: 200px;"></div>  
    	
    </div>
</div>  

<script>
window.onload = function() {
    if (performance.navigation.type === 1) {
        window.location.href = "${pageContext.request.contextPath}/clinic/list";
    }
};

</script>



