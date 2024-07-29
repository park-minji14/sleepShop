<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>

.navi{
	margin-bottom: 80px;
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
						<a href="${pageContext.request.contextPath}/" style="color: gray;">홈 &gt;</a> 
						<a href="${pageContext.request.contextPath}/mypage/main" style="color: gray;">마이페이지 &gt; </a>
					<a style="color: black;" class="thisCategory">최근 본 상품</a></div>
				</dl>
			</div>
			
	
			
			<section class="featured-products">
				<div class="remove-layout">
					<button type="button" class="btn" onclick="recentProductRemove()">삭제</button>
				</div>
			    <div class="inner">
			        <div class="product-grid"></div>
    			</div>
			</section>
			

<script type="text/javascript">
$(function(){
	 recentProductView();
});

function recentProductView() {
	let product = JSON.parse(localStorage.getItem("product")) || [];
	let out = '';
	
	if(product.length == 0) {
		out = '<div class="text-center p-5 fs-5" style="color: gray;">최근 본 상품 목록이 없습니다.</div>';
		$('.featured-products .inner').html(out);
		$('.remove-layout').hide();
	} else {
		out = '';
		for(let item of product) {
			let productNum = item.pnum;
			let productName = item.pname;
			let img = item.pimg;
			
			out += ' <div class="product-item">';
			out += '  <a href="${pageContext.request.contextPath}/product/details?productNum='+productNum+'">';
			out += '      <img src="/dra/uploads/product/' + img + '">';
			out += '      <span class="product-info">';
			out += '          <span>' + productName + '</span>';
			out += '       </span>';
			out += '  </a>';
			out += '</div>';
		}
		$('.product-grid').html(out);
		$('.remove-layout').show();
	}
	
}

function recentProductRemove() {
	localStorage.removeItem("product");
	alert("최근 본 상품을 삭제하시겠습니까?");
	recentProductView();
}

</script>			
			
			