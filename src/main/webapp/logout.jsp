<%@page import="java.sql.*"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그 아웃</title>
</head>
<body>
<h2>관리자 로그 아웃</h2>
<hr>
<%

	    // 세션이 존재하는 경우에만 세션 속성을 삭제하여 로그아웃합니다.
	    if(session != null) {
	        session.invalidate() ; // 세션 삭제 -> 로그아웃
	    }
	
%>

세션을 종료 후 로그 아웃을 수행하였습니다.<br>
그동안 수고 많으셨습니다.<br><br>
	<table border="0">
		<tr>
			<td>
				<form action="main.jsp">
					<input type="submit" value="메인 화면으로 이동 ▶">
				
				</form>


</body>
</html>