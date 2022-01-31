<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서검색</title>
</head>
<body>
<H1>도서 검색</H1>
<form method = "post" action="search_check.jsp">
   book name : <input type="text" name="book_name" maxlength="20"><br/>
   <br/>
   <input type = "submit" value = "검색">
   <input type = "button" value = "돌아가기" onclick="location.href = 'Libary.jsp'">
</form>
</body>
</html>