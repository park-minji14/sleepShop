<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.body-container {
	max-width: 1200px;
}

.member-list-tr { cursor: pointer; }
</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/boot-board.css" type="text/css">

<div class="body-container" style="padding: 20px 10px 0;">
	<p class="form-control-plaintext fs-6 fw-semibold"><i class="bi bi-chevron-double-right"></i> 회원 정보</p>
	<table class="table table-bordered">
		<tr>
			<td class="bg-light col-sm-2">회원번호</td>
			<td class="col-sm-4">${dto.memberIdx}</td>
			<td class="bg-light col-sm-2">아이디</td>
			<td class="col-sm-4">${dto.userId}</td>
		</tr>
		<tr>
			<td class="bg-light col-sm-2">이 름</td>
			<td class="col-sm-4">${dto.userName}</td>
			<td class="bg-light col-sm-2">생년월일</td>
			<td class="col-sm-4">${dto.birth}</td>
		</tr>
		<tr>
			<td class="bg-light col-sm-2">이메일</td>
			<td colspan="3">${dto.email}</td>
		</tr>
		<tr>
			<td class="bg-light col-sm-2">회원구분</td>
			<td>
				<c:choose>
					<c:when test="${dto.membership == 1}">일반회원</c:when>
					<c:when test="${dto.membership == 55}">전문가</c:when>
					<c:when test="${dto.membership == 77}">사원</c:when>
					<c:when test="${dto.membership == 99}">관리자</c:when>
				</c:choose>
				<span class="btn border" onclick="memberRoleUpdate();" style="cursor: pointer;">권한변경</span>
			</td>
			<td class="bg-light col-sm-2">전화번호</td>
			<td class="col-sm-4">${dto.tel}</td>
		</tr>
		<tr>
			<td class="bg-light col-sm-2">회원가입일</td>
			<td class="col-sm-4">${dto.register_date}</td>
			<td class="bg-light col-sm-2">최근로그인</td>
			<td class="col-sm-4">${dto.last_login}</td>
		</tr>
		
		<tr valign="middle">
			<td class="bg-light col-sm-2">계정상태</td>
			<td colspan="3">
				<span>
					${dto.enabled==1?"활성":"잠금"}
				</span>
				<c:if test="${dto.enabled==0 && not empty memberState}">, ${memberState.memo}</c:if>
				&nbsp;
				<span class="btn border" onclick="memberStateDetaileView();" style="cursor: pointer;">자세히</span>
			</td>
		</tr>
	</table>
	
	<form id="deteailedMemberForm" name="deteailedMemberForm" method="post">
		<p class="form-control-plaintext fs-6 fw-semibold"><i class="bi bi-chevron-double-right"></i> 회원 상태 변경</p>
		<table class="table table-bordered">
			<tr valign="middle">
				<td class="bg-light col-sm-2">계정상태</td>
				<td>
					<select class="form-select" name="stateCode" id="stateCode" onchange="selectStateChange()">
						<option value="">::상태코드::</option>
						<c:if test="${dto.enabled==0}">
							<option value="0">잠금 해제</option>
						</c:if>
						<option value="2">불법적인 방법으로 로그인</option>
						<option value="3">불건전 게시물 등록</option>
						<option value="4">다른 유저 비방</option>
						<option value="5">타계정 도용</option>
						<option value="6">기타 약관 위반</option>
					</select>
				</td>
			</tr>
			<tr valign="middle">
				<td class="bg-light col-sm-2">메 모</td>
				<td>
					<input type="text" name="memo" id="memo" class="form-control">
				</td>
			</tr>
		</table>
		
		<input type="hidden" name="memberIdx" value="${dto.memberIdx}">
		<input type="hidden" name="userId" value="${dto.userId}">
		<input type="hidden" name="registerId" value="${sessionScope.member.userId}">
		<input type="hidden" name="schType" value="${schType}">
		<input type="hidden" name="kwd" value="${kwd}">
		<input type="hidden" name="senabled" value="${enabled}">
		<input type="hidden" name="page" value="${page}">
		
	</form>
	
	<table class="table table-borderless">
		<tr> 
			<td class="text-end">
				<button type="button" class="btn btn-light" onclick="updateOk();">상태변경</button>
				<button type="button" class="btn btn-light" onclick="deleteOk();">회원삭제</button>
				<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/adminManagement/memberManage/list';">리스트</button>
			</td>
		</tr>
	</table>
</div>


<div class="modal fade" id="myMemberStateDetaileDialogModal" tabindex="-1" aria-labelledby="myMemberStateDetaileDialogModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" style="max-width: 600px;">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="myMemberStateDetaileDialogModalLabel">회원상태정보</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
			
				<table class="table board-list">
					<thead class="table-light">
						<tr>
							<th>내용</th>
							<th width="120">담당자</th>
							<th width="180">등록일</th>
						</tr>
					</thead>
					
					<tbody>
						<c:forEach var="vo" items="${listState}">
							<tr>
								<td class="ps-5">${vo.memo} (${vo.stateCode})</td>
								<td class="text-center">${vo.registerId}</td>
								<td class="text-center">${vo.reg_date}</td>
							</tr>
						</c:forEach>
				  
						<c:if test="${listState.size()==0}">
							<tr align="center">
								<td colspan="3" style="border: none;">등록된 정보가 없습니다.</td>
							</tr>  
						</c:if>
					</tbody>
				</table>  
			
			</div>
		</div>
	</div>
</div>

<div class="modal fade" data-bs-backdrop="static" id="myMemberRoleDialogModal" tabindex="-1" aria-labelledby="myMemberRoleDialogModalLabel" aria-hidden="true">
	<div class="modal-dialog  modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="myMemberRoleDialogModalLabel">회원권한변경</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<form name="memberRoleForm" method="post" class="text-center">
					<div class="row">
						<div class="col-auto">
							<select class="form-select" id="userRole" name="membership">
								<option value="1" ${dto.membership == 1 ? "selected" : "" }>일반회원</option>
								<option value="55" ${dto.membership == 55 ? "selected" : "" }>전문가</option>
								<option value="77" ${dto.membership == 77 ? "selected" : "" }>사원</option>
							</select>					
						</div>
						<div class="col-auto">
							<button type="button" class="btn btn-light" onclick="updateRoleOk();">변경하기</button>
						</div>
					</div>
					<input type="hidden" name="authority" value="${dto.authority}">
					<input type="hidden" name="memberIdx" value="${dto.memberIdx}">
					<input type="hidden" name="userId" value="${dto.userId}">
					<input type="hidden" name="schType" value="${schType}">
					<input type="hidden" name="kwd" value="${kwd}">
					<input type="hidden" name="senabled" value="${enabled}">
					<input type="hidden" name="page" value="${page}">
				</form>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
// 회원 상세 상태 정보 대화상자
function memberStateDetaileView() {
	$('#myMemberStateDetaileDialogModal').modal("show");
}


// 회원 상태 변경 완료
function updateOk() {
	const f = document.deteailedMemberForm;
	
	if( ! f.stateCode.value ) {
		alert("상태코드를 선택하세요.");
		f.stateCode.focus();
		return;
	}
	if( ! f.memo.value.trim() ) {
		alert("상태메모를 선택하세요.");
		f.memo.focus();
		return;
	}
	
	f.action = "${pageContext.request.contextPath}/adminManagement/memberManage/updateMemberState";
	f.submit();	
}

// 회원 권한 변경 대화상자
function memberRoleUpdate() {
	$('#myMemberRoleDialogModal').modal("show");
}

// 회원 권한 변경 완료
function updateRoleOk() {
	if(! confirm('회원 권한을 변경 하시겠습니까 ?')) {
		return;
	}
	
	const f = document.memberRoleForm;
	
	if(f.membership.value === "1") {
		f.authority.value = "USER";
	} else if(f.membership.value === "55") {
		f.authority.value = "EXP";
	} else if(f.membership.value === "77") {	
		f.authority.value = "EMP";
	}
	
	f.action = "${pageContext.request.contextPath}/adminManagement/memberManage/updateMemberRole";
	f.submit();
}

function selectStateChange() {
	const f = document.deteailedMemberForm;
	
	let code = f.stateCode.value;
	let memo = f.stateCode.options[f.stateCode.selectedIndex].text;
	
	f.memo.value = "";	
	if(! code) {
		return;
	}

	if(code!=="0" && code!=="6") {
		f.memo.value = memo;
	}
	
	f.memo.focus();
}
</script>
