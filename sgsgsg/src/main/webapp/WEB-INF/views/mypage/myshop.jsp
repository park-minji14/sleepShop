<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

		<!-- 나의 쇼핑 탭 -->
		<div class="tab-pane fade show active" id="orders">
			<!-- 쿠폰 및 포인트 정보 -->
			<div class="row mb-4">
				<div class="col-md-4">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title">
								<img
									src="https://img.icons8.com/color/24/000000/discount--v1.png"
									alt="쿠폰" class="icon" /> 쿠폰 <span class="badge bg-secondary">0</span>
							</h5>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title">
								<img
									src="${pageContext.request.contextPath}/resources/images/letter-p.png"
									alt="포인트" class="icon" /> 포인트 <span class="badge bg-secondary">${point.remain_points} P</span>
							</h5>
						</div>
					</div>
				</div>
			</div>

			<!-- 주문 진행 현황 -->
			<div class="card mb-4" >
				<div class="card-body" >
					<h5 class="card-title">주문 진행 현황</h5>
					<div class="d-flex justify-content-between mt-3">
						<div class="text-center">
							<img
								src="https://img.icons8.com/color/48/000000/payment-history.png"
								alt="입금대기" class="mb-2" />
							<p>입금대기</p>
							<span class="badge bg-primary">0</span>
						</div>
						<div class="text-center">
							<img
								src="https://img.icons8.com/color/48/000000/checked--v1.png"
								alt="결제완료" class="mb-2" />
							<p>결제완료</p>
							<span class="badge bg-primary">${orderState.ORDER1}</span>
						</div>
						<div class="text-center">
							<img
								src="https://img.icons8.com/color/48/000000/box-important--v1.png"
								alt="배송준비" class="mb-2" />
							<p>배송준비</p>
							<span class="badge bg-primary">${orderState.ORDER3}</span>
						</div>
						<div class="text-center">
							<img
								src="https://img.icons8.com/color/48/000000/in-transit--v1.png"
								alt="배송중" class="mb-2" />
							<p>배송중</p>
							<span class="badge bg-primary">${orderState.ORDER4}</span>
						</div>
						<div class="text-center">
							<img
								src="${pageContext.request.contextPath}/resources/images/icons8-delivered-64.png"
								width="38"
								alt="배송완료" class="mb-2" />
							<p>배송완료</p>
							<span class="badge bg-primary">${orderState.ORDER5}</span>
						</div>
						<div class="text-center">
							<img
								src="https://img.icons8.com/color/48/000000/thumb-up--v1.png"
								alt="구매확정" class="mb-2" />
							<p>구매확정</p>
							<span class="badge bg-primary">${orderState.ORDER8}</span>
						</div>
					</div>
				</div>
			</div>

			


			<!-- 주문 내역이 없을 때 표시 -->
			<c:if test="${savedList.size() == 0}">
				<div class="text-center mt-5">
					<img src="https://img.icons8.com/color/96/000000/nothing-found.png"
						alt="No orders" class="mb-3">
					<p>아직 주문한 상품이 없어요.</p>
				</div>
			</c:if>
			
				<c:forEach var="dto" items="${savedList}" varStatus="status">
		            <div class="review-item">
		                <div class="row align-items-center">
		                    <div class="col-md-2">
		                        <img src="${pageContext.request.contextPath}/uploads/product/${dto.thumbnail}" alt="Product"
		                            class="img-fluid">
		                    </div>
		                    <div class="col-md-7">
		                        <a href="${pageContext.request.contextPath}/product/details?productNum=${dto.productNum}" ><p style="color: darkgray; margin-bottom: 0">구매한 상품</p><h5>${dto.productName}</h5></a>
				              <p class="text-muted">구매일: ${dto.orderDate}</p>
				            </div>
				            
				         </div>
				            
			            <c:if test="${dto.reviewWrite==1}">
			            	<div class="collapse" id="collapseExample${status.index}">
		  						<div class="card card-body" style="height: auto;">
			  						<div class="row">
			  							<div class="col-auto">
			  								<i class="bi ${dto.score >= 1 ? 'bi-star-fill orange':'bi-star' }"></i>
			  								<i class="bi ${dto.score >= 2 ? 'bi-star-fill orange':'bi-star' }"></i>
			  								<i class="bi ${dto.score >= 3 ? 'bi-star-fill orange':'bi-star' }"></i>
			  								<i class="bi ${dto.score >= 4 ? 'bi-star-fill orange':'bi-star' }"></i>
			  								<i class="bi ${dto.score >= 5 ? 'bi-star-fill orange':'bi-star' }"></i>
			  							</div>
			  							<div class="col">
			  								<div class="row text-end" style="text-align: right;">
					  							<div class="reviewDate col-auto">
					  								${dto.review_Date}
					  							</div>
					  							<div class="col-auto">
					  								<a class="deleteReview" onclick="deleteReview('${dto.orderDetailNum}', '${pageNo}');">리뷰삭제</a>
					  							</div>
			  								</div>
			  							</div>
		  							</div>
			  						<div class="review-container" >			
									    <c:if test="${not empty dto.fileName}">
									    	<div style="margin-bottom: 30px;">
									            <img src="${pageContext.request.contextPath}/uploads/review/${dto.fileName}">
										    </div>
									    </c:if>
								    <div >
									        ${dto.review}
									    </div>
									</div>
		            			</div>
			            	</div>
			            </c:if>
				            
				    </div>
			  </c:forEach>
			
		</div>
