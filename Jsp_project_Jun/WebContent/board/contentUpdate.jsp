<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>게시글 수정</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="../assets/css/main.css" />
	</head>
	<body>
<%
int num = Integer.parseInt(request.getParameter("num"));
BoardDAO dao = new BoardDAO();
BoardDTO dto = dao.contentSelect(num);
%>
		<!-- Header -->
	<jsp:include page="../inc/top.jsp"></jsp:include>

		<!-- Main -->
			<section id="main" >
				<div class="inner">
				<header class="major special">
					<h1>게시글 수정</h1>
				</header>
				<section>
					<div class="table-wrapper">
					<form action="contentUpdatePro.jsp?num=<%=num%>" method="post">
						<table class="alt">
							<tbody>
								<tr>
									<td><b>제목</b></td>
									<td><input type="text" name="subject" value="<%=dto.getSubject()%>"></td>
									
								</tr>
									<td><b>작성자</b></td>
									<td><%=dto.getId()%></td>
								<tr>
									<td><b>내용</b></td>
									<td><textarea name="content" rows="10"><%=dto.getContent()%></textarea></td>
								</tr>
							</tbody>
							<tfoot>
								<tr>
									<td></td>
									<td><input type="submit" value="수정" style="float: right;"></td>
								</tr>
							</tfoot>
						</table>
						</form>
					</div>
				</section>
				
				
				</div>
			</section>

		<!-- Footer -->
			<jsp:include page="../inc/bottom.jsp"></jsp:include>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
</html>