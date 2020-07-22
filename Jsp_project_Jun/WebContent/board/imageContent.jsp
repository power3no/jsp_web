<%@page import="board.CommentDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.CommentDTO"%>
<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>이미지 게시글</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="../assets/css/main.css" />
	</head>
	<body>
<%
int num = Integer.parseInt(request.getParameter("num"));
BoardDAO dao = new BoardDAO();
dao.contentViews(num);
BoardDTO dto = dao.contentSelect(num);
CommentDAO cdao = new CommentDAO();
ArrayList<CommentDTO> list = cdao.commentSelect(2, num);
%>
		<!-- Header -->
	<jsp:include page="../inc/top.jsp"></jsp:include>

		<!-- Main -->
			<section id="main" >
				<div class="inner">
				<header class="major special">
					<h1>이미지 게시글</h1>
				</header>
				<section>
					<div class="table-wrapper">
					<form action="contentUpdate.jsp?num=<%=num%>" method="post">
						<table class="alt">
							<tbody>
								<tr>
									<td style="width: 100px;"><b>제목</b></td>
									<td style="width: 500px;" ><%=dto.getSubject() %></td>
									<td style="width: 100px;">조회수</td>
									<td style="width: 350px;"><%=dto.getViews()%></td>
								</tr>
								<tr>
									<td><b>글쓴이</b></td>
									<td><%=dto.getId()%></td>
									<td><b>작성일</b></td>
									<td><%=dto.getDate()%></td>
								</tr>
								<tr>
									<td><b>첨부파일</b></td>
									
									<td colspan="3"><%if(dto.getFile()!=null) {%><a href="fileDown.jsp?file_name=<%=dto.getFile()%>"><%=dto.getFile()%></a><%} %></td>
								</tr>
								<tr>
									<td><b>내용</b></td>
									<td colspan="3">
									<%if(dto.getFile()!=null) {%>
									<img src="<%=request.getContextPath()%>/images/<%=dto.getFile()%>" 
									width="500" height="500"><%} %>
									<%=dto.getContent()%></td>
								</tr>
							</tbody>
							<tfoot>
								<tr>
									<td colspan="3"></td>
									
									<td style="float: right;">
									<input type="button" onclick="location.href='imageBoard.jsp'" value="목록">
									<%
									if(session.getAttribute("id")!=null){
									if(session.getAttribute("id").equals(dto.getId())){
									%>
									<input type="submit" value="수정">
									<input type="button" onclick="location.href='delete.jsp?num=<%=num %>&value=2'" value="삭제"><%										
									}}
									%>
									</td>
								</tr>
							</tfoot>
						</table>
						</form>
						<%
						if(session.getAttribute("id")!=null){
						%>
						<form method="post" action="../board/commentPro.jsp?num=<%=request.getParameter("num")%>">
						<input type="hidden" name="type" value="2">
						<div class="table-wrapper">
							<table>
							<thead>
							</thead>
							<tbody>
								
								<%
									if(list != null){
										for(int i = 0; i < list.size(); i++){
											CommentDTO cdto = list.get(i);
											%>
											<tr>
											<td><b><%=cdto.getId()%></b></td>
											<td><%=cdto.getContent()%></td>
											<td><%=cdto.getDate()%></td>
											</tr>
											<%
										}
									}
								%>
								
							</tbody>
							<tfoot>
								<tr>
									<td ><label for="message"><%=session.getAttribute("id") %></label></td>
									<td>
										<div class="field">
											<textarea name="comment" rows="2" ></textarea>
										</div>
									</td>
									<td><input type="submit" value="댓글등록" class="alt" /></td>
								</tr>
							</tfoot>
							</table>
							</div>
							</form>
							<%}%>
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