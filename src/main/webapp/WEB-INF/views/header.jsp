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
<!-- Theme Stylesheet -->
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/responsive.css">
</head>
<body>
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
	<div class="header">
		<div class="container">
			<div class="row">
				<div class="col-md-3 col-sm-4">
					<div class="logo">
						<a href="/"> <img src="https://shopbukkit.s3.ap-northeast-2.amazonaws.com/static/bloom.jpg"
							alt="bloom" >
						</a>
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
		</div>
	</div>
</body>
</html>