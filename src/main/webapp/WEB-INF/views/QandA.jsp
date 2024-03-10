<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
	font-family: 'Arial', sans-serif;
	line-height: 1.6;
	margin: 0;
	padding: 0;
	background-color: #f4f4f4;
}

header {
	background: white;
	color: black;
	padding: 1em 0;
	text-align: center;
}

section {
	padding: 2em;
}

.contact-form {
	background: #fff;
	margin: 1em 0;
	padding: 2em;
	border-radius: 8px;
}

.form-group {
	margin-bottom: 1em;
}

label {
	display: block;
	margin-bottom: 0.5em;
}

input[type="text"], input[type="email"], textarea {
	width: 100%;
	padding: 0.8em;
	border: 1px solid #ddd;
	border-radius: 4px;
}

input[type="submit"] {
	background: #50b3a2;
	color: #fff;
	padding: 1em 2em;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

input[type="submit"]:hover {
	background: #3a8279;
}

.faq {
	margin: 1em 0;
}

.faq h2 {
	margin-top: 0;
}

.faq-item {
	margin: 1em 0;
}

.faq-item h3 {
	margin-top: 0;
}

.form-check1, .form-check2 {
	display: flex;
	align-items: center; /* 수직 가운데 정렬 */
	margin-bottom: 1em; /* 필요에 따라 여백 조절 */
}

.radio_box {
	display: block;
	*display: inline;
	*zoom: 1;
	position: relative;
	padding-left: 25px;
	margin-right: 10px;
	cursor: pointer;
	font-size: 14px;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

/* 기본 라디오 버튼 숨기기 */
.radio_box input[type="radio"] {
	display: none;
}

/* 선택되지 않은 라디오 버튼 스타일 꾸미기 */
.on {
	width: 20px;
	height: 20px;
	background: #ddd;
	border-radius: 50%;
	position: absolute;
	top: 0;
	left: 0;
}

/* 선택된 라디오 버튼 스타일 꾸미기 */
.radio_box input[type="radio"]:checked+.on {
	background: #f86480;
}

.on:after {
	content: "";
	position: absolute;
	display: none;
}

.radio_box input[type="radio"]:checked+.on:after {
	display: block;
}

.on:after {
	width: 10px;
	height: 10px;
	background: #fff;
	border-radius: 50%;
	position: absolute;
	left: 5px;
	top: 5px;
}
</style>
</head>
<body>
	<header>
		<h1>고객센터</h1>
	</header>

	<section>
		<div class="contact-form">
			<form action="/QandA" method="post" enctype="multipart/form-data">
				<label for="qanda1" class="radio_box"> 
					<input type="radio" id="qanda1" name="qanda" value="about_product" checked="checked" />
						<span class="on"></span> 상품관련하여 문의하고 싶어요
				</label> 
				<label for="qanda2" class="radio_box"> 
					<input type="radio" id="qanda2" name="qanda" value="about_delivery" /> 
						<span class="on"></span> 배송관련하여 문의하고 싶어요
				</label>
				<div class="form-group">
					<label for="content">제목을 입력해주세요. </label> <input type="text"
						name="content" id="content">
				</div>
				<div class="form-group">
					<label for="content">문의사항을 입력해주세요. </label> <input type="text"
						name="comment" id="comment">
				</div>
				<!-- <div class="form-group">
					<div class="test">
						<input type="file" name="imgPath" id="imgPath" value="img">
					</div>
				</div> -->
				<input type="submit" value="문의 등록하기">
			</form>
		</div>
	</section>
</body>
</html>