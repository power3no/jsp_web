<%@page import="board.Paging"%>
<%@page import="board.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>게시판</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="../assets/css/main.css" />
		<style>
			a {color:#000000}
		</style>

	</head>
	<body>
<%
int thisPage = 1;
if(request.getParameter("thisPage") !=null){
	thisPage = Integer.parseInt(request.getParameter("thisPage"));
}
BoardDAO dao = new BoardDAO();
ArrayList<BoardDTO> list = dao.boardSelect(1);
Paging p = new Paging(10, list, thisPage);

%>
		<!-- Header -->
	<jsp:include page="../inc/top.jsp"></jsp:include>

		<!-- Main -->
			<section id="main" >
				<div class="inner">
				<header class="major special">
					<h1>게시판</h1>
				</header>
				<section>
					<div class="table-wrapper">
						<table>
							<thead>
								<tr>
									<th style="width: 300px;">글번호</th>
									<th style="width: 700px;">글제목</th>
									<th>작성자</th>
									<th style="text-align: center;">조회수</th>
								</tr>
							</thead>
							<tbody>
<!-- 							페이지 수에 맞는 게시물 출력 -->
								<%
									for(int i = p.getStartContent(); i >= p.getEndContent(); i--){
										BoardDTO dto = list.get(i);
								%>							
								<tr>
									<td><%=i+1%></td>
									<td style="width: 700px;">
									<a href = "content.jsp?num=<%=dto.getNum()%>" ><%=dto.getSubject()%></a>
									</td>
									<td><%=dto.getId()%></td>
									<td style="text-align: center;"><%=dto.getViews()%></td>
								</tr>
								<%
									}
								%>
							</tbody>
							
							<tfoot>
								<tr>
									
									<td colspan="3" style="text-align: center;">
									<!-- 페이징 처리 -->
									<%
									if(5 < p.getStartPage()){
										%><a href = "board.jsp?thisPage=<%=p.getStartPage()-1%>">◀</a><%
									}
									for(int i = p.getStartPage(); i <= p.getEndPage(); i++){
									%>
									<a href = "board.jsp?thisPage=<%=i%>"><b><%=i%></b></a>									
									<%
									}
									if(p.getEndPage() < p.getMaxPage()){
										%><a href = "board.jsp?thisPage=<%=p.getStartPage()+5%>">▶</a><%
									}
									%>
									</td>
									<td>
									<%if(session.getAttribute("id")!=null) { %>
									<input type="button" value="글쓰기" onclick="location.href='write.jsp'"
									>
									<%}%>
									
									</td>
								</tr>
							</tfoot>
						</table>
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