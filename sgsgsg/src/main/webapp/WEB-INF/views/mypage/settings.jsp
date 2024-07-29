<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<script>
document.getElementById('infoUpdateBtn').addEventListener('click', function() {
    location.href = '${pageContext.request.contextPath}/member/pwd';
});

</script>

<style>

.card-body{
	height: 500px;
	margin: auto;;
}

.col-md-4 {
	margin: auto;
}

.css-4buihn {
    width: 150px;;
    height: 150px;;
    object-fit: fill;
    border-radius: 50%;
    margin-top: 50px;
}

.nick, .birth {
	color: gray;
	margin-top: 10px;
}

.profileData {
	font-size: 18px;
}

.row {
	margin-top: 40px;
	
}


.profile-remove {
	margin-left: 65px;
	color: lightgray;
	font-size: 13px;
	
}

</style>

<div class="col-md-4">
	<div class="card">
		<div class="card-body">
			<h5 class="card-title btn-profile-change" data-profile='${dto.profile}'>
				<c:set var="url1" value="${pageContext.request.contextPath}/resources/images/person.png"/>
				<c:set var="url2" value="${pageContext.request.contextPath}/uploads/profile/${dto.profile}"/>
			
				<img class="img-my-profile" src="${empty dto.profile ? url1:url2}" >
			</h5>
			<div>
				<a class="profile-remove">이미지 삭제</a>
			</div>
			<div>
				<div class="nick">이름  </div>
				<div class="profileData" >${dto.userName}</div>
				<div class="birth">생년월일  </div>
				<div class="profileData" >${dto.birth}</div>
			</div>
			
			<div class="row">
			        <button class="btn btn-primary" id="infoUpdateBtn">회원정보수정</button>
			</div>
		</div>
	</div>
</div>