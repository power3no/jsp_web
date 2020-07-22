<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복 확인</title>
<link rel="stylesheet" href="../assets/css/main.css" />
<script type="text/javascript">

function sel() {
	window.opener.form.id.value=document.checkForm.idCheck.value;
	window.close();
}

</script>

</head>
<body>

<%
String idCheck = request.getParameter("idCheck");
MemberDAO dao = new MemberDAO();
int check = dao.loginCheck(idCheck, ""); 		// 있으면 0 없으면 -1
%>
<section id="one">
	<div class="inner">
		<h2>아이디 중복확인</h2>
	<form action="dupcheck.jsp" method="get" name= "checkForm">
	<div class="row uniform 50%">
		<div class="6u 4u$(xsmall)">
		<input type="text" name = "idCheck" value = "<%=idCheck %>" placeholder="ID">
		</div>
		<div class="6u 4u$(xsmall)">
		<input type="submit" value="아이디 중복체크">
		</div>
		 <%
		if(check==0){
			%>
			<b>아이디가 중복됩니다 새로운 아이디를 입력해주세요</b>
			<%
		} else {
		
		%>
		<div class="6u 12u$(xsmall)">
		<b>사용 가능한 아이디입니다.</b>
		</div>
		<div class="6u 12u$(xsmall)">
		<input type="button" value="아이디 선택" onclick="sel()">
		</div>
		<%
		}
	%>
	</div>
	</form>
	</div>
</section>
</body>
</html>