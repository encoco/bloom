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

<style>
.product-name{
    margin-top: 20px;
    margin-bottom: 4px;
}

.product{
    display: block;
    width: 225px;
    text-align: center;
    text-decoration:none;
    color: black;
    float:left;
    margin-left: 10px;
    margin-right: 10px;
    margin-bottom: 30px;
}	
</style>
<body>
<div class="featured-items">
		<div class="container">
			<div class="row">
				<ul class="nav nav-tabs nav-product-tabs">
					<li class="active"><a href="#trending" data-toggle="tab"></a></li>
					<li><a href="#best-seller" data-toggle="tab">전체 상품</a></li>
					<li class="pull-right collection-url"><a href="">
							<i class="fa fa-long-arrow-right"></i>
					</a></li>
				</ul>
			    <c:forEach var="product" items="${products}">
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
</body>
</html>