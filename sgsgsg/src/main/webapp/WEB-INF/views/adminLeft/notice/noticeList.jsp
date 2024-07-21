<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
.body-container{
	max-width: 1000px;
}
.custom-title {
	max-width: 140px;
    font-size: 1.3rem;
    font-weight: bold;
    color: #fff; 
    background-color: #3d3d4f; 
    padding: 10px 20px; 
    border-radius: 5px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}
.custom-nav-tabs {
    border-bottom: none; 
    display: flex;
    align-items: center;
    justify-content: space-between; 
}
.custom-nav-pills {
    display: flex;
    gap: 10px; 
}
.custom-nav-link {
    min-width: 170px;
    background: #f3f5f7;
    border-radius: 0;
    border-right: 1px solid #dbdddf;
    color: #333;
    font-weight: 600;
    border: none; 
    background-color: transparent; 
}
.custom-nav-link.active {
    background: #3d3d4f;
    color: #fff;
}
.tab-pane {
    min-height: 300px;
}
.table {
    background-color: #ffffff;
}
.table thead th {
    background-color: #3949ab;
    color: #ffffff;
    border-color: #303f9f;
}
.table-list thead > tr > th { padding-top: 10px; padding-bottom: 10px; }
.table-list tbody > tr { vertical-align: middle; }
.table-list tbody tr > td { text-align: center; }
.table-list .left { text-align: left; padding-left: 10px; }

</style>

<script type="text/javascript">
    var userNickname = "${sessionScope.member.userName}";
</script>

<div class="mt-4">
	<div class="body-container">
	<!-- title 및 nav -->
		<div class="body-main">
		    <ul class="custom-nav-tabs mt-5 align-items-center justify-content-between" id="myTab" role="tablist">
		        <h4 class="custom-title mb-0">공지 사항</h4>
		        <div class="custom-nav-pills">
		            <li class="nav-item" role="presentation" style="list-style: none">
		                <button class="custom-nav-link ${state==0?'active':''}" id="tab-1" data-bs-toggle="tab" data-bs-target="#tab-pane" type="button" role="tab" aria-controls="0" aria-selected="${state==0?'true':'false'}">일반 공지</button>
		            </li>
		            <li class="nav-item" role="presentation" style="list-style: none">
		                <button class="custom-nav-link ${state==1?'active':''}" id="tab-2" data-bs-toggle="tab" data-bs-target="#tab-pane" type="button" role="tab" aria-controls="1" aria-selected="${state==1?'true':'false'}">중요 공지</button>
		            </li>
		            <li class="nav-item" role="presentation" style="list-style: none">
		                <button class="custom-nav-link ${state==2?'active':''}" id="tab-3" data-bs-toggle="tab" data-bs-target="#tab-pane" type="button" role="tab" aria-controls="2" aria-selected="${state==2?'true':'false'}">숨김 공지</button>
		            </li>
		        </div>
		    </ul>
		</div>
	
		<!-- 본문 -->
		<div class="pb-2 text-end">
			<button type="button" class="btn btn-light btn-append">공지사항 작성</button>
		</div>
			<table class="table table-border table-list">
				<thead>
					<tr class="text-center">
						<th width="100">고유번호</th>
						<th style="max-width: 600px;">제목</th>
						<th width="100">작성자</th>
						<th width="120">최초등록일</th>
						<th width="150">관리</th>
					</tr>
				</thead>
				
				<tbody class="notice-list">
				</tbody>
			</table>
			
			<div class="row justify-content-center align-items-center mb-3">
			    <div class="col-auto">
			        <form id="searchForm" class="d-flex justify-content-center">
			            <select name="searchType" class="form-select form-select-sm me-2" style="width: 150px;">
			                <option value="all">전체</option>
			                <option value="title">제목</option>
			                <option value="content">내용</option>
			                <option value="writer">작성자</option>
			            </select>
			            <input type="text" name="keyword" class="form-control form-control-sm me-2" placeholder="검색어" style="width: 200px;">
			            <button type="button" class="btn btn-primary btn-sm" onclick="searchNotice()">검색</button>
			        </form>
			    </div>
			</div>
				
		<div class="page-navigation">
		
		</div>	
	</div>
	
	<!-- 모달 대화상자(등록/수정/삭제) -->
	<div class="modal fade modal-lg" id="noticeSaveModal" aria-labelledby="Label" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header" style="background-color: #eee;">
					<h5 class="modal-title" id="Label">공지사항(일반/중요)</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body pt-1 saveNotice-form">
					<table class="table">
						<tr>
							<td class="text-center align-middle">제목</td>
							<td>
								<input type="text" name="noticeTitle" class="form-control form-control-sm w-75">
							</td>
						</tr>
						<tr>
							<td class="text-center align-middle">등록일자</td>
							<td>
								<input type="text" name="noticeDate" class="form-control form-control-sm w-25" readonly>
							</td>
						</tr>
						<tr>
							<td class="text-center align-middle">작성자</td>
							<td>
								<input type="text" name="noticeWriter" class="form-control form-control-sm w-75" readonly>
							</td>
						</tr>
						<tr>
							<td class="text-center align-middle">표시</td>
							<td>
								<select name="status" class="status form-select form-control-sm w-25">
									<option value="0" selected>일반</option>
									<option value="1">중요</option>
									<option value="2">숨김</option>
								</select>
							</td>
						</tr>
						<tr>
							<td class="text-center align-middle">본문<br>
								<span class="count">0자</span><br>
								<span class="total">/<br>5000자</span>
							</td>
							
							<td>
								<textarea name="noticeContent" class="form-control noticeContent" id="noticeContent" rows="15" placeholder="이곳에 입력해주세요."></textarea>
							</td>
						</tr>
					</table>
					
					<table class="table table-borderless">
						<tr>
							<td class="text-end">
								<input type="hidden" name="mode">
								<input type="hidden" name="noticeNum" value="0">
								<button type="button" class="btn btn-outline-primary btn-noticeSave">등록</button>
				    			<button type="button" class="btn btn-outline-danger btn-noticeCancel">취소</button>
							</td>
						</tr>
					</table>				
				</div>
			</div>
		</div>
	</div>
	
	<!-- 모달 대화상자(글 보기) -->
	<div class="modal fade modal-lg" id="noticeViewModal" aria-labelledby="viewModalLabel" aria-hidden="true">
	    <div class="modal-dialog modal-dialog-centered">
	        <div class="modal-content">
	            <div class="modal-header" style="background-color: #eee;">
	                <h5 class="modal-title" id="viewModalLabel">공지사항 보기</h5>
	                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	            </div>
	            <div class="modal-body pt-1 viewNotice-form">
	                <table class="table">
	                    <tr>
	                        <td class="text-center align-middle">제목</td>
	                        <td>
	                            <span id="viewTitle"></span>
	                        </td>
	                    </tr>
	                    <tr>
	                        <td class="text-center align-middle">작성자</td>
	                        <td>
	                            <span id="viewWriter"></span>
	                        </td>
	                    </tr>
	                    <tr>
	                        <td class="text-center align-middle">등록일자</td>
	                        <td>
	                            <span id="viewDate"></span>
	                        </td>
	                    </tr>
	                    <tr>
	                        <td class="text-center align-middle">수정일자</td>
	                        <td>
	                            <span id="viewUpdatedDate"></span>
	                        </td>
	                    </tr>
	                    <tr>
	                        <td class="text-center align-middle">구분</td>
	                        <td>
	                            <span id="viewStatus"></span>
	                        </td>
	                    </tr>
	                    <tr>
	                        <td class="text-center align-middle">본문</td>
	                        <td>
	                            <div id="viewContent"></div>
	                        </td>
	                    </tr>
	                </table>
	                <div class="text-end">
	                    <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">닫기</button>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>

</div>

<script type="text/javascript">
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

//글 등록버튼
$(".btn-append").click(function(){
    $(".saveNotice-form input[name=noticeTitle]").val("");
    $(".saveNotice-form input[name=noticeDate]").val("");
    $(".saveNotice-form input[name=noticeWriter]").val(userNickname);
    $(".saveNotice-form .count").text("0자");
    $(".saveNotice-form .noticeContent").val("");
    
    var currentStatus = $(".custom-nav-link.active").attr("aria-controls");
    $(".saveNotice-form select[name=status]").val(currentStatus);
    $(".saveNotice-form input[name=mode]").val("insert");
    
    var currentDate = new Date().toISOString().split('T')[0];
    $(".saveNotice-form input[name=noticeDate]").val(currentDate);
    
    $(".saveNotice-form input[name=mode]").val("insert");
    $(".saveNotice-form .btn-noticeSave").text("등록");

    $("#noticeSaveModal").modal("show");
});

$(".btn-noticeCancel").click(function(){
	$("#noticeSaveModal").modal("hide");
});

//등록된 공지 수정 버튼
$("body").on("click", ".btn-update", function(){
    let detailNum = $(this).attr("data-detailNum");
    
    let url = "${pageContext.request.contextPath}/adminManagement/noticeManage/noticeView";
    let query = {num: detailNum};

    const fn = function(data){
        // 데이터 채우기
        $(".saveNotice-form input[name=noticeTitle]").val(data.title);
        $(".saveNotice-form input[name=noticeDate]").val(data.created_date.split(" ")[0]);
        $(".saveNotice-form input[name=noticeWriter]").val(data.userNickname);
        $(".saveNotice-form .noticeContent").val(data.content);
        $(".saveNotice-form select[name=status]").val(data.status);
        $(".saveNotice-form input[name=mode]").val("update");
        $(".saveNotice-form input[name=noticeNum]").val(detailNum);
        
        $(".saveNotice-form .btn-noticeSave").text("수정");
        $("#noticeSaveModal").modal("show");
    };

    ajaxFun(url, "get", query, "json", fn);
});

//등록 공지 삭제 버튼
$("body").on("click", ".btn-delete", function(){
    if( ! confirm('등록된 공지를 삭제 하시겠습니까?') ) {
        return false;    
    }
    
    let detailNum = $(this).attr("data-detailNum");
    let page = $(".notice-list").attr("data-pageNo");
    
    let url = "${pageContext.request.contextPath}/adminManagement/noticeManage/noticeDelete";
    let query = "num="+detailNum;
    
    const fn = function(data){
        listPage(page);
    };
    
    ajaxFun(url, "post", query, "json", fn);
});

//공지등록(수정)대화상자 - 등록완료/수정완료
$(".btn-noticeSave").click(function(){
    let mode = $(".saveNotice-form input[name=mode]").val();

    let title = $(".saveNotice-form input[name=noticeTitle]").val();
    let noticeDate = $(".saveNotice-form input[name=noticeDate]").val();
    let noticeWriter = $(".saveNotice-form input[name=noticeWriter]").val();
    let status = $(".saveNotice-form select[name=status]").val();
    let noticeContent = $(".saveNotice-form textarea[name=noticeContent]").val();
    let updatedDate = new Date().toISOString().split('T')[0];
    
    let query = "";
    let url = "";
    if(mode === "insert") {
        query = "title="+title+"&noticeDate="+noticeDate+"&noticeWriter="+noticeWriter+
                "&status="+status+"&content="+noticeContent;
        url = "${pageContext.request.contextPath}/adminManagement/noticeManage/noticeInsert";
    } else { //수정
        let noticeNum = $(".saveNotice-form input[name=noticeNum]").val();
        query = "num="+noticeNum+"&title="+title+"&noticeDate="+noticeDate+"&noticeWriter="+noticeWriter+
                "&status="+status+"&content="+noticeContent+"&updated_date="+updatedDate;
        url = "${pageContext.request.contextPath}/adminManagement/noticeManage/noticeUpdate";
    }
    
    const fn = function(data){
        $("#noticeSaveModal").modal("hide");
        let page = "1"
        if(mode === "update") {
            page = $(".notice-list").attr("data-pageNo");
        }
        listPage(page);
    };
    
    ajaxFun(url, "post", query, "json", fn);
});

$(function(){
	listPage(1);	
});

function listPage(page) {
	const urlParams = new URLSearchParams(window.location.search);
	const state = urlParams.get('state') || 0; // 기본값을 0으로 설정
	
	let url = "${pageContext.request.contextPath}/adminManagement/noticeManage/noticeList";
	let query = "state=" + state +"&pageNo=" + page;
	
	const fn = function(data){
		let dataCount = parseInt(data.dataCount);
		
		$(".notice-list").html("");
		$(".btn-noticeDelete").prop("disabled", true)
		if(dataCount === 0) {
			$(".page-navigation").html("등록된 공지사항이 없습니다");
		} else {
			printNotice(data);
		}
	};
	
	ajaxFun(url, "get", query, "json", fn);
}

function printNotice(data) {
	let list = data.list;
	let dataCount = parseInt(data.dataCount);
	let pageNo = data.page;
	let total_page = data.total_page;
	let size = data.size;
	let paging = data.paging;
	
	let out = "";
	for(let item of list) {
		let num = item.num;
		let title = item.title;
		let displayOrder = item.displayOrder;
        let date = item.created_date;
        let printDate = date.split(" ")[0];
		let userNickname = item.userNickname;
		let status = item.status;
		let s;
		if(status === 0){
			s = "일반";
		} else if(status === 1){
			s = "중요";
		} else {
			s = "숨김";
		}

		out += "<tr>";
		out += "  <td data-num='"+num+"'>"+num+"</td>";
		out += "  <td>"+title+"</td>";
		//out += "  <td data-status='"+status+"'>"+s+"</td>";
		out += "  <td>"+userNickname+"</td>";
		out += "  <td>"+printDate+"</td>";
		out += "  <td>";
		out += "    <button type='button' class='btn btn-light btn-view' title='보기' data-detailNum='"+num+"'><i class='bi bi-eye'></i></button>";
		out += "    <button type='button' class='btn btn-light btn-update' title='수정' data-detailNum='"+num+"'><i class='bi bi-pencil'></i></button>";
		out += "    <button type='button' class='btn btn-light btn-delete' title='삭제' data-detailNum='"+num+"'><i class='bi bi-trash3'></i></button>";
		out += "  </td>";
		out += "</tr>";
		
	}
	$(".notice-list").html(out);
	$(".notice-list").attr("data-pageNo", pageNo);
	$(".page-navigation").html(paging);
}

//글 보기 버튼 클릭 이벤트
$("body").on("click", ".btn-view", function(){
    let num = $(this).attr("data-detailNum");
    
    let url = "${pageContext.request.contextPath}/adminManagement/noticeManage/noticeView";
    let query = {num: num};

    const fn = function(data){
        $("#viewTitle").text(data.title);
        $("#viewWriter").text(data.userNickname);
        $("#viewDate").text(data.created_date.split(" ")[0]);
        let updatedDate = data.updated_date ? data.updated_date.split(" ")[0] : "없습니다";
        $("#viewUpdatedDate").text(updatedDate);
        $("#viewStatus").text(data.status === 0 ? "일반" : data.status === 1 ? "중요" : "숨김");
        let content = data.content ? data.content.replace(/\n/g, "<br>") : "내용이 없습니다.";
        $("#viewContent").html(content);

        $("#noticeViewModal").modal("show");
    };

    ajaxFun(url, "get", query, "json", fn);
});

function searchNotice() {
    const form = $('#searchForm').serialize();
    listPage(1, form);
}

function listPage(page = 1) {
    const urlParams = new URLSearchParams(window.location.search);
    const state = urlParams.get('state') || 0; // 기본값을 0으로 설정

    let url = "${pageContext.request.contextPath}/adminManagement/noticeManage/noticeSearch";
    let searchForm = $("#searchForm").serialize();
    let query = "state=" + state + "&pageNo=" + page + "&" + searchForm;

    console.log("Search Query:", query); // 디버깅을 위한 로그 출력

    const fn = function(data) {
        let dataCount = parseInt(data.dataCount);
        
        $(".notice-list").html("");
        $(".btn-noticeDelete").prop("disabled", true);
        if(dataCount === 0) {
            $(".page-navigation").html("등록된 공지사항이 없습니다");
        } else {
            printNotice(data);
        }
    };

    ajaxFun(url, "get", query, "json", fn);
}

$(function() {
    $('#noticeContent').keyup(function(e) {
        let content = $(this).val();

        if (content.length == 0 || content == '') {
            $('.count').text('0자');
        } else {
            $('.count').text(content.length + '자');
        }
        
    });
});

//탭
$(function(){
    $("button[role='tab']").on('click', function(){
        const tab = $(this).attr("aria-controls");
        
        let url = "${pageContext.request.contextPath}/adminManagement/noticeManage/main";
        if(tab !== "0") {
            url += "?state=" + tab;
        }
        location.href = url;
        
        $("button[role='tab']").removeClass("active");
        $(this).addClass("active");
    });
});
</script>

