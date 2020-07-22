<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>로그인</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="../assets/css/main.css" />
	</head>
	<body>

		<!-- Header -->
	<jsp:include page="../inc/top.jsp"></jsp:include>

		<!-- Main -->
			<section id="main" >
				<div class="inner">
					<header class="major special">
					<h1>로그인</h1>
					</header>
					<section>
						<form method="post" action="loginPro.jsp" >
							<div class="row uniform 50%">
								<div class="6u 12u$(xsmall)">
									<b>아이디</b>
									<input type="text" name="id" placeholder="ID" />
								</div>
								<br><br><br>
								<div class="6u 12u$(xsmall)">
									<b>비밀번호</b> 									
									<input type="password" name="password" placeholder="Password" />
								</div>
								<div class="12u$">
									<ul class="actions">
										<li><input type="submit" value="login" class="special" /></li>										
									</ul>
								</div>
							</div>
						</form>
							
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