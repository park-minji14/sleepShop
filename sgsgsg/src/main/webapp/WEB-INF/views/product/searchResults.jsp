<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet"
    href="${pageContext.request.contextPath}/resources/css/page/main.css"
    type="text/css">
<div class="container">
    <div class="inner">
        <div class="main-content">
            <c:choose>
                <c:when test="${empty list}">
                    <div class="no-results">
                        <img
                            src="${pageContext.request.contextPath}/resources/images/no-results.png"
                            alt="검색 결과 없음">
                        <p>검색된 결과가 없습니다.</p>
                    </div>
                </c:when>
                <c:otherwise>
                    <section class="featured-products">
                        <h2>"${searchTerm}" 검색 결과</h2>
                        <div class="product-grid">
                            <c:forEach var="product" items="${list}">
                                <div class="product-item">
                                    <a href="${pageContext.request.contextPath}/product/details?productNum=${product.productNum}">
                                        <div class="image-wrapper">
                                            <img src="${pageContext.request.contextPath}/uploads/product/${product.thumbnail}"
                                                alt="${product.productName}">
                                            <div class="bookmark" data-product-id="${product.productNum}"></div>
                                        </div> 
                                        <span class="product-info"> 
                                            <span class="product-name">${product.productName}</span>
                                            <span class="discount"> ${product.discountRate}% 
                                                <span class="price"> 
                                                    <fmt:formatNumber value="${product.salePrice}" pattern="#,###원" />
                                                </span>
                                            </span> 
                                            <span class="rating"> 
                                                ★ <fmt:formatNumber value="${product.score}" pattern="#.#" /> 
                                                <span class="review-count">리뷰 ${product.reviewCount}</span>
                                            </span>
                                        </span>
                                    </a>
                                </div>
                            </c:forEach>
                        </div>
                    </section>
                    <!-- 페이징 처리 -->
                    <div class="pagination">${paging}</div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>

<script>
function loadPage(page) {
    var searchTerm = "${searchTerm}";  // 서버에서 전달받은 검색어
    var url = "${pageContext.request.contextPath}/product/search?searchTerm=" + encodeURIComponent(searchTerm) + "&pageNo=" + page;
    location.href = url;
}
</script>