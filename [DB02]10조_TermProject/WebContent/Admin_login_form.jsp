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
<form method = "post" action="Admin_login_check.jsp">
	관리자 번호 : <input type = "text" name = "m_num" maxlength = "10"> <br/>
	이름 : <input type="text" name="m_name" maxlength="10"><br/>
	비밀번호 : <input type="password" name="m_pw" maxlength="10"><br/>
	
	<br/>
	<input type = "submit" value = "로그인">
	<input type="button" value="돌아가기"	onclick="location.href = 'TermMain.jsp'">
</form>
</body>
</html>