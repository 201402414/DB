<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>remove_mem</title>
</head>
<body>
<H1>회원탈퇴</H1>
<form method = "post" action="remove_mem_check.jsp">
	ID : <input type = "text" name = "id" maxlength = "10"> <br/>
	Password : <input type="password" name="pw" maxlength="10"><br/>
	<br/>
	<input type = "submit" value = "탈퇴하기">
</form>
</body>
</html>