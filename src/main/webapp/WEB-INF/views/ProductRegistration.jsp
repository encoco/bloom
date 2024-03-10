<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: "Noto Sans KR", sans-serif;
}

a {
	text-decoration: none;
	color: black;
}

li {
	list-style: none;
}

.wrap {
	width: 100%;
	height: 100%;
	display: flex;
	align-items: center;
	justify-content: center;
	background: rgba(0, 0, 0, 0.1);
}

.ProductRegistration {
   width: 30%;
   height: 100%;
   background: white;
   border-radius: 20px;
   display: flex;
   justify-content: center;
   align-items: center;
   flex-direction: column;
   margin-top: 2%; 
} 

h2 {
	color: black;
	font-size: 2em;
}
.login_id{
	margin-top: 1%;
	width: 80%;
}
.login_id input{
	width: 100%;
	height: 30px;
	border-radius: 30px;
	margin-top: 10px;
	padding: 0px 20px;
	border: 1px solid lightgray;
	outline: none;
}
.submit {
	margin-top: 50px;
	width: 80%;
}
.submit input {
	width: 100%;
	height: 40px;
	border: 0;
	outline: none;
	border-radius: 40px;
	background: black; /* 검은색 배경 */
  	color: white; /* 흰색 글씨 */
	font-size: 1.2em;
	letter-spacing: 2px;
}
</style>
</head>
<body>
<form action="/ProductRegistration" method="post" onsubmit="return Test();" enctype="multipart/form-data">
   <div class="wrap">
        <div class="ProductRegistration">
            <h2>상품 등록</h2>
            <div class="login_id">
                <h4>상품명</h4>
                <input type="text" name="name" id="name" >
            </div>
            <div class="login_id">
                <h4>카테고리</h4>
                <select id="category_id" name="category_id" size="1">
                	<option value="0"> 상의 </option>
                	<option value="1"> 하의 </option>
                	<option value="2"> 신발</option>
                	<option value="3"> 원피스</option>
                </select>
            </div>
            <div class="login_id">
    			<h4>가격 (숫자만 입력 ex)10000</h4>
    			<div class="test"> <!-- !!! -->
    				<input type="text" name="price" id="price">
    			</div>
			</div>
			<div class="login_id">
    			<h4>상품설명</h4>
    			<div class="test"> <!-- !!! -->
    				<input type="text" name="product_content" id="product_content">
    			</div>
			</div>
            <div class="login_id">
                <h4>세일 (숫자만 입력해주세요)</h4>
                <input type="text" name="sale" id="sale">
            </div>
			<div class="login_id">
                <h4>재고</h4>
              	<input type="number" name="stock_xs" id="stock_xs" placeholder="XS">
                <input type="number" name="stock_s" id="stock_s" placeholder="S">
                <input type="number" name="stock_m" id="stock_m" placeholder= "M">
                <input type="number" name="stock_l" id="stock_l" placeholder="L">
                <input type="number" name="stock_xl" id="stock_xl" placeholder="XL">
            </div>
            <div class="login_id">
    			<h4>이미지1</h4>
    			<div class="test"> <!-- !!! -->
    				<input type="file" name="img1Path" id="img1Path">
    			</div>
			</div>
			<div class="login_id">
    			<h4>이미지2</h4>
    			<div class="test"> <!-- !!! -->
    				<input type="file" name="img2Path" id="img2Path">
    			</div>
			</div>
			<div class="login_id">
    			<h4>이미지3</h4>
    			<div class="test"> <!-- !!! -->
    				<input type="file" name="img3Path" id="img3Path">
    			</div>
			</div>
			<div class="login_id">
    			<h4>이미지4</h4>
    			<div class="test"> <!-- !!! -->
    				<input type="file" name="img4Path" id="img4Path">
    			</div>
			</div>
 		    <div class="submit">
    			<input type="submit" value="상품 등록">
			</div>
        </div>
    </div>
   </form>
   <script>
	    function Test() {
	    	var stock_xs= document.getElementById('stock_xs').value.trim();
			var stock_s= document.getElementById('stock_s').value.trim();
			var stock_m= document.getElementById('stock_m').value.trim();
			var stock_l= document.getElementById('stock_l').value.trim();
			var stock_xl= document.getElementById('stock_xl').value.trim();
			
			if (stock_xs === "") stock_xs = document.getElementById('stock_xs').value = '0';
			if (stock_s === "") stock_s = document.getElementById('stock_s').value = '0';
			if (stock_m === "") stock_m = document.getElementById('stock_m').value = '0';
			if (stock_l === "") stock_l = document.getElementById('stock_l').value = '0';
			if (stock_xl === "") stock_xl = document.getElementById('stock_xl').value = '0';
	        // Check if the name field is empty
	        var name = document.getElementById('name').value;
	        if (name == '') {
	            alert('상품명을 입력해주세요.');
	            return false;
	        }
	
	        // Check if the price field is empty
	        var price = document.getElementById('price').value;
	        if (price == '') {
	            alert('가격을 입력해주세요.');
	            return false;
	        }
	
	        // Check if the product content field is empty
	        var productContent = document.getElementById('product_content').value;
	        if (productContent == '') {
	            alert('상품설명을 입력해주세요.');
	            return false;
	        }
	
	        // Check if the sale field is empty
	        var sale = document.getElementById('sale').value;
	        if (sale == '') {
	            alert('세일을 입력해주세요.');
	            return false;
	        }
	
	        // Check if the first image is uploaded
	        var img1Path = document.getElementById('img1Path').value;
	        if (img1Path == '') {
	            alert('첫 번째 이미지를 업로드해주세요.');
	            return false;
	        }
	
	        // If all checks pass, allow the form to be submitted
	        alert('상품 추가 완료');
	        return true;
	        
	    }
	</script>
   
   
</body>
</html>