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
        <c:forEach var="inquiry" items="${inquiries}">
            <tr class="inquiry-row" data-bs-toggle="modal" data-bs-target="#inquiryModal" data-inquiry-id="${inquiry.inquiryNum}">
                <td>${inquiry.inquiryNum}</td>
                <td>${inquiry.inquiryType}</td>
                <td>${inquiry.productName}</td>
                <td>${inquiry.question}</td>
                <td>${inquiry.userId}</td>
                <td>${inquiry.question_Date}</td>
                <td>
                    <span class="badge ${inquiry.answerStatus == '답변완료' ? 'bg-success' : 'bg-warning'}">
                        ${inquiry.answerStatus}
                    </span>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>
        
<!-- 페이징 -->
<div class="page-navigation">
    ${paging}
</div>
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
<script>
$(document).ready(function() {
$('#inquiryModal').on('show.bs.modal', function (event) {
    var btn = $(event.relatedTarget);
    var id = btn.data('inquiry-id');
    var modal = $(this);

    $.ajax({
        url: 'getInquiry',
        type: 'GET',
        data: { inquiryNum: id },
        success: function(data) {
            modal.find('#inquiryNumber').text(data.inquiryNum);
            modal.find('#inquiryCategory').text(data.inquiryType); // 카테고리 표시
            modal.find('#productName').text(data.productName);
            modal.find('#inquiryAuthor').text(data.userId);
            modal.find('#inquiryDate').text(data.question_Date);
            modal.find('#inquiryStatus').text(data.answerStatus); // 답변 상태 표시
            modal.find('#inquiryContent').text(data.question);

            var fileList = modal.find('#attachedFilesList');
            fileList.empty();
            if (data.filename) {
                var files = data.filename.split(',');
                files.forEach(function(file) {
                    fileList.append('<li>' + file + '</li>');
                });
            }

            if (data.answer) {
                modal.find('#responseContent').text(data.answer);
                modal.find('#responseDate').text(data.answer_Date);
                modal.find('#responseSection').show();
                modal.find('#responseFormSection').hide();
            } else {
                modal.find('#responseSection').hide();
                modal.find('#responseFormSection').show();
            }
        },
        error: function() {
            alert('Failed to load inquiry.');
        }
    });
});

$('#responseForm').submit(function(e) {
    e.preventDefault();
    var id = $('#inquiryModal').find('#inquiryNumber').text();
    var answer = $('#newResponseContent').val();
    var answerId = 'admin'; // 아이디를 고정값으로 둬야 하나 고민..

    console.log("Submitting answer for inquiry ID:", id);
    console.log("Answer content:", answer);
    console.log("Answerer ID:", answerId);

    $.ajax({
        url: 'saveAnswer',
        type: 'POST',
        data: { 
            inquiryNum: id,
            answer: answer,
            answerId: answerId
        },
        success: function(response) {
            console.log("Server response:", response);
            if(response.status === 'success') {
                alert(response.message);
                $('#inquiryModal').modal('hide');
                location.reload();
            } else {
                alert("Failed to save answer. Server message: " + response.message);
            }
        },
        error: function(jqXHR, textStatus, errorThrown) {
            console.error("AJAX Error:");
            console.error("Status:", textStatus);
            console.error("Error:", errorThrown);
            console.error("Response Text:", jqXHR.responseText);
            console.error("Status Code:", jqXHR.status);
            alert('Failed to save answer. Error: ' + textStatus + '. See console for more details.');
        	}
    	});
	});
});
</script>