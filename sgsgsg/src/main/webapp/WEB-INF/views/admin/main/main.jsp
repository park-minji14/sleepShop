<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/echarts/5.5.0/echarts.min.js"></script>

<script type="text/javascript">
$(function() {
	let url = "${pageContext.request.contextPath}/adminManagement/charts"
	
	chartsUser();
	
	$.getJSON(url, function(data) {
		chartTodayOrder(data);
		chartTodayDelivery(data);
	});
});

function chartsUser() {
	//bar
	let chartData = [];
	
	let currentData = ${currentCount};
	let toDayData = ${toDayCount};
	let yesterDayData = ${yesterDayCount};
	let totalData = ${totalCount};
	
	let title = '회원 통계(접속자)';
	document.querySelector('.charts-user-title').innerHTML = title;
	
	chartData.push(currentData);
	chartData.push(toDayData);
	chartData.push(yesterDayData);
	chartData.push(totalData);
	
	var chartDom = document.querySelector('.charts-user');
	var myChart = echarts.init(chartDom);
	var option;

	option = {
	  tooltip: {
			trigger: 'item'  
		  },
	  xAxis: {
	    type: 'category',
	    data: ['현재', '오늘', '어제', '전체']
	  },
	  yAxis: {
	    type: 'value'
	  },
	  series: [
	    {
	      data: chartData,
	      type: 'bar'
	    }
	  ]
	};

	option && myChart.setOption(option);
	
};

function chartTodayOrder(data) {
	
	let chartData = [];
	
	let title = '일일 구매현황';
	document.querySelector('.charts-today-order-title').innerHTML = title;
	
	for(let item of data.todayOrder) {
		let stateNum = item.ORDERSTATE;
		console.log(stateNum);
		let str;
		switch (stateNum) {
		case 0: str = "입금대기"; break;
		case 1: str = "결제완료"; break;
		case 10: str = "반품접수"; break;
		case 11: str = "반품완료"; break;
		case 12: str = "환불접수"; break;
		case 13: str = "환불완료"; break;
		default: str = "오류";
		}
		console.log(str);
		let obj = {value:item.STATECOUNT, name:str};
		chartData.push(obj);
	}
	
	var chartDom = document.querySelector('.charts-today-order');
	var myChart = echarts.init(chartDom);
	var option;

	// This example requires ECharts v5.5.0 or later
	option = {
	  tooltip: {
	    trigger: 'item'
	  },
	  legend: {
	    top: '5%',
	    left: 'center'
	  },
	  series: [
	    {
	      name: '당일 주문현황',
	      type: 'pie',
	      radius: ['40%', '70%'],
	      center: ['50%', '70%'],
	      // adjust the start and end angle
	      startAngle: 180,
	      endAngle: 360,
	      data: chartData
	    }
	  ]
	};

	option && myChart.setOption(option);

}

function chartTodayDelivery(data) {
	
	let chartData = [];
	
	let title = '일일 배송현황';
	document.querySelector('.charts-today-delivery-title').innerHTML = title;
	
	for(let item of data.todayDelivery) {
		let stateNum = item.ORDERSTATE;
		
		let str;
		switch (stateNum) {
		case 2: str = "발송처리"; break;
		case 3: str = "배송시작"; break;
		case 4: str = "배송중"; break;
		case 5: str = "배송완료"; break;
		case 6: str = "배송실패"; break;
		case 7: str = "반송됨"; break;
		default: str = "오류";
		}
		console.log(str);
		let obj = {value:item.STATECOUNT, name:str};
		chartData.push(obj);
	}
	
	var chartDom = document.querySelector('.charts-today-delivery');
	var myChart = echarts.init(chartDom);
	var option;

	// This example requires ECharts v5.5.0 or later
	option = {
	  tooltip: {
	    trigger: 'item'
	  },
	  legend: {
	    top: '5%',
	    left: 'center'
	  },
	  series: [
	    {
	      name: '당일 배송현황',
	      type: 'pie',
	      radius: ['40%', '70%'],
	      center: ['50%', '70%'],
	      // adjust the start and end angle
	      startAngle: 180,
	      endAngle: 360,
	      data: chartData
	    }
	  ]
	};

	option && myChart.setOption(option);

}
</script>

<div class="body-container">
    <div class="body-main">
        <!-- 전체 주문 통계 -->
        <div class="container my-4">
            <h5 class="mb-3"><i class="fas fa-chart-line"></i> 통계 </h5>
            <div class="row g-4">
                <div class="col-md-4">
                    <div class="card border-light shadow-sm">
                        <div class="card-body">
                      		<div class="col p-2">
								<div class="fs-6 fw-semibold ">
								<i class="bi bi-chevron-right"></i> <label class="charts-user-title mb-2"></label></div>
								<div class="charts-user border rounded" style="height: 300px;"></div>
							</div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card border-light shadow-sm">
                        <div class="card-body">
                            <!-- <h6 class="card-title">주문상태 현황</h6> -->
                    		<div class="col p-2">
								<div class="fs-6 fw-semibold ">
								<i class="bi bi-chevron-right"></i> <label class="charts-today-order-title mb-2"></label></div>
								<div class="charts-today-order border rounded" style="height: 300px;"></div>
							</div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card border-light shadow-sm">
                        <div class="card-body">
                            <div class="col p-2">
								<div class="fs-6 fw-semibold ">
								<i class="bi bi-chevron-right"></i> <label class="charts-today-delivery-title mb-2"></label></div>
								<div class="charts-today-delivery border rounded" style="height: 300px;"></div>
							</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- 최근 주문 내역 -->
        <div class="container my-4">
            <h5 class="mb-3"><i class="fas fa-list-alt"></i> 최근 주문내역</h5>
            <div class="table-responsive">
                <table class="table table-bordered table-hover">
                    <thead class="table-light">
                        <tr>
                            <th scope="col">주문번호</th>
                            <th scope="col">상품명</th>
                            <th scope="col">수령자명</th>
                            <th scope="col">주문자명</th>
                            <th scope="col">총주문액</th>
                            <th scope="col">상태</th>
                            <th scope="col">주문일자</th>
                        </tr>
                    </thead>
    <tbody>
    	<c:forEach var="dto" items="${recentOrder}">
    		<tr>
    			<td class="text-center">${dto.orderNum}</td>
    			<td class="text-center">${dto.productOrderName}</td>
    			<c:choose>
	    			<c:when test="${not empty dto.recipientName}">
		    			<td class="text-center">${dto.recipientName}</td>
	    			</c:when>
	    			<c:otherwise>
	    				<td class="text-center">-</td>
	    			</c:otherwise>
    			</c:choose>
    			<td class="text-center">${dto.userName}</td>
    			<td class="text-center">
    				<fmt:formatNumber value="${dto.totalMoney}" type="number" pattern="#,##0" />
				</td>
    			<td class="text-center">
                   <c:choose>
                        
                        <c:when test="${dto.orderState == 0}">입금대기</c:when>
                        <c:when test="${dto.orderState == 1}">결제완료</c:when>
                        <c:when test="${dto.orderState == 10}">반품접수</c:when>
                        <c:when test="${dto.orderState == 11}">반품완료</c:when>
                        <c:when test="${dto.orderState == 12}">환불접수</c:when>
                        <c:when test="${dto.orderState == 13}">환불완료</c:when>
                        
                        <c:when test="${dto.orderState == 2}">발송처리</c:when>
                        <c:when test="${dto.orderState == 3}">배송시작</c:when>
                        <c:when test="${dto.orderState == 4}">배송중</c:when>
                        <c:when test="${dto.orderState == 5}">배송완료</c:when>
                        <c:when test="${dto.orderState == 6}">배송실패</c:when>
                        <c:when test="${dto.orderState == 7}">반송됨</c:when>
                        
                        <c:when test="${dto.orderState == 14}">교환접수</c:when>
                        <c:when test="${dto.orderState == 15}">교환완료</c:when>
                        
                        <c:when test="${dto.orderState == 8}">구매확정</c:when>
                        <c:when test="${dto.orderState == 9}">판매취소</c:when>
                        <c:when test="${dto.orderState == 16}">요청취소</c:when>
                        
                        <c:otherwise>알 수 없는 상태</c:otherwise>
                    </c:choose>
                </td>
    			<td class="text-center">${dto.orderDate}</td>
    		</tr>    	
    	</c:forEach>

    </tbody>
                </table>
            </div>
            
        </div>
    </div>
</div>