<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/echarts/5.5.0/echarts.min.js"></script>

<style>
.title-container {
    flex-grow: 1;
}
.data-container {
    display: flex;
    gap: 20px;
}

.centered-message {
    display: flex;
    align-items: center;
    justify-content: center;
    height: 100%;
    text-align: center;
    color: #999;
}
</style>

<script type="text/javascript">
$(function() {
	//회원통계 바로 출력
	chartsUser();
	
	let baseURL = "${pageContext.request.contextPath}/adminManagement";

	function loadData(url) {	
	    $.getJSON(url, function(data) {
	    	console.log(new Date().getTime());
	    	console.log("넘어온 자료: ", data);
	    	
	    	//Order 데이터 분류
	        let orderKey = Object.keys(data).find(key => key.endsWith('Order'));
	        let periodType = orderKey ? orderKey.replace('Order', '') : '';
	        let periodTitle = getPeriodTitle(periodType);
	        let orderTitle = periodTitle + ' 구매현황';

	        console.log(orderKey + ":" + data[orderKey] + ":" + periodType);
	        
	        if (orderKey && data[orderKey] && data[orderKey].length > 0) {
	        	//clearChart('.charts-today-order');
	            chartOrder(data, orderTitle);
	        } else {
	        	//clearChart('.charts-today-order');
	            handleEmptyData('.charts-today-order', '조회되는 주문 정보가 없습니다.', orderTitle);
	        }

			//Delivery 데이터 분류
	        let deliveryKey = Object.keys(data).find(key => key.endsWith('Delivery'));
	        periodType = deliveryKey ? deliveryKey.replace('Delivery', '') : '';
	        periodTitle = getPeriodTitle(periodType);
	        let deliveryTitle = periodTitle + ' 배송현황';

	        console.log(deliveryKey + ":" + data[deliveryKey] + ":" + periodType);
	        
	        if (deliveryKey && data[deliveryKey] && data[deliveryKey].length > 0) {
	        	//clearChart('.charts-today-delivery');
	            chartDelivery(data, deliveryTitle);
	        } else {
	        	//clearChart('.charts-today-delivery');
	            handleEmptyData('.charts-today-delivery', '조회되는 배송 정보가 없습니다.', deliveryTitle);
	        }
	        
	    }).fail(function() {
	        handleEmptyData('.charts-today-order', '데이터를 불러오는 중 오류가 발생했습니다.', '구매현황');
	        handleEmptyData('.charts-today-delivery', '데이터를 불러오는 중 오류가 발생했습니다.', '배송현황');
	    });
	}

	function getPeriodTitle(periodType) {
		switch (periodType) {
			case 'today': return '일일';
			case 'week': return '주간';
			case 'month': return '한달';
			default: return '';
		}
	}

    //초기데이터
    loadData(baseURL + "/daily");

    //바뀔때
    $('.mySelectThing').on('change', function() {
        let selectedOption = $(this).val();
        let url = baseURL + "/" + selectedOption; // + "?tmp=" + new Date().getTime();

        console.log("옵션값:", selectedOption);
        console.log("URL:", url);

        loadData(url);
    });
});

function handleEmptyData(selector, message, title) {
    $(selector).html('<div class="centered-message">' + message + '</div>');
    if (selector.includes('order')) {
        document.querySelector('.charts-today-order-title').innerHTML = title;
    } else if (selector.includes('delivery')) {
        document.querySelector('.charts-today-delivery-title').innerHTML = title;
    }
}
/* 
function clearMessage(selector) {
    $(selector + ' .centered-message').remove();
}

function clearChart(selector) {
    const chartContainer = document.querySelector(selector);
    while (chartContainer.firstChild) {
        chartContainer.removeChild(chartContainer.firstChild);
    }
}
*/

function chartOrder(data, title) {
	//console.log(data);
	let chartData = [];
	
	let orderKey = Object.keys(data).find(key => key.endsWith('Order'));
	let orders = data[orderKey];
	
	//clearMessage('.charts-today-order');
	document.querySelector('.charts-today-order-title').innerHTML = title;
	
	for(let item of orders) {
		let stateNum = item.ORDERSTATE;
		//console.log(stateNum);
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
		//console.log(str);
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
	      name: title,
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

function chartDelivery(data, title) {
	//console.log(data)
	let chartData = [];
	
	let deliveryKey = Object.keys(data).find(key => key.endsWith('Delivery'));
	let delivery = data[deliveryKey];
	
	//clearMessage('.charts-today-delivery');
	document.querySelector('.charts-today-delivery-title').innerHTML = title;
	
	
	for(let item of delivery) {
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
		//console.log(str);
		let obj = {value:item.STATECOUNT, name:str};
		chartData.push(obj);
	}
	
	var chartDom = document.querySelector('.charts-today-delivery');
	var myChart = echarts.init(chartDom);
	//myChart.clear();
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
	      name: title,
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
	
	//myChart.clear();
	option && myChart.setOption(option);
}

function chartsUser() {
	//bar
	let chartData = [];
	
	let toDayData = ${toDayCount};
	let yesterDayData = ${yesterDayCount};
	
	let title = '회원 통계';
	let currentData = ${currentCount};
	let totalData = ${totalCount};
	document.querySelector('.charts-user-title').innerHTML = title;
	document.querySelector('.charts-user-current').innerHTML = "현재: " + currentData;
	document.querySelector('.charts-user-total').innerHTML = "전체: " + totalData;
	
	chartData.push(currentData);
	chartData.push(toDayData);
	chartData.push(yesterDayData);
	/* chartData.push(totalData); */
	
	var chartDom = document.querySelector('.charts-user');
	var myChart = echarts.init(chartDom);
	var option;

	option = {
	  tooltip: {
		trigger: 'item'
	  },
	  xAxis: {
	    type: 'category',
	    data: ['현재', '오늘', '어제']
	  },
	  yAxis: {
	    type: 'value'
	  },
	  series: [
	    {
	      data: chartData,
	      type: 'bar',
	      itemStyle: {
	        color: function(params) {
	          //색상 변경
	          var colorList = ['#AEC6CF', '#77DD77', '#FDFD96', '#FFB7B2'];
	          return colorList[params.dataIndex];
	        }
	      }
	    }
	  ]
	};

	option && myChart.setOption(option);
};
</script>

<div class="body-container">
    <div class="body-main">
        <!-- 전체 주문 통계 -->
        <div class="container my-4">
			<div class="row mb-3 align-items-center">
			    <h5 class="col-8 mb-0"><i class="fas fa-chart-line"></i> 통계 </h5>
			    <div class="col-4 text-end">
			        <strong class="mb-2">조회 옵션</strong>
			        	<br>
			        <select class="form-select-sm mySelectThing">
			            <option value="daily">당일 조회</option>
			            <option value="week">일주일 조회</option>
			            <option value="month">한달 조회</option>
			        </select>
			    </div>
			</div>
            <div class="row g-4">
                <div class="col-md-4">
                    <div class="card border-light shadow-sm">
                        <div class="card-body">
                      		<div class="col p-2">
							    <div class="d-flex">
							        <div class="fs-6 fw-semibold title-container">
							            <label class="charts-user-title mb-2"></label>
							        </div>
							        <div class="data-container">
							            <div class="fs-8">
							                <label class="charts-user-current mb-2"></label>
							            </div>
							            <div class="fs-8">
							                <label class="charts-user-total mb-2"></label>
							            </div>
							        </div>
							    </div>
								<div class="charts-user border rounded" style="height: 300px;"></div>
							</div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card border-light shadow-sm">
                    
                        <div class="card-body">
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

        <div class="container my-4">
            <h5 class="mb-3"><i class="fas fa-list-alt"></i> 최근 주문내역</h5>
            <div class="table-responsive">
                <table class="table table-bordered table-hover">
                
                    <thead class="table-light">
                        <tr>
                            <th scope="col" class="text-center">주문번호</th>
                            <th scope="col" class="text-center">상품명</th>
                            <th scope="col" class="text-center">수령자명</th>
                            <th scope="col" class="text-center">주문자명</th>
                            <th scope="col" class="text-center">총주문액</th>
                            <th scope="col" class="text-center">상태</th>
                            <th scope="col" class="text-center">주문일자</th>
                        </tr>
                    </thead>
                    
				    <tbody>
				    	<c:forEach var="dto" items="${recentOrder}"> 
				    		<tr style="cursor: pointer;" onclick="location.href='${pageContext.request.contextPath}/adminManagement/orderManage/order/detail?orderNum=${dto.orderNum}'">
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