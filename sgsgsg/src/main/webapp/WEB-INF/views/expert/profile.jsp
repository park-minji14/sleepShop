<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.container {
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
}

.expert-style {
    border-radius: 20px;
    padding: 20px;
    margin: 30px 0;
    background-color: #fff;
    height: 400px;
    width: 1100px;
}

.expert-semi-style {
    border: 5px solid #35c5f0;
    border-radius: 20px;
    padding: 20px;
    margin: 30px 0;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
    background-color: #fff;
    height: 350px;
    width: 300px;
}

.expert-style2 {
    border: 1px solid #ddd;
    border-radius: 20px;
    padding: 20px;
    margin: 30px 0;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
    background-color: #fff;
    height: 500px;
    width: 1100px;
}

.experience-bar-container {
    width: 200px;
    height: 30px;
    background-color: #ddd;
    border-radius: 10px;
    overflow: hidden;
    margin-top: 10px;
    display: inline-block;
}

.experience-bar {
    width: 60%;
    height: 100%;
    background-color: #35c5f0;
}

@keyframes btncolor {
    0% {}
    100% {background: #35c5f0; color: white; transform: translateY(4px);}
}

.profile-update {
    width: 110px;
    height: 40px;
    background-color: white;
    border-radius: 10px;
    border: 2px solid #35c5f0;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
}

.profile-update:hover {
    animation: btncolor 0.3s forwards;
}

.profile-update2 {
    width: 110px;
    height: 40px;
    background-color: white;
    border-radius: 10px;
    border: 2px solid #35c5f0;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
}

@keyframes show {
    0% {opacity: 0; transform: translateX(-8px);}
    100% {opacity: 1; transform: translateX(0px);}
}

.show-slide {
    animation: show 1s forwards;
}

/* Tabs style */
.tab-container {
    display: flex;
    justify-content: center;
    margin-bottom: 20px;
    float: left;
    padding-left: 10px;
    
}

.tab-button {
    background-color: #BDBDBD;
    border: 1px solid white;
    color: white;
    padding: 10px 20px;
    cursor: pointer;
    outline: none;
    transition: background-color 0.3s, color 0.3s;
    border-radius: 10px;
    margin: 0 5px;
}

.tab-button.active {
    background-color: white;
    color: #35c5f0;
}

.tab-content {
    display: none;
}

.tab-content.active {
    display: block;
}


.answer-list-container {
    height: 500px;
    overflow-y: auto;
}

</style>

<div class="container">
    <div class="body-container">
        <div class="body-title">
            <h2 style="color: #35c5f0; font-weight: bold;"> 전문가의 프로필 </h2>
        </div>

        <div class="expert-style" style="display: flex; align-items: flex-start;">
            <div class="expert-semi-style" style="text-align: center;">
                <img src="${pageContext.request.contextPath}/uploads/etc/expertprofile.png"
                style="width: 200px; height: 200px; border-radius: 100px;">
                <br>
                <div>
                    <span style="font-size: 32px;">${dto.userName}</span>
                </div>
                <div class="experience-bar-container">
                    <div class="experience-bar"></div>
                </div>
            </div>
            <div class="expert-text" style="margin-left: 50px; margin-top: 30px;">
                <span style="font-size: 32px; display: block;">취득 자격증</span>
                <div class="certificates show-slide">
                        <span style="font-size: 18px; display: block; border: 2px solid #B7F0B1; border-radius: 20px; background: #B7F0B1; width: 300px; padding-top: 5px; margin-top: 15px;">&nbsp;<i class="bi bi-calendar2-check-fill"></i> ${dto.license1}</span>
                        <span style="font-size: 18px; display: block; border: 2px solid #B7F0B1; border-radius: 20px; background: #B7F0B1; width: 300px; padding-top: 5px; margin-top: 15px;">&nbsp;<i class="bi bi-calendar2-check-fill"></i> ${dto.license2}</span>
                        <span style="font-size: 18px; display: block; border: 2px solid #B7F0B1; border-radius: 20px; background: #B7F0B1; width: 300px; padding-top: 5px; margin-top: 15px;">&nbsp;<i class="bi bi-calendar2-check-fill"></i> ${dto.license3}</span>
                </div>
                <div class="additional-text" style="margin-top: 40px;">
                    <span style="font-size: 30px; display: block;">답변 갯수</span>
                </div>
                <div>
                    <span id="answer-count" style="font-size: 40px; display: block; color: #008000;">${answerCount}개</span>
                </div>
            </div>
            <div class="expert-text" style="margin-left: 30px; margin-top: 30px; padding-left: 30px;">
                <span style="font-size: 32px; display: block;">경력 사항</span>
                <div class="additional-info show-slide">
                    <span style="font-size: 18px; display: block; border: 2px solid #ADD8E6; border-radius: 20px; background: #ADD8E6; width: 300px; padding-top: 5px; margin-top: 15px;">&nbsp;<i class="bi bi-building-fill"></i> ${dto.career1}</span>
                    <span style="font-size: 18px; display: block; border: 2px solid #ADD8E6; border-radius: 20px; background: #ADD8E6; width: 300px; padding-top: 5px; margin-top: 15px;">&nbsp;<i class="bi bi-building-fill"></i> ${dto.career2}</span>
                    <span style="font-size: 18px; display: block; border: 2px solid #ADD8E6; border-radius: 20px; background: #ADD8E6; width: 300px; padding-top: 5px; margin-top: 15px;">&nbsp;<i class="bi bi-building-fill"></i> ${dto.career3}</span>
                </div>
                <div class="additional-text" style="margin-top: 40px;">
                    <span style="font-size: 30px; display: block;">답변 채택률</span>
                </div>
                <div>
                    <span id="acceptance-rate" style="font-size: 40px; display: block; color: #B70000;">${acceptanceRate}%</span>
                </div>
            </div>
        </div>

        <div class="tab-container">
            <button class="tab-button active" onclick="openTab(event, 'exposedContent')">소개</button>
            <button class="tab-button" onclick="openTab(event, 'answerList')">답변 목록</button>
        </div>
        
        <div style="height: 20px;"></div> 

        <div id="exposedContent" class="tab-content active expert-style2 answer-list-container">
            <span style="font-size: 22px; margin: 10px;">${dto.exposed_content}</span>
        </div>

        <div id="answerList" class="tab-content expert-style2 answer-list-container">
            <c:forEach var="answer" items="${answerList}">
                <div class="answer-item">
                    <h6>
	                    <a href="${pageContext.request.contextPath}/clinic/article?page=${page}&num=${answer.question_id}">
	                    <span style="color: blue;">${answer.content}</span>
	                    </a>
	                    (RE: ${answer.title})
                    </h6>
                    <span>작성일: ${answer.created_date}</span> 
                </div>
                <hr/>
            </c:forEach>
        </div>

        <div>
            <c:choose>
                <c:when test="${sessionScope.member.userId==dto.userId || sessionScope.member.membership>90}">
                    <button class="profile-update" onclick="location.href='${pageContext.request.contextPath}/expert/editprofile?userId=${dto.userId}';">프로필 수정</button>
                </c:when>
                <c:otherwise>
                    &nbsp;
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>

<script>
document.addEventListener('DOMContentLoaded', (event) => {
    const targetRate = parseFloat("${acceptanceRate}");
    const targetCount = ${answerCount};
    const duration = 700;
    const incrementRate = targetRate / (duration / 10);
    const incrementCount = targetCount / (duration / 10);
    let currentRate = 0;
    let currentCount = 0;
    const acceptanceRateElement = document.getElementById('acceptance-rate');
    const answerCountElement = document.getElementById('answer-count');
    
    const interval = setInterval(() => {
        currentRate += incrementRate;
        currentCount += incrementCount;
        
        if (currentRate >= targetRate) {
            currentRate = targetRate;
        }
        
        if (currentCount >= targetCount) {
            currentCount = targetCount;
            clearInterval(interval);
        }
        
        acceptanceRateElement.textContent = currentRate.toFixed(1) + '%';
        answerCountElement.textContent = Math.floor(currentCount) + '개';
    }, 10);
});

function openTab(event, tabName) {
    let i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tab-content");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
        tabcontent[i].classList.remove("active");
    }
    tablinks = document.getElementsByClassName("tab-button");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].classList.remove("active");
    }
    document.getElementById(tabName).style.display = "block";
    document.getElementById(tabName).classList.add("active");
    event.currentTarget.classList.add("active");
}
</script>

<br><br>
