<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글작성</title>
</head>
<body>
	<jsp:useBean id="board" class="board.BoardInfo" scope="page" />
	<jsp:setProperty name="board" property="*" />
	<jsp:useBean id="data" class="board.DataManager" scope="page" />
	<%
		String rPath = request.getContextPath();
		
			if (data.insertBoard(board) != 0) {
				out.print("<h3>게시글을 작성하였습니다..</h3>");
				out.print("<h3><a href=\"" + rPath + "/user/board_form.jsp\">글 작성하기</a></h3>");
				out.print("<h3><a href=\"" + rPath + "/user/board_list2.jsp\">게시된 글 보기</a></h3>");
			} else {
				out.print("<h3>글작성에 실패하였습니다. 잠시 후 다시 시도해 주세요.</h3>");
				out.print("<h3><a href=\"" + rPath + "/user/board_list2.jsp\">게시글</a></h3>");
			}
		
	%>
</body>
</html>