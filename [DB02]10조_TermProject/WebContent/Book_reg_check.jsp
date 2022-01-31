<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>

<% request.setCharacterEncoding("euc-kr"); %>

<%   //   �Ķ���� ���� ���� �κ�
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
      
      //   DB�� ������ ���� Connection ��ü�� ���� �κ�
      Class.forName("com.mysql.jdbc.Driver");
      conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
      
      //   ������ �����ϴ� �κ�
      String sql = "insert into book values(?, ?, ?, ?)";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, ISBN);
      pstmt.setString(2, book_name);
      pstmt.setString(3, author);
      pstmt.setString(4, publisher);
 
      pstmt.executeUpdate();
      
      //   ���� ������ ����Ǵ� ����
      str = "���� ��� �Ϸ�";
   }catch(Exception e) {
      e.printStackTrace();
      str = "���� ��� ����";
   }finally {
      if(pstmt != null) try{pstmt.close();}catch(SQLException sqle) {}
      if(conn != null) try{conn.close();}catch(SQLException sqle) {}
   }

%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� ���</title>
</head>
<body>
   <%=str %>
   <input type = "button" value = "���ư���" onclick = "location.href='Book_manage_form.jsp'">
</body>
</html>