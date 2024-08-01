<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    <title>서비스 준비 중 - 새근새근</title>
    <style>
        .preparation-page {
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
        }
        .preparation-wrapper {
            width: 100%;
            max-width: 500px;
            padding: 20px;
        }
        .preparation-content {
            background-color: white;
            padding: 2rem;
            border-radius: 10px;
            animation: fadeIn 1s ease-in-out;
        }
        .preparation-icon {
            font-size: 5rem;
            margin-bottom: 1rem;
        }
        .btn-redirect {
            background-color: #87CEEB;
            border: none;
            transition: all 0.3s ease;
        }
        .btn-redirect:hover {
            background-color: #5F9EA0;
            transform: scale(1.05);
        }
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }
    </style>
    <div class="preparation-page">
        <div class="preparation-wrapper">
            <div class="preparation-content text-center">
                <div class="preparation-icon">
                    🏗️
                </div>
                <h1 class="mb-4">서비스 준비 중입니다</h1>
                <p class="mb-4">안녕하세요. 새근새근 서비스는 현재 준비 중에 있습니다.<br>더 나은 서비스로 곧 찾아뵙겠습니다!</p>
                <p class="mb-4">서비스 오픈 일정: 2024년 9월 예정</p>
                <button class="btn btn-redirect btn-lg" onclick="window.location.href='/'">
                    홈페이지로 돌아가기
                </button>
            </div>
        </div>
    </div>