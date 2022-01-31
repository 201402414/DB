<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>

<% request.setCharacterEncoding("euc-kr"); %>

<%   //   �Ķ���� ���� ���� �κ�
   String ISBN = request.getParameter("ISBN");
   String date = request.getParameter("date");
   
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
      String sql = "insert into book_manage values(?, ?, ?)";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, ISBN);
      pstmt.setString(2, "false");
      pstmt.setString(3, date);
 		
      pstmt.executeUpdate();
      
      //   ���� ������ ����Ǵ� ����
      str = "���� �뿩 �Ϸ�";
   }catch(Exception e) {
      e.printStackTrace();
      str = "�̹� �뿩���� �����Դϴ�.";
   }finally {
      if(pstmt != null) try{pstmt.close();}catch(SQLException sqle) {}
      if(conn != null) try{conn.close();}catch(SQLException sqle) {}
   }

%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� �뿩</title>
</head>
<body>
	<%=str %>
	<br>
   <input type = "button" value = "���ư���" onclick = "location.href='Libary.jsp'">
</body>
</html>