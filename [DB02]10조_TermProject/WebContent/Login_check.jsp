<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.sql.Statement"%>
<%
	request.setCharacterEncoding("euc-kr");
%>

<%
	//   파라미터 값을 얻어내는 부분
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	Timestamp register = new Timestamp(System.currentTimeMillis()); //   현재의 날짜와 시간을 얻는다.

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String getid = "";
	String getpw = "";
	String str = "";
	String mem = "";
	String temp = "";
	boolean is_right = false;

	try {
		String jdbcUrl = "jdbc:mysql://localhost:3306/db_term";
		String dbId = "root";
		String dbPass = "whslepq1";
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);

		temp = "SELECT * FROM db_term.id";
		pstmt = conn.prepareStatement(temp);
		rs = pstmt.executeQuery();
		//   DB와 연동을 위한 Connection 객체를 얻어내는 부분

		/*
		while (rs.next()) {
			getid = rs.getString("id");
			if(getid == null){
				String sql = "insert into id values(?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.executeUpdate();
				break;
			}else{
				String sql = "update db_term.id set id =? where id = ?";
			    pstmt = conn.prepareStatement(sql);
			    pstmt.setString(1, id);
			    pstmt.setString(2, getid);
			    break;
			}
			
		}*/

		mem = "SELECT * FROM db_term.member";
		pstmt = conn.prepareStatement(mem);
		rs = pstmt.executeQuery();

		while (rs.next()) {
			getid = rs.getString("id");
			getpw = rs.getString("pw");

			if (id.equals(getid) && pw.equals(getpw)) {
				is_right = true;
				break;
			} else {

			}
		}

		if (is_right == true) {
%>
로그인 성공!
<br>
<input type="button" value="도서관 입장"
	onclick="location.href = 'Libary.jsp'">
<%
	} else {
%>
로그인 실패!
<br>
<input type="button" value="다시 로그인 하기"
	onclick="location.href = 'Login_form.jsp'">
<%
	}

		//   쿼리 성공시 수행되는 문장

	} catch (Exception e) {
		e.printStackTrace();
%>
로그인 실패!
<br>
<input type="button" value="다시 로그인 하기"
	onclick="location.href = 'Login_form.jsp'">
<%
	} finally {
		if (pstmt != null)
			try {
				pstmt.close();
			} catch (SQLException sqle) {
			}
		if (conn != null)
			try {
				conn.close();
			} catch (SQLException sqle) {
			}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login_check</title>
</head>
<body>
	<%=str%>

</body>
</html>