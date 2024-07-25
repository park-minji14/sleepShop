<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- CSS: 메인전용 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/page/main.css"
	type="text/css">


<div class="tab-pane fade show active" id="recent">
	<h4 class="mb-4"
		style="text-align: center; font-size: 40px; margin: 50px;">찜한 상품</h4>
	<dl>

		<div class="navi" style="text-align: center;">
			<a href="${pageContext.request.contextPath}">홈 &gt;</a> <a
				href="${pageContext.request.contextPath}/mypage/main">마이페이지 &gt;
			</a> <a style="font: light-gray;">찜한 상품</a>
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


<%-- 	<section class="featured-products">
		<div class="inner">
			<div class="product-grid">
				<div class="product-item">
					<c:forEach var="list" items="${list}">
						<a href="${pageContext.request.contextPath}/product/details?productNum=${list.productNum}"> <img
							src="/dra/uploads/product/test1.png" alt="ㅌㅅㅌ"> <span
							class="product-info"> <span>${list.productName}</span> <span
								class="discount">${list.productName} <span class="price">${list.productName}
								</span>
							</span> <span class="rating">${list.productName} <span class="review-count">리뷰
										0</span>
							</span>
						</span>
						</a>
					</c:forEach>
				</div>
			</div>
		</div>
	</section> --%>

	<section class="featured-products">
		<div class="inner">
			<div class="product-grid">
				<c:forEach var="list" items="${list}">
					<div class="product-item">
						<a
							href="${pageContext.request.contextPath}/product/details?productNum=${list.productNum}">
							<div class="image-wrapper">
								<img
									src="${pageContext.request.contextPath}/uploads/product/${list.thumbnail}"
									alt="${list.productName}">
								<div class="bookmark" data-product-id="${list.productNum}"></div>
							</div> <span class="product-info"> <span>${list.productName}</span>
								<span class="discount"> ${list.discountRate}% <span
									class="price"> <fmt:formatNumber
											value="${list.price * (1 - list.discountRate / 100)}"
											pattern="#,###원" />
								</span>
							</span> <span class="rating"> ★ ${list.score} <span
									class="review-count">리뷰 ${list.reviewCount}</span>
							</span>
						</span>
						</a>
					</div>
					</c:forEach>
			</div>
		</div>
	</section>

	<!-- 최근 본 상품 목록 -->
	<div class="recent-item">
		<!-- 상품 정보 및 다시 보기 버튼 -->
	</div>
	<!-- 추가 최근 본 상품 아이템... -->
</div>
