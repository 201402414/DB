<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login_form</title>
</head>
<body>
<H1>로그인</H1>
<form method = "post" action="Login_check.jsp">
	ID : <input type = "text" name = "id" maxlength = "10"> <br/>
	Password : <input type="password" name="pw" maxlength="10"><br/>
	<br/>
	<input type = "submit" value = "로그인">
	<input type="button" value="돌아가기"	onclick="location.href = 'TermMain.jsp'">
</form>
</body>
</html>