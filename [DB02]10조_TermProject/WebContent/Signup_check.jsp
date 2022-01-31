<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>

<% request.setCharacterEncoding("euc-kr"); %>

<%   //   파라미터 값을 얻어내는 부분
   String id = request.getParameter("id");
   String pw = request.getParameter("pw");
   String name = request.getParameter("user_name");
   String email = request.getParameter("email");
   String tel = request.getParameter("tel");
   String category = request.getParameter("title");
   Timestamp register = new Timestamp(System.currentTimeMillis());   //   현재의 날짜와 시간을 얻는다.
   
   Connection conn = null;
   PreparedStatement pstmt = null;
   String str = "";
   
   try{
      String jdbcUrl = "jdbc:mysql://localhost:3306/db_term";
      String dbId = "root";
      String dbPass = "whslepq1";
      
      //   DB와 연동을 위한 Connection 객체를 얻어내는 부분
      Class.forName("com.mysql.jdbc.Driver");
      conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
      
      //   쿼리를 수행하는 부분
      String sql = "insert into member values(?, ?, ?, ?, ?, ?)";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, id);
      pstmt.setString(2, pw);
      pstmt.setString(3, name);
      pstmt.setString(4, email);
      pstmt.setString(5, tel);
      pstmt.setString(6, category);
      pstmt.executeUpdate();
      
      //   쿼리 성공시 수행되는 문장
      str = "회원가입 완료!";
   }catch(Exception e) {
      e.printStackTrace();
      str = "회원가입 실패 이미 존재하는 아이디";
   }finally {
      if(pstmt != null) try{pstmt.close();}catch(SQLException sqle) {}
      if(conn != null) try{conn.close();}catch(SQLException sqle) {}
   }

%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원가입</title>
</head>
<body>
   <%=str %>
   <input type = "button" value = "돌아가기" onclick = "location.href='TermMain.jsp'">
</body>
</html>