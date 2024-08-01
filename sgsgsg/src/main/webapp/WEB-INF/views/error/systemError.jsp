<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   response.setStatus(HttpServletResponse.SC_OK);
%>
<title>시스템 오류 - 새근새근</title>
<style>
    .error-page {
        display: flex;
        align-items: center;
        justify-content: center;
        min-height: 100vh;
    }
    .error-wrapper {
        width: 100%;
        max-width: 500px;
        padding: 20px;
    }
    .error-content {
        background-color: white;
        padding: 2rem;
        border-radius: 10px;
        /* box-shadow: 0 0 20px rgba(0, 0, 0, 0.1); */
    }
    .error-icon {
        font-size: 4rem;
        color: #dc3545;
        margin-bottom: 1rem;
    }
    .btn-redirect {
         background-color: #87CEEB;
        border: none;
        transition: all 0.3s ease;
    }
    .btn-redirect:hover {
        background-color: #0056b3;
        transform: scale(1.05);
    }
</style>
<div class="error-page">
    <div class="error-wrapper">
        <div class="error-content text-center">
            <div class="error-icon">
                <i class="bi bi-exclamation-triangle"></i>
            </div>
            <h4 class="mb-4 fw-bold">시스템 오류</h4>
            <div class="alert alert-danger mb-4">
                데이터 처리중 오류가 발생했습니다.<br>
                잠시후 다시 시도 해보시기 바랍니다.
            </div>
            <button class="btn btn-redirect btn-lg" onclick="location.href='${pageContext.request.contextPath}/';">
                메인화면으로 이동 <i class="bi bi-arrow-counterclockwise"></i>
            </button>
        </div>
    </div>
</div>