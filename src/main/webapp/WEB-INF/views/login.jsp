<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
* {
  margin: 0;
  padding: 10;
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

.login {
  width: 30%;
  height: 600px;
  background: white;
  border-radius: 20px;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
}

h2 {
  color: black;
  font-size: 2em;
}
.login_sns {
  padding: 20px;
  display: flex;
}

.login_sns li {
  padding: 0px 15px;
}

.login_sns a {
  width: 50px;
  height: 50px;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 10px;
  border-radius: 50px;
  background: white;
  font-size: 20px;
  box-shadow: 3px 3px 3px rgba(0, 0, 0, 0.4), -3px -3px 5px rgba(0, 0, 0, 0.1);
}

.login_id {
  margin-top: 20px;
  width: 80%;
}

.login_id input {
  width: 130%;
  height: 50px;
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

.login_pw input {
  width: 130%;
  height: 50px;
  border-radius: 30px;
  margin-top: 10px;
  padding: 0px 20px;
  border: 1px solid lightgray;
  outline: none;
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
  height: 50px;
  border: 0;
  outline: none;
  border-radius: 40px;
  background: black; /* 검은색 배경 */
  color: white; /* 흰색 글씨 */
  border: 1px solid white; /* 흰색 테두리 추가 */
  /* background: linear-gradient(to left, rgb(255, 77, 46), rgb(255, 155, 47));
  color: white; */
  font-size: 1.2em;
  letter-spacing: 2px;
}
.login {
  position: relative; /* 상대 위치 지정 */
  /* 기존 스타일 유지 */
}

.main-button {
  position: absolute; /* 절대 위치 지정 */
  top: 40px; /* 상단에서 10px 떨어진 위치 */
  left: 40px; /* 왼쪽에서 10px 떨어진 위치 */
}

.main-link {
  display: inline-block;
  padding: 10px 20px; /* 패딩 감소 */
  background-color: black;
  color: white;
  border-radius: 20px; /* 모서리 둥글게 */
  text-decoration: none;
  font-size: 0.8em; /* 글씨 크기 감소 */
  transition: background-color 0.3s;
}

.main-link:hover {
  background-color: #555;
}
</style>
</head>
<body>
    <div class="wrap">
        <div class="login">
            <h2>로그인</h2>
            <div class="main-button">
	    		<a href="/" class="main-link">홈</a>
			</div>
            <div class="login_sns">
            <li> <a href="/login"></a>  <i class="fab fa-naver"></i> </a></li>
            <li><a href=""><i class="fab fa-facebook-f"></i></a></li>
            <li><a href=""><i class="fab fa-twitter"></i></a></li>
            </div>
            
             <form action="/login" method="post">
            <div class="login_id">
                <h4>이메일</h4>
                <input type="email" name="email" id="email" placeholder="name@example.com">
            </div>
            <div class="login_pw">
                <h4>비밀번호</h4>
                <input type="password" name="userpwd" id="userpwd" type="password" placeholder="Password">
            </div>
            <div class="login_etc">
                <!-- <div class="checkbox">
                <input type="checkbox" name="" id=""> Remember
                </div> -->
                <div class="forgot_pw">
                <a href="/FinePwd">비밀번호 찾기</a>
            </div> 
            </div>
            <div class="submit">
                <input type="submit" value="로그인">
            </div>
            </form>
        </div>
    </div>
</body>
</html>