<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체글 보기</title>
</head>
<body>
	<table border=2>
		<tr>
			<th>닉네임</th>
			<th>제목</th>
			<th>내용</th>
			<th>글쓴 날짜</th>
		</tr>
		<%
			Connection con = null;
			Statement stmt = null;
			ResultSet rs = null;
			String url = "jdbc:mysql://localhost:3306/my_site?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
			String user = "root";
			String pw = "zxcv1234";

			try {
				// mysqlbd 주소
				// Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
				// mariadb 주소
				Class.forName("org.mariadb.jdbc.Driver");
				con = DriverManager.getConnection(url, user, pw);
				stmt = con.createStatement();
				rs = stmt.executeQuery("select * from board ORDER BY reg_date DESC");
				while (rs.next()) {
					out.print("<tr>");
					out.print("<td>" + rs.getString("nick") + "</td>");
					out.print("<td>" + rs.getString("title") + "</td>");
					out.print("<td>" + rs.getString("text") + "</td>");
					out.print("<td>" + rs.getString("reg_date") + "</td>");
					out.print("</tr>");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		%>
		</table>
		<br />
		<a href="<%=request.getContextPath()%>/user/logout.jsp">로그아웃</a>
		<a href="<%=request.getContextPath()%>/user/board_form.jsp">글쓰기</a>
		<a href="<%=request.getContextPath()%>/user/member_info.jsp">내정보 보기</a>
		<a href="<%=request.getContextPath()%>/user/my_list.jsp">내가쓴글 보기</a>
</body>
</html>