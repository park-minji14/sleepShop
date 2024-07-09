<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript">
	//상품등록
	function sendLogin() {
		const f = document.productSubmitForm;
		let str;

		/* 	str = f.userId.value;
		 if (!str) {
		 alert("아이디를 입력하세요.");
		 f.userId.focus();
		 return;
		 }

		 str = f.userPwd.value;
		 if (!str) {
		 alert("비밀번호를 입력하세요.");
		 f.userPwd.focus();
		 return;
		 } */

		f.action = "${pageContext.request.contextPath}/adminManagement/productManage/write";
		f.submit();
	}
</script>
<style>
.accordion {
  width: 100%;
  border: 1px solid #ccc;
  border-radius: 5px;
  margin: 10px 0;
}
.accordion-item {
  border-bottom: 1px solid #ccc;
}
.accordion-item:last-child {
  border-bottom: none;
}
.accordion-header {
  padding: 10px;
  background: #f1f1f1;
  cursor: pointer;
}
.accordion-content {
  display: none;
  padding: 10px;
}
.form-group {
  margin: 4px;
}
.form-group label {
  display: block;
  margin-bottom: 5px;
  font-weight: bold;
}
.form-group input[type="text"],
.form-group select {
  width: 45%;
  padding: 6px;
  border: 1px solid #ccc;
  border-radius: 5px;
  margin-bottom: 3px;
}
.form-group .row {
  display: flex;
  gap: 10px;
}
.form-group .row select {
  flex: 1;
  max-width: 200px;
  margin-left: 8px;
}
</style>

<div class="accordion">
	<div class="accordion-item">
		<div class="accordion-header">상품정보 입력</div>
		<div class="accordion-content">
			<div class="form-group">
				<label for="productName">상품명</label>
				<input type="text" id="productName" placeholder="상품명을 입력하세요.">
			</div>
			<div class="form-group">
				<label for="productPrice">상품가격</label>
				<input type="text" id="productPrice" placeholder="상품가격을 입력하세요.">
			</div>
			<div class="form-group">
				<label for="productDiscount">할인율</label>
				<input type="text" id="productDiscount" placeholder="할인율을 입력하세요.">
			</div>
			<div class="form-group">
				<label for="productPoint">적립금</label>
				<input type="text" id="productPoint" placeholder="적립금을 입력하세요.">
			</div>
			<div class="form-group">
				<label for="productShipping">배송비</label>
				<input type="text" id="productShipping" placeholder="배송비를 입력하세요.">
			</div>
		</div>
	</div>
    <div class="accordion-item">
      <div class="accordion-header">카테고리 입력</div>
      <div class="accordion-content">
        <div class="form-group">
          <div class="row">
            <select id="category">
              <option>카테고리 선택</option>
              <option>테스트 1</option>
            </select>
            <select id="subCategory">
              <option>하위카테고리 선택</option>
              <option>테스트 1</option>
            </select>
          </div>
        </div>
      </div>
    </div>
	<div class="accordion-item">
		<div class="accordion-header">상품 옵션</div>
		<div class="accordion-content">
			<div class="form-group">
				<label for="optionSelect">옵션 수 선택</label>
				<select id="optionSelect" onchange="toggleOptions()">
					<option value="0">옵션 없음</option>
					<option value="1">옵션 1개</option>
					<option value="2">옵션 2개</option>
				</select>
			</div>
			<div id="optionsContainer">
				<div id="option1" class="form-group" style="display: none;">
					<label for="option1Name">옵션 1 이름</label>
					<input type="text" id="option1Name" placeholder="옵션 1 이름을 입력하세요.">
					<label for="option1Value">옵션 1 값</label>
					<input type="text" id="option1Value" placeholder="옵션 1 값을 입력하세요.">
				</div>
				<div id="option2" class="form-group" style="display: none;">
					<label for="option2Name">옵션 2 이름</label>
					<input type="text" id="option2Name" placeholder="옵션 2 이름을 입력하세요.">
					<label for="option2Value">옵션 2 값</label>
					<input type="text" id="option2Value" placeholder="옵션 2 값을 입력하세요.">
				</div>
			</div>
		</div>
	</div>
	<div class="accordion-item">
		<div class="accordion-header">상품 진열</div>
		<div class="accordion-content">
			<div class="form-group">
				<label>진열 상태</label>
				<div>
					<label><input type="radio" name="display" value="yes"> 진열함</label>
					<label><input type="radio" name="display" value="no"> 진열안함</label>
				</div>
			</div>
		</div>
	</div>
	<div class="accordion-item">
		<div class="accordion-header">상품 설명</div>
		<div class="accordion-content">
			<div class="form-group">
				<label for="description">상품 설명</label>
				<textarea id="description" placeholder="상품 설명을 입력하세요." rows="5"></textarea>
			</div>
		</div>
	</div>
</div>

<script>
document.querySelectorAll('.accordion-header').forEach(header => {
  header.addEventListener('click', () => {
    const content = header.nextElementSibling;
    const isOpen = content.style.display === 'block';
    
    document.querySelectorAll('.accordion-content').forEach(content => {
      content.style.display = 'none';
    });

    if (!isOpen) {
      content.style.display = 'block';
    }
  });
});

function toggleOptions() {
	const optionsContainer = document.getElementById('optionsContainer');
	const option1 = document.getElementById('option1');
	const option2 = document.getElementById('option2');
	const selectedValue = document.getElementById('optionSelect').value;

	if (selectedValue === '1') {
		option1.style.display = 'block';
		option2.style.display = 'none';
	} else if (selectedValue === '2') {
		option1.style.display = 'block';
		option2.style.display = 'block';
	} else {
		option1.style.display = 'none';
		option2.style.display = 'none';
	}
}
</script>