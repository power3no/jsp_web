<%@page import="member.MemberDAO"%>
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
String id = request.getParameter("id");
String password = request.getParameter("password");

int check = -1;

MemberDAO dao = new MemberDAO();
check = dao.loginCheck(id, password);
if(check == 1){
	session.setAttribute("id", id);
	%>
	<script type="text/javascript">
	alert("로그인 하셨습니다.");
	location.href = "../main/index.jsp";
	</script>
	<%
}
else if(check == 0){
	%>
	<script type="text/javascript">
	alert("비밀번호가 틀렸습니다.");
	location.href = "login.jsp";
	</script>
	<%
}
else {
	%>
	<script type="text/javascript">
	alert("아이디가 틀렸습니다.");
	location.href = "login.jsp";
	</script>
	<%
}

%>

</body>
</html>