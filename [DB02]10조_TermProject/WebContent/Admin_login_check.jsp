<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.Statement" %>
<% request.setCharacterEncoding("euc-kr"); %>

<%   //   파라미터 값을 얻어내는 부분
   String m_num = request.getParameter("m_num");
   String m_name = request.getParameter("m_name");
   String m_pw = request.getParameter("m_pw");
   Timestamp register = new Timestamp(System.currentTimeMillis());   //   현재의 날짜와 시간을 얻는다.
   
   Connection conn = null;
   PreparedStatement pstmt = null;
   ResultSet rs  = null;
   String getnum = "";
   String getname = "";
   String getpw = "";
   String str = "";
   String mem = "";
   boolean is_right = false;
   
   try{
      String jdbcUrl = "jdbc:mysql://localhost:3306/db_term";
      String dbId = "root";
      String dbPass = "whslepq1";
      
      //   DB와 연동을 위한 Connection 객체를 얻어내는 부분
      Class.forName("com.mysql.jdbc.Driver");
      conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
      
      mem = "SELECT * FROM db_term.manager";
      pstmt = conn.prepareStatement(mem);
      rs = pstmt.executeQuery();
     
      while(rs.next()){
          getnum = rs.getString("m_num");
          getpw = rs.getString("m_pw");
	      getname = rs.getString("m_name");
          if(m_num.equals(getnum) &&m_name.equals(getname) &&m_pw.equals(getpw)){
        	is_right = true;
        	break;
          }else{
        	  
          }
      }
      
      if(is_right == true){
    	  %>
    	  로그인 성공!<br>
    	  <input type="button" value="관리자 페이지 가기"	onclick="location.href = 'Book_manage_form.jsp'">
    	  <%
    	  
      }else{
    	  %>
    	  로그인 실패!<br>
    	   <input type="button" value="다시 로그인 하기"	onclick="location.href = 'Login_form.jsp'">
    	  <%
      }
      
      //   쿼리 성공시 수행되는 문장
   
   }catch(Exception e) {
      e.printStackTrace();
      str = "회원가입 실패";
   }finally {
      if(pstmt != null) try{pstmt.close();}catch(SQLException sqle) {}
      if(conn != null) try{conn.close();}catch(SQLException sqle) {}
   }

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login_check</title>
</head>
<body>
	<%=str %>
	
</body>
</html>