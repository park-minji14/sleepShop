<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>

style>body {
	background-color: #f8f9fa;
}

.container {
	max-width: 1000px;
}

.card {
	box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075);
}

.btn-primary {
	background-color: #35c5f0;
	border-color: #35c5f0;
}

.btn-primary:hover {
	background-color: #2bb0d8;
	border-color: #2bb0d8;
}

.form-container {
	position: relative;
}

.form-submit-btn {
	text-align: right;
	margin-top: 15px;
}

.table th {
	text-align: center;
}
</style>
<body>
    <div class="container mt-5">
        <h2 class="text-center mb-4">FAQ 관리</h2>
        
        <div class="card mb-4">
            <div class="card-header bg-primary text-white">
                FAQ 등록/수정
            </div>
            <div class="card-body form-container">
                <form id="faqForm">
                <input type="hidden" id="userID" value="${sessionScope.member.userId}">
                    <div class="mb-3">
                        <label for="category" class="form-label">카테고리</label>
                        <select class="form-select" id="category" required>
                            <option value="">카테고리 선택</option>
                            <option value="회원 정책">회원 정책</option>
                            <option value="주문 및 결제">주문 및 결제</option>
                            <option value="배송">배송</option>
                            <option value="교환 및 반품">교환 및 반품</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="question" class="form-label">질문</label>
                        <input type="text" class="form-control" id="question" required>
                    </div>
                    <div class="mb-3">
                        <label for="answer" class="form-label">답변</label>
                        <textarea class="form-control" id="answer" rows="5" required></textarea>
                    </div>
                    <div class="mb-3 form-check">
                        <input type="checkbox" class="form-check-input" id="isVisible" checked>
                        <label class="form-check-label" for="isVisible">노출 여부</label>
                    </div>
                    <div class="form-submit-btn">
                        <button type="submit" class="btn btn-primary">등록/수정</button>
                    </div>
                </form>
            </div>
        </div>
        
        <div class="card">
            <div class="card-header bg-primary text-white">
                FAQ 목록
            </div>
            <div class="card-body">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>카테고리</th>
                            <th>질문</th>
                            <th>노출 여부</th>
                            <th>작성일자</th>
                            <th>수정일자</th>
                            <th>관리</th>
                        </tr>
                    </thead>
                    <tbody id="faqList">
                        <!-- FAQ 목록이 여기에 동적으로 추가됩니다 -->
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <script>
        $(document).ready(function() {
        	$('#faqForm').on('submit', function(e) {
                e.preventDefault();
                var faqData = {
                    category: $('#category').val(),
                    question: $('#question').val(),
                    answer: $('#answer').val(),
                    is_Active: $('#isVisible').is(':checked') ? 1 : 0,
                    userID: $('#userID').val() // 히든 필드에서 userID 값을 읽어 포함
                    
                    

                };
                $.ajax({
                    url: 'faq',
                    type: 'POST',
                    contentType: 'application/json',
                    data: JSON.stringify(faqData),
                    success: function(response) {
                        if(response.status === 'success') {
                            alert('FAQ가 성공적으로 등록되었습니다.');
                            loadFaqList();
                        } else {
                            alert(response.message || 'FAQ 등록에 실패했습니다.');
                        }
                    }
                });
            });

        	console.log("User ID:", $('#userID').val());
        	
            function loadFaqList() {
                // 이전에 사용했던 리스트 출력 코드
                <c:forEach var="faq" items="${list}" varStatus="status">
                    $('#faqList').append(`
                        <tr>
                            <td>${faq.category}</td>
                            <td>${faq.question}</td>
                            <td>${faq.is_Active == 1 ? '노출' : '숨김'}</td>
                            <td>${faq.created_Date}</td>
                            <td>${faq.updated_Date || '-'}</td>
                            <td>
                                <button class="btn btn-sm btn-warning edit-faq" data-id="${faq.faq_Num}">수정</button>
                                <button class="btn btn-sm btn-danger delete-faq" data-id="${faq.faq_Num}">삭제</button>
                            </td>
                        </tr>
                    `);
                </c:forEach>
            }

            loadFaqList();

            $(document).on('click', '.edit-faq', function() {
                var id = $(this).data('id');
                console.log('FAQ 수정:', id);
            });

            $(document).on('click', '.delete-faq', function() {
                var id = $(this).data('id');
                if(confirm('정말 이 FAQ를 삭제하시겠습니까?')) {
                    console.log('FAQ 삭제:', id);
                    loadFaqList();
                }
            });
        });
    </script>
</body>