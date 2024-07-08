<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/cart.css" type="text/css">
	
<style type="text/css">
.container {
	max-width: 1100px;
}
</style>

<div class="commerce-cart-wrap">
	<div class="container">
		<div class="body-container">
			<div class="commerce-cart row">
				<div class="commerce-cart__content-wrap col-md-7">
					<div class="commerce-cart__content">
						<div class="commerce-cart__header-wrap">
							<div class="commerce-cart__header">
								<span class="commerce-cart__header__left">
									<label class="label_check">
										<span class="checkbox-wrap">
											<input type="checkbox"  value="">
										</span>
											<span class="commerce-cart__header__caption">모두선택</span>
									</label>
								</span>
								<span class="commerce-cart__header__right">
									<button class="commerce-cart__header__delete" type="button">선택삭제</button>
								</span>
							</div>
						</div>
						<div class="top_notification">
							<div class="ms-3">쿠폰 적용된 가격은 결제할 때 확인 가능</div>
							<button type="button" aria-label="삭제" class="top_notification_delete">
								<svg width="12" height="12" viewBox="0 0 12 12" fill="currentColor" preserveAspectRatio="xMidYMid meet">
									<path fill-rule="nonzero" d="M6 4.6L10.3.3l1.4 1.4L7.4 6l4.3 4.3-1.4 1.4L6 7.4l-4.3 4.3-1.4-1.4L4.6 6 .3 1.7 1.7.3 6 4.6z"/>
								</svg>
							</button>
						</div>
						<div>
						<c:forEach var="dto" items="${list_X}">
						cartNum=${dto.cartNum}, productNum=${dto.productNum}, PRODUCTNAME=${dto.productName}, stockNum=${dto.stockNum}, 
						OPTIONNAME=${dto.optionName}, optionValue=${dto.optionValue}, OPTIONNUM=${dto.optionNum}, 
						OPTIONNAME2=${dto.optionName2}, optionValue2=${dto.optionValue2}, OPTIONNUM2=${dto.optionNum2},
						qty=${dto.qty}
						<br/><br/>
						
						</c:forEach>
						</div>
						<ul class="commerce-cart__content__group-list">
							
							<li class="commerce-cart__content__group-item">
								<article class="commerce-cart__group">
									<h1 class="commerce-cart__group__header">스타일링홈 배송</h1>
									<ul class="commerce-cart__group__item-list">
										<li class="commerce-cart__group__item">
											<article class="commerce-cart__delivery-group">
												<ul class="commerce-cart__delivery-group__product-list">
												<!-- 여러 상품 시작 -->
													<li class="commerce-cart__delivery-group__product-item">
														<article class="carted-product">
															<div class="carted-product__select">
																<div class="checkbox-wrap">
																	<input type="checkbox" class="checkbox" value="" checked>
																</div>
															</div>
															<a class="product-small-item product-small-item--clickable" href="/productions/474367/selling">
																<span class="product-small-item__image">
																	<img alt="상품 이미지" src="https://prs.ohou.se/apne2/any/uploads/productions/v1-252867613126656.jpg">
																</span>
																<span class="product-small-item__content">
																	<h1 class="product-small-item__title">[스타일링홈]
																		[7일간!15%쿠폰](60수면) 고밀도 사각사각 컬러풀 호텔이불 먼지없는 여름 차렵이불세트</h1>
																	<span class="delivery_info">무료배송&nbsp;|&nbsp;일반택배</span>
																</span></a>
															<button class="carted-product__delete" type="button" aria-label="삭제">
																<svg width="12" height="12" viewBox="0 0 12 12" fill="currentColor" preserveAspectRatio="xMidYMid meet">
																	<path fill-rule="nonzero" d="M6 4.6L10.3.3l1.4 1.4L7.4 6l4.3 4.3-1.4 1.4L6 7.4l-4.3 4.3-1.4-1.4L4.6 6 .3 1.7 1.7.3 6 4.6z"/>
																</svg>
															</button>
															<ul class="carted-product__option-list">
																<li class="carted-product__option-list__item">
																	<article class="option_box">
																		<h2 class="option_title">색상: 01.간절기용_브릭레드 / 사이즈: 01.SS 베개세트</h2>
																		<button type="button" aria-label="삭제" class="option_delete">
																			<svg width="12" height="12" viewBox="0 0 12 12" fill="currentColor" preserveAspectRatio="xMidYMid meet">
																				<path fill-rule="nonzero" d="M6 4.6L10.3.3l1.4 1.4L7.4 6l4.3 4.3-1.4 1.4L6 7.4l-4.3 4.3-1.4-1.4L4.6 6 .3 1.7 1.7.3 6 4.6z"/>
																			</svg>
																		</button>
																		<div class="option_subBox">
																			<div class="option_qty">
																				<span class="minus_qty bi bi-dash-lg"></span>
																				<button class="chage_qty">2</button>
																				<span class="plus_qty bi bi-plus-lg"></span>
																			</div>
																			<div class="option_price">
																				65,900원
																			</div>
																		</div>
																	</article>
																</li>
															</ul>
															<div class="carted-product__footer">
																<span class="carted-product__footer__left">
																	<button class="carted-product__edit-btn" type="button">옵션변경</button>
																	<button class="carted-product__order-btn" type="button">바로구매</button>
																</span>
																<span class="carted-product__subtotal">
																	<span class="carted-product__subtotal__number">65,900</span>원
																</span>
															</div>
														</article>
													</li>
													<!-- 여러 상품 중 하나 끝 -->
													<li class="commerce-cart__delivery-group__product-item">
														<article class="carted-product">
															<div class="carted-product__select">
																<div class="checkbox-wrap">
																	<input type="checkbox" class="checkbox" value="" checked>
																</div>
															</div>
															<span class="css-l46ngn elsmzm01">오늘출발 마감
																<span class="afterDeadLine css-1xskdmv elsmzm00">7/8 (월) 발송 예정</span>
															</span>
															<a class="product-small-item product-small-item--clickable" href="/productions/169814/selling">
																<span class="product-small-item__image">
																	<img alt="상품 이미지" src="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/162546803477431867.jpg?w=256&amp;h=256&amp;c=c">
																</span>
																<span class="product-small-item__content">
																	<h1 class="product-small-item__title">[스타일링홈]
																		[5일간!10%쿠폰][1+1]100% 빛차단/자외선차단 온도조절 3중직 거실 창문 암막커튼</h1>
																	<span class="delivery_info">70,000원 이상
																		무료배송&nbsp;|&nbsp;일반택배
																	</span>
																</span>
															</a>
															<button class="carted-product__delete" type="button" aria-label="삭제">
																<svg width="12" height="12" viewBox="0 0 12 12" fill="currentColor" preserveAspectRatio="xMidYMid meet">
																	<path fill-rule="nonzero" d="M6 4.6L10.3.3l1.4 1.4L7.4 6l4.3 4.3-1.4 1.4L6 7.4l-4.3 4.3-1.4-1.4L4.6 6 .3 1.7 1.7.3 6 4.6z"/>
																</svg>
															</button>
															<ul class="carted-product__option-list">
															<!-- 1번째 옵션 -->
																<li class="carted-product__option-list__item">
																	<article class="option_box">
																		<h2 class="option_title">품명: 01.메이든
																			암막_커튼핀형 / 사이즈(가로x세로): 01.쿨그레이 소창형 (2장)</h2>
																		<button type="button" aria-label="삭제" class="option_delete">
																			<svg width="12" height="12" viewBox="0 0 12 12" fill="currentColor" preserveAspectRatio="xMidYMid meet">
																				<path fill-rule="nonzero" d="M6 4.6L10.3.3l1.4 1.4L7.4 6l4.3 4.3-1.4 1.4L6 7.4l-4.3 4.3-1.4-1.4L4.6 6 .3 1.7 1.7.3 6 4.6z"/>
																			</svg>
																		</button>
																		<div class="option_subBox">
																			<div class="option_qty">
																				<span class="minus_qty bi bi-dash-lg"></span>
																				<button class="chage_qty">1</button>
																				<span class="plus_qty bi bi-plus-lg"></span>
																			</div>
																			<div class="option_price">29,500원
																			</div>
																		</div>
																	</article>
																</li>
																<!-- 2번째 옵션 -->
																<li class="carted-product__option-list__item">
																	<article class="option_box">
																		<h2 class="option_title">조립/설치비 (1개)</h2>
																		<button type="button" aria-label="삭제" class="option_delete">
																			<svg width="12" height="12" viewBox="0 0 12 12" fill="currentColor" preserveAspectRatio="xMidYMid meet">
																				<path fill-rule="nonzero" d="M6 4.6L10.3.3l1.4 1.4L7.4 6l4.3 4.3-1.4 1.4L6 7.4l-4.3 4.3-1.4-1.4L4.6 6 .3 1.7 1.7.3 6 4.6z"/>
																			</svg>
																		</button>
																		<div class="option_subBox">
																			<div class="option_price">0원</div>
																		</div>
																	</article>
																</li>
															</ul>
															<div class="carted-product__footer">
																<span class="carted-product__footer__left">
																	<button class="carted-product__edit-btn" type="button">옵션변경</button>
																	<button class="carted-product__order-btn" type="button">바로구매</button>
																</span>
																<span class="carted-product__subtotal">
																	<span class="carted-product__subtotal__number">29,500</span>원
																</span>
															</div>
														</article>
													</li>
												</ul>
												<!-- 여러 상품 끝 -->
												<footer class="commerce-cart__delivery-group__footer">
													<p class="commerce-cart__delivery-group__total">2개 묶음배송비 3,000원</p>
													<p class="commerce-cart__delivery-group__group-caption">묶음배송 상품 600원 추가시 무료배송</p>
													<p class="commerce-cart__delivery-group__group-link">
														<a class="commerce-cart__delivery-group__group-link__link" href="/productions/455128/groupable_productions">묶음배송 상품 추가하기
															<svg class="icon" width="1em" height="1em" viewBox="0 0 24 24" preserveAspectRatio="xMidYMid meet">
																<path fill="currentColor" fill-rule="nonzero" d="M6 19.692L8.25 22 18 12 8.25 2 6 4.308 13.5 12z"></path>
															</svg>
														</a>
													</p>
												</footer>
											</article>
										</li>
									</ul>
								</article>
							</li>
							
							<!-- 다음 여러 상품 -->
							<li class="commerce-cart__content__group-item">
								<article class="commerce-cart__group">
									<h1 class="commerce-cart__group__header">hellowyellow 배송</h1>
									<ul class="commerce-cart__group__item-list">
										<li class="commerce-cart__group__item">
											<article class="commerce-cart__delivery-group">
												<ul class="commerce-cart__delivery-group__product-list">
													<li class="commerce-cart__delivery-group__product-item">
														<article class="carted-product">
															<div class="carted-product__select">
																<div class="checkbox-wrap">
																	<input type="checkbox" class="checkbox" value="" checked>
																</div>
															</div>
															<a class="product-small-item product-small-item--clickable" href="/productions/146362/selling">
																<span class="product-small-item__image">
																	<img alt="상품 이미지" src="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/166088584050337899.jpg?w=256&amp;h=256&amp;c=c">
																</span>
																<span class="product-small-item__content">
																	<h1 class="product-small-item__title">[GAKYU] 무료배송
																		모던 라운드 리빙박스 시리즈 8size</h1>
																	<span class="delivery_info">무료배송&nbsp;|&nbsp;일반택배</span>
																</span>
															</a>
															<button class="carted-product__delete" type="button" aria-label="삭제">
																<svg width="12" height="12" viewBox="0 0 12 12" fill="currentColor" preserveAspectRatio="xMidYMid meet">
																	<path fill-rule="nonzero" d="M6 4.6L10.3.3l1.4 1.4L7.4 6l4.3 4.3-1.4 1.4L6 7.4l-4.3 4.3-1.4-1.4L4.6 6 .3 1.7 1.7.3 6 4.6z"/>
																</svg>
															</button>
															<ul class="carted-product__option-list">
																<li class="carted-product__option-list__item">
																	<article class="option_box">
																		<h2 class="option_title">사이즈선택: 리빙박스L /
																			색상선택: 아이보리</h2>
																		<button type="button" aria-label="삭제" class="option_delete">
																			<svg width="12" height="12" viewBox="0 0 12 12" fill="currentColor" preserveAspectRatio="xMidYMid meet">
																				<path fill-rule="nonzero" d="M6 4.6L10.3.3l1.4 1.4L7.4 6l4.3 4.3-1.4 1.4L6 7.4l-4.3 4.3-1.4-1.4L4.6 6 .3 1.7 1.7.3 6 4.6z"/>
																			</svg>
																		</button>
																		<div class="option_subBox">
																			<div class="option_qty">
																				<span class=" minus_qty bi bi-dash-lg"></span>
																				<button class="chage_qty">1</button>
																				<span class="plus_qty bi bi-plus-lg"></span>
																			</div>
																			<div class="option_price">5,000원</div>
																		</div>
																	</article>
																</li>
																<li class="carted-product__option-list__item">
																	<article class="option_box">
																		<h2 class="option_title">사이즈선택: 리빙박스S /
																			색상선택: 아이보리</h2>
																		<button type="button" aria-label="삭제" class="option_delete">
																			<svg width="12" height="12" viewBox="0 0 12 12" fill="currentColor" preserveAspectRatio="xMidYMid meet">
																				<path fill-rule="nonzero" d="M6 4.6L10.3.3l1.4 1.4L7.4 6l4.3 4.3-1.4 1.4L6 7.4l-4.3 4.3-1.4-1.4L4.6 6 .3 1.7 1.7.3 6 4.6z"/>
																			</svg>
																		</button>
																		<div class="option_subBox">
																			<div class="option_qty">
																				<span class="minus_qty bi bi-dash-lg"></span>
																				<button class="chage_qty">1</button>
																				<span class="plus_qty bi bi-plus-lg"></span>
																			</div>
																			<div class="option_price">2,700원</div>
																		</div>
																	</article>
																</li>
															</ul>
															<div class="carted-product__footer">
																<span class="carted-product__footer__left">
																	<button class="carted-product__edit-btn" type="button">옵션변경</button>
																	<button class="carted-product__order-btn" type="button">바로구매</button>
																</span>
																<span class="carted-product__subtotal">
																	<span class="carted-product__subtotal__number">7,700</span>원
																</span>
															</div>
														</article>
													</li>
												</ul>
												<footer class="commerce-cart__delivery-group__footer">
													<p class="commerce-cart__delivery-group__total">배송비 무료</p>
												</footer>
											</article>
										</li>
									</ul>
								</article>
							</li>
						</ul>
						<!-- 모바일 대응 금액 출력 -->
						<div class="commerce-cart__summary commerce-cart__content__summary">
							<dl class="commerce-cart__summary__row">
								<dt>총 상품금액</dt>
								<dd>
									<span class="number">196,800</span>원
								</dd>
							</dl>
							<dl class="commerce-cart__summary__row">
								<dt>총 배송비</dt>
								<dd>
									+ <span class="number">0</span>원
								</dd>
							</dl>
							<dl class="commerce-cart__summary__row">
								<dt>총 할인금액</dt>
								<dd>
									- <span class="number">93,700</span>원
								</dd>
							</dl>
							<dl class="commerce-cart__summary__row commerce-cart__summary__row--total">
								<dt>결제금액</dt>
								<dd>
									<span class="number">103,100</span>원
								</dd>
							</dl>
						</div>
					</div>
					<section>
						<div class="by_others">
							<h2 class="by_others_title">다른 고객이 함께 구매한 상품</h2>
							<div class="next_able">
								<ul class="production-list">
								<!-- 상품1시작 -->
									<li class="production-item-wrap">
										<article class="production-item">
											<a class="production-item__overlay" href="/productions/109388/selling"></a>
											<div class="production-item-image production-item__image">
												<img class="image" alt="" src="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/166864581773020776.jpg?gif=1&amp;w=360&amp;h=360&amp;c=c&amp;q=0.8&amp;webp=1">
												<button class="production-item-scrap-badge text-secondary" type="button">
													<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bookmarks-fill" viewBox="0 0 16 16">
													  <path d="M2 4a2 2 0 0 1 2-2h6a2 2 0 0 1 2 2v11.5a.5.5 0 0 1-.777.416L7 13.101l-4.223 2.815A.5.5 0 0 1 2 15.5z"/>
													  <path d="M4.268 1A2 2 0 0 1 6 0h6a2 2 0 0 1 2 2v11.5a.5.5 0 0 1-.777.416L13 13.768V2a1 1 0 0 0-1-1z"/>
													</svg>
												</button>
												<div class="production-item-image__dark-overlay"></div>
											</div>
											<div class="production-item__content">
												<h1 class="production-item__header">
													<span class="production-item__header__brand">믹스앤매치 </span>
													<span class="production-item__header__name">미드센추리 카이 항균
														먼지없는 홑매트리스커버 4사이즈 18컬러</span>
												</h1>
												<span class="production-item-price">
													<span class="production-item-price__rate">50
														<span class="percentage">% </span>
													</span>
													<!-- 할인된 금액 -->
													<span class="production-item-price__price">9,900</span>
												</span>
												<p class="production-item-stats production-item-stats--review">
													<svg class=icon xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
													  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
													</svg>
													<strong class="avg">4.8</strong> 리뷰 16,114
												</p>
												<span class="production-item-delivery-badge delivery_wrap">
													<!-- 오늘출발 그림(필요없음) -->
													<img src="https://assets.ohou.se/web/dist/media/assets/icons/ic-departure-today-c4b771c1162afcd9223631b660e19d73.png" class="icon">
												</span>
												<!-- 오늘 출발 가능 일시(필요없음) -->
												<span class="delivery_text">평일
													13:00까지 결제시</span>
												<!-- 무료배송, 특가 아이콘 -->
												<span class="production-item-badge-list">
													<svg class="icon" aria-label="무료배송" width="47" height="20" viewBox="0 0 47 20" preserveAspectRatio="xMidYMid meet">
														<g fill="none" fill-rule="evenodd">
															<rect width="47" height="20" fill="#000" fill-opacity=".07" fill-rule="nonzero" rx="4"/>
															<path fill="#757575" d="M12.73 5.38v3.96h-6.6V5.38h6.6zm-2.68 9.43H8.76v-3.25H5v-1.03h8.86v1.03h-3.81v3.25zm1.4-6.49V6.41H7.43v1.91h4.04zm11.08 2.7h-1.42v1.54h2.26v1.02h-8.86v-1.02h2.24v-1.53h-1.1V7.78h5.32V6.65H15.6V5.63h6.66V8.8h-5.33v1.18h5.61v1.04zm-4.53 0v1.54h1.87v-1.53H18zm14.37 3.78h-1.23V9.86h-.8v4.49h-1.2V5.18h1.2v3.66h.8V5h1.23v9.8zm-4.2-2.54h-3.9V6.01h1.27v2.26h1.36V6h1.28v6.26zm-1.27-1.01v-2h-1.36v2h1.36zm14.49 1.71c0 1.13-1.25 1.82-3.41 1.82s-3.42-.7-3.42-1.82 1.25-1.82 3.4-1.82c2.18 0 3.43.7 3.43 1.82zm-3.41-6.05c-.5 1.13-2.1 1.9-3.51 2.1l-.54-1c1.64-.17 3.39-1.06 3.39-2.54V5.2h1.33v.28c0 1.48 1.99 2.47 3.4 2.53l-.55 1.01c-1.31-.18-3.03-.97-3.52-2.1zm4.42 3.78h-8.86V9.66h3.79V8.4h1.29v1.26h3.78v1.03zm-2.33 2.27c0-.5-.83-.8-2.1-.8s-2.08.3-2.08.8c0 .51.81.8 2.08.8s2.1-.29 2.1-.8z"/>
														</g>
													</svg>
													<svg class="icon" aria-label="특가" width="30" height="20"viewBox="0 0 30 20" preserveAspectRatio="xMidYMid meet">
														<rect width="30" height="20" fill="#F77" rx="4"/>
														<path fill="#fff" d="M12.83 7.93v-.97H7.93v-.555h5.228v-.991H6.655v4.063h6.59v-.992H7.928V7.93h4.901zm-6.295 3.747v1.002h5.326v2.037h1.274v-3.04h-6.6zm7.733-.588v-1.024H5.5v1.024h8.768zM23.91 9.782V8.725h-1.405V5H21.24v9.705h1.264V9.782h1.405zm-3.954-3.79h-4.53v1.056h3.147c-.174 1.938-1.623 3.975-3.736 4.945l.773.958c2.974-1.612 4.259-4.03 4.346-6.96z"/>
													</svg>
												</span>
												<!-- 할인쿠폰, 필요할까 -->
												<div class="salecoupon_wrap">
													<span class="ss-j5muvd">
														<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAQSURBVHgBAQUA+v8AAAAAAAAFAAFkeJU4AAAAAElFTkSuQmCC"
														class="ss-12mmj1c" alt="">
													</span>
													<span class="salecoupon_text">할인쿠폰</span>
												</div>
											</div>
										</article>
									</li>
									<!-- 상품1끝 -->
									<li class="production-item-wrap"><article
											class="production-item">
											<a class="production-item__overlay"
												href="/productions/270805/selling"></a>
											<div class="production-item-image production-item__image">
												<img class="image" alt="" src="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/168014522299564930.jpg?gif=1&amp;w=360&amp;h=360&amp;c=c&amp;q=0.8">
												<button class="production-item-scrap-badge text-secondary" type="button">
													<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bookmarks-fill" viewBox="0 0 16 16">
													  <path d="M2 4a2 2 0 0 1 2-2h6a2 2 0 0 1 2 2v11.5a.5.5 0 0 1-.777.416L7 13.101l-4.223 2.815A.5.5 0 0 1 2 15.5z"/>
													  <path d="M4.268 1A2 2 0 0 1 6 0h6a2 2 0 0 1 2 2v11.5a.5.5 0 0 1-.777.416L13 13.768V2a1 1 0 0 0-1-1z"/>
													</svg>
												</button>
												<div class="production-item-image__dark-overlay"></div>
											</div>
											<div class="production-item__content">
												<h1 class="production-item__header">
													<span class="production-item__header__brand">헬로우슬립 </span><span
														class="production-item__header__name">[10%쿠폰] NEW
														먼지없는 모던체크 사계절 차렵이불세트 SS/Q 7컬러</span>
												</h1>
												<span class="production-item-price"><span
													class="production-item-price__rate">63<span
														class="percentage">% </span></span><span
													class="production-item-price__price">32,900</span></span>
												<p
													class="production-item-stats production-item-stats--review">
													<svg class="icon" width="24" height="24"
														viewBox="0 0 24 24" preserveAspectRatio="xMidYMid meet">
													<path fill="currentColor" fill-rule="evenodd"
															d="M12 19.72l-5.677 2.405c-.76.322-1.318-.094-1.247-.906l.533-6.142-4.042-4.656c-.54-.624-.317-1.283.477-1.467l6.006-1.39L11.23 2.28c.426-.707 1.122-.699 1.542 0l3.179 5.282 6.006 1.391c.805.187 1.011.851.477 1.467l-4.042 4.656.533 6.142c.072.822-.497 1.224-1.247.906L12 19.72z"></path></svg>
													<strong class="avg">4.7</strong> 리뷰 2,111
												</p>
												<span class="production-item-badge-list"><svg
														class="icon" aria-label="특가" width="30" height="20"
														viewBox="0 0 30 20" preserveAspectRatio="xMidYMid meet">
													<rect width="30" height="20" fill="#F77" rx="4"></rect>
													<path fill="#fff"
															d="M12.83 7.93v-.97H7.93v-.555h5.228v-.991H6.655v4.063h6.59v-.992H7.928V7.93h4.901zm-6.295 3.747v1.002h5.326v2.037h1.274v-3.04h-6.6zm7.733-.588v-1.024H5.5v1.024h8.768zM23.91 9.782V8.725h-1.405V5H21.24v9.705h1.264V9.782h1.405zm-3.954-3.79h-4.53v1.056h3.147c-.174 1.938-1.623 3.975-3.736 4.945l.773.958c2.974-1.612 4.259-4.03 4.346-6.96z"></path></svg></span>
												<div class="salecoupon_wrap">
													<span class="ss-j5muvd"><img
														src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAQSURBVHgBAQUA+v8AAAAAAAAFAAFkeJU4AAAAAElFTkSuQmCC"
														class="ss-12mmj1c" alt=""></span><span
														class="salecoupon_text">할인쿠폰</span>
												</div>
											</div>
										</article></li>
									<li class="production-item-wrap"><article
											class="production-item">
											<a class="production-item__overlay"
												href="/productions/300514/selling"></a>
											<div class="production-item-image production-item__image">
												<div class="image"></div>
												<button class="production-item-scrap-badge text-secondary" type="button">
													<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bookmarks-fill" viewBox="0 0 16 16">
													  <path d="M2 4a2 2 0 0 1 2-2h6a2 2 0 0 1 2 2v11.5a.5.5 0 0 1-.777.416L7 13.101l-4.223 2.815A.5.5 0 0 1 2 15.5z"/>
													  <path d="M4.268 1A2 2 0 0 1 6 0h6a2 2 0 0 1 2 2v11.5a.5.5 0 0 1-.777.416L13 13.768V2a1 1 0 0 0-1-1z"/>
													</svg>
												</button>
												<div class="production-item-image__dark-overlay"></div>
											</div>
											<div class="production-item__content">
												<h1 class="production-item__header">
													<span class="production-item__header__brand">데코지오 </span><span
														class="production-item__header__name">1+1쉐도우 100%
														빛차단 자외선 열기차단 암막커튼 빠른 맞춤제작 11컬러</span>
												</h1>
												<span class="production-item-price"><span
													class="production-item-price__rate">27<span
														class="percentage">% </span></span><span
													class="production-item-price__price">29,800</span></span>
												<p
													class="production-item-stats production-item-stats--review">
													<svg class="icon" width="24" height="24"
														viewBox="0 0 24 24" preserveAspectRatio="xMidYMid meet">
													<path fill="currentColor" fill-rule="evenodd"
															d="M12 19.72l-5.677 2.405c-.76.322-1.318-.094-1.247-.906l.533-6.142-4.042-4.656c-.54-.624-.317-1.283.477-1.467l6.006-1.39L11.23 2.28c.426-.707 1.122-.699 1.542 0l3.179 5.282 6.006 1.391c.805.187 1.011.851.477 1.467l-4.042 4.656.533 6.142c.072.822-.497 1.224-1.247.906L12 19.72z"></path></svg>
													<strong class="avg">4.7</strong> 리뷰 6,293
												</p>
												<span class="production-item-badge-list"><svg
														class="icon" aria-label="무료배송" width="47" height="20"
														viewBox="0 0 47 20" preserveAspectRatio="xMidYMid meet">
													<g fill="none" fill-rule="evenodd">
													<rect width="47" height="20" fill="#000" fill-opacity=".07"
															fill-rule="nonzero" rx="4"></rect>
													<path fill="#757575"
															d="M12.73 5.38v3.96h-6.6V5.38h6.6zm-2.68 9.43H8.76v-3.25H5v-1.03h8.86v1.03h-3.81v3.25zm1.4-6.49V6.41H7.43v1.91h4.04zm11.08 2.7h-1.42v1.54h2.26v1.02h-8.86v-1.02h2.24v-1.53h-1.1V7.78h5.32V6.65H15.6V5.63h6.66V8.8h-5.33v1.18h5.61v1.04zm-4.53 0v1.54h1.87v-1.53H18zm14.37 3.78h-1.23V9.86h-.8v4.49h-1.2V5.18h1.2v3.66h.8V5h1.23v9.8zm-4.2-2.54h-3.9V6.01h1.27v2.26h1.36V6h1.28v6.26zm-1.27-1.01v-2h-1.36v2h1.36zm14.49 1.71c0 1.13-1.25 1.82-3.41 1.82s-3.42-.7-3.42-1.82 1.25-1.82 3.4-1.82c2.18 0 3.43.7 3.43 1.82zm-3.41-6.05c-.5 1.13-2.1 1.9-3.51 2.1l-.54-1c1.64-.17 3.39-1.06 3.39-2.54V5.2h1.33v.28c0 1.48 1.99 2.47 3.4 2.53l-.55 1.01c-1.31-.18-3.03-.97-3.52-2.1zm4.42 3.78h-8.86V9.66h3.79V8.4h1.29v1.26h3.78v1.03zm-2.33 2.27c0-.5-.83-.8-2.1-.8s-2.08.3-2.08.8c0 .51.81.8 2.08.8s2.1-.29 2.1-.8z"></path></g></svg>
													<svg class="icon" aria-label="특가" width="30" height="20"
														viewBox="0 0 30 20" preserveAspectRatio="xMidYMid meet">
													<rect width="30" height="20" fill="#F77" rx="4"></rect>
													<path fill="#fff"
															d="M12.83 7.93v-.97H7.93v-.555h5.228v-.991H6.655v4.063h6.59v-.992H7.928V7.93h4.901zm-6.295 3.747v1.002h5.326v2.037h1.274v-3.04h-6.6zm7.733-.588v-1.024H5.5v1.024h8.768zM23.91 9.782V8.725h-1.405V5H21.24v9.705h1.264V9.782h1.405zm-3.954-3.79h-4.53v1.056h3.147c-.174 1.938-1.623 3.975-3.736 4.945l.773.958c2.974-1.612 4.259-4.03 4.346-6.96z"></path></svg></span>
											</div>
										</article>
									</li>
									<li class="production-item-wrap"><article
											class="production-item">
											<a class="production-item__overlay"
												href="/productions/318140/selling"></a>
											<div class="production-item-image production-item__image">
												<div class="image"></div>
												<button class="production-item-scrap-badge text-secondary" type="button">
													<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bookmarks-fill" viewBox="0 0 16 16">
													  <path d="M2 4a2 2 0 0 1 2-2h6a2 2 0 0 1 2 2v11.5a.5.5 0 0 1-.777.416L7 13.101l-4.223 2.815A.5.5 0 0 1 2 15.5z"/>
													  <path d="M4.268 1A2 2 0 0 1 6 0h6a2 2 0 0 1 2 2v11.5a.5.5 0 0 1-.777.416L13 13.768V2a1 1 0 0 0-1-1z"/>
													</svg>
												</button>
												<div class="production-item-image__dark-overlay"></div>
											</div>
											<div class="production-item__content">
												<h1 class="production-item__header">
													<span class="production-item__header__brand">FREESPACE
													</span><span class="production-item__header__name">커튼봉 스위트
														25mm 6size 6color</span>
												</h1>
												<span class="production-item-price"><span
													class="production-item-price__rate">21<span
														class="percentage">% </span></span><span
													class="production-item-price__price">11,700</span></span>
												<p
													class="production-item-stats production-item-stats--review">
													<svg class="icon" width="24" height="24"
														viewBox="0 0 24 24" preserveAspectRatio="xMidYMid meet">
													<path fill="currentColor" fill-rule="evenodd"
															d="M12 19.72l-5.677 2.405c-.76.322-1.318-.094-1.247-.906l.533-6.142-4.042-4.656c-.54-.624-.317-1.283.477-1.467l6.006-1.39L11.23 2.28c.426-.707 1.122-.699 1.542 0l3.179 5.282 6.006 1.391c.805.187 1.011.851.477 1.467l-4.042 4.656.533 6.142c.072.822-.497 1.224-1.247.906L12 19.72z"></path></svg>
													<strong class="avg">4.6</strong> 리뷰 6,760
												</p>
												<span
													class="production-item-delivery-badge delivery_wrap"><img
													src="https://assets.ohou.se/web/dist/media/assets/icons/ic-departure-today-c4b771c1162afcd9223631b660e19d73.png"
													class="icon"></span><span class="delivery_text">평일
													13:00까지 결제시</span><span class="production-item-badge-list"><svg
														class="icon" aria-label="무료배송" width="47" height="20"
														viewBox="0 0 47 20" preserveAspectRatio="xMidYMid meet">
													<g fill="none" fill-rule="evenodd">
													<rect width="47" height="20" fill="#000" fill-opacity=".07"
															fill-rule="nonzero" rx="4"></rect>
													<path fill="#757575"
															d="M12.73 5.38v3.96h-6.6V5.38h6.6zm-2.68 9.43H8.76v-3.25H5v-1.03h8.86v1.03h-3.81v3.25zm1.4-6.49V6.41H7.43v1.91h4.04zm11.08 2.7h-1.42v1.54h2.26v1.02h-8.86v-1.02h2.24v-1.53h-1.1V7.78h5.32V6.65H15.6V5.63h6.66V8.8h-5.33v1.18h5.61v1.04zm-4.53 0v1.54h1.87v-1.53H18zm14.37 3.78h-1.23V9.86h-.8v4.49h-1.2V5.18h1.2v3.66h.8V5h1.23v9.8zm-4.2-2.54h-3.9V6.01h1.27v2.26h1.36V6h1.28v6.26zm-1.27-1.01v-2h-1.36v2h1.36zm14.49 1.71c0 1.13-1.25 1.82-3.41 1.82s-3.42-.7-3.42-1.82 1.25-1.82 3.4-1.82c2.18 0 3.43.7 3.43 1.82zm-3.41-6.05c-.5 1.13-2.1 1.9-3.51 2.1l-.54-1c1.64-.17 3.39-1.06 3.39-2.54V5.2h1.33v.28c0 1.48 1.99 2.47 3.4 2.53l-.55 1.01c-1.31-.18-3.03-.97-3.52-2.1zm4.42 3.78h-8.86V9.66h3.79V8.4h1.29v1.26h3.78v1.03zm-2.33 2.27c0-.5-.83-.8-2.1-.8s-2.08.3-2.08.8c0 .51.81.8 2.08.8s2.1-.29 2.1-.8z"></path></g></svg>
													<svg class="icon" aria-label="특가" width="30" height="20"
														viewBox="0 0 30 20" preserveAspectRatio="xMidYMid meet">
													<rect width="30" height="20" fill="#F77" rx="4"></rect>
													<path fill="#fff"
															d="M12.83 7.93v-.97H7.93v-.555h5.228v-.991H6.655v4.063h6.59v-.992H7.928V7.93h4.901zm-6.295 3.747v1.002h5.326v2.037h1.274v-3.04h-6.6zm7.733-.588v-1.024H5.5v1.024h8.768zM23.91 9.782V8.725h-1.405V5H21.24v9.705h1.264V9.782h1.405zm-3.954-3.79h-4.53v1.056h3.147c-.174 1.938-1.623 3.975-3.736 4.945l.773.958c2.974-1.612 4.259-4.03 4.346-6.96z"></path></svg></span>
											</div>
										</article>
									</li>
								</ul>
								<div class="prev_product" aria-label="이전">
									<svg width="20" height="20" viewBox="0 0 20 20" preserveAspectRatio="xMidYMid meet">
										<path d="M15.1 10l-.14-.14-8.68-8.68L4.9 2.55 12.36 10l-7.45 7.45 1.37 1.37 8.68-8.68z" fill="currentColor"/>
									</svg>
								</div>
								<div class="next_product" aria-label="다음">
									<svg width="20" height="20" viewBox="0 0 20 20" preserveAspectRatio="xMidYMid meet">
										<path d="M15.1 10l-.14-.14-8.68-8.68L4.9 2.55 12.36 10l-7.45 7.45 1.37 1.37 8.68-8.68z" fill="currentColor"/>
									</svg>
								</div>
							</div>
						</div>
					</section>
				</div>
				<!-- 사이드바 결제금액 + 결제 버튼 -->
				<div class="commerce-cart__side-bar-wrap col-lg-4">
					<div class="commerce-cart__side-bar-container" style="position: sticky; top: 81px; transition: top 0.1s ease 0s;">
						<div class="commerce-cart__side-bar" style="position: relative;">
							<div class="commerce-cart__summary commerce-cart__side-bar__summary">
								<dl class="commerce-cart__summary__row">
									<dt>총 상품금액</dt>
									<dd>
										<span class="number">196,800</span>원
									</dd>
								</dl>
								<dl class="commerce-cart__summary__row">
									<dt>총 배송비</dt>
									<dd>
										+ <span class="number">0</span>원
									</dd>
								</dl>
								<dl class="commerce-cart__summary__row">
									<dt>총 할인금액</dt>
									<dd>
										- <span class="number">93,700</span>원
									</dd>
								</dl>
								<dl class="commerce-cart__summary__row commerce-cart__summary__row--total">
									<dt>결제금액</dt>
									<dd>
										<span class="number">103,100</span>원
									</dd>
								</dl>
							</div>
							<div class="commerce-cart__side-bar__order">
								<button class="order_btn commerce-cart__side-bar__order__btn" type="button">3개 상품 구매하기</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 모바일 대응 결제버튼 -->
		<div class="commerce-cart__footer-wrap" style="position: sticky; bottom: 0px; transition: bottom 0.1s ease 0s;">
			<div class="commerce-cart__footer" style="position: relative;">
				<div class="commerce-cart__footer__total">
					<span class="count">3개 </span>
					<span class="cost">103,100원</span>
				</div>
				<button class="order_btn commerce-cart__footer__order" type="button">바로구매</button>
			</div>
		</div>
</div>