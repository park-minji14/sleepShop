<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div>
    <div class="mt-3">
    
		<div class="card shadow-sm" style="background-color: #f2f2f2; border: 1px solid #e0e0e0;">
		    <div class="card-body d-flex align-items-center">
		        <div class="me-3">
		            <i class="fas fa-box-open fa-2x text-success"></i>
		        </div>
		        <div>
		            <h5 class="card-title mb-0">${productName}</h5>
		            <p class="text-muted mb-0">재고 상세</p>
		        </div>
		    </div>
		</div>

    </div>
		<div class="mt-3 p-2">
			<div class="row pb-2">
				<div class="col text-end">
					<button type="button" class="btn btn-light border btn-allStockUpdate"
						data-productNum="${productNum}">
						<i class="fas fa-plus"></i> 전체등록
					</button>
				</div>
			</div>
			<table class="table table-border table-list">
            <thead class="bg-primary text-white">
                <tr>
                    <th scope="col" class="text-center" width="100">번호</th>
                    <th scope="col" class="text-left" width="200">${title}</th>
                    <th scope="col" class="text-left" width="200">${title2}</th>
                    <th scope="col" class="text-center" width="170">재고량</th>
                    <th scope="col" class="text-center">변 경</th>
                </tr>
            </thead>
				<tbody class="productStcok-list">
					<c:if test="${list.size() == 0}">
						<tr>
							<td colspan="5">등록된 상품이 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${list.size() != 0}">
						<c:forEach var="dto" items="${list}" varStatus="status">
							<tr valign="middle">
								<td class="text-center">${status.count}</td>
								<td class="left">${dto.optionValue}</td>
								<td class="left">${dto.optionValue2}</td>
								<td class="left">
									<input type="text" name="totalStock" class="form-control" value="${dto.totalStock}">
								</td>
								<td>
									<button type="button" class="btn border btn-light btn-stockUpdate"
										data-stockNum="${dto.stockNum}"
										data-detailNum="${dto.detailNum}"
										data-detailNum2="${dto.detailNum2}"
										data-productNum="${dto.productNum}">
										 <i class="fas fa-save"></i>
									 </button>
								</td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
		
		</div>
</div>