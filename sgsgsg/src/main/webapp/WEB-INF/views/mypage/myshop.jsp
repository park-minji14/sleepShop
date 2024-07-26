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
									src="https://img.icons8.com/color/24/000000/coin-wallet.png"
									alt="포인트" class="icon" /> 포인트 <span class="badge bg-secondary">0P</span>
							</h5>
						</div>
					</div>
				</div>
			</div>

			<!-- 주문 진행 현황 -->
			<div class="card mb-4">
				<div class="card-body">
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
							<span class="badge bg-primary">0</span>
						</div>
						<div class="text-center">
							<img
								src="https://img.icons8.com/color/48/000000/box-important--v1.png"
								alt="배송준비" class="mb-2" />
							<p>배송준비</p>
							<span class="badge bg-primary">0</span>
						</div>
						<div class="text-center">
							<img
								src="https://img.icons8.com/color/48/000000/in-transit--v1.png"
								alt="배송중" class="mb-2" />
							<p>배송중</p>
							<span class="badge bg-primary">0</span>
						</div>
						<div class="text-center">
							<img
								src="https://img.icons8.com/color/48/000000/delivered-box--v1.png"
								alt="배송완료" class="mb-2" />
							<p>배송완료</p>
							<span class="badge bg-primary">0</span>
						</div>
						<div class="text-center">
							<img
								src="https://img.icons8.com/color/48/000000/thumb-up--v1.png"
								alt="구매확정" class="mb-2" />
							<p>구매확정</p>
							<span class="badge bg-primary">0</span>
						</div>
					</div>
				</div>
			</div>

			<!-- 주문 조회 필터 -->
			<div class="row mb-4">
				<div class="col-md-6">
					<select class="form-select">
						<option>3개월</option>
						<option>6개월</option>
						<option>1년</option>
					</select>
				</div>
				<div class="col-md-6">
					<select class="form-select">
						<option>전체</option>
						<option>배송완료</option>
						<option>구매확정</option>
					</select>
				</div>
			</div>

			<!-- 주문 내역이 없을 때 표시 -->
			<div class="text-center mt-5">
				<img src="https://img.icons8.com/color/96/000000/nothing-found.png"
					alt="No orders" class="mb-3">
				<p>아직 주문한 상품이 없어요.</p>
			</div>
		</div>

		<!-- 나의 리뷰 탭 -->
		<div class="tab-pane fade" id="reviews">
			<h4 class="mb-4">구매한 상품</h4>
			<div class="review-item">
				<div class="row align-items-center">
					<div class="col-md-2">
						<img src="https://via.placeholder.com/100" alt="Product"
							class="img-fluid">
					</div>
					<div class="col-md-7">
						<h5>메모리폼 베개</h5>
						<p class="text-muted">구매일: 2024-07-07..</p>
					</div>
					<div class="col-md-3 text-end">
						<button class="btn btn-write-review" data-bs-toggle="modal"
							data-bs-target="#reviewModal">리뷰 작성하기</button>
					</div>
				</div>
			</div>
			<div class="review-item">
				<div class="row align-items-center">
					<div class="col-md-2">
						<img src="https://via.placeholder.com/100" alt="Product"
							class="img-fluid">
					</div>
					<div class="col-md-7">
						<h5>수면 안대</h5>
						<p class="text-muted">구매일: 2024-07-07</p>
					</div>
					<div class="col-md-3 text-end">
						<button class="btn btn-write-review" data-bs-toggle="modal"
							data-bs-target="#reviewModal">리뷰 작성하기</button>
					</div>
				</div>
			</div>
		</div>

		<!-- 찜한 상품 탭 -->
		<div class="tab-pane fade" id="wishlist">
			<h4 class="mb-4">찜한 상품</h4>
			<!-- 찜한 상품 목록 -->
			<div class="wishlist-item">
				<!-- 상품 정보 및 장바구니 담기/삭제 버튼 -->
			</div>
			<!-- 추가 찜한 상품 아이템... -->
		</div>

		<!-- 최근 본 상품 탭 -->
		<div class="tab-pane fade" id="recent">
			<h4 class="mb-4">최근 본 상품</h4>
			<!-- 최근 본 상품 목록 -->
			<div class="recent-item">
				<!-- 상품 정보 및 다시 보기 버튼 -->
			</div>
			<!-- 추가 최근 본 상품 아이템... -->
		</div>

		<!-- 1:1 문의 탭 -->
		<div class="tab-pane fade" id="inquiry">
			<h4 class="mb-4">1:1 문의 내역</h4>
			<!-- 문의 내역 목록 -->
			<div class="inquiry-item">
				<!-- 문의 제목, 날짜, 상태 및 상세 내용 -->
			</div>
			<!-- 추가 문의 아이템... -->
			<button class="btn btn-primary mt-3" data-bs-toggle="modal"
				data-bs-target="#inquiryModal">새 문의 작성</button>
		</div>
		
		
		<!-- 포인트 탭 -->
		<div class="tab-pane fade" id="point">
			<h4 class="mb-4">포인트</h4>
			<!-- 포인트 목록 -->
			<div class="point-item">
				<!-- 상품 정보 및 장바구니 담기/삭제 버튼 -->
			</div>
		
		

		<!-- 설정 탭 -->
		<div class="tab-pane fade" id="settings">
			<h4 class="mb-4">설정</h4>
			<!-- 배송지 관리 -->
			<h5>배송지 관리</h5>
			<div class="card mb-3">
				<div class="card-body">
					<h6 class="card-title">기본 배송지</h6>
					<p class="card-text">서울특별시 하,,,</p>
					<button class="btn btn-sm btn-outline-primary">수정</button>
				</div>
			</div>
			<button class="btn btn-primary" data-bs-toggle="modal"
				data-bs-target="#addressModal">새 배송지 추가</button>
		</div>
	</div>

	<!-- 리뷰 작성 모달 -->
	<div class="modal fade" id="reviewModal" tabindex="-1"
		aria-labelledby="reviewModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="reviewModalLabel">리뷰 작성하기</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form>
						<div class="mb-3">
							<label for="reviewRating" class="form-label">평점</label> <select
								class="form-select" id="reviewRating">
								<option value="5">5점</option>
								<option value="4">4점</option>
								<option value="3">3점</option>
								<option value="2">2점</option>
								<option value="1">1점</option>
							</select>
						</div>
						<div class="mb-3">
							<label for="reviewContent" class="form-label">리뷰 내용</label>
							<textarea class="form-control" id="reviewContent" rows="3"></textarea>
						</div>
						<div class="mb-3">
							<label for="reviewImage" class="form-label">이미지 첨부</label> <input
								type="file" class="form-control" id="reviewImage">
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary">리뷰 등록</button>
				</div>
			</div>
		</div>
	</div>


	<!-- 새 문의 작성 모달 -->
	<div class="modal fade" id="inquiryModal" tabindex="-1"
		aria-labelledby="inquiryModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="inquiryModalLabel">새 문의 작성</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form>
						<div class="mb-3">
							<label for="inquiryType" class="form-label">문의 유형</label> <select
								class="form-select" id="inquiryType">
								<option>배송 관련</option>
								<option>상품 관련</option>
								<option>결제 관련</option>
								<option>기타</option>
							</select>
						</div>
						<div class="mb-3">
							<label for="inquiryTitle" class="form-label">제목</label> <input
								type="text" class="form-control" id="inquiryTitle">
						</div>
						<div class="mb-3">
							<label for="inquiryContent" class="form-label">문의 내용</label>
							<textarea class="form-control" id="inquiryContent" rows="3"></textarea>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary">문의 등록</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 새 배송지 추가 모달 -->
	<div class="modal fade" id="addressModal" tabindex="-1"
		aria-labelledby="addressModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="addressModalLabel">새 배송지 추가</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form>
						<div class="mb-3">
							<label for="addressName" class="form-label">배송지명</label> <input
								type="text" class="form-control" id="addressName">
						</div>
						<div class="mb-3">
							<label for="recipientName" class="form-label">수령인</label> <input
								type="text" class="form-control" id="recipientName">
						</div>
						<div class="mb-3">
							<label for="postalCode" class="form-label">우편번호</label> <input
								type="text" class="form-control" id="postalCode">
						</div>
						<div class="mb-3">
							<label for="address1" class="form-label">주소</label> <input
								type="text" class="form-control" id="address1">
						</div>
						<div class="mb-3">
							<label for="address2" class="form-label">상세주소</label> <input
								type="text" class="form-control" id="address2">
						</div>
						<div class="mb-3">
							<label for="phoneNumber" class="form-label">연락처</label> <input
								type="tel" class="form-control" id="phoneNumber">
						</div>
						<div class="form-check">
							<input class="form-check-input" type="checkbox" id="setAsDefault">
							<label class="form-check-label" for="setAsDefault"> 기본
								배송지로 설정 </label>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary">배송지 등록</button>
				</div>
			</div>
		</div>
	</div>
