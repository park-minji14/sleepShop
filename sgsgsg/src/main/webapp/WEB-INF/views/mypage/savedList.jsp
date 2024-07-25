<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>

a{

	color: black;
}

.reviewDate {
	margin-left: 10px;
}

.card {
	height: 100px;
}


.navi{
	margin-bottom: 80px;
}


.btn-write-review {
    background-color: #007bff;
    color: white;
    border: none;
    padding: 8px 15px;
    border-radius: 4px;
    transition: background-color 0.3s ease;
}

.btn-success {
    background-color: orange;
    color: white;
    border: none;
    padding: 8px 15px;
    border-radius: 4px;
    transition: background-color 0.3s ease;
}


.btn-success {
    --bs-btn-color: #fff;
    --bs-btn-bg: #DF7401;
    --bs-btn-border-color: #DF7401;
    --bs-btn-hover-color: black;
    --bs-btn-hover-bg: #DF7401;
    --bs-btn-hover-border-color: #DF7401;
    --bs-btn-focus-shadow-rgb: 60, 153, 110;
    --bs-btn-active-color: black;
    --bs-btn-active-bg: #DF7401;
    --bs-btn-active-border-color: #DF7401;
    --bs-btn-active-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125);
    --bs-btn-disabled-color: #fff;
    --bs-btn-disabled-bg: #DF7401;
    --bs-btn-disabled-border-color: #DF7401;
}


.h5, h5 {
    font-size: 1.15rem;
}

.orange {
	color: orange;
}

</style>

	<!-- 나의 리뷰 탭 -->
	<div class="tab-pane fade show active" id="reviews">
	    <h4 class="mb-4" style="text-align: center;   font-size: 33px;  font-weight: 600; margin: 90px;">구매한 상품</h4>
	    		<dl>
					<!--  <dt><img src="https://atimg.sonyunara.com/2023/renew/list/mypage_1.png" class="icon" alt="">주문관리</dt>  -->
					<div class="navi" style="text-align: center;">
						<a href="${pageContext.request.contextPath}">홈 &gt;</a> 
						<a href="${pageContext.request.contextPath}/mypage/main">마이페이지 &gt; </a>
					<a style="font: light-gray;">나의 리뷰</a></div>
				</dl>
	           
	           <div class="col-md-6">
				<select class="form-select changeReview" style=" width: 200px; margin-bottom: 20px;">
					<option value="0" ${state==0?'selected':''}>구매 내역</option>
					<option value="1" ${state==1?'selected':''}>작성할 리뷰</option>
					<option value="2" ${state==2?'selected':''}>작성된 리뷰</option>
				</select>
	</div>
            
            
     <c:forEach var="dto" items="${list}" varStatus="status">
            <div class="review-item">
                <div class="row align-items-center">
                    <div class="col-md-2">
                        <img src="${pageContext.request.contextPath}/uploads/product/${dto.thumbnail}" alt="Product"
                            class="img-fluid">
                    </div>
                    <div class="col-md-7">
                        <a href="${pageContext.request.contextPath}/product/details?productNum=${dto.productNum}" ><h5>${dto.productName}</h5></a>
		              <p class="text-muted">구매일: ${dto.orderDate}</p>
		            </div>
		            <div class="col-md-3 text-end">
	                	<button class="btn ${dto.reviewWrite == 1 ? 'btn-success':'btn-write-review' }" data-orderDetailNum="${dto.orderDetailNum}" data-reviewWrite="${dto.reviewWrite}"
	                		data-bs-toggle="collapse" data-bs-target="#collapseExample${status.index}" aria-expanded="false" aria-controls="collapseExample">${dto.reviewWrite == 1 ? "리뷰 보기" : "리뷰 작성"}</button>
		            </div>
		            <c:if test="${dto.reviewWrite==1}">
		            	<div class="collapse" id="collapseExample${status.index}">
	  							<div class="card card-body">
		  							<div style="display: flex; flex-direction: row;">
		  								<div>
		  									<i class="bi ${dto.score >= 1 ? 'bi-star-fill orange':'bi-star' }"></i>
		  									<i class="bi ${dto.score >= 2 ? 'bi-star-fill orange':'bi-star' }""></i>
		  									<i class="bi ${dto.score >= 3 ? 'bi-star-fill orange':'bi-star' }""></i>
		  									<i class="bi ${dto.score >= 4 ? 'bi-star-fill orange':'bi-star' }""></i>
		  									<i class="bi ${dto.score >= 5 ? 'bi-star-fill orange':'bi-star' }""></i>
		  								</div>
		  								<div class="reviewDate" style="text-align: left;">
		  									${dto.review_Date}
		  								</div>
		  								<div>
		  									<button class="btn deleteReview" onclick="deleteReview('${dto.orderDetailNum}', '${pageNo}');">리뷰삭제</button>
		  								</div>
	  								</div>
		  								<div style="display: flex; flex-direction: row;">
			  								<div>
			    								${dto.review}
			    							</div>	
		  								<div>

		    							</div>
	  								</div>
								</div>
						</div>
		            </c:if>
		        </div>
	        </div>
	  </c:forEach>
	  <div class="page-navigation text-center mt-3">
            ${dataCount == 0 ? "등록된 문의가 없습니다." : paging}
      </div>
        

</div>
