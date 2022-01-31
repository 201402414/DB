<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>

<% request.setCharacterEncoding("euc-kr"); %>

<%   //   파라미터 값을 얻어내는 부분
   String ISBN = request.getParameter("ISBN");

     
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
      String sql = "delete from db_term.book where ISBN = ?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, ISBN);
      pstmt.executeUpdate();
      
      //   쿼리 성공시 수행되는 문장
      str = "도서정보 삭제 성공!";
   }catch(Exception e) {
      e.printStackTrace();
      str = "도서정보 삭제 실패";
     
   }finally {
      if(pstmt != null) try{pstmt.close();}catch(SQLException sqle) {}
      if(conn != null) try{conn.close();}catch(SQLException sqle) {}
   }

%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>도서 삭제</title>
</head>
<body>
   <%=str %><br>
   <input type = "button" value = "돌아가기" onclick = "location.href='Book_manage_form.jsp'">
</body>
</html>