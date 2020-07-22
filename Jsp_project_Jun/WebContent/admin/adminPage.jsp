<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--
	Introspect by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
	<head>
		<title>관리자 페이지</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="../assets/css/main.css" />
	</head>
	<body>
<%
if(session.getAttribute("id")==null || !session.getAttribute("id").equals("admin")){
	response.sendRedirect("../main/index.jsp");
}
%>

		<!-- Header -->
		<jsp:include page="../inc/top.jsp"/>

		<!-- Main -->
			<section id="main" >
				<div class="inner">
					<header class="major special">
						<h1>회원에게 이메일 보내기</h1>
					</header>
					<div class="inner">
					<form method="post" action="emailSend.jsp">
						<div class="field half first">
							<label for="name">Subject</label>
							<input type="text" name="subject"/>
						</div>
						<div class="field half">
							<label for="email">Email</label>
							<input type="text" name="email" placeholder="모든 회원에게 보내기 * 입력"/>
						</div>
							<label for="message">Message</label>
						<div class="field">
							<textarea name="message" rows="6"></textarea>
						</div>
						<ul class="actions">
							<li><input type="submit" value="Send Message" class="alt" /></li>
						</ul>
					</form>
				</div>
				</div>
			</section>

		<!-- Footer -->
			<jsp:include page="../inc/bottom.jsp"/>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
</html>