<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>

a{

	color: black;
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
	<select class="form-select" style=" width: 200px; ">
			<option>구매 내역</option>
			<option>작성할 리뷰</option>
			<option>작성된 리뷰</option>
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
    							${dto.review}
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
