<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

			<div class="css-ow22sl e1v2ggz01">
				
				<!-- 1:1 문의 탭 -->
					<div class="tab-pane fade show active" id="inquiry">
						<h4 class="mb-4" style="text-align: center;   font-size: 40px; margin: 50px;">1:1 문의 내역</h4>
					</div>
					
					
					<div class="col-md-6">
						<select class="form-select" style=" width: 200px; ">
							
							<option>전체</option>
							<option>답변완료</option>
							<option>답변대기</option>
						</select>
					</div>
					
				
					
					<div class="table-style6">
							<div>
								<span>
									<div class="table-header" >
										
											<div class="date">작성일</div>
											<div class="inquiry">문의구분</div>
											<div class="subject">제목</div>
											<div class="answer">답변여부</div>
										
									</div>
								</span>
							</div>
							<hr>
							<div>
								<span>
									<div class="table-content" >
										<div class="cont" >
											<div class="date">2024-07-12</div>
											<div class="inquiry">배송문의</div>
											<div class="subject" onclick="location.href='${pageContext.request.contextPath}/mypage/oneTooneDetails';" >혹시 배송 얼마나 걸리나요?</div>
											<div class="answer">답변완료</div>
										</div>
										<div class="cont">
											<div class="date">2024-07-12</div>
											<div class="inquiry">배송문의</div>
											<div class="subject">혹시 배송 얼마나 걸리나요?</div>
											<div class="answer">답변완료</div>
										</div>
									</div>
								</span>
							</div>
					</div>
					
					
					<input type="radio" id="option4" name="category" value="글 작성" class="radio-input" ${category == '글 작성' ? 'checked' : ''} onclick="#inquiryModal" data-bs-toggle="modal"
					data-bs-target="#inquiryModal">
				        <label for="option4" class="radio-label" style="width: 150px; text-align: center; font-size: 20px;">글 작성</label>
		
		
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
