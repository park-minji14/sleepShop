<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
			
			<div class="css-ow22sl e1v2ggz01">
				
				<!-- 1:1 문의 탭 -->
					<div class="tab-pane fade show active" id="inquiry">
						<h4 class="mb-4" style="text-align: center;   font-size: 40px; margin: 50px;">1:1 문의 내역</h4>
					</div>
					
					<input type="radio" id="option4" name="category" value="돌아가기" class="radio-input" ${category == '돌아가기' ? 'checked' : ''} onclick="listInquiry('${pageNo}')" >
				        <label for="option4" class="radio-label" style="width: 150px; text-align: center; font-size: 20px;">돌아가기</label>
					
					<input type="radio" id="option5" name="category2" value="삭제" style="float: right;" class="radio-input" ${category == '삭제' ? 'checked' : ''} onclick="deleteInquiry('${dto.num}', '${pageNo}')" >
				        <label for="option5" class="radio-label" style="width: 150px; text-align: center; font-size: 20px;">삭제</label>
						
					<div class="table-style6">
							<div>
								<span>
									<div class="table-header" >
											<div class="inquiry">문의내용</div>
										
									</div>
								</span>
							</div>
							<hr>
							<div>
								<span>
									<div class="table-content" >
										<div class="cont">
											<div class="content">${dto.content}</div>
										</div>
									</div>
								</span>
							</div>
					</div>
					
					<c:if test="${not empty dto.response_date}">
					</c:if>
						<div class="table-style6">
								<div>
									<span>
										<div class="table-header" >
											
												<div class="answer">답변내용</div>
											
										</div>
									</span>
								</div>
								<hr>
								<div>
									<span>
										<div class="table-content" >
											<div class="cont">
												<div class="content">${dto.response_content}</div>
											</div>
										</div>
									</span>
								</div>
						</div>
		
			</div>
