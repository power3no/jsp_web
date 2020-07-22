<%@page import="member.MemberDAO"%>
<%@page import="email.MailSend"%>
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
request.setCharacterEncoding("UTF-8");
String email = request.getParameter("email");
String subject = request.getParameter("subject");
String message = request.getParameter("message");

MailSend ms = new MailSend();
if(email.equals("*")){
	MemberDAO dao = new MemberDAO();
	String[] emailArr = dao.selectEmail();
	for(String value:emailArr){
		ms.MailSend(value, subject, message);
	}
} else {
	ms.MailSend(email, subject, message);
}
%>

<script type="text/javascript">
alert("이메일이 전송되었습니다!");
location.href = "adminPage.jsp";
</script>
</body>
</html>