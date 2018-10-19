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
<title>글삭제</title>
</head>
<body>
	<jsp:useBean id="data" class="board.DataManager" scope="page" />
	<%
		String id = (String) session.getAttribute("ID");
		String rPath = request.getContextPath();
		
		if (id != null) {
			if (data.removeBoard(id) != 0) {
				out.print("<h3>삭제하였습니다.</h3>");
				session.invalidate();
				out.print("<h3><a href=\"" + rPath + "/user/my_list.jsp\">내 리스트로 돌아가기</a></h3>");
			} else {
				out.print("<h3>삭제하지 못했습니다.</h3>");
				out.print("<h3><a href=\"" + rPath + "/user/board_info.jsp\">수정 화면으로 돌아가기</a></h3>");
			}
		} else {
			out.print("<h3>로그인 필요합니다.</h3>");
			response.sendRedirect(request.getContextPath() + "/index.jsp");
		}
	%>
</body>
</html>