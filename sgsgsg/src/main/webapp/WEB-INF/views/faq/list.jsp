<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
.nav-tabs .nav-link {
	color: #4682B4;
}
.nav-tabs .nav-link.active {
	color: #fff;
	background-color: #35c5f0;
} 
/* 활성 탭 스타일 */
.accordion-button:not(.collapsed) {
	background-color: #e7f1ff;
	color: #000;
}
/* 열린 아코디언 버튼 */
.accordion-button:focus {
	box-shadow: 0 0 0 0.25rem rgba(135, 206, 250, 0.25);
}
 /* 포커스 효과 */
.accordion-body {
	background-color: #f8f9fa;
} 
/* 답변 배경색 */
h1, h2 {
	color: #000;
} 
/* 제목 색상 */
.accordion-item.hidden, .accordion-item[style*="display: none"] {
	display: none !important;
} 
/* 숨김 처리 */
</style>

<div class="inner">
    <h1 class="text-center mb-4">💤 새근새근 FAQ 💤</h1>
    
    <ul class="nav nav-tabs mb-3" id="myTab" role="tablist">
        <li class="nav-item" role="presentation">
            <button class="nav-link active" id="all-tab" data-bs-toggle="tab" data-category="all" type="button" role="tab">전체</button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link" id="회원 정책-tab" data-bs-toggle="tab" data-category="회원 정책" type="button" role="tab">👤 회원 정책</button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link" id="주문 및 결제-tab" data-bs-toggle="tab" data-category="주문 및 결제" type="button" role="tab">💳 주문 및 결제</button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link" id="배송-tab" data-bs-toggle="tab" data-category="배송" type="button" role="tab">🚚 배송</button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link" id="교환 및 반품-tab" data-bs-toggle="tab" data-category="교환 및 반품" type="button" role="tab">🔄 교환 및 반품</button>
        </li>
    </ul>
    
    <div class="tab-content" id="myTabContent">
        <div class="tab-pane fade show active" id="faqContent" role="tabpanel">
            <div class="accordion" id="accordionAll">
                <c:forEach var="faq" items="${list}" varStatus="status">
                    <div class="accordion-item" data-category="${faq.category}">
                        <h2 class="accordion-header">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq${faq.faq_Num}">
                                ${faq.question}
                            </button>
                        </h2>
                        <div id="faq${faq.faq_Num}" class="accordion-collapse collapse" data-bs-parent="#accordionAll">
                            <div class="accordion-body">
                                ${faq.answer}
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>

<script>
$(document).ready(function() {
    $('#myTab button').on('click', function (e) {
        e.preventDefault();
        $(this).tab('show');
        
        var category = $(this).data('category');
        console.log("선택된 카테고리:", category);
        
        if (category === 'all') {
            $('.accordion-item').show();
        } else {
            $('.accordion-item').hide();
            $('.accordion-item[data-category="' + category + '"]').show();
        }
    });

    // 아코디언 기능 초기화
    $('.accordion-button').on('click', function() {
        $(this).toggleClass('collapsed');
        var target = $(this).data('bs-target');
        $(target).toggleClass('show');
    });
});
</script>