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

<div class="mt-4">
	<div class="body-container">
	<!-- title 및 nav -->
		<div class="body-main">
		    <ul class="custom-nav-tabs mt-5 align-items-center justify-content-between" id="myTab" role="tablist">
		        <h4 class="custom-title mb-0">공지 사항</h4>
		        <div class="custom-nav-pills">
		            <li class="nav-item" role="presentation" style="list-style: none">
		                <button class="custom-nav-link ${state==1?'active':''}" id="tab-1" data-bs-toggle="tab" data-bs-target="#tab-pane" type="button" role="tab" aria-controls="1" aria-selected="${state==1?'true':'false'}">일반 공지</button>
		            </li>
		            <li class="nav-item" role="presentation" style="list-style: none">
		                <button class="custom-nav-link ${state==2?'active':''}" id="tab-2" data-bs-toggle="tab" data-bs-target="#tab-pane" type="button" role="tab" aria-controls="2" aria-selected="${state==2?'true':'false'}">중요 공지</button>
		            </li>
		            <li class="nav-item" role="presentation" style="list-style: none">
		                <button class="custom-nav-link ${state==3?'active':''}" id="tab-3" data-bs-toggle="tab" data-bs-target="#tab-pane" type="button" role="tab" aria-controls="3" aria-selected="${state==3?'true':'false'}">숨김 공지</button>
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
						<th width="90">순번</th>
						<th style="max-width: 600px;">제목</th>
						<th width="100">작성자</th>
						<th width="120">등록일</th>
					</tr>
				</thead>
				
				<tbody class="notice-list">
					<tr>
						<td>1</td>
						<td>테스트</td>
						<td>관리자</td>
						<td>2024-07-10</td>
					</tr>
					<tr>
						<td>2</td>
						<td>테스트2</td>
						<td>어드민</td>
						<td>2024-07-12</td>
					</tr>
				</tbody>
				
			</table>
				
		<div class="page-navigation">페이징</div>	
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
								<input type="text" name="noticeWriter" class="form-control form-control-sm w-75">
							</td>
						</tr>
						<tr>
							<td class="text-center align-middle">표시</td>
							<td>
								<select name="viewDetail" class="viewDetail form-select form-control-sm w-25">
									<option value="0" selected>일반</option>
									<option value="1">중요</option>
									<option value="2">숨김</option>
								</select>
							</td>
						</tr>
						<tr>
							<td class="text-center align-middle">본문<br>
								<span class="count">0자</span><br>
								<span class="total">/<br>1000자</span>
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

</div>

<script type="text/javascript">
//글 등록버튼
$(".btn-append").click(function(){
    $(".saveNotice-form input[name=noticeTitle]").val("");
    $(".saveNotice-form input[name=noticeDate]").val("");
    $(".saveNotice-form input[name=noticeWriter]").val("");
    $(".saveNotice-form .count").text("0자");
    $(".saveNotice-form .noticeContent").val("");
    
    $(".saveNotice-form select[name=viewDetail]").val("0");
    $(".saveNotice-form input[name=mode]").val("insert");
    
    var currentDate = new Date().toISOString().split('T')[0];
    $(".saveNotice-form input[name=noticeDate]").val(currentDate);
    
    $(".saveNotice-form .btn-productSave").text("등록");

    $("#noticeSaveModal").modal("show");
});

$(".btn-noticeCancel").click(function(){
	$("#noticeSaveModal").modal("hide");
});

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
</script>

