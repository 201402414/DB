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
<form method = "post" action="Book_reg_check.jsp">
	ISBN : <input type = "text" name = "ISBN" maxlength = "20"> <br/>
	book name : <input type="text" name="book_name" maxlength="20"><br/>
	Author : <input type = "text" name = "author" maxlength = "20"> <br/>
	publisher : <input type = "text" name = "publisher" maxlength = "20"> <br/>
	<br/>
	<input type = "submit" value = "등록">
	  <input type="button" value="돌아가기"	onclick="location.href = 'Book_manage_form.jsp'">
</form>
</body>
</html>