<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>drawCheck.jsp</title>
</head>
<body>

	<%
		request.setCharacterEncoding("utf-8");
	
		String uid = request.getParameter("userID");
		//String upw = request.getParameter("userPW");
		//String uemail = request.getParameter("userEmail");
		
		String sql = "DELETE FROM members WHERE id = ?";

		String driverName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/jsp_projectdb";
		String username = "root";
		String password = "12345";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driverName); // jdbc 드라이버 불러오기
			conn = DriverManager.getConnection(url, username, password);
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, uid);
			//pstmt.setString(2, upw);
			//pstmt.setString(3, uemail);
			
			int success = pstmt.executeUpdate();  //sql문 실행(1이반환되면 성공 0이 반환되면 실패)
			
			if(success == 1) { // 조건이 참이면 sql문 실행 성공
				//out.print("회원 가입 성공!");
				response.sendRedirect("drawSuccess.jsp");
				
			} else { //조건이 거짓이므로 sql문 실행 실패
				//out.print("회원 가입 실패!");
				response.sendRedirect("drawErr.jsp");
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
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

</body>
</html>