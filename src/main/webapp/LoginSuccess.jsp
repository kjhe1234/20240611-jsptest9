<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		
		String adminID = request.getParameter("adminID");
		String adminPW = request.getParameter("adminPW");
		
		String sql = "SELECT * FROM members WHERE id= ? AND passwd=?";
	
		String driverName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/jsp_projectdb";
		String username = "root";
		String password = "12345";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driverName); // jdbc 드라이버 불러오기
			conn = DriverManager.getConnection(url, username, password);
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, adminID);
			pstmt.setString(2, adminPW);

			//int success = pstmt.executeUpdate();
			rs = pstmt.executeQuery();
			
			if(rs.next() && adminID.equals("space") && adminPW.equals("123456")) {  // 참이면 로그인 성공 -> rs내에 반환되어진 레코드가 1개 존재
				session.setAttribute("adminID", adminID);
			} else { // 로그인 실패 -> rs내에 반환되어진 레코드가 0개
				response.sendRedirect("loginErr.jsp");
			}
		
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null){
					rs.close();
				}
				if(pstmt != null) {
					pstmt.close();
				}
				if(conn != null){
					conn.close();
				}
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		
	%>
	<h2>관리자 로그인</h2>
	<hr>
	새로운 세션 성공!<br>
	관리자 [<%= adminID %>]님이 로그인 하셨습니다.<br>
	<table border="0">
		<tr>
			<td>
				<form action="memberlist.jsp">
					<input type="submit" value="◀ 등록회원 관리하기">
				
				</form>
			
			</td>
			<td>
				<form action="logout.jsp">
					<input type="submit" value="로그 아웃▶">
				
				</form>
			
			</td>
	
		</tr>
	</table>
	
	

</body>
</html>