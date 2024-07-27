<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>

.navi{
	margin-bottom: 80px;
}


.h2, h2 {
    /* font-size: calc(1.5rem); */
    font-size: 20px;
    line-height: 20px;
    margin-left: 8px;
    font-weight: 700;
    color: #424242;
}


.h5, h5 {
    font-size: 18px;
    line-height: 18px;
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    color: rgb(194, 200, 204);
}



.thisCategory {
    margin-left: 0;
    position: relative;
    z-index: 1;
}


.thisCategory:after {
    display: block;
    position: absolute;
    left: 0;
    bottom: 0;
    width: 100%;
    height: 11px;
    background: #81DAF5;
    content: '';
    z-index: -1;
}



.css-42wh1f {
    text-align: right;
    margin-left: 16px;
    font-size: 20px;
    line-height: 28px;
    font-weight: 700;
    flex-shrink: 0;
    color: rgb(53, 197, 240);
}


</style>




			<div class="css-ow22sl e1v2ggz01">
				
				<!-- 포인트 칸 -->
				<div class="css-77kc86 e1t6i3i25" style="width: 75%; margin: auto; margin-top: 60px;">
					<div class="css-0 e1t6i3i24">
						<h2 class="css-ojabq6 e1t6i3i23" style="font-size: 33px;  font-weight: 600; margin-top: 30px; margin-bottom: 25px;">사용 가능한 포인트</h2>
						<p class="css-1irwz7g e1t6i3i22">${point.remain_points} P</p>
					</div>
					<div class="css-1yu4f1z e1t6i3i21">
						<p class="css-1yx9urm e1t6i3i20">30일 이내 소멸 예정 포인트<b> 0 P</b></p>
					</div>
				</div>
				
				<dl>
					<!--  <dt><img src="https://atimg.sonyunara.com/2023/renew/list/mypage_1.png" class="icon" alt="">주문관리</dt>  -->
					<div class="navi" style="text-align: center; margin-top: 30px; margin-bottom: 40px;">
						<a href="${pageContext.request.contextPath}" style="color: gray;">홈 &gt;</a> 
						<a href="${pageContext.request.contextPath}/mypage/main" style="color: gray;">마이페이지 &gt; </a>
					<a style="color: black;" class="thisCategory">포인트</a></div>
				</dl>
			</div>
			
			
			
			<div class="css-1066lcq e1rx7pum12"><h2 class="css-ojabq6 e1rx7pum11" style="font-size: 25px; font-weight: 600; color: gray;">포인트 내역</h2>
			
			
			
			<!-- 포인트 탭 -->
				<div class="review-item">
					<div class="row align-items-center">
						<c:forEach var="dto" items="${list}">
							<div class="col-md-2">
								<h5>${dto.change_date}</h5>
							</div>
							<div class="col-md-7">
									<div class ="css-s5xdrg e1rx7pum4"><h2 class="css-z57iji e1rx7pum2">${dto.reason}</h2><div class="accumulate css-1yj5lcs e1rx7pum3" style="width: 40px;">${dto.change_points >= 0 ? "적립" : "사용" }</div></div>
									<p class="text-muted">
										<c:choose>
											<c:when test="${not empty dto.productOrderName }">
												<c:if test="${dto.change_points > 0}">
													상품구매확정: ${dto.productOrderName}
												</c:if>
												<c:if test="${dto.change_points < 0}">
													${dto.productOrderName}
												</c:if>												
											</c:when>
											<c:otherwise>
											  기타
											 </c:otherwise>
										</c:choose>
								
									</p>
							</div>
							<div class="col-md-3 text-end">
								<button class="btn ${dto.change_points >= 0 ? 'btn-primary' : 'btn-danger' } ">
									${dto.change_points>=0 ? "+" :""}${dto.change_points}</button>
							</div>
						</c:forEach>
					</div>
				</div>
				
			</div>
					
