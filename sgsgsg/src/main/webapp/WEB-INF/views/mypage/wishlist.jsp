<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>

.thisCategory {
    margin-left: 0;
    position: relative;
    z-index: 1;
}


.thisCategory:after {
    display: block;
    position: absolute;
    left: 0;
    bottom: 0;
    width: 100%;
    height: 11px;
    background: #81DAF5;
    content: '';
    z-index: -1;
}


.navi{
	margin-bottom: 80px;
}


</style>





<div class="tab-pane fade show active" id="recent">
    <h4 class="mb-4" style="text-align: center;   font-size: 33px;  font-weight: 600; margin: 90px;">찜한 상품</h4>
    <dl>
        <div class="navi" style="text-align: center;">
            <a href="${pageContext.request.contextPath}" style="color: gray;">홈 &gt;</a>
            <a href="${pageContext.request.contextPath}/mypage/main" style="color: gray;">마이페이지 &gt;</a>
            <a style="font: #888;" class="thisCategory">찜한 상품</a>
        </div>
    </dl>
    <div class="col-md-6">
        <select class="form-select" style="width: 200px;">
            <option>카테고리</option>
            <option>침구</option>
            <option>가전</option>
            <option>의류</option>
            <option>향초</option>
            <option>조명</option>
            <option>영양제</option>
            <option>수면용품</option>
            <option>졸음방지용품</option>
        </select>
    </div>
    <section class="featured-products">
        <div class="inner">
		<p style="text-align: right; margin-right: 20px;">총 <span id="totalWishlistCount">${list.size()}</span>개의 상품</p>
            <div id="wishlistContainer" class="product-grid">
                <c:forEach var="item" items="${list}">
                    <div class="product-item" data-product-id="${item.productNum}">
                        <a href="${pageContext.request.contextPath}/product/details?productNum=${item.productNum}">
                            <div class="image-wrapper" style="position: relative;">
                                <img src="${pageContext.request.contextPath}/uploads/product/${item.thumbnail}"
                                    alt="${item.productName}">
                                <div class="bookmark active" data-product-id="${item.productNum}"></div>
                            </div> 
                            <span class="product-info"> 
                                <span class="product-name">${item.productName}</span>
                                <c:if test="${item.discountRate > 0}">
                                    <span class="discount"> 
                                        ${item.discountRate}% 
                                        <span class="price"> 
                                            <fmt:formatNumber value="${item.price * (1 - item.discountRate / 100)}" pattern="#,###원" />
                                        </span>
                                    </span>
                                </c:if>
                                <c:if test="${item.discountRate == 0}">
                                    <span class="price"> 
                                        <fmt:formatNumber value="${item.price}" pattern="#,###원" />
                                    </span>
                                </c:if>
                                <span class="rating"> 
                                    ★ <fmt:formatNumber value="${item.score}" pattern="#.#" /> 
                                    <span class="review-count">리뷰 ${item.reviewCount}</span>
                                </span>
                            </span>
                        </a>
                    </div>
                </c:forEach>
            </div>
        </div>
    </section>
</div>

<script>
$(document).ready(function() {
    // 북마크 클릭 이벤트 처리
    $('.bookmark').on('click', function(e) {
        e.preventDefault();
        e.stopPropagation();
        var productNum = $(this).data('product-id');
        toggleWishlist(productNum);
    });

    // 초기 총 개수 업데이트
    updateTotalCount();
});

function toggleWishlist(productNum) {
    $.ajax({
        url: "${pageContext.request.contextPath}/wishlist/toggle",
        type: "POST",
        data: {productNum: productNum},
        dataType: "json",
        success: function(data) {
            if(data.state === "true") {
                if (!data.isAdded) {
                    removeProductFromWishlist(productNum);
                }
            } else {
                alert(data.message);
            }
        },
        error: function(xhr, status, error) {
            console.error("북마크실패:", error);
        }
    });
}

function removeProductFromWishlist(productNum) {
    $('.product-item[data-product-id="' + productNum + '"]').remove();
    updateTotalCount();
    if($('.product-item').length === 0) {
        $("#wishlistContainer").html('<p>위시리스트가 비어있습니다.</p>');
    }
}

function updateTotalCount() {
    var count = $('.product-item').length;
    $('#totalWishlistCount').text(count);
}
</script>