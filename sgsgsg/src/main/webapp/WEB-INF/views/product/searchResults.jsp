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
									<a
										href="${pageContext.request.contextPath}/product/details/${product.productNum}">
										<img
										src="${pageContext.request.contextPath}/uploads/product/${product.thumbnail}"
										alt="${product.productName}"> <span class="product-info">
											<span>${product.productName}</span> <span class="discount">
												${product.discountRate}% <span class="price"> <fmt:formatNumber
														value="${product.price}" pattern="#,###원" />
											</span>
										</span> <span class="rating"> ★ ${product.score} <span
												class="review-count">리뷰 ${product.reviewCount}</span>
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