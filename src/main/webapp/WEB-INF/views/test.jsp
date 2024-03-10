<%@page import="java.text.NumberFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>상품 보기</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/product_detail.css" rel="stylesheet" />
<link href="css/style.css" rel="stylesheet" />
<style>
/* 선택되지 않은 라디오 버튼의 스타일 */
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
	display: flex;
	justify-content: center;
	width: 100%;
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
	display: flex;
	flex-direction: column;
	align-items: flex-start;
	border: 1px solid #ccc;
	margin: 10px;
	padding: 10px;
}

/* 리뷰 정보 스타일 */
.review-details {
	display: flex;
	align-items: center;
	width: 100%;
}

/* 별 평가 스타일 */
.score {
	font-size: 24px;
	color: black; /* 별 아이콘의 색상 */
}

/* 유저 정보 스타일 */
.user-name {
	font-weight: bold;
	font-size: 18px;
	margin-right: 10px;
}

.date {
	color: #777;
}

/* 리뷰 텍스트 스타일 */
.review-text {
	font-size: 16px;
	margin-top: 10px;
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
	background-color: black;
	color: white;
}
</style>

</head>
<body>


	<div class="top-bar">
		<a class="navbar-brand navbar-brand-custom" href="/">Bloom</a>
		<div class="container">
			<div class="row">
				<div class="col-md-6"></div>

				<div class="col-md-6">

					<!-- <a class="navbar-brand navbar-brand-custom" href="/">Bloom</a> -->
					<div class="action pull-right">

						<ul>

							<c:choose>
								<c:when test="${not empty sessionScope.email}">
									<!-- 로그인 상태 -->
									<li class="white-text" s><a href="/MyPage">${sessionScope.email}</li>
									<li><a href="/logout"><i class="fa fa-lock"></i>logout</a></li>
									<li><a href="/MyPage"><i class="fa fa-MyPage"></i>MyPage</a></li>
								</c:when>
								<c:otherwise>
									<!-- 비로그인 상태 -->
									<li><a href="/login"><i class="fa fa-user"></i> Login</a></li>
									<li><a href="/register"><i class="fa fa-lock"></i>Register</a></li>
									<li><a href="/product_detail"><i class="fa fa-lock"></i>detail</a></li>
									<li><a href="/cart"><i class="fa fa-lock"></i>cart</a></li>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Product section-->
	<section class="py-5">
		<div class="container px-4 px-lg-5 my-5">
			<div class="row gx-4 gx-lg-5 align-items-center">
				<div class="col-md-6">
					<img class="card-img-top mb-5 mb-md-0" src="${product.img1}"
						alt="..." width="600px" height="500" />
				</div>
				<div class="col-md-6">
					<div class="small mb-1"></div>
					<h1 class="display-5 fw-bolder">${product.name}</h1>
					<div class="fs-5 mb-5">
						<p>
							가격:
							<fmt:formatNumber value="${product.price}" type="number"
								pattern="#,###" />
						</p>
					</div>
					<p class="lead">${product.product_content}</p>
					<div class="d-flex">
						<input class="form-control text-center me-3" id="inputQuantity"
							type="num" value="1" style="max-width: 3rem" />
						<button class="btn btn-outline-dark flex-shrink-0" type="button">
							<i class="bi-cart-fill me-1"></i> 구매
						</button>
						<button class="btn btn-outline-dark flex-shrink-0" type="button">
							<i class="bi-cart-fill me-1"></i> 장바구니 담기
						</button>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Related items section-->

	<%-- <jsp:include page="product_detail2.jsp" /> --%>

	<section class="py-5 bg-light">
		<div class="container px-4 px-lg-5 mt-5">
			<h2 class="fw-bolder mb-4">비슷한 상품</h2>
			<div
				class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
				<div class="col mb-5">
					<div class="card h-100">
						<img class="card-img-top"
							src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
						Product details
						<div class="card-body p-4">
							<div class="text-center">
								<h5 class="fw-bolder">Fancy Product</h5>
								$40.00 - $80.00
							</div>
						</div>
						Product actions
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto" href="#">View
									options</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col mb-5">
					<div class="card h-100">
						Sale badge
						<div class="badge bg-dark text-white position-absolute"
							style="top: 0.5rem; right: 0.5rem">Sale</div>
						Product image
						<img class="card-img-top"
							src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
						Product details
						<div class="card-body p-4">
							<div class="text-center">
								Product name
								<h5 class="fw-bolder">Special Item</h5>
								Product reviews
								<div
									class="d-flex justify-content-center small text-warning mb-2">
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
								</div>
								Product price
								<span class="text-muted text-decoration-line-through">$20.00</span>
								$18.00
							</div>
						</div>
						Product actions
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col mb-5">
					<div class="card h-100">
						Sale badge
						<div class="badge bg-dark text-white position-absolute"
							style="top: 0.5rem; right: 0.5rem">Sale</div>
						Product image
						<img class="card-img-top"
							src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
						Product details
						<div class="card-body p-4">
							<div class="text-center">
								Product name
								<h5 class="fw-bolder">Sale Item</h5>
								Product price
								<span class="text-muted text-decoration-line-through">$50.00</span>
								$25.00
							</div>
						</div>
						Product actions
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col mb-5">
					<div class="card h-100">
						Product image
						<img class="card-img-top"
							src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
						Product details
						<div class="card-body p-4">
							<div class="text-center">
								Product name
								<h5 class="fw-bolder">Popular Item</h5>
								Product reviews
								<div
									class="d-flex justify-content-center small text-warning mb-2">
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
								</div>
								Product price
								$40.00
							</div>
						</div>
						Product actions
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Footer-->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Your
				Website 2023</p>
		</div>
	</footer>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>