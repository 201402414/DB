<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login_form</title>
</head>
<body>
   <H1>도서 목록 수정</H1>
   <table width="100%" border="1">
      <tr>
         <td>ISBN</td>
         <td>책제목</td>
         <td>저자</td>
         <td>출판사</td>
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

            mem = "SELECT * FROM db_term.book";
            pstmt = conn.prepareStatement(mem);
            rs = pstmt.executeQuery();
            while (rs.next()) {
      %>
      <tr>
         <td><%=rs.getString("ISBN")%></td>
         <td><%=rs.getString("book_name")%></td>
         <td><%=rs.getString("author")%></td>
         <td><%=rs.getString("publisher")%></td>
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
      <form method="post" action="Book_modi_check.jsp">
      <br/><br/>
          수정을 원하는 책의 ISBN : <input type="text" name="ISBN" maxlength="20"> <br />
         ISBN : <input type="text" name="ISBN_" maxlength="20"> <br />
         제목 : <input type="text" name="book_name" maxlength="20"> <br />
         저자 : <input type="text" name="author" maxlength="20"> <br />
         출판사 : <input type="text" name="publisher" maxlength="20"> <br />
         <br /> <input type="submit" value="수정">
         <input type="button" value="돌아가기"	onclick="location.href = 'Book_manage_form.jsp'">
      </form>
</body>
</html>