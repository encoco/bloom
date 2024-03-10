<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	flex-direction: row;
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
        <h1>리뷰 수정</h1>
    </header>

    <section>
        <div class="contact-form">
            <h2>구매하신 상품은 만족하시나요?</h2>
            <form action="/ChangeReview" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <input type="hidden" id="product_id" name="product_id" value="${review.product_id}"/>
                    <input type="hidden" id="review_id" name="review_id" value="${review.review_id}"/>
                    <label for="star_score">별점을 선택해주세요 </label>
					      <div class="star-rating">
					    <c:forEach var="i" begin="1" end="5">
					        <input type="radio" id="${i}-stars" name="star_score" value="${i}"
					               ${review.star_score == i ? 'checked' : ''} />
					        <label for="${i}-stars" class="star">&#9733;</label>
					    </c:forEach>
					</div>
                </div>
                <div class="form-group">
                    <label for="content">자세한 리뷰를 작성해주세요. </label>
                    <textarea name="content" id="content" placeholder="여기에 리뷰를 작성하세요" rows="13">${review.content}</textarea> 
                </div>
                <div class="form-group">
					<div class="test">
						<input type="file" name="imgPath" id="imgPath" value="img">
					</div>
				</div>
                <input type="submit" value="리뷰 수정하기">
            </form>
        </div>
    </section>
	<script>
document.addEventListener('DOMContentLoaded', function () {
    // 별점을 나타내는 모든 라디오 버튼을 가져옵니다.
    const starInputs = document.querySelectorAll('.star-rating input[type="radio"]');
    const starLabels = document.querySelectorAll('.star-rating label');

    // 별점 선택 시 색상을 업데이트하는 함수입니다.
    function updateStars() {
        starInputs.forEach((input, index) => {
            // 현재 선택된 별점 이하의 모든 별에 대해서 색상을 변경합니다.
            if(input.checked) {
                for(let i = 0; i <= index; i++) {
                    starLabels[i].style.color = '#ffc107'; // 노란색
                }
                for(let i = index + 1; i < starLabels.length; i++) {
                    starLabels[i].style.color = '#ccc'; // 회색
                }
            }
        });
    }

    // 각 별점 라디오 버튼에 이벤트 리스너를 추가합니다.
    starInputs.forEach(input => {
        input.addEventListener('change', updateStars);
    });

    // 페이지 로딩 시 현재 별점에 따라 별의 색상을 설정합니다.
    updateStars();
});
</script>
</body>
</html>