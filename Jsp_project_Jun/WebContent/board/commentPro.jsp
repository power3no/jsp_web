<%@page import="board.CommentDAO"%>
<%@page import="board.BoardDAO"%>
<%@page import="board.CommentDTO"%>
<%@page import="board.BoardDTO"%>
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
request.setCharacterEncoding("UTF-8");
CommentDTO dto = new CommentDTO();
int type = Integer.parseInt(request.getParameter("type"));
dto.setType(type);
dto.setNum(Integer.parseInt(request.getParameter("num")));
dto.setId((String)session.getAttribute("id"));
dto.setContent(request.getParameter("comment"));
CommentDAO dao = new CommentDAO();
dao.commentInsert(dto);

switch(type){
case 1:
	response.sendRedirect("content.jsp?num="+dto.getNum());
	break;
case 2:
	response.sendRedirect("imageContent.jsp?num="+dto.getNum());
	break;
case 3:
	response.sendRedirect("fileContent.jsp?num="+dto.getNum());
	break;
}
%>

</body>
</html>