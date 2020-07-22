<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>자료실 글쓰기</title>
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
					<h1>글쓰기</h1>
				</header>
				<section>
					<div class="table-wrapper">
					<form action="fileWritePro.jsp?page=3" method="post" enctype="multipart/form-data">
						<table class="alt">
							<tbody>
								<tr>
									<td><b>제목</b></td>
									<td><input type="text" name="subject"></td>
								</tr>
								<tr>
									<td><b>작성자</b></td>
									<td><%=session.getAttribute("id") %></td>
								</tr>
								<tr>
									<td><b>파일</b></td>
									<td><input type="file" name = "file"></td>
								</tr>
								<tr>
									<td><b>내용</b></td>
									<td><textarea name="content" rows="10"></textarea></td>
								</tr>
							</tbody>
							<tfoot>
								<tr>
									<td></td>
									<td><input type="submit" value="글쓰기" style="float: right;"></td>
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