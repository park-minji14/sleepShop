<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>

.navi{
	margin-bottom: 80px;
}


</style>



			<!-- 최근 본 상품 탭 -->
			<div class="tab-pane fade show active" id="recent" style=".member #my_menu dl dd a:first-of-type {
    margin-left: 0;
    position: relative;
    z-index: 1;
}">
				<h4 class="mb-4" style="text-align: center;   font-size: 33px;  font-weight: 600; margin: 90px;">최근 본 상품</h4>
				<dl>
					<!--  <dt><img src="https://atimg.sonyunara.com/2023/renew/list/mypage_1.png" class="icon" alt="">주문관리</dt>  -->
					<div class="navi" style="text-align: center;">
						<a href="${pageContext.request.contextPath}">홈 &gt;</a> 
						<a href="${pageContext.request.contextPath}/mypage/main">마이페이지 &gt; </a>
					<a style="font: light-gray;">최근 본 상품</a></div>
				</dl>
			
			
			
			
			<div class="col-md-6">
				<select class="form-select" style=" width: 200px; ">
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
			        <div class="product-grid">
			            
			                <div class="product-item">
			                    <a href="/dra/product/details?productNum=98">
			                        <img src="/dra/uploads/product/test1.png" alt="ㅌㅅㅌ">
			                        <span class="product-info">
			                            <span>ㅌㅅㅌ</span>
			                            <span class="discount">
			                                5% 
			                                <span class="price">
			                                    30,000원
			                                </span>
			                            </span>
			                            <span class="rating">
			                                ★ 0.0 
			                                <span class="review-count">리뷰 0</span>
			                            </span>
			                        </span>
			                    </a>
			                </div>
			            
			                <div class="product-item">
			                    <a href="/dra/product/details?productNum=98">
			                        <img src="/dra/uploads/product/test1.png" alt="민지쿤">
			                        <span class="product-info">
			                            <span>민지쿤</span>
			                            <span class="discount">
			                                10% 
			                                <span class="price">
			                                    30,000원
			                                </span>
			                            </span>
			                            <span class="rating">
			                                ★ 0.0 
			                                <span class="review-count">리뷰 0</span>
			                            </span>
			                        </span>
			                    </a>
			                </div>
			            
			                <div class="product-item">
			                    <a href="/dra/product/details?productNum=98">
			                        <img src="/dra/uploads/product/test1.png" alt="김치테스트">
			                        <span class="product-info">
			                            <span>김치테스트</span>
			                            <span class="discount">
			                                2% 
			                                <span class="price">
			                                    2,000,000원
			                                </span>
			                            </span>
			                            <span class="rating">
			                                ★ 0.0 
			                                <span class="review-count">리뷰 0</span>
			                            </span>
			                        </span>
			                    </a>
			                </div>
			            
			                <div class="product-item">
			                    <a href="/dra/product/details?productNum=98">
			                        <img src="/dra/uploads/product/test1.png" alt="호랑">
			                        <span class="product-info">
			                            <span>호랑</span>
			                            <span class="discount">
			                                10% 
			                                <span class="price">
			                                    30,000원
			                                </span>
			                            </span>
			                            <span class="rating">
			                                ★ 0.0 
			                                <span class="review-count">리뷰 0</span>
			                            </span>
			                        </span>
			                    </a>
			                </div>
			            
			                <div class="product-item">
			                    <a href="/dra/product/details?productNum=98">
			                        <img src="/dra/uploads/product/test1.png" alt="룰루랄라">
			                        <span class="product-info">
			                            <span>룰루랄라</span>
			                            <span class="discount">
			                                10% 
			                                <span class="price">
			                                    30,000원
			                                </span>
			                            </span>
			                            <span class="rating">
			                                ★ 0.0 
			                                <span class="review-count">리뷰 0</span>
			                            </span>
			                        </span>
			                    </a>
			                </div>
			            
			                <div class="product-item">
			                    <a href="/dra/product/details?productNum=98">
			                        <img src="/dra/uploads/product/test1.png" alt="쿨에어 이불">
			                        <span class="product-info">
			                            <span>쿨에어 이불</span>
			                            <span class="discount">
			                                10% 
			                                <span class="price">
			                                    40,000원
			                                </span>
			                            </span>
			                            <span class="rating">
			                                ★ 0.0 
			                                <span class="review-count">리뷰 0</span>
			                            </span>
			                        </span>
			                    </a>
			                </div>
			            
			                <div class="product-item">
			                    <a href="/dra/product/details?productNum=98">
			                        <img src="/dra/uploads/product/test1.png" alt="럭셔리 킹사이즈 침대">
			                        <span class="product-info">
			                            <span>럭셔리 킹사이즈 침대</span>
			                            <span class="discount">
			                                10% 
			                                <span class="price">
			                                    2,000,000원
			                                </span>
			                            </span>
			                            <span class="rating">
			                                ★ 0.0 
			                                <span class="review-count">리뷰 0</span>
			                            </span>
			                        </span>
			                    </a>
			                </div>
            
        </div>
    </div>
</section>
			
			
				<!-- 최근 본 상품 목록 -->
				<div class="recent-item">
					<!-- 상품 정보 및 다시 보기 버튼 -->
				</div>
				<!-- 추가 최근 본 상품 아이템... -->
			</div>
