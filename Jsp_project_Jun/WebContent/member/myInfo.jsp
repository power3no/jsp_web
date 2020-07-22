<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script language="javascript">

function goPopup(){
	var pop = window.open("../jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 

}

function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
		document.form.address1.value = roadAddrPart1;
		document.form.address2.value = addrDetail;
		document.form.zipNo.value = zipNo;
		
		
}

</script>

		<title>회원 정보</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="../assets/css/main.css" />
	</head>
	<body>

<%
String id = (String) session.getAttribute("id");

MemberDAO dao = new MemberDAO();
MemberDTO dto = dao.updateSelect(id);
String agree = dto.getAgree();
%>

		<!-- Header -->
	<jsp:include page="../inc/top.jsp"></jsp:include>

		<!-- Main -->
			<section id="main" >
				<div class="inner">
				<header class="major special">
						<h1>회원 정보</h1>
				</header>
					<section>
							<form method="post" action="update.jsp" name="form" id="form" >
								<div class="row uniform 50%">
									<div class="6u 12u$(xsmall)">
										<b>아이디</b>
										<input type="text" name="id" value="<%=id%>" readonly />
									</div>
									<br><br><br>
									<div class="6u 12u$(xsmall)">
										<b>이름</b>
										<input type="text" name="name" value="<%=dto.getName()%>" placeholder="name" readonly />
									</div><br><br><br>	
									<div class="2u 12u$(xsmall)">
									<b>주소</b>
									<input type="text" name="zipNo" value="<%=dto.getZipNo()%>" placeholder="우편번호" readonly/>
									</div>
									<br><br><br>
									<div class="6u 12u$(xsmall)">
										<input type="text"  name="address1" value="<%=dto.getAddress1()%>" placeholder="전체 주소" readonly/>
									</div>
									<div class="6u$ 12u$(xsmall)">
										<input type="text"  name="address2" value="<%=dto.getAddress2()%>" placeholder="나머지 주소" readonly />
									</div>
									<div class="6u$ 12u$(xsmall)">
										<b>전화번호</b>
										<input type="text" name="phone" value="<%=dto.getPhone()%>" placeholder="010-1111-2222" readonly/>
									</div>
									<div class="6u$ 12u$(xsmall)">
										<b>이메일</b>
										<input type="email" name="email" value="<%=dto.getEmail()%>" placeholder="qwe@naver.com" readonly />
									</div>
									<div class="3u 12u$(small)">
										<input type="checkbox" id="copy" name="agree" value="email" <%if(agree.contains("email")){%>checked<%}%>>
										<label for="copy">Email</label>
									</div>
									<div class="3u$ 12u$(small)">
										<input type="checkbox" id="human" name="agree" value="sms" <%if(agree.contains("sms")){%>checked<%}%>>
										<label for="human">SMS</label>
									</div>
									<div class="12u$">
									<input type="submit" value="회원정보수정" class="special" />
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