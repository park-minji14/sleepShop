<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


            <!-- 나의 리뷰 탭 -->
            <div class="tab-pane fade show active" id="reviews">
                <h4 class="mb-4" style="text-align: center;   font-size: 40px; margin: 50px;">구매한 상품</h4>
                
                <div class="col-md-6">
					<select class="form-select" style=" width: 200px; ">
						
						<option>상품 리뷰 작성</option>
						<option>내가 작성한 리뷰</option>
					</select>
				</div>
                
                
                <div class="review-item">
                    <div class="row align-items-center">
                        <div class="col-md-2">
                            <img src="https://via.placeholder.com/100" alt="Product"
                                class="img-fluid">
                        </div>
                        <div class="col-md-7">
                            <h5>메모리폼 베개</h5>
                            <p class="text-muted">구매일: 2024-07-07</p>
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
        
