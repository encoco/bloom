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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" 
						integrity="sha384-JcKb8q3p/qqUfDPEJTPNniXKbkV4FDWo5uXjFBKjSEJnITpCQVJ3LQMwHskeaPbN" 
						crossorigin="anonymous">
<!-- Theme Stylesheet -->
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/responsive.css">


</head>
<body>
	<%@ include file ="header.jsp" %>
	

	<div class="navigation">
		<nav class="navbar navbar-theme">
			<div class="container">
				<div class="shop-category nav navbar-nav navbar-left">
					<!-- Single button -->
					<div class="btn-group">
						<button type="button"
							class="btn btn-shop-category dropdown-toggle"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							카테고리<span class="caret"></span>
						</button>
						<ul class="dropdown-menu">
							<li><a href="/category?category=0">상의</a></li>
							<li><a href="/category?category=1">하의</a></li>
							<li><a href="/category?category=2">신발</a></li>
							<li><a href="/category?category=3">원피스</a></li>
						</ul>
					</div>
				</div>
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse" id="navbar">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="/">Home</a></li>
						<li><a href="/MyPage">마이페이지</a></li>
						<!-- <li><a href="#">최근 본 상품</a></li>
						<li><a href="#">찜</a></li> -->
						<li><a href="/cart">장바구니</a></li>
						<!-- <li><a href="#">주문 배송 조회</a></li> -->
					</ul>
				</div>
			</div>
		</nav>
	</div>
	<div class="slider">
		<div class="container">
			<div class="row">
						<div id="featured" class="carousel slide" data-ride="carousel">
							<div class="carousel-inner" role="listbox">
								<div class="item active" 
									style="background-image: url('https://shopbukkit.s3.ap-northeast-2.amazonaws.com/static/bloom11.png')">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- <div class="banner">
		<div class="container">
			<div class="row">
				<div class="col-md-4 col-sm-4">
					<div class="single-banner"
						style="background-image: url(https://shopbukkit.s3.ap-northeast-2.amazonaws.com/static/banner-1.jpg)">
						<div class="banner-caption">
							<h3>Awesome Bag Collection</h3>
							<a href="" class="btn btn-theme">Shop Now</a>
						</div>
					</div>
				</div>
				<div class="col-md-4 col-sm-4">
					<div class="single-banner"
						style="background-image: url(https://shopbukkit.s3.ap-northeast-2.amazonaws.com/static/banner-2.jpg)">
						<div class="banner-caption">
							<h3>Men Shirt Collection</h3>
							<a href="" class="btn btn-theme">Shop Now</a>
						</div>
					</div>
				</div>
				<div class="col-md-4 col-sm-4">
					<div class="single-banner"
						style="background-image: url(https://shopbukkit.s3.ap-northeast-2.amazonaws.com/static/banner-3.jpg)">
						<div class="banner-caption">
							<h3>Women Bag Collection</h3>
							<a href="" class="btn btn-theme">Shop Now</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div> -->
	
	<!--             베스트 상품              -->
	<div class="featured-items">
		<div class="container">
			<div class="row">
				<ul class="nav nav-tabs nav-product-tabs">
					<li class="active"><a href="#trending" data-toggle="tab"></a></li>
					<li><a href="#best-seller" data-toggle="tab">베스트 상품</a></li>
					<li class="pull-right collection-url"><a href="/product_all">
							<i class="fa fa-long-arrow-right"></i>
					</a></li>
				</ul>
			    <c:forEach var="product" items="${products}" begin="0" end="7">
					<div class="tab-content">
						<div class="tab-pane active" id="trending">
							<div class="col-md-3 col-sm-4">
								<div class="single-product">
									<div class="product-block">
										<img src="${product.img1}" alt="" class="thumbnail"  width="225" height="225px"/>
										<div class="product-description text-center">
											<p class="title">${product.name}</p>
											<p><fmt:formatNumber value="${product.price}" type="number" pattern="#,###" /></p>
										</div>
										<div class="product-hover">
											<ul>
												 <%-- <li>
    											 <a href="#" class="add-to-cart" data-product-id="${product.product_id}"> <i class="fa fa-cart-arrow-down"></i>
    													</a>
  												</li> --%>
												<li><a href="/product_detail?product_id=${product.product_id}"><i class="fa fa-arrows-h"></i></a></li>
												<li><a href=""><i class="fa fa-heart-o"></i></a></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
	    			</div>
    			</c:forEach>
    		</div>
    	</div>
    </div>
    
    <!--             최근 본 상품              -->
	<!-- <div class="popular-items">
		<div class="container">
			<div class="row">
				<ul class="nav nav-tabs nav-product-tabs">
					<li class="active"><a href="#popular" data-toggle="tab">최근 본 상품과 비슷한 상품</a></li>
					<li><a href="#special" data-toggle="tab">.</a></li>
					<li class="pull-right collection-url"><a href="/product_all">모두 보기
							<i class="fa fa-long-arrow-right"></i>
					</a></li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane active" id="popular">
						<div class="col-md-3 col-sm-4">
							<div class="single-product">
								<div class="product-block">
									<img src="" alt="" class="thumbnail">
									<div class="product-description text-center">
										<p class="title">Date Tiffany Torchiere</p>
										<p class="price">$ 55.00</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div> -->
	<%@ include file ="footer.jsp" %>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>

	<!-- Latest compiled and minified JavaScript -->

	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

	<!-- Script -->
	<script>
    document.addEventListener('DOMContentLoaded', function() {
        document.querySelectorAll('.add-to-cart').forEach(function(button) {
            button.addEventListener('click', function(event) {
                event.preventDefault(); // 기본 앵커 동작을 방지합니다.
                var product_id = this.dataset.productId; // data-product-id 속성을 통해 상품 ID를 가져옵니다.
                addToCart(product_id); // 상품 ID를 addToCart 함수로 전달합니다.
            });
        });
    });

    // 이 함수는 사용자가 '장바구니 추가' 버튼을 클릭했을 때 호출됩니다.
    function addToCart(product_id) {
        // 세션에서 이메일을 가져오는 로직을 구현합니다.
        // 이 예제에서는 JSP의 EL(Expression Language)을 사용하여 이메일을 인라인으로 삽입합니다.
        var email = "<c:out value='${sessionScope.email}'/>";
        
        // 이메일이 없다면 로그인 페이지로 리디렉션합니다.
        if (!email) {
            alert('로그인이 필요합니다.');
            window.location.href = '/login';
            return;
        }

        // fetch API를 사용하여 서버에 AJAX 요청을 보냅니다.
        fetch('/addcart', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({ email: email, product_id: product_id })
        })
        .then(response => {
            if (!response.ok) {
                throw new Error('not ok.');
            }
            // JSON으로 응답을 파싱하기 전에 Content-Type을 검사합니다.
            const contentType = response.headers.get('content-type');
            if (!contentType || !contentType.includes('application/json')) {
                throw new TypeError("error");
            }
            return response.json();
        })
        .then(data => {
            if (data.success) {
                alert('상품이 장바구니에 추가되었습니다.');
            } else {
            	alert(data.message);
            }
        })
        .catch(error => {
            console.error('Error adding to cart:', error);
            alert('장바구니 추가 중 오류가 발생했습니다.');
        });
    }
	</script>
	<script src="js/script.js"></script>
</body>