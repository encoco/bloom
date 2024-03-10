<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge">

<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Bloom</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<!-- Google Font -->
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700|Raleway:400,300,500,700,600'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.css"
	type="text/css">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet">
<!-- Theme Stylesheet -->
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/responsive.css">
<style>
#myBtn {
  display: none; /* 기본적으로 버튼은 숨겨져 있습니다 */
  position: fixed; /* 스크롤 시에도 동일한 위치에 고정됩니다 */
  bottom: 30px; /* 화면 하단에서 20px의 위치에 배치 */
  right : 40px; /* 화면 오른쪽에서 30px의 위치에 배치 */
  z-index: 99; /* 다른 요소들 위에 버튼이 위치하도록 z-index 설정 */
  border: none; /* 테두리 없음 */
  outline: none; /* 외곽선 없음 */
  background-color: #555; /* 배경 색상 */
  color: white; /* 글자 색상 */
  cursor: pointer; /* 마우스 오버 시 커서 변경 */
  padding: 15px; /* 패딩 */
  border-radius: 10px; /* 둥근 모서리 */
}

#myBtn:hover {
  background-color: #555; /* 호버 시 배경 색상 변경 */
}
</style>
</head>
<body>
<button onclick="topFunction()" id="myBtn" title="Go to top"><i class="fas fa-arrow-up"></i></button>
<a class="navbar-brand ps-3" href="/">bloom</a>
	<div class="top-bar">
		<div class="container">
			<div class="row">
				<div class="col-md-6"></div>
				<div class="col-md-6">
					<div class="action pull-right">
						<ul>
						    <c:choose>
						        <c:when test="${not empty sessionScope.email}">
						            <!-- 로그인 상태 -->
						            <li class="white-text"><a href="/MyPage">${sessionScope.email}</a></li>
						            <li><a href="/logout"><i class="fa fa-lock"></i>로그아웃</a></li>
						            <li><a href="/cart"><i class="fa fa-MyPage"></i>장바구니</a></li>
						            <li><a href="/MyPage"><i class="fa fa-MyPage"></i> 마이페이지</a></li>
						            <c:if test="${isAdmin}">
						                <!-- 관리자인 경우에만 보임 -->
						                <li><a href="/ProductRegistration"><i class="fa fa-MyPage"></i> 상품등록</a></li>
						            </c:if>
						        </c:when>
						        <c:otherwise>
						            <!-- 비로그인 상태 -->
						            <li><a href="/login"><i class="fa fa-user"></i> 로그인</a></li>
						            <li><a href="/register"><i class="fa fa-lock"></i>회원가입</a></li>
						            <li><a href="/cart"><i class="fa fa-MyPage"></i>장바구니</a></li> 
						        </c:otherwise>
						    </c:choose>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="navigation">
		<nav class="navbar navbar-theme">
			<div class="container">
				<!-- Brand and toggle get grouped for better mobile display -->

				<div class="navbar-header">

					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#navbar" aria-expanded="false">

						<span class="sr-only">Menu</span> <span class="icon-bar"></span> 
						<span class="icon-bar"></span> <span class="icon-bar"></span>
					</button>
				</div>
				<div class="shop-category nav navbar-nav navbar-left">
					<!-- Single button -->
					<div class="btn-group">
						<button type="button"
							class="btn btn-shop-category dropdown-toggle"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							카테고리 <span class="caret"></span>
						</button>

						<ul class="dropdown-menu">
							<li><a href="/category?category=0">상의</a></li>
							<li><a href="/category?category=1">하의</a></li>
							<li><a href="/category?category=2">신발</a></li>
							<li><a href="/category?category=3">원피스</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md-7 col-sm-5">
				    <div class="search-form">
				        <form class="navbar-form" role="search" action="/search" method="get">
				            <div class="form-group">
				                <input type="text" class="form-control" id = "search" name="search" placeholder="What do you need...">
				            </div>
				            <button type="submit" class="btn">
				                <i class="fa fa-search"></i>
				            </button>
				        </form>
				    </div>
				</div>
			</div>
		</nav>
	</div>
	
	<%@ include file ="featured-items.jsp" %>
	<script>
		window.onscroll = function() {scrollFunction()};
	
		function scrollFunction() {
		  if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
		    document.getElementById("myBtn").style.display = "block";
		  } else {
		    document.getElementById("myBtn").style.display = "none";
		  }
		}
	
		// 버튼을 클릭하면 페이지 맨 위로 이동하는 함수
		function topFunction() {
		  document.body.scrollTop = 0; // 사파리 브라우저를 위한 코드
		  document.documentElement.scrollTop = 0; // 크롬, 파이어폭스, IE, 오페라 브라우저를 위한 코드
		}
	</script>
</body>
</html>