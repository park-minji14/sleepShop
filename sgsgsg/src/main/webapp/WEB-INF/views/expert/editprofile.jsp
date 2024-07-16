<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
.container {
    display: flex;
    justify-content: center;
    align-items: center;
}


</style>

<div class="container">
    <div class="body-container">
        <div class="body-title">
            <h2 style="color: #35c5f0; font-weight: bold;"> 프로필 수정 </h2>
        </div>

        <form action="${pageContext.request.contextPath}/expert/editProfile" method="post">
            <input type="hidden" name="userId" value="${dto.userId}">
            <div>
                <label for="license">취득 자격증:</label>
                <textarea id="license" name="license" rows="5" cols="30">${dto.license}</textarea>
            </div>
            <div>
                <label for="career">경력 사항:</label>
                <textarea id="career" name="career" rows="5" cols="30">${dto.career}</textarea>
            </div>
            <div>
                <label for="exposed_content">자기소개:</label>
                <textarea id="exposed_content" name="exposed_content" rows="5" cols="30">${dto.exposed_content}</textarea>
            </div>
            <button type="submit">업데이트</button>
        </form>
    </div>
</div>


<div style="height: 200px;">

</div>

<br><br><hr>