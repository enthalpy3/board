
<%
	request.setCharacterEncoding("utf-8");
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
</head>
<body>
	<jsp:useBean id="board" class="board.BoardInfo" scope="page" />
	<jsp:setProperty property="*" name="board" />
	<jsp:useBean id="data" class="board.DataManager" scope="page" />
	<%
		String id = (String) session.getAttribute("ID");
		String rPath = request.getContextPath();
		if (id != null) {
			if (data.updateBoard(board) != 0) {
				out.print("<h3>수정에 성공하였습니다.</h3>");
				out.print("<h3><a href=\"" + rPath + "/user/my_list.jsp\">내글보기</a></h3>");
			} else {
				out.print("<h3> 수정에 실패하였습니다.</h3>");
				out.print("<h3><a href=\"" + rPath + "/user/board_info.jsp\">다시수정하기</a></h3>");
			}
		} else {
			response.sendRedirect(rPath + "/user/my_list.jsp");
		}
	%>

</body>
</html>