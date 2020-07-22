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
request.setCharacterEncoding("UTF-8");
String[] agreeArr = request.getParameterValues("agree");
String agree = "";
if(agreeArr != null){
	agree = agreeArr[0];
	for(int i = 1; i < agreeArr.length; i++){
		agree += "/"+agreeArr[i];
	}
}
String changePassword = request.getParameter("changePassword");
%>
<jsp:useBean id="dto" class="member.MemberDTO"/>
<jsp:setProperty property="*" name="dto"/>

<%
dto.setAgree(agree);

MemberDAO dao = new MemberDAO();
int check = -1;
check = dao.loginCheck(dto.getId(), dto.getPassword());

if(check == 1){	
	dto.setPassword(changePassword);
	dao.updateMember(dto);
	%>
	<script type="text/javascript">
	alert("회원정보가 수정되었습니다.");
	location.href="../main/index.jsp";
	</script>
	<%
}
else {
	%>
	<script type="text/javascript">
	alert("비밀번호가 일치하지 않습니다.");
	location.href="../member/update.jsp";
	</script>
	<%
}
%>

</body>
</html>