<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>

<% request.setCharacterEncoding("euc-kr"); %>

<%   //   파라미터 값을 얻어내는 부분
   String ISBN = request.getParameter("ISBN");
   String book_name = request.getParameter("book_name");
   String author = request.getParameter("author");
   String publisher = request.getParameter("publisher");

  
   
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
      String sql = "insert into book values(?, ?, ?, ?)";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, ISBN);
      pstmt.setString(2, book_name);
      pstmt.setString(3, author);
      pstmt.setString(4, publisher);
 
      pstmt.executeUpdate();
      
      //   쿼리 성공시 수행되는 문장
      str = "도서 등록 완료";
   }catch(Exception e) {
      e.printStackTrace();
      str = "도서 등록 실패";
   }finally {
      if(pstmt != null) try{pstmt.close();}catch(SQLException sqle) {}
      if(conn != null) try{conn.close();}catch(SQLException sqle) {}
   }

%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>도서 등록</title>
</head>
<body>
   <%=str %>
   <input type = "button" value = "돌아가기" onclick = "location.href='Book_manage_form.jsp'">
</body>
</html>