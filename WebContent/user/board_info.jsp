<%@page import="member.MemberInfo"%>
<%@page import="board.BoardInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>게시글</title>
</head>
<body>
	<jsp:useBean id="data" class="member.DataManager" scope="page" />
	<%
		String id = (String) session.getAttribute("ID");
		String rPath = request.getContextPath();
		if (id != null) {
			MemberInfo member = data.getMember(id);
			out.print("<form action=\"" + rPath + "/user/board_update.jsp\" method=\"post\">");
			out.print("<table>");
			out.print("<tr><th colspan=2>게시글</th></tr>");
			out.print("<tr><td>닉네임</td><td><input type=\"text\" name=\"nick\" value=\"" + member.getNick()
					+ "\"></td></tr>");
			out.print("<tr><td>제목</td><td><input type=\"text\" name=\"title\" value=\"" + member.getTitle()
					+ "\"></td></tr>");
			out.print("<tr><td>내용</td><td><input type=\"text\" name=\"text\" value=\"" + member.getText()
					+ "\"></td></tr>");
			out.print("<tr><td>작성날짜</td><td>" + member.getReg_date() + "</td></tr>");
			out.print("<tr><td solspan=2><input type=\"submit\" value=\"수정\"></td></tr>");
			out.print("</table>");
			out.print("</form>");
		} else {
			response.sendRedirect(rPath + "/my_list.jsp");
		}
	%>
	<a href="<%=request.getContextPath()%>/user/logout.jsp">로그아웃</a>
	<br />
	<a href="<%=request.getContextPath()%>/user/board_delete.jsp?=<%=id%>">글삭제</a>
	<br />
	<a href="<%=request.getContextPath()%>/user/board_form.jsp">글쓰기</a>
	<br />
	<a href="<%=request.getContextPath()%>/user/my_list.jsp">내가쓴글 보기</a>
</body>
</html>