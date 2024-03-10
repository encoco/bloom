<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/buy.css">
<script>
	// 페이지 로딩 시 상품 ID 배열 초기화
	var products = [];
</script>
</head>
<body>	
	<section class="cart">
		<div id="productInfo" 
     			data-first-product-name="${product[0].name}" 
     			data-total-count="${fn:length(product)}">
		</div>
		<div class="category" id="category">
			<ul class="category_list">
				<li><a href="/">Home</a></li>
				<li><a href="/MyPage">마이페이지</a></li>
				<li><a href="#">최근 본 상품</a></li>
				<li><a href="#">찜</a></li>
				<li><a href="/cart">장바구니</a></li>
				<li><a href="#">주문 배송 조회</a></li>
			</ul>
		</div>
		<hr>

		<div class="title">
			<h1>주문하기</h1>
		</div>

		<div class="order_info">
			<h3>주문상품 정보</h3>
		</div>
		<table class="cart__list">
			<form>
				<thead>
					<tr>
						<td colspan="2">상품정보</td>
						<td>옵션</td>
						<td>주문 금액</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="product" items="${product}">
						<script>
                            // 각 상품의 ID를 배열에 추가
                            products.push({
            					id: ${product.product_id},
            					size: "${product.size}",
            					quantity: ${product.quantity},
            					name  : "${product.name}"
        					});
                        </script>
					<tr class="cart__list__detail">
						<td> <img src="${product.img1}" alt=""></td> 
						<td><a href="/product_detail?product_id=${product.product_id}">${product.name}</a>
							<p><fmt:formatNumber value="${product.price}" type="number" pattern="#,###" /></p>
						</td>
						
						<td class="cart__list__option">
							<p>사이즈 : ${product.size}/ ${product.quantity}개</p>
						</td>
						<td><span class="price"><fmt:formatNumber value="${product.price * product.quantity}" type="number" pattern="#,###" />원</span><br>
					</tr>
					</c:forEach>
				</tbody>
			</form>
		</table>
		<div class="price_total">
			<h1>
				총 주문금액 <span><fmt:formatNumber value="${totalAmount}" type="number" pattern="#,###" />원</span>
			</h1>
		</div>


		
		<hr>
		<div class="form-group">
			<label for="receiver">수령인</label> <input type="text" id="receiver">
		</div>
		
		<div class="form-group">
			<label for="phone">휴대폰</label> <input type="text" id="phone"
				class="form-control" oninput="oninputPhone(this)" maxlength="14">
		</div>
		<div class="form-group">
			<label for="address">배송주소</label> <input type="text" id="address">

		</div>
		<div class="form-group">
			<label for="memo">배송메모</label> <select id="memo">
				<option value="">배송 시 요청사항을 선택해주세요</option>
				<option value="leave_front">문 앞에 놓아주세요</option>
				<option value="security_office">경비실에 맡겨주세요</option>
				<!-- 추가 옵션들 -->
			</select>
		</div>
		<hr>


		<div class="Final_payment">
			<h3>최종 결제 금액</h3>
			<hr>
		</div>
		<dl class="order_totalpay">
			<dt>총 상품금액</dt>
			<dd><p><fmt:formatNumber value="${totalAmount}" type="number" pattern="#,###" />원</p></dd>
			<dt>총 배송비</dt>
			<dd>0 원</dd>
			<dt>쿠폰 할인</dt>
			<dd>0 원</dd>
			<dt>포인트 할인</dt>
			<dd>0 원</dd>
			<dt class="large">결제 예상 금액</dt>
			<dd class="red large"><fmt:formatNumber value="${totalAmount}" type="number" pattern="#,###" />원</dd>
		</dl>
		<hr>


		<div class="Payment_Method">
			<h3>결제 수단</h3>
			<hr>
		</div>
		<div class="form-check2">
			<input class="kakaopay_check" type="radio" name="pay" id="pay2" checked="check">
			<label class="form-check-label" for="pay2" > 카카오페이 </label>
		</div>
		<hr>
		<div class="cart__mainbtns" > 
			<button class="paymentbtn" onclick="requestPay()">결제하기</button>
		</div>
	</section>
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
	<script>
		var IMP = window.IMP;
    	IMP.init("imp56534188");
    	
    	var today = new Date();
		var makeMerchantUid = today.getHours() + today.getMinutes() + today.getSeconds() + today.getMilliseconds();
		
		function oninputPhone(target) {
			target.value = target.value.replace(/[^0-9]/g, '').replace(
					/(^02.{0}|^01.{1}|[0-9]{3,4})([0-9]{3,4})([0-9]{4})/g,
					"$1-$2-$3");
		}
		function requestPay() {
		    var productInfo = document.getElementById("productInfo");
		    var firstProductName = productInfo.getAttribute('data-first-product-name');
		    var totalCount = productInfo.getAttribute('data-total-count');
		    var productName = "";
		    if (totalCount != 1) {
		        productName = firstProductName + " 포함 " + totalCount + "가지";
		    } else {
		        productName = firstProductName;
		    }

		    var receiver = document.getElementById("receiver") ? document.getElementById("receiver").value : '';
		    var phone = document.getElementById("phone") ? document.getElementById("phone").value : '';
		    var address = document.getElementById("address") ? document.getElementById("address").value : '';
		    var memo = document.getElementById("memo") ? document.getElementById("memo").value : '';

		    if (!receiver) {
		        alert("수령인을 입력해주세요");
		        return;
		    }
		    if (!phone) {
		        alert("전화번호를 입력해주세요");
		        return;
		    }
		    if (!address) {
		        alert("주소를 입력해주세요");
		        return;
		    }
		    
		    // 요청 데이터 객체 생성
		    var requestData = {
		        order_id: makeMerchantUid,
		        product_id: products, // 상품 ID 목록
		        receiver: receiver,
		        phone: phone,
		        address: address,
		        memo: memo,
		    };

		    // 결제 요청 보내기
		    IMP.request_pay(
		        {
		            pg: "kakaopay.TC0ONETIME",
		            pay_method: "card",
		            merchant_uid: makeMerchantUid,
		            name: productName,
		            amount: ${totalAmount},
		            buyer_email: "wkdwlgjs111@naver.com",
		            buyer_name: receiver,
		            buyer_tel: phone,
		            buyer_addr: address,
		            buyer_postcode: "123-456",
		        },
		        function (rsp) {
		            if (rsp.success) {
		                // 결제 성공 처리
		                fetch('/processOrder', {
		                    method: 'POST',
		                    headers: {
		                        'Content-Type': 'application/json',
		                    },
		                    body: JSON.stringify(requestData) // 요청 데이터를 JSON 형식으로 전송
		                })
		                .then(response => response.json())
		                .then(data => {
		                    if (data.success) {
		                        alert('주문 처리 성공');
		                        window.location.href = '/';
		                    } else {
		                        console.log(data);
		                    	alert('주문 처리 실패: ' + data.message);
		                        
		                    }
		                })
		                .catch(error => {
		                    console.error('Error processing order:', error);
		                    alert('주문 처리 중 오류가 발생했습니다.');
		                });
		            } else {
		                // 결제 실패 처리
		                alert(rsp.error_msg);
		            }
		        }
		    );
		}
	</script>
</body>
</html>