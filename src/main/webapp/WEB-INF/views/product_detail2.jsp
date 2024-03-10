<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

<style>


.btn-check:not(:checked)+label.btn-outline-primary {
	color: black;
	background-color: white;
	border-color: black;
	border-radius: 0;
	height: 70px;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 18px;
	padding: 0;
}

/* 선택된 라디오 버튼의 스타일 */
.btn-check:checked+label.btn-outline-primary {
	color: white;
	background-color: black;
	border-color: black;
	border-radius: 0;
	height: 70px;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 18px;
	padding: 0;
}

.btn-group {
    width: 71%;
    display: flex;
    margin: 0 auto; /* 가운데 정렬 */
}

.review-type-container {
	display: flex;
	justify-content: center;
}

.review-type-text {
	cursor: pointer;
	margin: 10px;
}

/* 리뷰 컨테이너 스타일 */
.Artc_review-conts {
    width: 66%;
    margin: 20px auto; /* Increased margin for better separation */
    padding: 15px; /* Added padding for spacing inside each review */
    border: 1px solid #ccc; /* Optional: add border for better definition */
    background-color: #f9f9f9; /* Optional: background color for contrast */
}
/* 리뷰 정보 스타일 */
.review-details {
    display: flex;
    align-items: center;
    justify-content: space-between; /* Adjust as needed */
    margin-bottom: 10px; /* Space between details and content */
}


/* 별 평가 스타일 */
.score {
    font-size: 20px; /* Adjust size as needed */
    margin-right: 10px;
}
/* 유저 정보 스타일 */
.user-name, .date {
    margin-right: 10px; /* Consistent spacing */
}


/* 리뷰 텍스트 스타일 */
.review-text {
    font-size: 16px;
    color: #333; /* Darker color for better readability */
}

.review-content img {
    max-width: 100px;
    max-height: 100px;
    margin-top: 10px; /* Space between text and image */
}

.thumbs img {
	max-width: 100px;
	max-height: 100px;
}

/* 리뷰 이미지 스타일 */
.review-thumbs {
	align-self: flex-end;
}

.review-thumbs img {
	max-width: 100px; /* 이미지 최대 너비 제한 */
	max-height: 100px; /* 이미지 최대 높이 제한 */
}

.qna-table-container {
	max-width: 95%; /* 필요에 따라 최대 너비를 조절하세요 */
	margin: 0 auto; /* 컨테이너를 가운데 정렬합니다 */
	padding: 10px; /* 좌우 여백을 추가합니다 */
}

.qna-table {
	width: 100%;
	border-collapse: collapse;
}

.qna-table th, .qna-table td {
	border: 1px solid black;
	padding: 8px;
	white-space: nowrap; /* 텍스트가 줄 바꿈되지 않도록 설정합니다 */
}

.qna-table th {
	font-weight: bold;
}

.qna-table th.type, .qna-table td.type {
	width: 20%;
}

.qna-table th.state, .qna-table td.state {
	width: 15%;
}

.qna-table th.writer, .qna-table td.writer {
	width: 15%;
}

.qna-table th.date, .qna-table td.date {
	width: 15%;
	text-align: right;
}

.ico-state {
	border: 1px solid black;
	color: black;
	padding: 2px 8px;
	border-radius: 4px;
}

.answer {
	background-color:black;
	color: white;
}

.imgtext{
	margin-left :20px;
	margin-right: 20px;
}
.more-btn {
    background-color: black; 
    color: white; 
    border: 1px solid white;
    padding: 5px 10px; 
    border-radius: 5px; 
    cursor: pointer; 
    text-align: center;
    display: inline-block;
    margin-top: 10px; 
}

.more-btn:hover {
    background-color: #555;
}

</style>
</head>
<body>
	<div class="btn-group" role="group"
		aria-label="Basic radio toggle button group">
		<input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" checked> 
		<label class="btn btn-outline-primary" for="btnradio1" onclick="showDescription()">상세정보</label> 
		
		<input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off">
		<label class="btn btn-outline-primary" for="btnradio2" onclick="showReview()">리뷰</label>
		 
		<input type="radio" class="btn-check" name="btnradio" id="btnradio3" autocomplete="off">
		<label class="btn btn-outline-primary" for="btnradio3" onclick="showQandA()">Q&A</label>
	</div>

	<!-- 상세 정보 내용 -->
	<div class="scrollable-container" id="descriptionContent" style="text-align: center;">
		<div class="scrollable-container" id="Product-Details">
			<span> 
				<c:if test="${not empty product.img2}">
					<img src="${product.img2}" alt="" style="width: 50%; height: auto; display: block; margin: 0 auto;">
				</c:if>
			</span>
			<span> 
				<c:if test="${not empty product.img3}">
					<img src="${product.img3}" alt="" style="width: 50%; height: auto; display: block; margin: 0 auto;">
				</c:if>
			</span>
			<span>
				<c:if test="${not empty product.img4}"> 
					<img src="${product.img4}" alt="" style="width: 50%; height: auto; display: block; margin: 0 auto;">
				</c:if>
			</span>
		</div>
	</div>

	<!-- 리뷰 내용 -->
	<div class="scrollable-container" id="reviewContent"
		style="display: none">
		<div class="review-type-container">
		
			<span class="review-type-text" onclick="showReviewType('all')">전체 리뷰 (${review.size()})</span> 
			<span class="review-type-text" onclick="showReviewType('photo')">포토 리뷰 (${imgreview })</span> 
			<span class="review-type-text" onclick="showReviewType('text')">텍스트 리뷰 (${textreview })</span>
		</div>
		<div class="scrollable-container" id="allReviews">
    <!-- 전체 리뷰 내용 -->
		    <c:forEach items="${review}" var="review">
			    <div class="Artc_review-conts">
			        <div class="review-details">
			            <div class="score"><c:forEach var="i" begin="1" end="${review.star_score}">
					        ★
					    </c:forEach>
					    <c:forEach var="i" begin="1" end="${5 - review.star_score}">
					        ☆
					    </c:forEach> / ${review.email} / ${review.formattedReviewDate}</div>
			            <c:if test="${not empty review.review_img}">
			                <span> <img src="${review.review_img}" class="review-image" alt="" width="70px" height="70px" onclick="showFullImage(this.src)"> </span>
		                </c:if>
		            </div>
		            <div class="review-content">
		                <!-- 요약된 리뷰 텍스트 -->
		                <span id="summary-${review.review_id}">
		                    ${fn:substring(review.content, 0, 200)}${fn:length(review.content) > 200 ? '...' : ''}
		                </span>
		                <!-- 전체 리뷰 텍스트, 초기에는 숨김 -->
		                <span id="full-${review.review_id}" style="display: none;">
		                    ${review.content}
		                </span>
		                <!-- 자세히 버튼 -->
		                <c:if test="${fn:length(review.content) > 200}">
							<button class="more-btn" onclick="toggleReviewDetails('summary-${review.review_id}', 'full-${review.review_id}', this)">자세히</button>
		                </c:if>
		            </div>
		        </div>
		    </c:forEach>
		</div>
		
		<div class="scrollable-container" id="photoReviews"
			style="display: none">
			<!-- 포토 리뷰 내용 -->
			<div class="scrollable-container" id="photoReviewsContent">
				<c:forEach items="${review}" var="review">
					<c:if test="${not empty review.review_img}">
					<div class="Artc_review-conts">
						<div class="review-details">
							<div class="score"><c:forEach var="i" begin="1" end="${review.star_score}">
					        ★
					    	</c:forEach>
						    <c:forEach var="i" begin="1" end="${5 - review.star_score}">
						        ☆
						    </c:forEach> / ${review.email} / ${review.formattedReviewDate}</div>
							<%-- <strong class="user-name">${review.email}</strong> <span class="date">${review.formattedReviewDate}</span> --%>
							<c:if test="${not empty review.review_img}">
								<span><img src="${review.review_img}" class="review-image" alt="" width="70px" height="70px" onclick="showFullImage('${review.review_img}')" ></span>
							</c:if>
						</div>
						<div class="review-content">
			                <!-- 요약된 리뷰 텍스트 -->
			                <span id="summary-${review.review_id}">
			                    ${fn:substring(review.content, 0, 200)}${fn:length(review.content) > 200 ? '...' : ''}
			                </span>
			                <!-- 전체 리뷰 텍스트, 초기에는 숨김 -->
			                <span id="full-${review.review_id}" style="display: none;">
			                    ${review.content}
			                </span>
			                <!-- 자세히 버튼 -->
			                <c:if test="${fn:length(review.content) > 200}">
			                    <button class="more-btn" onclick="toggleReviewDetails('summary-${review.review_id}', 'full-${review.review_id}', this)">자세히</button>
			                </c:if>
			            </div>
					</div>
					</c:if>
				</c:forEach>
			</div>
		</div>
			
		<div class="scrollable-container" id="textReviewsContent"
			style="display: none">
			<!-- 텍스트 리뷰 내용 -->
			<c:forEach items="${review}" var="review">
				<c:if test="${empty review.review_img}">
				<div class="Artc_review-conts">
					<div class="review-details">
						<div class="score"><c:forEach var="i" begin="1" end="${review.star_score}">
					        ★
					    </c:forEach>
					    <c:forEach var="i" begin="1" end="${5 - review.star_score}">
					        ☆
					    </c:forEach> / ${review.email} / ${review.formattedReviewDate}</div>
						<%-- <strong class="user-name"></strong> <span class="date">${review.formattedReviewDate}</span> --%>
					</div>
					 	<div class="review-content">
		                	<!-- 요약된 리뷰 텍스트 -->
		                	<span id="summary-${review.review_id}">
		                    	${fn:substring(review.content, 0, 200)}${fn:length(review.content) > 200 ? '...' : ''}
		                	</span>
		            	    <!-- 전체 리뷰 텍스트, 초기에는 숨김 -->
		        	        <span id="full-${review.review_id}" style="display: none;">
		    	                ${review.content}
			                </span>
			                <!-- 자세히 버튼 -->
			                <c:if test="${fn:length(review.content) > 200}">
		                    	<button class="more-btn" onclick="toggleReviewDetails('summary-${review.review_id}', 'full-${review.review_id}', this)">자세히</button>
		                	</c:if>
		            	</div>
					</div>
				</c:if>
			</c:forEach>
		</div>
	</div>
	<!-- Q&A 내용 -->
	<div class="scrollable-container" id="QandAContent"
		style="display: none">
		<div class="qna-table-container">
			<!-- Q&A 테이블을 감싼 컨테이너 -->
			<table class="qna-table">
				<tr>
					<th class="type al-l">분류</th>
					<th class="state">내용</th>
					<th class="writer">작성자</th>
					<th class="date">작성일</th>
					<th class="state">처리상태</th>
				</tr>
				<tr>
					<td class="type al-l">배송 문의</td>
					<td class="type al-l">내용</td>
					<td class="writer">dnj*******</td>
					<td class="date">2023.11.01</td>
					<td class="state"><span class="ico-state answer">답변완료</span></td>
				</tr>
				
				<!-- 추가적인 Q&A 아이템을 이어서 추가할 수 있습니다. -->
			</table>
		</div>
	</div>	
	<!-- jQuery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<!-- Bootstrap JS -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	
	<script>
		// 페이지 로드시 자동으로 상세 정보 표시
		window.onload = function() {
			showDescription();
		}
		// 상세정보, 리뷰, q&n 버튼 누르면 그 화면 나오도록
		function showDescription() { //상세 정보
			document.getElementById("descriptionContent").style.display = "block";
			document.getElementById("reviewContent").style.display = "none";
			document.getElementById("QandAContent").style.display = "none";
		}

		function showReview() {//리뷰
			document.getElementById("descriptionContent").style.display = "none";
			document.getElementById("reviewContent").style.display = "block";
			document.getElementById("QandAContent").style.display = "none";
			showReviewType('all'); // 전체 리뷰를 기본으로 표시
		}

		function showReviewType(type) { //리뷰 안에 전체, 포토, 텍스트 리뷰
			document.getElementById("allReviews").style.display = "none";
			document.getElementById("photoReviews").style.display = "none";
			document.getElementById("textReviewsContent").style.display = "none";

			if (type === 'all') {
				document.getElementById("allReviews").style.display = "block";
				document.getElementById("photoReviews").style.display = "none";
				document.getElementById("textReviewsContent").style.display = "none";
			} else if (type === 'photo') {
				document.getElementById("allReviews").style.display = "none";
				document.getElementById("photoReviews").style.display = "block";
				document.getElementById("textReviewsContent").style.display = "none";
			} else if (type === 'text') {
				document.getElementById("allReviews").style.display = "none";
				document.getElementById("photoReviews").style.display = "none";
				document.getElementById("textReviewsContent").style.display = "block";
			}
		}
		function showQandA() {
			document.getElementById("descriptionContent").style.display = "none";
			document.getElementById("reviewContent").style.display = "none";
			document.getElementById("textReviewsContent").style.display = "none"; // 텍스트 리뷰 게시판 숨기기
			document.getElementById("QandAContent").style.display = "block";
		}

		
		//리뷰 자세히보기 버튼
		function toggleReviewDetails(summaryId, fullId, btn) {
		    var summaryElement = document.getElementById(summaryId);
		    var fullElement = document.getElementById(fullId);
		
		    if (fullElement.style.display === 'none') {
		        // 전체 리뷰 내용을 표시하고 요약 텍스트를 숨김
		        summaryElement.style.display = 'none';
		        fullElement.style.display = 'inline';
		        btn.textContent = '간략히'; // 버튼 텍스트를 '간략히'로 변경
		    } else {
		        // 전체 리뷰 내용을 숨기고 요약 텍스트를 표시
		        summaryElement.style.display = 'inline';
		        fullElement.style.display = 'none';
		        btn.textContent = '자세히'; // 버튼 텍스트를 '자세히'로 변경
		    }
		}
		//이미지 크게보기
		function showFullImage(src) {
		    var modal = document.getElementById("reviewModal");
		    var modalImg = document.getElementById("reviewImgModal");
		
		    modal.style.display = "block";
		    modalImg.src = src;
		
		    var span = document.getElementsByClassName("close")[0];
		    span.onclick = function() {
		        modal.style.display = "none";
		    };
		
		    window.onclick = function(event) {
		        if (event.target == modal) {
		            modal.style.display = "none";
		        }
		    };
		}
	</script>
	<div id="reviewModal" class="modal">
  <span class="close">&times;</span>
  <img class="modal-content" id="reviewImgModal">
  <div id="reviewCaption"></div>
</div>
	
</body>
</html>