
<%@page import="member.MemberDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.time.LocalDateTime"%>
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
String birth_YEAR = request.getParameter("birth_YEAR");
String birth_MONTH = request.getParameter("birth_MONTH");
String birth_DAY = request.getParameter("birth_DAY");
String[] agreeArr = request.getParameterValues("agree");
String agree = "";
if(agreeArr != null){
	agree = agreeArr[0];
	for(int i = 1; i < agreeArr.length; i++){
		agree += "/"+agreeArr[i];
	}
}
LocalDateTime localDateTime = LocalDateTime.now();
Timestamp leg_date = Timestamp.valueOf(localDateTime);
%>

<jsp:useBean id="dto" class="member.MemberDTO"/>
<jsp:setProperty property="*" name="dto"/>
<%
dto.setBirth(birth_YEAR + "/"  + birth_MONTH + "/" + birth_DAY);
dto.setAgree(agree);
dto.setDate(leg_date);

MemberDAO dao = new MemberDAO();
dao.insertMember(dto);
%>
<script type="text/javascript">
alert("가입에 성공하셨습니다");
location.href="./login.jsp";
</script>

</body>
</html>