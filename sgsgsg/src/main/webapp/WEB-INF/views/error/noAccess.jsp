<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

    <title>잘못된 접근 - 새근새근</title>
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
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            animation: shake 0.82s cubic-bezier(.36,.07,.19,.97) both;
        }
        .error-icon {
            font-size: 5rem;
            color: #ff6b6b;
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
        @keyframes shake {
            10%, 90% { transform: translate3d(-1px, 0, 0); }
            20%, 80% { transform: translate3d(2px, 0, 0); }
            30%, 50%, 70% { transform: translate3d(-4px, 0, 0); }
            40%, 60% { transform: translate3d(4px, 0, 0); }
        }
    </style>

    <div class="error-page">
        <div class="error-wrapper">
            <div class="error-content text-center">
                <div class="error-icon">⚠️</div>
                <h1 class="mb-4">잘못된 접근입니다</h1>
                <p class="mb-4">죄송합니다. 요청하신 페이지에 접근할 수 없습니다.</p>
                <button class="btn btn-redirect btn-lg" onclick="window.location.href='/'">
                    메인 페이지로 돌아가기
                </button>
            </div>
        </div>
    </div>
