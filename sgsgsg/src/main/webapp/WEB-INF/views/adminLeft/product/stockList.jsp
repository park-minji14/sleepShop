<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
.container {
    background-color: #f8f9fa;
    border-radius: 10px;
    box-shadow: 0 0 15px rgba(0,0,0,0.1);
    padding: 25px;
}
.table {
    background-color: #ffffff;
}
.table thead th {
    background-color: #3949ab;
    color: #ffffff;
    border-color: #303f9f;
}
.btn-primary {
    background-color: #3949ab;
    border-color: #3949ab;
}
.btn-primary:hover {
    background-color: #303f9f;
    border-color: #303f9f;
}
.product-preview {
    position: relative;
    cursor: pointer;
}
.product-preview .preview-content {
    display: none;
    position: absolute;
    background-color: #fff;
    border: 1px solid #ddd;
    padding: 10px;
    z-index: 1;
    width: 200px;
    box-shadow: 0 2px 5px rgba(0,0,0,0.2);
}
.product-preview:hover .preview-content {
    display: block;
}
.status-icon {
    font-size: 1.2em;
}
.status-icon.visible {
    color: #4CAF50;
}
.status-icon.hidden {
    color: #F44336;
}
</style>

<script type="text/javascript">
window.addEventListener("load", function() {
    const stockGrater = document.getElementById("stockGrater");
    const stockLess = document.getElementById("stockLess");

    function isNumber(event) {
        event.target.value = event.target.value.replace(/[^0-9]/g, '');
    }

    stockGrater.addEventListener("input", isNumber);
    stockLess.addEventListener("input", isNumber);
});
</script>
    <div class="mt-4">
        <!-- 검색 필터 -->
        <form class="mb-4 " name="searchForm" action="${pageContext.request.contextPath}/adminManagement/productManage/stockList">
        
				<div class="border border-secondary-subtle p-3">
				    <div class="row g-2">
				        <div class="col">
				            <label for="searchKeyword" class="form-label">검색어</label>
				            <input type="text" name="kwd" id="searchKeyword" class="form-control form-control-sm" placeholder="키워드 입력">
				        </div>
				        <div class="col">
				            <label for="stockGrater" class="form-label">재고(이상)</label>
				            <input type="text" name="stockGrater" id="stockGrater" class="form-control form-control-sm" placeholder="개 이상">
				        </div>
				        <div class="col">
				            <label for="stockLess" class="form-label">재고(이하)</label>
				            <input type="text" name="stockLess" id="stockLess" class="form-control form-control-sm" placeholder="개 이하">
				        </div>
				        <div class="col">
				            <label for="category" class="form-label">상위카테고리</label>
				            <select name="parentNum" class="form-select form-select-sm">
				                <option value="">카테고리 선택</option>
				                <c:forEach var="vo" items="${listCategory}">
				                    <option value="${vo.categoryNum}" ${parentNum==vo.categoryNum?"selected":""}>${vo.categoryName}</option>
				                </c:forEach>
				            </select>
				        </div>
				        <div class="col">
				            <label for="subCategory" class="form-label">하위카테고리</label>
				            <select name="categoryNum" class="form-select form-select-sm">
				                <option value="">하위 카테고리 선택</option>
				            </select>
				        </div>
				    </div>
		            <div class="d-flex justify-content-end mt-4">
		                <button type="reset" class="btn btn-secondary me-2">초기화</button>
		                <button type="submit" class="btn btn-primary">검색</button>
		            </div>
				</div>
            
        	</form>
        </div>
        
       	<div class="page-navigation">
			${dataCount == 0 ? "등록된 상품이 없습니다." : paging}
		</div>
		
        <!-- 상품 목록 -->
       	<div class="col-auto pt-2 text-end">
		${dataCount}개(${page}/${total_page} 페이지)
		</div>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th width="70">순번</th>
                        <th width="120">이미지</th>
                        <th width="90">상품코드</th>
                        <th>상품명</th>
                        <th width="110">상위카테고리</th>
                        <th width="120">하위카테고리</th>
                        <th width="100">전체재고</th>
                        <th width="80">진열여부</th>
                        <th width="120">최근수정일</th>
                        <th>관리</th>
                    </tr>
                </thead>
                <tbody>
               		<!-- 상품 진열할 곳 -->
               		<c:forEach var="dto" items="${list}" varStatus="status">
	            		<tr>
	                        <td>${dataCount-(page-1)*size-status.index}</td>
	                        <td>
	                        	<img src="${pageContext.request.contextPath}/uploads/product/${dto.thumbnail}" alt="상품 이미지" width="50" height="50"> 
	                        </td>
	                        <td>${dto.productNum}</td>
	                        <td>${dto.productName}</td>
	                        <td>${dto.categoryName}</td>
	                        <td>
							    <c:choose>
							        <c:when test="${dto.parentNum == 1}">
							            침구
							        </c:when>
							        <c:when test="${dto.parentNum == 2}">
							            가전
							        </c:when>
							        <c:when test="${dto.parentNum == 3}">
							            의류
							        </c:when>
							        <c:when test="${dto.parentNum == 4}">
							            향초
							        </c:when>
							        <c:when test="${dto.parentNum == 5}">
							            조명
							        </c:when>
							        <c:when test="${dto.parentNum == 6}">
							            영양제
							        </c:when>
							        <c:when test="${dto.parentNum == 7}">
							            수면용품
							        </c:when>
							        <c:when test="${dto.parentNum == 8}">
							            졸음방지용품
							        </c:when>
							        <c:otherwise>
							            ${dto.parentNum}
							        </c:otherwise>
							    </c:choose>
							</td>
	                        <td>${dto.totalStock}</td>   
	                        <td>
							    <c:choose>
							        <c:when test="${dto.productShow == 1}">
							            <p>진열</p>
							        </c:when>
							        <c:when test="${dto.productShow == 0}">
							            <p>숨김</p>
							        </c:when>
							        <c:otherwise>
							            <p>조회불가</p>
							        </c:otherwise>
							    </c:choose>
							</td>
							<td>${dto.update_date}</td>
	                        <td><button type="button" class="btn btn-sm btn-primary btn-productStock" id="btnArticle" data-productNum="${dto.productNum}" data-optionCount="${dto.optionCount}">재고관리</button></td>
	                    </tr>
               		</c:forEach>
                    
                </tbody>
            </table>
        </div>
        
    </div>
    
<!-- 재고 상세보기 대화상자 -->
<div class="modal fade" id="productStockDialogModal" tabindex="-1" aria-labelledby="productStockDialogModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="productStockDialogModalLabel">재고관리</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body pt-1">
				<div class="modal-productStock"></div>
			</div>
		</div>
	</div>
</div>
    
<script type="text/javascript">
$(function(){
	$("form select[name=parentNum]").change(function(){
		let parentNum = $(this).val();
		
		$("form select[name=categoryNum]").find('option').remove().end()
			.append("<option value=''>하위 카테고리 선택</option>");	
		
		if(! parentNum) {
			return false;
		}
		
		let url = "${pageContext.request.contextPath}/adminManagement/productManage/listSubCategory";
		let query = "parentNum="+parentNum;
		
		const fn = function(data) {
			$.each(data.listSubCategory, function(index, item){
				let categoryNum = item.categoryNum;
				let categoryName = item.categoryName;
				let s = "<option value='"+categoryNum+"'>"+categoryName+"</option>";
				$("form select[name=categoryNum]").append(s);
			});
		};
		ajaxFun(url, "get", query, "json", fn);
		
	});
});

$(function(){
	$('.btn-productStock').click(function(){
		// 재고 관리 대화상자
		let productNum = $(this).attr('data-productNum');
		let optionCount = $(this).attr('data-optionCount');
		let url = '${pageContext.request.contextPath}/adminManagement/productManage/listProductStock?productNum='+productNum+'&optionCount='+optionCount;
		
		$('.modal-productStock').load(url);
		
		$('#productStockDialogModal').modal('show');
	});
	
	$('.modal-productStock').on('click', '.btn-allStockUpdate', function(){
		// 재고 일괄 변경
		if(! confirm('재고를 일괄 변경 하시겠습니까 ? ')) {
			return false;
		}
		
		let productNum = $(this).attr('data-productNum');
		let url = '${pageContext.request.contextPath}/adminManagement/productManage/updateProductStock';
		let query = 'productNum='+productNum;
		
		let isValid = true;
		$('.productStcok-list tr').each(function(){
			let $input = $(this).find('input[name=totalStock]');
			let $btn = $(this).find('.btn-stockUpdate');
			
			if(!/^\d+$/.test($input.val().trim())) {
				alert('재고량은 숫자만 가능합니다.');
				$input.focus();
				isValid = false;
				return false;
			}
			
			let stockNum = $btn.attr('data-stockNum');
			let detailNum = $btn.attr('data-detailNum');
			detailNum = detailNum ? detailNum : 0;
			let detailNum2 = $btn.attr('data-detailNum2');
			detailNum2 = detailNum2 ? detailNum2 : 0;
			let totalStock = $input.val().trim();
			
			query += '&stockNums=' + stockNum;
			query += '&detailNums=' + detailNum;
			query += '&detailNums2=' + detailNum2;
			query += '&totalStocks=' + totalStock;
		});
		
		if( ! isValid ) {
			return false;
		}
		
		const fn = function(data) {
			if(data.state === "true") {
				alert("재고가 일괄 변경 되었습니다.");
			} else {
				alert("재고 일괄 변경이 실패 했습니다.");
			}
		};
		
		ajaxFun(url, "post", query, "json", fn);		
	});
	
	$('.modal-productStock').on('click', '.btn-stockUpdate', function(){
		// 재고 변경	
		let productNum = $(this).attr('data-productNum');
		let stockNum = $(this).attr('data-stockNum');
		let detailNum = $(this).attr('data-detailNum');
		detailNum = detailNum ? detailNum : 0;
		let detailNum2 = $(this).attr('data-detailNum2');
		detailNum2 = detailNum2 ? detailNum2 : 0;
		let totalStock = $(this).closest('tr').find('input[name=totalStock]').val().trim();
		
		if(!/^\d+$/.test(totalStock)) {
			alert('재고량은 숫자만 가능합니다.');
			$(this).closest('tr').find('input[name=totalStock]').focus();
			return false;
		}
	
		let url = '${pageContext.request.contextPath}/adminManagement/productManage/updateProductStock';
		let query = {productNum:productNum, stockNums:stockNum, detailNums:detailNum, detailNums2:detailNum2, totalStocks:totalStock};
		
		const fn = function(data) {
			if(data.state === "true") {
				alert("재고가 변경 되었습니다.");
			} else {
				alert("재고 변경이 실패 했습니다.");
			}
		};
		
		ajaxFun(url, "post", query, "json", fn);		
		
	});
});
 
const productStockModalEl = document.getElementById('productStockDialogModal');
productStockModalEl.addEventListener('show.bs.modal', function(){
});

productStockModalEl.addEventListener('hidden.bs.modal', function(){
	//모달 안보일 때 바로 갱신시켜줌
	searchList();
});

function searchList() {
	const f = document.searchForm;
	f.submit();
};

function ajaxFun(url, method, formData, dataType, fn, file = false) {
	const settings = {
			type: method, 
			data: formData,
			dataType:dataType,
			success:function(data) {
				fn(data);
			},
			beforeSend: function(jqXHR) {
				jqXHR.setRequestHeader('AJAX', true);
			},
			complete: function () {
			},
			error: function(jqXHR) {
				if(jqXHR.status === 403) {
					login();
					return false;
				} else if(jqXHR.status === 400) {
					alert('요청 처리가 실패 했습니다.');
					return false;
		    	}
		    	
				console.log(jqXHR.responseText);
			}
	};
	
	if(file) {
		settings.processData = false;  // file 전송시 필수. 서버로전송할 데이터를 쿼리문자열로 변환여부
		settings.contentType = false;  // file 전송시 필수. 서버에전송할 데이터의 Content-Type. 기본:application/x-www-urlencoded
	}
	
	$.ajax(url, settings);
}
</script>