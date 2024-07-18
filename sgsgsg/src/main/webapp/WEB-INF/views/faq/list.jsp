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

<div class="container mt-5">
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

<!-- <body>
    <div class="container mt-5">
        <h1 class="text-center mb-4">💤 새근새근 FAQ 💤</h1>
        
        <div class="accordion" id="faqAccordion">
            회원 정책
            <div class="accordion-item">
                <h2 class="accordion-header">
                    <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne">
                        👤 회원 정책
                    </button>
                </h2>
                <div id="collapseOne" class="accordion-collapse collapse show" data-bs-parent="#faqAccordion">
                    <div class="accordion-body">
                        <h5>Q: 회원 가입은 어떻게 하나요? 🤔</h5>
                        <p>A: 홈페이지 상단의 '회원가입' 버튼을 클릭하여 필요한 정보를 입력하시면 됩니다. 만 14세 이상이어야 가입이 가능합니다.</p>
                        
                        <h5>Q: 비밀번호를 잊어버렸어요. 어떻게 해야 하나요? 🔑</h5>
                        <p>A: 로그인 페이지에서 '비밀번호 찾기' 옵션을 선택하여 이메일 인증을 통해 비밀번호를 재설정할 수 있습니다.</p>
                        
                        <h5>Q: 회원 탈퇴는 어떻게 하나요? 🚪</h5>
                        <p>A: 마이페이지에서 회원 탈퇴 신청이 가능합니다. 단, 진행 중인 주문이 있거나 미해결된 문의가 있는 경우 탈퇴가 제한될 수 있습니다.</p>
                        
                        <h5>Q: 개인정보는 안전하게 보관되나요? 🔒</h5>
                        <p>A: 네, 저희는 고객님의 개인정보 보호를 최우선으로 생각합니다. 암호화 기술을 사용하여 안전하게 저장 및 관리하고 있습니다.</p>
                        
                        <h5>Q: 회원 등급은 어떻게 올라가나요? 🏅</h5>
                        <p>A: 구매 금액과 횟수에 따라 회원 등급이 결정됩니다. 자세한 등급 기준은 마이페이지에서 확인하실 수 있습니다.</p>
                    </div>
                </div>
            </div>
            
            주문 및 결제
            <div class="accordion-item">
                <h2 class="accordion-header">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo">
                        💳 주문 및 결제
                    </button>
                </h2>
                <div id="collapseTwo" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                    <div class="accordion-body">
                        <h5>Q: 어떤 결제 수단을 이용할 수 있나요? 💰</h5>
                        <p>A: 신용카드, 체크카드, 계좌이체, 휴대폰 결제 등 다양한 방법으로 결제가 가능합니다.</p>
                        
                        <h5>Q: 주문 취소는 언제까지 가능한가요? ❌</h5>
                        <p>A: 상품 배송 준비 단계까지 주문 취소가 가능합니다. 배송이 시작된 후에는 고객센터로 문의해 주세요.</p>
                        
                        <h5>Q: 할부 결제가 가능한가요? 📅</h5>
                        <p>A: 네, 5만원 이상 구매 시 2-6개월 무이자 할부가 가능합니다. 카드사별로 조건이 다를 수 있으니 확인 부탁드립니다.</p>
                        
                        <h5>Q: 현금영수증 발급은 어떻게 하나요? 🧾</h5>
                        <p>A: 주문 시 현금영수증 신청을 선택하시거나, 마이페이지에서 구매내역을 통해 발급받으실 수 있습니다.</p>
                        
                        <h5>Q: 포인트와 쿠폰을 동시에 사용할 수 있나요? 🎟️</h5>
                        <p>A: 네, 가능합니다. 단, 일부 특가 상품이나 프로모션 상품의 경우 사용이 제한될 수 있습니다.</p>
                    </div>
                </div>
            </div>
            
            배송
            <div class="accordion-item">
                <h2 class="accordion-header">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree">
                        🚚 배송
                    </button>
                </h2>
                <div id="collapseThree" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                    <div class="accordion-body">
                        <h5>Q: 배송은 얼마나 걸리나요? ⏱️</h5>
                        <p>A: 주문 완료 후 평균 2-3일 내에 배송이 완료됩니다. 제주도 및 도서산간 지역은 1-2일 추가될 수 있습니다.</p>
                        
                        <h5>Q: 배송 조회는 어떻게 하나요? 🔍</h5>
                        <p>A: 마이페이지의 주문내역에서 송장번호를 확인하실 수 있으며, 해당 택배사 홈페이지에서 조회 가능합니다.</p>
                        
                        <h5>Q: 무료 배송 기준이 어떻게 되나요? 🆓</h5>
                        <p>A: 5만원 이상 구매 시 전국 무료 배송입니다. 단, 제주도 및 도서산간 지역은 추가 배송비가 발생할 수 있습니다.</p>
                        
                        <h5>Q: 해외 배송도 가능한가요? 🌍</h5>
                        <p>A: 현재 국내 배송만 가능합니다. 해외 배송 서비스는 추후 도입 예정입니다.</p>
                        
                        <h5>Q: 당일 배송 서비스가 있나요? 🏃</h5>
                        <p>A: 현재 당일 배송 서비스는 제공하지 않습니다. 빠른 배송을 위해 최선을 다하고 있습니다.</p>
                    </div>
                </div>
            </div>
            
            교환 및 반품
            <div class="accordion-item">
                <h2 class="accordion-header">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour">
                        🔄 교환 및 반품
                    </button>
                </h2>
                <div id="collapseFour" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                    <div class="accordion-body">
                        <h5>Q: 교환/반품 신청 기간은 어떻게 되나요? 📆</h5>
                        <p>A: 상품 수령 후 7일 이내에 신청 가능합니다. 단, 제품의 하자나 오배송의 경우 30일 이내 신청 가능합니다.</p>
                        
                        <h5>Q: 교환/반품 배송비는 누가 부담하나요? 💸</h5>
                        <p>A: 고객 변심의 경우 고객님께서 왕복 배송비를 부담하셔야 합니다. 제품 하자나 오배송의 경우 저희가 부담합니다.</p>
                        
                        <h5>Q: 사용한 제품도 반품이 가능한가요? 🛏️</h5>
                        <p>A: 사용하거나 세탁한 제품은 원칙적으로 반품이 불가능합니다. 제품 하자의 경우 고객센터로 문의해 주세요.</p>
                        
                        <h5>Q: 교환은 몇 번까지 가능한가요? 🔁</h5>
                        <p>A: 동일 상품에 대해 1회 교환이 가능합니다. 추가 교환은 반품 후 재구매로 진행됩니다.</p>
                        
                        <h5>Q: 반품 시 사은품은 어떻게 해야 하나요? 🎁</h5>
                        <p>A: 사은품도 함께 반품해 주셔야 합니다. 사은품 누락 시 반품이 제한될 수 있습니다.</p>
                    </div>
                </div>
            </div>
        </div>
    </div> -->
