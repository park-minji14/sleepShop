<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    <style>
        :root {
            --main-color: #3949ab;
        }
        .btn-primary, .bg-primary {
            background-color: var(--main-color) !important;
            border-color: var(--main-color) !important;
        }
        .text-primary {
            color: var(--main-color) !important;
        }
        .inquiry-row:hover {
            cursor: pointer;
            background-color: #f8f9fa;
        }
        .modal-section {
            background-color: #f8f9fa;
            border: 1px solid #dee2e6;
            border-radius: 0.25rem;
            padding: 1rem;
            margin-bottom: 1rem;
        }
        .modal-section h6 {
            color: var(--main-color);
            border-bottom: 2px solid var(--main-color);
            padding-bottom: 0.5rem;
            margin-bottom: 1rem;
        }
        .info-item {
            display: flex;
            margin-bottom: 0.5rem;
        }
        .info-label {
            font-weight: bold;
            width: 120px;
            flex-shrink: 0;
        }
        .info-value {
            flex-grow: 1;
        }
        #responseSection {
            display: none;
        }
    </style>
    <div class="container mt-5">
        <h2 class="text-primary mb-4">상품 문의 관리</h2>
        
        <table class="table table-hover">
            <thead class="bg-primary text-white">
                <tr>
                    <th>번호</th>
                    <th>카테고리</th>
                    <th>상품명</th>
                    <th>문의 내용</th>
                    <th>작성자</th>
                    <th>작성일</th>
                    <th>상태</th>
                </tr>
            </thead>
            <tbody>
                <tr class="inquiry-row" data-bs-toggle="modal" data-bs-target="#inquiryModal" data-inquiry-id="1">
                <!-- dPTl 예시 떼이터.. -->
                    <td>1</td>
                    <td>상품</td>
                    <td>피자먹고싶다</td>
                    <td>무슨 피자?</td>
                    <td>박민*지</td>
                    <td>2024-07-22</td>
                    <td><span class="badge bg-warning" id="statusBadge1">답변대기</span></td>
                </tr>         
            </tbody>
        </table>
    </div>

    <!-- 문의 상세 및 답변 모달 -->
    <div class="modal fade" id="inquiryModal" tabindex="-1" aria-labelledby="inquiryModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header bg-primary text-white">
                    <h5 class="modal-title" id="inquiryModalLabel">문의 상세 및 답변</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="modal-section">
                        <h6>문의 정보</h6>
                        <div class="info-item">
                            <span class="info-label">문의 번호:</span>
                            <span class="info-value" id="inquiryNumber"></span>
                        </div>
                        <div class="info-item">
                            <span class="info-label">카테고리:</span>
                            <span class="info-value" id="inquiryCategory"></span>
                        </div>
                        <div class="info-item">
                            <span class="info-label">상품명:</span>
                            <span class="info-value" id="productName"></span>
                        </div>
                        <div class="info-item">
                            <span class="info-label">문의자:</span>
                            <span class="info-value" id="inquiryAuthor"></span>
                        </div>
                        <div class="info-item">
                            <span class="info-label">문의 일시:</span>
                            <span class="info-value" id="inquiryDate"></span>
                        </div>
                        <div class="info-item">
                            <span class="info-label">상태:</span>
                            <span class="info-value" id="inquiryStatus"></span>
                        </div>
                    </div>
                    
                    <div class="modal-section">
                        <h6>문의 내용</h6>
                        <p id="inquiryContent"></p>
                    </div>
                    
                    <div class="modal-section">
                        <h6>첨부 파일</h6>
                        <ul id="attachedFilesList"></ul>
                    </div>
                    
                    <div class="modal-section" id="responseSection">
                        <h6>답변 내용</h6>
                        <p id="responseContent"></p>
                        <div class="info-item">
                            <span class="info-label">답변 일시:</span>
                            <span class="info-value" id="responseDate"></span>
                        </div>
                    </div>
                    
                    <div class="modal-section" id="responseFormSection">
                        <h6>답변 작성</h6>
                        <form id="responseForm">
                            <div class="mb-3">
                                <textarea class="form-control" id="newResponseContent" rows="3" placeholder="답변을 입력하세요..."></textarea>
                            </div>
                            <div class="mb-3">
                                <input class="form-control" type="file" id="responseAttachment">
                            </div>
                            <button type="submit" class="btn btn-primary">답변 등록</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
   