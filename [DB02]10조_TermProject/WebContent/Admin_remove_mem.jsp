<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin_remove_mem</title>
</head>
<body>
   <H1>관리자 </H1>
   <H2>회원 정보 삭제</H2>
   <table width="100%" border="1">
      <tr>
         <td>id</td>
         <td>pwd</td>
         <td>이름</td>
         <td>이메일</td>
         <td>전화번호</td>
         <td>소속</td>
      </tr>
      <%
         Connection conn = null;
         PreparedStatement pstmt = null;
         ResultSet rs = null;
         String str = "";
         String mem = "";

         try {
            String jdbcUrl = "jdbc:mysql://localhost:3306/db_term";
            String dbId = "root";
            String dbPass = "whslepq1";

            //   DB와 연동을 위한 Connection 객체를 얻어내는 부분
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);

            mem = "SELECT * FROM db_term.member";
            pstmt = conn.prepareStatement(mem);
            rs = pstmt.executeQuery();
            while (rs.next()) {
      %>
      <tr>
         <td><%=rs.getString("id")%></td>
         <td><%=rs.getString("pw")%></td>
         <td><%=rs.getString("user_name")%></td>
         <td><%=rs.getString("email")%></td>
         <td><%=rs.getString("tel")%></td>
         <td><%=rs.getString("category")%></td>
      </tr>
      <%
         }
         } catch (SQLException ex) {
            out.println(ex.getMessage());
            ex.printStackTrace();
         } finally {
            // 6. 사용한 Statement 종료
            if (rs != null)
               try {
                  rs.close();
               } catch (SQLException ex) {
               }
            if (pstmt != null)
               try {
                  pstmt.close();
               } catch (SQLException ex) {
               }

            // 7. 커넥션 종료
            if (conn != null)
               try {
                  conn.close();
               } catch (SQLException ex) {
               }
         }
      %>
   </table>
<form method = "post" action="Admin_remove_check.jsp">
	ID : <input type = "text" name = "id" maxlength = "10"> <br/>
	Password : <input type="password" name="pw" maxlength="10"><br/>
	<br/>
	<input type = "submit" value = "탈퇴하기">
	  <input type="button" value="돌아가기"	onclick="location.href = 'Book_manage_form.jsp'">
</form>
</body>
</html>