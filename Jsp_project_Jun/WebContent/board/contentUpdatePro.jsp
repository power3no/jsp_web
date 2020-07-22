<%@page import="board.BoardDAO"%>
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
int num = Integer.parseInt(request.getParameter("num"));

%>

<jsp:useBean id="dto" class="board.BoardDTO"/>
<jsp:setProperty property="*" name="dto"/>
<%
BoardDAO dao = new BoardDAO();
dao.contentUpdate(num, dto);
%>
<script type="text/javascript">
alert("수정 완료!");
location.href="content.jsp?num=<%=num%>";
</script>

</body>
</html>