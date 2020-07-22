<%@page import="board.BoardDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.time.LocalDateTime"%>
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
String id = (String)session.getAttribute("id");

%>
<jsp:useBean id="dto" class="board.BoardDTO"/>
<jsp:setProperty property="*" name="dto"/>
<%
dto.setId(id);
BoardDAO dao = new BoardDAO();
dao.boardWrite(1,dto);
%>

<script type="text/javascript">
alert("게시글이 등록되었습니다!");
location.href="board.jsp";
</script>
</body>
</html>