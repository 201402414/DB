<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>

<% request.setCharacterEncoding("euc-kr"); %>

<%   //   �Ķ���� ���� ���� �κ�
   String id = request.getParameter("id");
   String pw = request.getParameter("pw");
     
   Connection conn = null;
   PreparedStatement pstmt = null;
   String str = "";
   
   try{
      String jdbcUrl = "jdbc:mysql://localhost:3306/db_term";
      String dbId = "root";
      String dbPass = "whslepq1";
      
      //   DB�� ������ ���� Connection ��ü�� ���� �κ�
      Class.forName("com.mysql.jdbc.Driver");
      conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
      
      //   ������ �����ϴ� �κ�
      String sql = "delete from db_term.member where id = ?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, id);
      pstmt.executeUpdate();
      
      //   ���� ������ ����Ǵ� ����
      str = "ȸ������ ���� ����!";
   }catch(Exception e) {
      e.printStackTrace();
      str = "ȸ������ ���� ����";
	  
   }finally {
      if(pstmt != null) try{pstmt.close();}catch(SQLException sqle) {}
      if(conn != null) try{conn.close();}catch(SQLException sqle) {}
   }

%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ������</title>
</head>
<body>
	<%=str %><br>
   <input type = "button" value = "���ư���" onclick = "location.href='TermMain.jsp'">
</body>
</html>