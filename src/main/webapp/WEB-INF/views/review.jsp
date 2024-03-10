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

/* 별  */
.star-rating {
	border: solid 1px #ccc;
	display: flex;
	flex-direction: row-reverse;
	font-size: 1.5em;
	justify-content: space-around;
	padding: 0 .2em;
	text-align: center;
	width: 5em;
}

.star-rating input {
	display: none;
}

.star-rating label {
	color: #ccc;
	cursor: pointer;
}

.star-rating :checked ~ label {
	color: #f90;
}

.star-rating label:hover, .star-rating label:hover ~ label {
	color: #fc0;
}
</style>
</head>

<body>
	<header>
		<h1>리뷰 쓰기</h1>
	</header>

	<section>
		<div class="contact-form">
			<h2>구매하신 상품은 만족하시나요?</h2>
			<form action="/review" method="post" enctype="multipart/form-data">
				<div class="form-group">
					<input type="hidden" id="product_id" name="product_id" value="${product_id}"/>
						<label for="name">별점을 선택해주세요 </label>
						<div class="star-rating">
							<input type="radio" id="5-stars" name="star_score" value="5" /> 
							<label for="5-stars" class="star">&#9733;</label> 
							<input type="radio" id="4-stars" name="star_score" value="4" /> 
							<label for="4-stars" class="star">&#9733;</label> 
							<input type="radio" id="3-stars" name="star_score" value="3" /> 
							<label for="3-stars" class="star">&#9733;</label>
							<input type="radio" id="2-stars" name="star_score" value="2" /> 
							<label for="2-stars" class="star">&#9733;</label> 
							<input type="radio" id="1-star" name="star_score" value="1" /> 
							<label for="1-star"	class="star">&#9733;</label>
						</div>
					</div>
				<div class="form-group">
				    <label for="content">자세한 리뷰를 작성해주세요. <span id="charNum">1000</span>자 남음</label>
				    <textarea name="content" id="content" placeholder="여기에 리뷰를 작성하세요" rows="13" maxlength="999" onkeyup="countChar(this)"></textarea> 
				</div>
				<div class="form-group">
					<div class="test">
						<input type="file" name="imgPath" id="imgPath" value="img">
					</div>
				</div>
				<input type="submit" value="리뷰 등록하기">
			</form>
		</div>
	</section>
</body>
	<script>
function countChar(val) {
    var len = val.value.length;
    var charNum = document.getElementById('charNum');
    if (len >= 999) {
        val.value = val.value.substring(0, 999);
        charNum.textContent = '0';
    } else {
        charNum.textContent = 999 - len;
    }
}
</script>
</html>