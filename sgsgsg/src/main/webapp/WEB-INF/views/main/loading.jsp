<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<title>페이지 준비중</title>
    <style>
        body {
            background-color: #ffffff;
        }
        .loader {
            width: 80px;
            height: 80px;
            border: 5px solid #e8eaf6;
            border-top: 5px solid #1a237e;
            border-radius: 50%;
            animation: spin 1s linear infinite;
            margin: 0 auto 2rem;
        }
        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }
    </style>

    <div class="container d-flex align-items-center justify-content-center" style="height: 100vh;">
        <div class="text-center">
            <div class="loader"></div>
            <h1 class="mb-4">페이지 준비중입니다</h1>
            <p class="lead">요청하신 페이지가 현재 준비 중입니다.</p>
            <p>빠른 시일 내에 업데이트 하도록 하겠습니다.</p>
        </div>
    </div>
