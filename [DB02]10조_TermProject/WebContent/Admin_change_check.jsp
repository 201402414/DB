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
      String sql = "update db_term.member set pw =?, user_name = ?, email = ?, tel = ?, category = ? where id = ?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, pw);
      pstmt.setString(2, name);
      pstmt.setString(3, email);
      pstmt.setString(4, tel);
      pstmt.setString(5, category);
      pstmt.setString(6, id);
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
<title>������ ȸ�� ����</title>
</head>
<body>
   <%=str %><br>
   <input type = "button" value = "���ư���" onclick = "location.href='Book_manage_form.jsp'">
</body>
</html>