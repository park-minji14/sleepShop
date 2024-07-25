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
.button-row {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-top: 20px;
}
.button-group {
    display: flex;
    gap: 10px;
}
.text-center {
    vertical-align: middle;
}
</style>

<script type="text/javascript">
window.addEventListener("load", function() {
    const priceMin = document.getElementById("priceMin");
    const priceMax = document.getElementById("priceMax");

    function isNumber(event) {
        event.target.value = event.target.value.replace(/[^0-9]/g, '');
        
        const value = parseInt(event.target.value, 10);
        const MAX_INT = 2147483647;

        if (value > MAX_INT) {
            event.target.value = MAX_INT;
            alert(`입력값이 너무 큽니다.`);
        }
    }

    priceMin.addEventListener("input", isNumber);
    priceMax.addEventListener("input", isNumber);
});
</script>

    <div class="mt-4">
        <!-- 검색 필터 -->
        <form class="mb-4 ">
        	<div class="border border-secondary-subtle p-3">
	            <div class="row mb-3">
	                <div class="col">
	                    <label for="searchKeyword" class="form-label">검색어</label>
						<input type="text" name="kwd" id="searchKeyword" class="form-control form-control-sm" placeholder="키워드 입력" value="${kwd}">
	                </div>
	                <div class="col">
	                    <label for="category" class="form-label">카테고리</label>
						<select name="parentNum" class="form-select form-select-sm">
							<option value="">상위 카테고리 선택</option>
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
	            
		        <div class="row">
		            <div class="col">
		                <label for="priceMin" class="form-label">최소 가격</label>
		                <input type="text" name="priceMin" id="priceMin" class="form-control form-control-sm" placeholder="원 이상" value="${priceMin}">
		            </div>
		            <div class="col">
		                <label for="priceMax" class="form-label">최대 가격</label>
		                <input type="text" name="priceMax" id="priceMax" class="form-control form-control-sm" placeholder="원 이하" value="${priceMax}">
		            </div>
		            
	                <div class="col">
	                    <label class="form-label">판매여부</label>
	                    <div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="productShow" id="allStatus" value="2" ${dto.productShow == 2 ? 'checked' : ''}>
								<label class="form-check-label" for="allStatus">전체</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="productShow" id="activeStatus" value="1" ${dto.productShow == 1 ? 'checked' : ''}>
								<label class="form-check-label" for="activeStatus">진열</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="productShow" id="outOfStockStatus" value="0" ${dto.productShow == 0 ? 'checked' : ''}>
								<label class="form-check-label" for="outOfStockStatus">숨김</label>
							</div>
	                    </div>
	                </div>
	                
	                <div class="row">
					    <div class="col">
					        <small class="text-muted">가격 검색은 정가 기준입니다</small>
					    </div>
					</div>
		        </div>
		        
		    <div class="d-flex justify-content-end">
		        <button type="reset" class="btn btn-secondary me-2" onclick="location.href='${pageContext.request.contextPath}/adminManagement/productManage/productList'">초기화</button>
		        <button type="submit" class="btn btn-primary">검색</button>
		    </div>
            
            </div>
            
        </form>
        
        
	<div class="d-flex justify-content-between align-items-center mt-3">
	    <div class="col-auto">
	        <button class="btn btn-success"><a class="nav-link text-white" href="${pageContext.request.contextPath}/adminManagement/productManage/productWrite">+ 상품 등록</a></button>
	        <button class="btn btn-secondary"><a class="nav-link text-white" href="${pageContext.request.contextPath}/adminManagement/productManage/excelProductAllDownload">EXCEL</a></button>
	    </div>
	    <div class="page-navigation text-center">
	        ${dataCount == 0 ? "등록된 상품이 없습니다." : paging}
	    </div>
	    <div class="col-auto text-end">
	        ${dataCount}개(${page}/${total_page} 페이지)
	    </div>
	</div>
    <div class="table-responsive mt-3">
        <table class="table table-hover">
            <thead>
                <tr>
                    <th class="text-center">순번</th>
                    <th class="text-center">이미지</th>
                    <th class="text-center">상품코드</th>
                    <th class="text-center">상품명</th>
                    <th class="text-center">상위카테고리</th>
                    <th class="text-center">하위카테고리</th>
                    <th class="text-center">최근수정일</th>
                    <th class="text-center">진열</th>
                    <th class="text-center">정가</th>
                    <th class="text-center">할인율</th>
                    <th class="text-center">판매가</th>
                    <th class="text-center">적립금</th>
                    <th colspan="2" class="text-center">관리</th>
                </tr>
            </thead>
            
			<tbody>
			    <c:forEach var="dto" items="${list}" varStatus="status">
			        <tr>
			            <td class="text-center">${dataCount-(page-1)*size-status.index}</td>
			            <td class="text-center">
			                <img src="${pageContext.request.contextPath}/uploads/product/${dto.thumbnail}" alt="상품 이미지" width="50" height="50">
			            </td>
			            <td class="text-center">${dto.productNum}</td>
			            <td class="product-preview text-center">	
			                ${dto.productName}
			            </td>
			            <td class="text-center">
			                <c:choose>
			                    <c:when test="${dto.parentNum == 1}">침구</c:when>
			                    <c:when test="${dto.parentNum == 2}">가전</c:when>
			                    <c:when test="${dto.parentNum == 3}">의류</c:when>
			                    <c:when test="${dto.parentNum == 4}">향초</c:when>
			                    <c:when test="${dto.parentNum == 5}">조명</c:when>
			                    <c:when test="${dto.parentNum == 6}">영양제</c:when>
			                    <c:when test="${dto.parentNum == 7}">수면용품</c:when>
			                    <c:when test="${dto.parentNum == 8}">졸음방지용품</c:when>
			                    <c:otherwise>${dto.parentNum}</c:otherwise>
			                </c:choose>
			            </td>
			            <td class="text-center">${dto.categoryName}</td>
			            <td class="text-center">${dto.update_date}</td>
			            <td class="text-center">
			                <c:choose>
			                    <c:when test="${dto.productShow == 1}"><span>진열</span></c:when>
			                    <c:when test="${dto.productShow == 0}"><span>숨김</span></c:when>
			                    <c:otherwise><span>조회불가</span></c:otherwise>
			                </c:choose>
			            </td>
			            <td class="text-center"><fmt:formatNumber value="${dto.price}" type="number"/></td>
			            <td class="text-center">${dto.discountRate}%</td>
			            <td class="text-center"><fmt:formatNumber value="${dto.salePrice}" type="number" maxFractionDigits="0"/></td>
			            <td class="text-center">${dto.savedMoney}</td>
			            <td class="text-center"><button type="button" class="btn btn-sm btn-primary" id="btnUpdate" data-productNum="${dto.productNum}" data-parentNum="${dto.parentNum}" onclick="sendProductNum(this)">수정</button></td>
			            <td class="text-center"><button type="button" class="btn btn-sm btn-danger" id="btnDelete" data-productNum="${dto.productNum}" onclick="sendProductNum(this)">삭제</button></td>
			        </tr>
			    </c:forEach>
			</tbody>
        </table>
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

function sendProductNum(button) {
    console.log(button.getAttribute('data-parentNum'));
    const productNum = button.getAttribute('data-productNum');
    const parentNum = button.getAttribute('data-parentNum');
    const f = document.createElement('form');
    const bType = button.id;
    f.method = 'get';
    
    const productNumInput = document.createElement('input');
    productNumInput.type = 'hidden';
    productNumInput.name = 'productNum';
    productNumInput.value = productNum;
    f.appendChild(productNumInput);
    
    const parentNumInput = document.createElement('input');
    parentNumInput.type = 'hidden';
    parentNumInput.name = 'parentNum';
    parentNumInput.value = parentNum;
    f.appendChild(parentNumInput);
    
    const pageNumInput = document.createElement('input');
    pageNumInput.type = 'hidden';
    pageNumInput.name = 'pageNo';
    pageNumInput.value = '${pageNo}';
    f.appendChild(pageNumInput);
    
    document.body.appendChild(f);
    
    if (bType === 'btnUpdate') {
        f.action = '${pageContext.request.contextPath}/adminManagement/productManage/productUpdate';
        f.submit();
    } else if (bType === 'btnDelete') {
        if (confirm('삭제는 복구 되지 않습니다.')) {
            f.action = '${pageContext.request.contextPath}/adminManagement/productManage/productDelete';
            f.submit();
        } else {
            document.body.removeChild(f);
        }
    }
}

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