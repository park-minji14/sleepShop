<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
.container {
	display: flex;
    justify-content: center;
    align-items: center;
}


.btn-container {
	display: flex;
    justify-content: center;
    align-items: center;
}


.apply-q-style {
	border: 5px solid #35c5f0;  
    border-radius: 30px;
    padding: 20px;
    margin: 30px 0; 
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);  
    background-color: #35c5f0;
    width: 1000px;
    color: white;
    font-size: 22px;
    font-weight: bold;
}


.apply-a-style {
	border: 5px solid #35c5f0;  
    border-radius: 30px;
    padding: 20px;
    margin: 30px 0; 
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);  
    background-color: #fff;
    width: 1000px;
    font-size: 20px;
}


.input-style {
	border: none;
	background: none;
	outline: none;
	font-size: 16px; 
	padding: 0; 
	margin: 0;
	width: 800px;
}


.slide {
	display: none;
}

.slide.active {
	display: block;
}

.navigation {
	margin-top: 20px;
}


@keyframes btncolor {
	0% {}
	100% {background: #35c5f0; color: white; transform: translateY(2px);}
}

@keyframes btncolor2 {
	0% {}
	100% {background: #1DDB16; color: white; transform: translateY(2px);}
}

.apply-btn {
	width: 80px;
	height: 40px;
	background-color: white;
	border-radius: 10px;
	border: 2px solid #35c5f0;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3); 
}

.apply-btn:hover {
	animation: btncolor 0.3s forwards;
}


.apply-submit-btn {
	width: 100px;
	height: 40px;
	background-color: white;
	border-radius: 10px;
	border: 2px solid #1DDB16;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3); 
} 

.apply-submit-btn:hover {
	animation: btncolor2 0.3s forwards;
}



@keyframes show {
	0% {opacity: 0; transform: translateX(-10px);}
	100% {opacity: 1; transform: translateX(0px);}
}

.show-slide {
	animation: show 1s forwards;
}



</style>

<script>
let currentSlide = 1;
const totalSlides = 5;

function showSlide(n) {
    const slides = document.getElementsByClassName('slide');
    if (n > totalSlides) currentSlide = totalSlides;
    if (n < 1) currentSlide = 1;
    for (let i = 0; i < slides.length; i++) {
        slides[i].classList.remove('active');
    }
    slides[currentSlide - 1].classList.add('active');
    
    updateButtons();
}


function nextSlide() {
    currentSlide++;
    showSlide(currentSlide);
}


function prevSlide() {
    currentSlide--;
    showSlide(currentSlide);
}


function updateButtons() {
    const prevBtn = document.getElementById('prev-btn');
    const nextBtn = document.getElementById('next-btn');
    const submitBtn = document.getElementById('submit-btn');

    if (currentSlide === 1) {
        prevBtn.style.display = 'none';
    } else {
        prevBtn.style.display = 'inline-block';
    }

    if (currentSlide === totalSlides) {
        nextBtn.style.display = 'none';
        submitBtn.style.display = 'inline-block';
    } else {
        nextBtn.style.display = 'inline-block';
        submitBtn.style.display = 'none';
    }
}


document.addEventListener('DOMContentLoaded', (event) => {
    showSlide(currentSlide);
});
</script>



<div class="container">
	<div class="body-container">	
		<div class="body-title">
			<h2 style="color: #35c5f0; font-weight: bold;"> 전문가 신청하기 </h2>
		</div>
		
		<div id="slide1" class="slide active show-slide">
			<div class="apply-q-style">
				본인의 소개를 간단하게 작성해보세요.
			</div>
			<div class="apply-a-style">
				<input type="text" name="apply-answer1" class="input-style" value="">  
			</div>
		</div>
		
		<div id="slide2" class="slide show-slide">
			<div class="apply-q-style">
				경력을 입력하세요.
			</div>
			<div class="apply-a-style">
				<input type="text" name="apply-answer2" class="input-style" value="" placeholder="예) xx수면의원 n년 근무 등">  
			</div>
		</div>
		
		<div id="slide3" class="slide show-slide">
			<div class="apply-q-style">
				취득 자격증을 입력하세요.
			</div>
			<div class="apply-a-style">
				<input type="text" name="apply-answer3" class="input-style" value="" placeholder="예) 심리운동사자격증 등">  
			</div>
		</div>
		
		<div id="slide4" class="slide show-slide">
			<div class="apply-q-style">
				질문자에 대한 자신의 답변 방식을 간단하게 말해보세요.
			</div>
			<div class="apply-a-style">
				<input type="text" name="apply-answer4" class="input-style" value="" placeholder="예) 간단명료하게 요점만 설명한다 등">  
			</div>
		</div>
		
		<div id="slide5" class="slide show-slide">
			<div class="apply-q-style">
				수면클리닉 전문가가 된 후 향후 계획을 말해보세요.
			</div>
			<div class="apply-a-style">
				<input type="text" name="apply-answer5" class="input-style" value="">  
			</div>
		</div>
		
		<div class="navigation btn-container">
			<button class="apply-btn" id="prev-btn" onclick="prevSlide()" style="margin: 0 10px;">이전</button> 
			<button class="apply-btn" id="next-btn" onclick="nextSlide()" style="margin: 0 10px;">다음</button>
			<button class="apply-submit-btn" id="submit-btn" style="display: none; margin: 0 10px;">제출하기</button>
		</div>
			
		
	</div>
</div>

<div style="height: 200px;"></div>
<br><br><br><br><hr>