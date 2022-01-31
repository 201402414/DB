<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login_form</title>
</head>
<body>
<H1>회원가입</H1>
<form method = "post" action="Signup_check.jsp">
	ID : <input type = "text" name = "id" maxlength = "10"> <br/>
	Password : <input type="password" name="pw" maxlength="10"><br/>
	Name : <input type = "text" name = "user_name" maxlength = "10"><br/>
	E-mail : <input type = "text" name = "email" maxlength = "15"><br/>
	TEL : <input type = "text" name = "tel" maxlength = "20"><br/>
	구분 : <select name="title">
			<option value="student">학 생</option>
			<option value="Gstudent">대 학 원 생</option>
			<option value="teacher">교 직 원</option>
		</select> <br />
	<input type = "submit" value = "회원가입">
	<input type="button" value="돌아가기"	onclick="location.href = 'TermMain.jsp'">
</form>
</body>
</html>