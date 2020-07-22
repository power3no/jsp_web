<%@page import="board.BoardDTO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
String uploadPath = request.getRealPath("/upload");




System.out.println(uploadPath);
int maxSize = 10*1024*1024;
MultipartRequest multi = new MultipartRequest(request,uploadPath, maxSize, "utf-8", new DefaultFileRenamePolicy());


String id = (String)session.getAttribute("id");
String subject = multi.getParameter("subject");
String content = multi.getParameter("content");
String file = multi.getFilesystemName("file");	// 업로드 된 파일 이름
int value = Integer.parseInt(request.getParameter("page"));
String url = "";
if(value == 2){
	url = "imageBoard.jsp";
} else if(value == 3){
	url = "fileBoard.jsp";
}

BoardDTO dto = new BoardDTO();
dto.setId(id);
dto.setSubject(subject);
dto.setContent(content);
dto.setFile(file);

BoardDAO dao = new BoardDAO();
dao.boardWrite(value,dto);
%>

	<script type="text/javascript">
		alert("게시글이 등록되었습니다!");
		location.href = "<%=url%>";
	</script>
</body>
</html>