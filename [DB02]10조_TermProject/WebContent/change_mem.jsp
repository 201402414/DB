<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>change_mem</title>
</head>
<body>
<H1>회원정보 수정</H1>
<form method = "post" action="change_mem_check.jsp">
	ID확인 : <input type = "text" name = "id" maxlength = "10"> <br/>
	바꿀 Password : <input type="password" name="pw" maxlength="10"><br/>
	바꿀 Name : <input type = "text" name = "user_name" maxlength = "10"><br/>
	바꿀 E-mail : <input type = "text" name = "email" maxlength = "15"><br/>
	바꿀 TEL : <input type = "text" name = "tel" maxlength = "20"><br/>
	바꿀 구분 : <select name="title">
			<option value="student">학 생</option>
			<option value="Gstudent">대 학 원 생</option>
			<option value="teacher">교 직 원</option>
		</select> <br />
	<input type = "submit" value = "정보 수정하기">
</form>
</body>
</html>