<%@page import="board.Paging"%>
<%@page import="board.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>이미지 게시판</title>
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
ArrayList<BoardDTO> list = dao.boardSelect(2);
Paging p = new Paging(9, list, thisPage);

%>
		<!-- Header -->
	<jsp:include page="../inc/top.jsp"></jsp:include>

		<!-- Main -->
			<section id="main" >
				<div class="inner">
				<header class="major special">
					<h1>이미지 게시판</h1>
				</header>
				<section>
					<div class="table-wrapper">
							<section>
							<div class="box alt">
								<div class="row 50% uniform">
									<%int count = 0;
									for(int i = p.getStartContent(); i >= p.getEndContent(); i--){
										BoardDTO dto = list.get(i); 
										count++;
										if(count%3 != 0){%>
										<div class="4u">
										<%} else{
											%><div class="4u$"><%
										}
										%>
									<span class="image fit">
									<a href = "imageContent.jsp?num=<%=dto.getNum()%>" >
									<img src="<%=request.getContextPath()%>/images/<%=dto.getFile()%>" />
									<%=dto.getSubject()%> <b style="float: right;">views : <%=dto.getViews() %></b> <br>
									<code><%=dto.getId() %></code>
									</a>
									</span></div>	
									<%
									}	
									%>
									
								</div>
							</div>
							</div>
							</section>
<!-- 							페이지 수에 맞는 게시물 출력 -->
							
									<!-- 페이징 처리 -->
									<div style="text-align: center;">
									<%
									if(5 < p.getStartPage()){
										%><a href = "imageBoard.jsp?thisPage=<%=p.getStartPage()-1%>">◀</a><%
									}
									for(int i = p.getStartPage(); i <= p.getEndPage(); i++){
									%>
									<a href = "imageBoard.jsp?thisPage=<%=i%>"><b><%=i%></b></a>									
									<%
									}
									if(p.getEndPage() < p.getMaxPage()){
										%><a href = "imageBoard.jsp?thisPage=<%=p.getStartPage()+5%>">▶</a><%
									}
									%>
									</div>
									<%if(session.getAttribute("id")!=null) { %>
									<input type="button" value="글쓰기" style="float: right;" onclick="location.href='imageWrite.jsp'"
									><br>
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