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
      String sql = "update db_term.member set pw =?, user_name = ?, email = ?, tel = ?, category = ? where id = ?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, pw);
      pstmt.setString(2, name);
      pstmt.setString(3, email);
      pstmt.setString(4, tel);
      pstmt.setString(5, category);
      pstmt.setString(6, id);
      pstmt.executeUpdate();
      
      //   쿼리 성공시 수행되는 문장
      str = "회원정보 수정 성공!";
   }catch(Exception e) {
      e.printStackTrace();
      str = "회원정보 수정 실패";
     
   }finally {
      if(pstmt != null) try{pstmt.close();}catch(SQLException sqle) {}
      if(conn != null) try{conn.close();}catch(SQLException sqle) {}
   }

%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>관리자 회원 수정</title>
</head>
<body>
   <%=str %><br>
   <input type = "button" value = "돌아가기" onclick = "location.href='Book_manage_form.jsp'">
</body>
</html>