<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>장바구니</title>
    <link rel="stylesheet" href="css/cart.css">
</head>
<body>
    <%@ include file ="header.jsp" %>
    <section class="cart">
        <div class="cart__information">
            <ul>
                <li>장바구니 상품은 최대 30일간 저장됩니다.</li>
                <li>가격, 옵션 등 정보가 변경된 경우 주문이 불가할 수 있습니다.</li>
                <li>오늘출발 상품은 판매자 설정 시점에 따라 오늘출발 여부가 변경될 수 있으니 주문 시 꼭 다시 확인해 주시기 바랍니다.</li>
            </ul>
        </div>
        	<form id="cartForm" action="/buy" method="post">
            <table class="cart__list">
                <thead>
                    <tr>
                        <td><input type="checkbox" id="selectAll" checked=checked></td>
                        <td colspan="2">상품정보</td>
                        <td>옵션</td>
                        <td>상품금액</td>
                        <td>배송비</td>
                    </tr>
                </thead>
	                <tbody>
	                    <c:forEach var="cart" items="${cart}">
	                        <tr class="cart__list__detail">
	                            <td>
	                                <input type="checkbox" name="selectedItems" value="${cart.product_id}" checked="checked">
	                            </td>
	                            <td>
	                            	<a href="/product_detail?product_id=${cart.product_id}">
						                <img src="${cart.img1}" alt="${cart.name}">
						            </a>
	                            </td>
	                            <td>
	                            	<br><br>
	                                <p>${cart.name}</p>
	                                <p><fmt:formatNumber value="${cart.price}" type="number" pattern="#,###" /></p>
	                            </td>
	                            <td class="cart__list__option">
	                            <br><br>
	                                <p>사이즈 : ${cart.size} / ${cart.quantity}개</p>
	                            </td>
	                            <td>
	                            	<br><br>
	                                <span class="price"><p><fmt:formatNumber value="${cart.price * cart.quantity}" type="number" pattern="#,###" /></p></span><br>
	                            </td>
	                            <td>무료</td>
	                        </tr>
	                    </c:forEach>
	                    <tfoot>
			                    <tr>
			                        <td colspan="3">
			                        	<input type="checkbox" id="selectAll" checked=checked> 
			                        	<button class="cart__list__optionbtn" onclick="deleteSelectedItems()">선택상품 삭제</button>
			                            <!-- <button class="cart__list__optionbtn">선택상품 찜</button> -->
			                        </td>
			                    </tr>
	                	</tfoot>
	                </tbody>
	            </table>
	             </form>
	        	<div class="cart__mainbtns">
	            	<button class="cart__bigorderbtn left" onclick="window.location.href='/product_all'">쇼핑 계속하기</button>
	            	<input type="button" class="cart__bigorderbtn right" value="선택 상품 주문하기" onclick="submitSelectedItems()">
	        	</div>
	    </section>

    <script>
	    function deleteSelectedItems(event) {
	        event.preventDefault();
	        var selectedItems = document.querySelectorAll('input[name="selectedItems"]:checked');
	        if (selectedItems.length === 0) {
	            alert("삭제할 상품을 선택해주세요.");
	            return;
	        }
	
	        var productIds = Array.from(selectedItems).map(item => item.value);
	
	        // AJAX 요청을 보내는 부분
	        var xhr = new XMLHttpRequest();
	        xhr.open("POST", "/deleteSelectedItems", true);
	        xhr.setRequestHeader("Content-Type", "application/json");
	        xhr.send(JSON.stringify({ productIds: productIds }));
	
	        xhr.onload = function() {
	            if (xhr.status == 200) {
	                alert('장바구니 삭제 완료');
	                window.location.reload(); // 현재 페이지를 새로고침
	            } else {
	                alert("삭제 실패: " + xhr.responseText);
	            }
	        };
	    }
		function submitSelectedItems() {
	        var form = document.getElementById('cartForm');
	        var selectedItems = form.querySelectorAll('input[name="selectedItems"]:checked');
	
	        if (selectedItems.length === 0) {
	            alert("주문할 상품을 선택해주세요.");
	            return;
	        }
	        form.submit();
	    }
		// "선택상품 삭제" 버튼에 이벤트 리스너 추가
			document.querySelectorAll('.cart__list__optionbtn').forEach(button => {button.addEventListener('click', deleteSelectedItems);
    	});
	</script>
	<script>
		document.addEventListener('DOMContentLoaded', function() {
		    var selectAllCheckbox = document.getElementById('selectAll');
		    selectAllCheckbox.addEventListener('change', function() {
		        var itemCheckboxes = document.querySelectorAll('input[type="checkbox"][name="selectedItems"]');
		        var footerCheckbox = document.querySelector('tfoot input[type="checkbox"]');
		        
		        itemCheckboxes.forEach(function(checkbox) {
		            checkbox.checked = selectAllCheckbox.checked;
		        });
	
		        if (footerCheckbox) {
		            footerCheckbox.checked = selectAllCheckbox.checked;
		        }
		    });
	
		    // Optional: Add listener to footer checkbox to control selectAll
		    var footerCheckbox = document.querySelector('tfoot input[type="checkbox"]');
		    if (footerCheckbox) {
		        footerCheckbox.addEventListener('change', function() {
		            selectAllCheckbox.checked = footerCheckbox.checked;
		            var itemCheckboxes = document.querySelectorAll('input[type="checkbox"][name="selectedItems"]');
		            itemCheckboxes.forEach(function(checkbox) {
		                checkbox.checked = footerCheckbox.checked;
		            });
		        });
		    }
		});
	</script>
</body>
</html>