<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
			<header id="header">
				<div class="inner">
					<a href="../main/index.jsp" class="logo">JSP</a>
					<nav id="nav">
						<a href="../main/index.jsp">Home</a>
						<a href="../board/board.jsp">게시판</a>
						<a href="../board/imageBoard.jsp">이미지 게시판</a>
						<a href="../board/fileBoard.jsp">자료실</a>
						<%
						if(session.getAttribute("id") != null){
							if(session.getAttribute("id").equals("admin")){%>
							<a href="../admin/adminPage.jsp">관리자페이지</a>
						<%}
						%>
							<a href="../member/myInfo.jsp">내 정보(<%=session.getAttribute("id")%>)</a>
							<a href="../member/logout.jsp">로그아웃</a>
						<%
						}
						else {
						%>
						<a href="../member/login.jsp">로그인</a>
						<a href="../member/signup.jsp">회원가입</a>
						<%	
						}
						%>
					</nav>
				</div>
			</header>
			<a href="#menu" class="navPanelToggle"><span class="fa fa-bars"></span></a>