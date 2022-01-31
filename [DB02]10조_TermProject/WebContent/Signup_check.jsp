<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>

<% request.setCharacterEncoding("euc-kr"); %>

<%   //   �Ķ���� ���� ���� �κ�
   String id = request.getParameter("id");
   String pw = request.getParameter("pw");
   String name = request.getParameter("user_name");
   String email = request.getParameter("email");
   String tel = request.getParameter("tel");
   String category = request.getParameter("title");
   Timestamp register = new Timestamp(System.currentTimeMillis());   //   ������ ��¥�� �ð��� ��´�.
   
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
      String sql = "insert into member values(?, ?, ?, ?, ?, ?)";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, id);
      pstmt.setString(2, pw);
      pstmt.setString(3, name);
      pstmt.setString(4, email);
      pstmt.setString(5, tel);
      pstmt.setString(6, category);
      pstmt.executeUpdate();
      
      //   ���� ������ ����Ǵ� ����
      str = "ȸ������ �Ϸ�!";
   }catch(Exception e) {
      e.printStackTrace();
      str = "ȸ������ ���� �̹� �����ϴ� ���̵�";
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
   <%=str %>
   <input type = "button" value = "���ư���" onclick = "location.href='TermMain.jsp'">
</body>
</html>