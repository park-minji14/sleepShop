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
    width: 800px;  
    height: 300px; 
    font-size: 16px;
}

</style>


<div class="container">
    <div class="body-container">
    
    	<form id="editProfileForm" action="${pageContext.request.contextPath}/expertapply/submit" method="post">
	    	<div class="submit-style">
	    	dd
	    	</div>
    	</form>
    	
    </div>
</div>  