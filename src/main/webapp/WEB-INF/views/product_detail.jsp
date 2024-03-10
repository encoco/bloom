<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page import="java.text.NumberFormat"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>상품 보기</title>


<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet">
<!-- Core theme CSS (includes Bootstrap)-->
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<link href="css/product_detail.css" rel="stylesheet" />
<link href="css/style.css" rel="stylesheet" />
<style>
.option.sold-out {
    text-decoration: line-through; /* 가로줄 그어짐 */
    color: grey; /* 회색으로 표시하여 선택 불가능하게 보이게 함 */
}

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
/* 모달 창 스타일 */
.modal {
  display: none; /* 기본적으로 숨겨져 있습니다 */
  position: fixed;
  z-index: 1; /* 다른 요소 위에 표시 */
  padding-top: 10px; /* 상단에 여백 */
  left: 0;
  top: 0;
  width: 100%; /* 전체 너비 */
  height: 80%; /* 전체 높이 */
  overflow: auto; /* 스크롤 가능하게 */
  background-color: rgb(0,0,0); /* 검정 배경 */
  background-color: rgba(0,0,0,0.9); /* 약간의 투명도 */
  
}

/* 모달 이미지 */
.modal-content {
  margin: auto;
  display: block;
  width: 70%;
  max-width: 700px;  
}

/* 모달 <span> 요소 - 닫기 버튼 */
.close {
  position: absolute;
  top: 15px;
  right: 35px;
  color: #f1f1f1;
  font-size: 40px;
  font-weight: bold;
  cursor: pointer;
}
</style>
</head>
<body>
	<%@ include file ="header.jsp" %>
		<!-- Product section-->
	<button onclick="topFunction()" id="myBtn" title="Go to top"><i class="fas fa-arrow-up"></i></button>
	<section class="py-5">
		<div class="container px-4 px-lg-5 my-5">
			<div class="row gx-4 gx-lg-5 align-items-center">
				<div class="col-md-6">
					<img id="productImage" class="card-img-top mb-5 mb-md-0" src="${product.img1}" 
											width="500px" height="500" id="productImage" style="cursor: pointer;" onclick="showProductImageModal()"/>
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
					<h4>사이즈</h4>
                	
					<form action="/solobuy" method="post">
    					<!-- 제품 ID 숨겨진 필드로 추가 (실제 제품 ID로 대체) -->
    					<input type="hidden" id = "selectedItems" name="selectedItems" value="${product.product_id}" />
    					
						<!-- 사이즈 선택 -->
						
    					<select id="size" name="size" class="form-control">
        					<c:if test="${stock.xs > 0}">
        						<option value="xs">XS &nbsp;&nbsp;&nbsp; 재고 : ${stock.xs}</option>
    						</c:if>
    						<c:if test="${stock.xs <= 0}">
        						<option value="xs" disabled class="sold-out">XS - 품절</option>
    						</c:if>
    						<c:if test="${stock.s > 0}">
        						<option value="s">S &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  재고 : ${stock.s}</option>
    						</c:if>
    						<c:if test="${stock.s <= 0}">
        						<option value="s" disabled class="sold-out">S - 품절</option>
    						</c:if>
    						<c:if test="${stock.m > 0}">
        						<option value="m">M &nbsp;&nbsp;&nbsp;    재고 : ${stock.m}</option>
    						</c:if>
    						<c:if test="${stock.m <= 0}">
        						<option value="m" disabled class="sold-out">M - 품절</option>
    						</c:if>
    						<c:if test="${stock.l > 0}">
        						<option value="l">L &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  재고 : ${stock.l}</option>
    						</c:if>
    						<c:if test="${stock.l <= 0}">
        						<option value="l" disabled class="sold-out">L - 품절</option>
    						</c:if>
    						<c:if test="${stock.xl > 0}">
        						<option value="xl">XL &nbsp;&nbsp;&nbsp; 재고 : ${stock.xl}</option>
    						</c:if>	
    						<c:if test="${stock.xl <= 0}">
        						<option value="xl" disabled class="sold-out">XL - 품절</option>
    						</c:if>
    					</select>
           				<input name="quantityInput" id="quantityInput" type="number" value="1" class="form-control" 
           								style="max-width: 10rem; margin-top:20px"/>
					    <!-- 구매 버튼 -->
    					<button type="submit" class="btn btn-outline-dark flex-shrink-0" style="margin-top:20px">
        					<i class="bi-cart-fill me-1"></i> 구매
    					</button>
						
    					<button class="btn btn-outline-dark flex-shrink-0" type="button" onclick="addcart(${selectedItems})" style="margin-top:20px">
    						<i class="bi-cart-fill me-1"></i> 장바구니 담기
						</button>

					</form>
				</div>
			</div>
		</div>
	</section>
	<!-- Related items section-->
	<%-- <%@ include file ="product_detail2.jsp" %> --%>
	<jsp:include page="product_detail2.jsp" />
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Your
				Website 2023</p>
		</div>
	</footer>
	<!-- Bootstrap core JS-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- jQuery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<!-- Bootstrap JS -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script>
		function validateOrder() {
		    var selectedSize = document.getElementById('size').value; // 선택한 사이즈
		    var selectedQuantity = parseInt(document.getElementById('quantityInput').value); // 선택한 수량
	
		    // 사이즈별 재고 수량 (실제 재고 데이터에 맞게 수정 필요)
		    var stock = {
		        xs: ${stock.xs},
		        s: ${stock.s},
		        m: ${stock.m},
		        l: ${stock.l},
		        xl: ${stock.xl}
		    };
	
		    // 재고보다 많은 수량을 주문하려고 하면 경고창 표시
		    if (selectedQuantity > stock[selectedSize]) {
		        alert("선택하신 사이즈의 재고가 부족합니다. 재고 수량을 확인하고 다시 주문해주세요.");
		        return false; // 주문 중단
		    }
		    if (selectedQuantity <= 0) {
		        alert("수량을 확인해주세요.");
		        return false; // 주문 중단
		    }
	
		    return true; // 재고가 충분하면 주문 진행
		}
	
		// 주문 버튼 클릭 이벤트에 validateOrder 함수 연결
		document.querySelector("form[action='/solobuy']").onsubmit = function() {
		    return validateOrder();
		};
	</script>
	
		<script>
    		function addcart(product_id) {
        		var sizeElement = document.getElementById('size').value.trim();;
        		var quantityElement = document.getElementById('quantityInput').value.trim();;
				var product_id = document.getElementById('selectedItems').value.trim();;
				
        		
		        if (!sizeElement || !quantityElement) {
            		console.error('Element not found');
            		return;
        		}
		        
			    fetch('/addcart', {
			        method: 'POST',
			        headers: {
			            'Content-Type': 'application/json',
			        },
			        body: JSON.stringify({ 
			            product_id: product_id, 
			            size: sizeElement , 
			            quantity: quantityElement 
			        })
			    })
			    .then(response => {
			        // 응답 상태에 따른 에러 처리
			        if (!response.ok) {
			            throw new Error('Network response was not ok');
			        }
			        return response.json();
			    })
			    .then(data => {
			        // 서버로부터의 응답에 따른 사용자 알림 처리
			        if (data.success) {
			            if (confirm('상품이 장바구니에 추가되었습니다. 장바구니 페이지로 이동하시겠습니까?')) {
			                window.location.href = '/cart'; // 사용자가 '확인'을 누를 경우 장바구니 페이지로 이동
			            }
			        } else {
			            alert(data.message); // 서버가 제공하는 메시지 출력
			        }
			    })
			    .catch(error => {
			        alert('로그인을 해야 합니다.');
			        window.location.href = '/login'; // 로그인 페이지로 리디렉션
			    });
			}
		</script>
		<script>
			// 스크롤이 일정 위치에 도달했을 때 버튼을 보이게 합니다
			window.onscroll = function() {scrollFunction()};
	
			function scrollFunction() {
			  if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
			    document.getElementById("myBtn").style.display = "block";
			  } else {
			    document.getElementById("myBtn").style.display = "none";
			  }
			}
	
			// 버튼을 클릭하면 페이지 상단으로 스크롤합니다
			function topFunction() {
			  document.body.scrollTop = 0; // 사파리를 위한 대응
			  document.documentElement.scrollTop = 0; // 크롬, 파이어폭스, IE, 오페라를 위한 대응
			}
		</script>
		<script>
		document.addEventListener("DOMContentLoaded", function() {
		    var img = document.getElementById("productImage");
		    var modal = document.getElementById("myModal");
		    var modalImg = document.getElementById("img01");
		    var span = document.getElementsByClassName("close")[0];

		    if (img && modal && modalImg && span) {
		        img.onclick = function() {
		            modal.style.display = "block";
		            modalImg.src = this.src;
		        };

		        span.onclick = function() { 
		            modal.style.display = "none";
		        };

		        window.onclick = function(event) {
		            if (event.target == modal) {
		                modal.style.display = "none";
		            }
		        };
		    } else {
		        console.error("Some elements were not found.");
		    }
		});
		
		</script>
		<script>
			function showProductImageModal() {
			    var modal = document.getElementById("productImageModal");
			    var modalImg = document.getElementById("productImgModal");
	
			    modal.style.display = "block";
			    modalImg.src = document.getElementById("productImage").src;
	
			    var span = document.getElementsByClassName("productClose")[0];
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
		<div id="productImageModal" class="modal">
		    <span class="productClose">&times;</span>
		    <img class="modal-content" id="productImgModal">
		    <div id="productCaption"></div>
		</div>
</body>
</html>