<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

    <div class="container mt-4">
        <!-- 검색 필터 -->
        <form class="mb-4 ">
        
        	<div class="border border-secondary-subtle p-3">
	            <div class="row mb-3">
	                <div class="col">
	                    <label for="searchKeyword" class="form-label">검색어</label>
						<input type="text" id="searchKeyword" class="form-control" placeholder="키워드 입력">
	                </div>
	                <div class="col">
	                    <label for="category" class="form-label">카테고리</label>
						<select name="parentNum" class="form-select">
							<option value="">카테고리 선택</option>
							<c:forEach var="vo" items="${listCategory}">
								<option value="${vo.categoryNum}" ${parentNum==vo.categoryNum?"selected":""}>${vo.categoryName}</option>
							</c:forEach>
						</select>
	                </div>
	                <div class="col">
	                    <label for="subCategory" class="form-label">하위카테고리</label>
						<select name="categoryNum" class="form-select">
							<option value="">하위 카테고리 선택</option>
							<c:forEach var="vo" items="${listSubCategory}">
								<option value="${vo.categoryNum}" ${dto.categoryNum==vo.categoryNum?"selected":""}>${vo.categoryName}</option>
							</c:forEach>
						</select>
	                </div>
	            </div>
	            
	            <div class="row mb-3">
	                <div class="col">
	                    <label for="stock" class="form-label">상품재고</label>
	                    <input type="text" id="stock" class="form-control" placeholder="개 이상 ~ 개 이하">
	                </div>
	                <div class="col">
	                    <label for="priceRange" class="form-label">상품가격</label>
	                    <input type="text" id="priceRange" class="form-control" placeholder="원 이상 ~ 원 이하">
	                </div>
	            </div>
	            
	            <div class="row mb-3">
	                <div class="col">
	                    <label class="form-label">판매여부</label>
	                    <div>
	                        <div class="form-check form-check-inline">
	                            <input class="form-check-input" type="radio" name="saleStatus" id="allStatus" value="all" checked>
	                            <label class="form-check-label" for="allStatus">전체</label>
	                        </div>
	                        <div class="form-check form-check-inline">
	                            <input class="form-check-input" type="radio" name="saleStatus" id="activeStatus" value="active">
	                            <label class="form-check-label" for="activeStatus">진열</label>
	                        </div>
	                        <div class="form-check form-check-inline">
	                            <input class="form-check-input" type="radio" name="saleStatus" id="outOfStockStatus" value="outOfStock">
	                            <label class="form-check-label" for="outOfStockStatus">숨김</label>
	                        </div>
	                    </div>
	                </div>
	            </div>
	            
		            <div class="d-flex justify-content-end">
		                <button type="reset" class="btn btn-secondary me-2">초기화</button>
		                <button type="submit" class="btn btn-primary">검색</button>
		            </div>
            
            </div>
            
        </form>
        
        <button class="btn btn-success mt-3"><a class="nav-link" href="${pageContext.request.contextPath}/adminManagement/productManage/productWrite">+ 상품 등록</a></button>
       	<div class="page-navigation">
			${dataCount == 0 ? "등록된 상품이 없습니다." : paging}
		</div>
		
        <!-- 상품 목록 -->
        <div class="table-responsive">
            <table class="table table-striped table-bordered">
                <thead>
                    <tr>
                        <th>선택</th>
                        <th>이미지</th>
                        <th>상품코드</th>
                        <th>상품명</th>
                        <th>카테고리</th>
                        <th>최근수정일</th>
                        <th>진열</th>
                        <th>정가</th>
                        <th>할인율</th>
                        <th>판매가</th>
                        <th>적립금</th>
                        <th colspan="2">관리</th>
                    </tr>
                </thead>
                <tbody>
               		<!-- 상품 진열할 곳 -->
               		<c:forEach var="dto" items="${list}" varStatus="status">
               			<tr>
                        <td><input type="checkbox"></td>
                        <td>
                        	<img src="${pageContext.request.contextPath}/uploads/product/${dto.thumbnail}" alt="상품 이미지" width="50"> 
                        </td>
                        <td>${dto.productNum}</td>
                        <td>${dto.productName}</td>
                        <td>${dto.categoryName}</td>
                        <td>${dto.update_date}</td>
                        <td>
				            <c:choose>
				                <c:when test="${dto.productShow == 0}">
				                    숨김
				                </c:when>
				                <c:when test="${dto.productShow == 1}">
				                    진열
				                </c:when>
				                <c:otherwise>
				                    비정상적인 데이터
				                </c:otherwise>
				            </c:choose>
				        </td>
                        <td>${dto.price}</td>
                        <td>${dto.discountRate}%</td>
                        <td><fmt:formatNumber value="${dto.price * (1 - dto.discountRate / 100.0)}" type="number" maxFractionDigits="2"/></td>
                        <td>${dto.savedMoney}</td>
                        <td><button type="button" class="btn btn-sm btn-primary" id="btnUpdate" data-productNum="${dto.productNum}" data-parentNum="${dto.parentNum}" onclick="sendProductNum(this)">수정</button></td>
                        <td><button type="button" class="btn btn-sm btn-danger" id="btnDelete" data-productNum="${dto.productNum}" onclick="sendProductNum(this)">삭제</button></td>
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