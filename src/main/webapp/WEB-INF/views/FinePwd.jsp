<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.regex.Pattern"%>
<%@ page import="java.util.regex.Matcher"%>
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
	height: 100vh;
	display: flex;
	align-items: center;
	justify-content: center;
	background: rgba(0, 0, 0, 0.1);
}

.register {
   width: 30%;
   height: 680px;
   background: white;
   border-radius: 20px;
   display: flex;
   justify-content: center;
   align-items: center;
   flex-direction: column;
   margin-top: 2%; 
} 

h2 {
	color: tomato;
	font-size: 2em;
}

.login_sns {
	padding: 15px;
	display: flex;
}

.login_sns li {
	padding: 0px 15px;
}

.login_sns a {
	width: 40px;
	height: 40px;
	display: flex;
	align-items: center;
	justify-content: center;
	padding: 10px;
	border-radius: 50px;
	background: white;
	font-size: 20px;
	box-shadow: 3px 3px 3px rgba(0, 0, 0, 0.4), -3px -3px 5px
		rgba(0, 0, 0, 0.1);
}

.login_id, .login_pw, .login_pwck, .login_username
, .login_tel, .login_rrn{
	margin-top: 1%;
	width: 80%;
}

.login_id input, .login_pw input , .login_pwck input , .login_username input
, .login_tel input, .login_rrn input{
	width: 100%;
	height: 30px;
	border-radius: 30px;
	margin-top: 10px;
	padding: 0px 20px;
	border: 1px solid lightgray;
	outline: none;
}

.login_pw {
	margin-top: 20px;
	width: 80%;
}
.login_etc {
	padding: 10px;
	width: 80%;
	font-size: 14px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	font-weight: bold;
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
	background: linear-gradient(to left, rgb(255, 77, 46), rgb(255, 155, 47));
	color: white;
	font-size: 1.2em;
	letter-spacing: 2px;
}
.idcheck {
	display: flex;
    justify-content: space-between; /* 버튼과 입력 필드 간의 공간을 최대로 확보 */
    align-items: center; /* 세로 중앙 정렬 */
}
.idcheck button {
    width: 120px; /* 원하는 너비로 변경 */
    height: 40px;
    /* margin : 10%; */
    border: none;
    border-radius: 5px;
    background: linear-gradient(to left, rgb(255, 77, 46), rgb(255, 155, 47));
	color: white;
    font-size: 15px; /* 원하는 글꼴 크기로 변경 */
    cursor: pointer;
}
.idcheck input[type="button"] {
    width: 100px; /* 원하는 너비로 변경 */
    height: 30px; /* 원하는 높이로 변경 */
    /* 다른 스타일 속성 */
}
.password-icon {
    cursor: pointer;
    padding-left: 5px;
    color: red;
}

.tooltip {
    display: none;
    position: absolute;
    background-color: #333;
    color: white;
    padding: 5px;
    border-radius: 5px;
    font-size: 12px;
    margin-left: 10px;
    margin-top: -5px;
}

.password-icon:hover + .tooltip {
    display: inline-block;
}
</style>
</head>
<body>
	<script type="text/javascript">
			var temp_email = "";
			var emailkey = "";
			let check = false;
			var pattern = /^(?=.*[a-z])(?=.*\d)(?=.*[!@#$%^&*()_+{}\[\]:;<>,.?~\\/-]).{8,20}$/;
			
			function validateForm() {
 	    	var password = document.getElementById('ch_Pwd').value.trim();
 	        var passwordConfirm = document.getElementById('chk_Pwd').value.trim();
	 	        if(!password || !passwordConfirm){
	 	      		alert('비밀번호를 입력해주세요');
	 	      		return false;
	 	      	}
	 	        else if (!pattern.test(password)) {
	 	     	    alert('비밀번호 양식을 확인해주세요.');
	 	     	    return false;
	 	     	}
	 	        else if (password !== passwordConfirm) { 
	 	            alert('비밀번호가 일치하지 않습니다.');
	 	            return false; // 일치하지 않으면 폼 제출 중지
	 	        }
	 	        else if(check == false || (temp_email !== document.getElementById('email').value.trim())){
	 	        	alert('이메일 인증을 다시 해주세요');
	 	        	return false;
	 	        }
	 	      //alert('회원가입 성공.');
 	    }
 		
 		
 		function checkEmailDuplication() { //----완성--
 		    var email = document.getElementById('email').value.trim();
 			temp_email = email;
 			if(email === ""){
 				alert('이메일 형식을 맞춰주세요..');
 				return;
 			}
 			else if (!email.includes('@')) {
 		        alert('이메일 형식을 맞춰주세요. "@"가 포함되어야 합니다.');
 		        return;
 		    }
 			
 			fetch('/checkEmailDuplication?email=' + email)
 	        .then(response => response.json())
 	        .then(data => {
 	            if (!data.isDuplicated) {
 	                alert('이메일이 존재하지않습니다.');
 	            } else {
 	               alert('이메일 사용 가능. 인증키를 발송합니다.');
 	               fetch('/api/mail/sendEmailVerification?email=' + email)
 	              .then(response => response.json()) // JSON 응답을 파싱
 	              .then(data => { 
 	                  if (data.success === "true") { // 서버에서 success 값을 반환했는지 확인
 	                      alert('인증키가 성공적으로 발송되었습니다. 이메일을 확인해주세요.');
 	                      emailkey = data.code;
 	                  } else {
 	                      alert('인증키 발송에 실패했습니다. 다시 시도해주세요.');
 	                  }
 	              })
 	              .catch(error => {
 	                  console.error('Error:', error);
 	                  alert('인증키 발송 중 에러가 발생했습니다.');
 	              });
 	            }
 	        });
 		}
 		
 		
 		function verifyEmailCode() {   //이메일 인증 로직
 			const userCode = document.getElementById("emailCheck").value;
 		    if(userCode === emailkey && emailkey !== "") {
 		    	check = true;
 		        alert("인증 성공!");
 		    } else {
 		        // 인증 실패
 		       alert("인증번호가 일치하지 않습니다. 다시 시도해주세요.");
 		    }
 		} 
 		function updatePasswordIconColor() { // 비밀번호 힌트
 		    var password = document.getElementById('ch_Pwd').value.trim();
 		    
 		    var icon = document.querySelector('.password-icon');
 		    
 		    if (pattern.test(password)) {
 		        icon.style.color = 'green';
 		    } else {
 		        icon.style.color = 'red';
 		    }
 		}
 		window.onload = function() {
 	        document.getElementById('ch_Pwd').addEventListener('input', updatePasswordIconColor);
 	    };
		</script>

<form action="/FinePwd" method="post" onsubmit="return validateForm();">
   <div class="wrap">
        <div class="register">
            <h2>비밀번호 찾기</h2>
            <div class="login_id">
                <h4>이메일</h4>
                <input type="email" name="email" id="email" placeholder="abcd@gmail.com">
                <div class="idcheck">
        			<input type="button" value="이메일인증" onclick="checkEmailDuplication()">
        			<input type="text" id="emailCheck" placeholder="인증번호를 입력하세요.">
        			<button id="checkbutton" type="button" onclick="verifyEmailCode()">확인</button>
    			</div>
            </div>
            <div class="login_pw">
    			<h4>비밀번호</h4>
    			<div class="test"> <!-- !!! -->
    				<input type="password" name="ch_Pwd" id="ch_Pwd" placeholder="****">
    			</div> <!-- !!! -->
    			<i class="password-icon">비밀번호는 8자 이상, 알파벳, 숫자, 특수문자를 포함해야 합니다.</i>
			</div>
            <div class="login_pwck">
                <h4>비밀번호확인</h4>
                <input type="password" name="chk_Pwd" id="chk_Pwd" placeholder="****">
            </div>
 		            <div class="submit">
    			<input type="submit" value="비밀번호 변경">
			</div>
        </div>
    </div>
   </form>
</body>
</html>