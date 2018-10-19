<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%@ page import="member.MemberInfo"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="data" class="member.DataManager" scope="session" />

	<h2>글을 작성할수 있습니다.</h2>
	<form action="<%=request.getContextPath()%>/user/board_reg.jsp"
		method="post">
		<table border=1>
			<tr>
				<th>닉네임</th>
				<%
					String nick = (String) session.getAttribute("ID");
					String rPath = request.getContextPath();
					if (nick != null) {
						MemberInfo member = data.getMember(nick);
						out.print("<th><input type=\"text\" name=\"nick\" value=\"" + member.getNick() + "\"></th>");
					}
				%>
			</tr>
			
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" value="제목없음" /></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><input type="text" name="text" /></td>
			</tr>
			<tr>
				<td colspan=2><input type="submit" value="저장" /> <input
					type="reset" value="다시작성" /></td>
			</tr>
		</table>
	</form>
	<a href="<%=request.getContextPath()%>/user/board_list2.jsp">전체글 보기</a>
	<br />
	<a href="<%=request.getContextPath()%>/user/my_list.jsp">내가쓴글 보기</a>
</body>
</html>