<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

    <div class="container mt-4">
        <!-- 검색 필터 -->
        <form class="mb-4">
            <div class="row mb-3">
                <div class="col">
                    <label for="searchKeyword" class="form-label">검색어</label>
					<input type="text" id="searchKeyword" class="form-control" placeholder="키워드 입력">
                </div>
                <div class="col">
                    <label for="category" class="form-label">카테고리</label>
                    <select id="category" class="form-select">
                        <option selected>카테고리선택</option>
                        <!-- 카테고리 돌릴 곳 -->
                    </select>
                </div>
                <div class="col">
                    <label for="subCategory" class="form-label">하위카테고리</label>
                    <select id="category" class="form-select">
                        <option selected>하위카테고리</option>
                        <!-- 카테고리 돌릴 곳 -->
                    </select>
                </div>
				<!-- 기간검색 우선 주석처리       
				<div class="col">
                    <label for="dateRange" class="form-label">기간검색</label>
                    <input type="text" id="dateRange" class="form-control" placeholder="최근수정일 ~">
                </div> 
                -->
            </div>
            <div class="row mb-3">
                <div class="col">
                    <label for="stock" class="form-label">상품재고</label>
                    <input type="text" id="stock" class="form-control" placeholder="개 이상 ~ 개 이하">
                </div>
				<!-- 안씀        
                <div class="col">
                    <label for="region" class="form-label">배송가능 지역</label>
                    <select id="region" class="form-select">
                        <option selected>전체</option>
                        Add more options here
                    </select>
                </div>
				-->                
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
                            <label class="form-check-label" for="outOfStockStatus">품절</label>
                        </div>
                    </div>
                </div>
				<!-- 과세 안쓰겠지?
                 <div class="col">
                    <label class="form-label">과세유형</label>
                    <div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="taxType" id="allTax" value="all" checked>
                            <label class="form-check-label" for="allTax">전체</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="taxType" id="taxable" value="taxable">
                            <label class="form-check-label" for="taxable">과세</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="taxType" id="nonTaxable" value="nonTaxable">
                            <label class="form-check-label" for="nonTaxable">비과세</label>
                        </div>
                    </div>
                </div> 
                -->
            </div>
            <div class="d-flex justify-content-end">
                <button type="reset" class="btn btn-secondary me-2">초기화</button>
                <button type="submit" class="btn btn-primary">검색</button>
            </div>
        </form>
        
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
                        <th>최초등록일</th>
                        <th>최근수정일</th>
                        <th>진열</th>
                        <th>정가</th>
                        <th>판매가</th>
                        <th>적립금</th>
                        <!-- <th>순위</th> -->
                        <th>관리</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td><img src="이미지 URL" alt="상품 이미지" width="50"></td>
                        <td>AP-100001</td>
                        <td>상품명 예시</td>
                        <td>패션의류/잡화/뷰티</td>
                        <td>21-06-06</td>
                        <td>23-11-10</td>
                        <td>진열</td>
                        <td>20,000</td>
                        <td>29,520</td>
                        <td>1,480</td>
                        <!-- <td>2</td> -->
                        <td><button class="btn btn-sm btn-primary">수정</button></td>
                    </tr>
                    <!-- 상품 진열할 곳 -->
                </tbody>
            </table>
        </div>
        <button class="btn btn-success mt-3">+ 상품등록</button>
    </div>