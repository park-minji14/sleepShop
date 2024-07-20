<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>

style>body {
	background-color: #f8f9fa;
}

.btn-primary {
	background-color: #35c5f0;
	border-color: #35c5f0;
}

.btn-primary:hover {
	background-color: #2bb0d8;
	border-color: #2bb0d8;
}

.form-submit-btn {
	text-align: right;
	margin-top: 15px;
}

.table th {
	text-align: center;
}

/*스타일 수정2*/

body {
    background-color: #f8f9fa;
}
.container {
    max-width: 1000px;
}
.card {
    box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075);
}
.btn-primary {
    background-color: #3949ab;
    border-color: #3949ab;
}
.btn-primary:hover {
    background-color: #303f9f;
    border-color: #303f9f;
}
.form-container {
    position: relative;
}

.card-header {
    background-color: #3949ab;
    color: white;
}
.btn-edit {
    background-color: #ffa000;
    border-color: #ffa000;
    color: white;
}
.btn-edit:hover {
    background-color: #ff8f00;
    border-color: #ff8f00;
    color: white;
}
.btn-delete {
    background-color: #d32f2f;
    border-color: #d32f2f;
    color: white;
}
.btn-delete:hover {
    background-color: #c62828;
    border-color: #c62828;
    color: white;
}
</style>

    <div class="container mt-5">
        <h2 class="text-center mb-4">FAQ 관리</h2>
        <div class="mb-3">
            <a href="${pageContext.request.contextPath}/faq/list" class="btn btn-primary">FAQ 페이지로 이동</a>
        </div>
        <div class="card mb-4">
            <div class="card-header">
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
            <div class="card-header">
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
                    </tbody>
                </table>
            </div>
        </div>
    </div>

<script>
$(document).ready(function() {
	
	// FAQ 수정을 위해 데이터 불러오는 함수
	function loadFaqForEdit(id) {
	    // AJAX로 서버에서 FAQ 정보 가져옴
	    // 성공하면 폼에 데이터 채우고 수정 모드로 변경함
	    // 실패하면 에러 메시지 보여줌
	    $.ajax({
	        url: 'getFaq',
	        type: 'GET',
	        data: { faqNum: id },
	        success: function(faq) {
	            if (faq) {
	                $('#category').val(faq.category);
	                $('#question').val(faq.question);
	                $('#answer').val(faq.answer);
	                $('#isVisible').prop('checked', faq.is_Active == 1);
	                $('#faqForm').data('mode', 'edit');
	                $('#faqForm').data('id', faq.faq_Num);
	                
	                $('.form-submit-btn button').text('수정');

	                $('html, body').animate({
	                    scrollTop: $("#faqForm").offset().top
	                }, 500);
	            } else {
	                alert('선택한 FAQ를 찾을 수 없습니다.');
	            }
	        },
	        error: function(xhr, status, error) {
	            console.error('Error loading FAQ:', status, error);
	            alert('FAQ 정보를 불러오는 중 오류가 발생했습니다.');
	        }
	    });
	}

    $(document).on('click', '.edit-faq', function() {
        var id = $(this).data('id');
        loadFaqForEdit(id);
    });

    //FAQ 목록 불러오는 함수 
    function loadFaqList() {
        // AJAX로 서버에서 FAQ 목록 가져옴
        // 성공하면 updateFaqTable 함수 호출해서 테이블 업데이트함
        // 실패하면 콘솔에 에러 로그 남김
        $.ajax({
            url: 'list',
            type: 'GET',
            data: { userType: 'admin' },
            dataType: 'json',
            success: function(response) {     
                updateFaqTable(response);
            },
            error: function(xhr, status, error) {
                console.error('Error FAQ list:', status, error);
            }
        });
    }
	
    //FAQ 테이블 업데이트 함수 
    function updateFaqTable(faqList) {
        // 받은 FAQ 목록으로 테이블 내용 새로 만듦
        // 각 FAQ마다 수정, 삭제 버튼 추가함
        var tableBody = $('#faqList');
        tableBody.empty();

        $.each(faqList, function(index, faq) {
            var row = '<tr>' +
                '<td>' + faq.category + '</td>' +
                '<td>' + faq.question + '</td>' +
                '<td>' + (faq.is_Active == 1 ? '노출' : '숨김') + '</td>' +
                '<td>' + formatDate(faq.created_Date) + '</td>' +
                '<td>' + (faq.updated_Date ? formatDate(faq.updated_Date) : '') + '</td>' +
                '<td>' +
                '<button class="btn btn-sm btn-edit edit-faq" data-id="' + faq.faq_Num + '">수정</button> ' +
                '<button class="btn btn-sm btn-delete delete-faq" data-id="' + faq.faq_Num + '">삭제</button>' +
                '</td>' +
                '</tr>';
            tableBody.append(row);
        });
    }

    //날짜 표시 형식 함수
    //padZero -> 10미만이면 앞에 0붙여줌..
    //(예: "2023-05-09 14:05")으로 표시됨.
     function formatDate(dateString) {
        if (!dateString) return '';
        var date = new Date(dateString);
        return date.getFullYear() + '-' + 
               padZero(date.getMonth() + 1) + '-' + 
               padZero(date.getDate()) + ' ' + 
               padZero(date.getHours()) + ':' + 
               padZero(date.getMinutes());
    }

    function padZero(num) {
        return num < 10 ? '0' + num : num;
    }

 	//FAQ 삭제 
    function deleteFaq(id) {
	    // 삭제 확인 후 AJAX로 서버에 삭제 요청 보냄
	    // 성공하면 목록 새로고침하고 메시지 보여줌
	    // 실패하면 에러 메시지 보여줌
        if(confirm('정말 이 FAQ를 삭제하시겠습니까?')) {
            $.ajax({
                url: 'delete',
                type: 'GET',
                data: { faqNum: id },
                success: function(response) {
                    if(response.status === 'success') {
                        alert('FAQ가 성공적으로 삭제되었습니다.');
                        loadFaqList();
                    } else {
                        alert('FAQ 삭제 중 오류가 발생했습니다: ' + response.message);
                    }
                },
                error: function(xhr, status, error) {
                    console.error('Error deleting FAQ:', status, error);
                    alert('FAQ 삭제 중 오류가 발생했습니다.');
                }
            });
        }
    }

    $(document).on('click', '.delete-faq', function() {
        var id = $(this).data('id');
        deleteFaq(id);
    });	

    $(document).on('click', '.edit-faq', function() {
        var id = $(this).data('id');
        loadFaqForEdit(id);
    });
	
    // FAQ 폼 제출 이벤트 처리
    $('#faqForm').submit(function(e) {
        // 폼 기본 제출 동작 막음
        // 수정 모드인지 새로 등록하는지 확인함
        // FAQ 데이터 객체 만들어서 AJAX로 서버에 전송함
        // 성공하면 폼 리셋하고 목록 새로고침함
        // 실패하면 에러 메시지 보여줌
        e.preventDefault();
        var mode = $(this).data('mode') || 'add';
        var url = mode === 'edit' ? 'update' : 'faq';
        console.log('Checkbox state:', $('#isVisible').is(':checked'));
        var faqData = {
            faq_Num: mode === 'edit' ? $(this).data('id') : null,
            category: $('#category').val(),
            question: $('#question').val(),
            answer: $('#answer').val(),
            is_Active: $('#isVisible').is(':checked') ? 1 : 0
        };
        console.log('Sending FAQ data:', faqData);

        $.ajax({
            url: url,
            type: 'POST',  // 항상 POST 방식 사용
            contentType: 'application/json',
            data: JSON.stringify(faqData),
            success: function(response) {
                console.log('Ajax success. Response:', response);
                if(response.status === 'success') {
                    alert(response.message);
                    $('#faqForm')[0].reset();
                    $('#faqForm').removeData('mode').removeData('id');
                    $('.form-submit-btn button').text('등록');
                    loadFaqList();
                } else {
                    alert(response.message);
                }
            },
            error: function(xhr, status, error) {
                console.error('Ajax error:', status, error);
                console.log('XHR Response:', xhr.responseText);
                alert('FAQ ' + (mode === 'edit' ? '수정' : '등록') + ' 중 오류가 발생했습니다.');
            }
        });
    });
    // 페이지 로드 시 FAQ 목록 불러옴
    loadFaqList();
});
</script>