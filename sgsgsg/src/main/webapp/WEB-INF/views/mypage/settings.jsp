<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<script>
document.getElementById('infoUpdateBtn').addEventListener('click', function() {
    window.location.href = '${pageContext.request.contextPath}/member/pwd';
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
	margin-top: 20px;
}

.profileData {
	font-size: 18px;
	
}


.row {
	margin-top: 40px;
	
}



</style>




<div class="col-md-4">
	<div class="card">
		<div class="card-body">
			<h5 class="card-title">
				<img src="https://image.ohou.se/i/bucketplace-v2-development/uploads/users/profile_images/
							166315803394254074.jpeg?w=144&amp;h=144&amp;c=c" srcset="https://image.ohou.se/
							i/bucketplace-v2-development/uploads/users/profile_images/166315803394254074.jpeg?
							w=216&amp;h=216&amp;c=c 1.5x,https://image.ohou.se/i/bucketplace-v2-development/uploads/
							users/profile_images/166315803394254074.jpeg?w=288&amp;h=288&amp;c=c 2x,https://image.ohou.se/
							i/bucketplace-v2-development/uploads/users/profile_images/166315803394254074.jpeg?w=432&amp;h=432&amp;
							c=c 3x" alt="profileImage" class="e1gqgyr33 css-4buihn">
			</h5>
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