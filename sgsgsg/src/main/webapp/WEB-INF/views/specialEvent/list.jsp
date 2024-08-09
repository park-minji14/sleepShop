<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<title>기획전</title>
<style>
.card {
	border: none;
	border-radius: 10px;
	overflow: hidden;
	transition: transform 0.3s;
	margin-bottom: 20px;
}

.card:hover {
	transform: translateY(-5px);
}

.card-img-overlay {
	background: rgba(0, 0, 0, 0.3);
}

.card-title {
	font-weight: bold;
}

.badge {
	font-size: 0.8rem;
}

.card-img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.sub-images {
	display: flex;
	justify-content: space-between;
}

.sub-image {
	width: 23%;
	aspect-ratio: 1/1;
	object-fit: cover;
	border-radius: 5px;
}
</style>


<div class="container my-5">
	<div class="inner">
	<div class="row g-4">
		<div class="col-md-6">
			<div class="card text-white" style="height: 310px;">
				<img src=" https://via.placeholder.com/550x310" class="card-img"
					alt="오늘의 특가">
				<div
					class="card-img-overlay d-flex flex-column justify-content-between">
					<h5 class="card-title">오늘의 특가</h5>
					<p class="card-text">
						<span class="badge bg-primary">최대 80% OFF</span>
					</p>
				</div>
			</div>
			<div class="sub-images mt-2">
				<img src="https://via.placeholder.com/100x100" class="sub-image"
					alt="서브이미지 1"> <img src="https://via.placeholder.com/100x100"
					class="sub-image" alt="서브이미지 2"> <img
					src="https://via.placeholder.com/100x100" class="sub-image"
					alt="서브이미지 3"> <img src="https://via.placeholder.com/100x100"
					class="sub-image" alt="서브이미지 4">
			</div>
		</div>
		<div class="col-md-6">
			<div class="card text-white" style="height: 310px;">
				<img src=" https://via.placeholder.com/550x310" class="card-img"
					alt="오픈특가">
				<div
					class="card-img-overlay d-flex flex-column justify-content-between">
					<h5 class="card-title">오픈특가</h5>
					<p class="card-text">
						<span class="badge bg-success">1870개 상품</span>
					</p>
				</div>
			</div>
			<div class="sub-images mt-2">
				<img src="https://via.placeholder.com/100x100" class="sub-image"
					alt="서브이미지 5"> <img src="https://via.placeholder.com/100x100"
					class="sub-image" alt="서브이미지 6"> <img
					src="https://via.placeholder.com/100x100" class="sub-image"
					alt="서브이미지 7"> <img src="https://via.placeholder.com/100x100"
					class="sub-image" alt="서브이미지 8">
			</div>
		</div>
	</div>
	</div>
</div>
