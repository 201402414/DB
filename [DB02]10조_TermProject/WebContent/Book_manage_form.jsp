<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>book manage page</title>
</head>
<body>
	<H1>도서 관리 메뉴</H1>

	<input type="button" value="도서 등록" onclick="location.href = 'Book_reg_form.jsp'">
	<input type="button" value="도서 수정"	onclick="location.href = 'Book_modi_form.jsp'">
	<input type="button" value="도서 삭제"	onclick="location.href = 'Book_del_form.jsp'"><br><br>
	<input type="button" value="회원 정보 수정"	onclick="location.href = 'Admin_change_mem.jsp'">
	<input type="button" value="회원 탈퇴"	onclick="location.href = 'Admin_remove_mem.jsp'">
</body>
</html>