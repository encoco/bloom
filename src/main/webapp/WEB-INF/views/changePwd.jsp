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
  height: 600px; /* 높이 조정 */
  background: white;
  border-radius: 20px;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
}

h2 {
  color: black; /* 텍스트 색상 변경 */
  font-size: 2em;
}

.login_pw, .login_pwck {
  margin-top: 20px;
  width: 80%;
}

.login_pw input, .login_pwck input {
  width: 100%; /* 너비 조정 */
  height: 50px; /* 높이 조정 */
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
  height: 50px;
  border: 0;
  outline: none;
  border-radius: 40px;
  background: black; /* 배경색 변경 */
  color: white; /* 글씨색 변경 */
  font-size: 1.2em;
  letter-spacing: 2px;
}

.password-icon {
  padding-left: 5px;
  color: red;
  font-size: 14px;
}
</style>
</head>
<body>
<form action="/changePwd" method="post" onsubmit="return validateForm();">
   <div class="wrap">   
        <div class="register">
        	<h2>비밀번호 변경</h2>
    		<div class="login_pw">
    			<div class="test">
    				<h4> 현재 비밀번호 </h4>
    				<input type="password" name="userpwd" id="userpwd" placeholder="****">
    				<h4>변경 할 비밀번호</h4>
                	<input type="password" name="ch_Pwd" id="ch_Pwd" placeholder="****">
                	<h4>변경 할 비밀번호 확인</h4>
                	<input type="password" name="ch_Pwdck" id="ch_Pwdck" placeholder="****"><br>
                	<i class="password-icon">비밀번호는 8자 이상, 알파벳, 숫자, 특수문자를 포함해야 합니다.</i>
    			</div>
    		</div>
    			<div class="submit">
	    			<input type="submit" value="변경">
				</div>
			</div>
        </div>
   </form> 
	
	<script type="text/javascript">
	    var pattern = /^(?=.*[a-z])(?=.*\d)(?=.*[!@#$%^&*()_+{}\[\]:;<>,.?~\\/-]).{8,20}$/;
	    function validateForm() {
	        var ch_Pwd = document.getElementById('ch_Pwd').value.trim();
	        var ch_Pwdck = document.getElementById('ch_Pwdck').value.trim();
	
	        if (!ch_Pwd || !ch_Pwdck) {
	            alert('비밀번호를 입력해주세요');
	            return false;
	        }
	
	        if (!pattern.test(ch_Pwd)) {
	            alert('비밀번호 양식을 확인해주세요.');
	            return false;
	        } else if (ch_Pwd !== ch_Pwdck) {
	            alert('비밀번호가 일치하지 않습니다.');
	            return false; // 일치하지 않으면 폼 제출 중지
	        }
	        
	        return "/MyPage";
	    }
	
	    function updatePasswordIconColor() {
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

</body>
</html>