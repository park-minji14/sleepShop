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
                            <th scope="col">주문자명</th>
                            <th scope="col">수령자명</th>
                            <th scope="col">전화번호</th>
                            <th scope="col">결제방법</th>
                            <th scope="col">총주문액</th>
                            <th scope="col">주문일시</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>24052415505361</td>
                            <td>세금만</td>
                            <td>세금만</td>
                            <td>010-3333-3333</td>
                            <td>무통장</td>
                            <td>29,520</td>
                            <td>2024-05-24 15:51 (금)</td>
                        </tr>
                        <tr>
                            <td>24051715563443</td>
                            <td>124</td>
                            <td>214</td>
                            <td>124</td>
                            <td>무통장</td>
                            <td>20,000</td>
                            <td>2024-05-17 15:57 (금)</td>
                        </tr>
                        <tr>
                            <td>24040511530204</td>
                            <td>관리자</td>
                            <td>관리자</td>
                            <td>010-0000-0000</td>
                            <td>무통장</td>
                            <td>136,240</td>
                            <td>2024-04-05 11:53 (금)</td>
                        </tr>
                        <tr>
                            <td>24040416420267</td>
                            <td>111111111</td>
                            <td>111111</td>
                            <td>11111</td>
                            <td>무통장</td>
                            <td>58,890</td>
                            <td>2024-04-04 16:42 (목)</td>
                        </tr>
                        <tr>
                            <td>24032211451267</td>
                            <td>한글만</td>
                            <td>한글만</td>
                            <td>010-1111-1111</td>
                            <td>무통장</td>
                            <td>60,060</td>
                            <td>2024-03-22 11:45 (금)</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            
        </div>
    </div>
</div>