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

function dupcheck() {
	if(document.form.id.value==""){
		alert("아이디를 입력해주세요!")
		document.form.id.focus();
		return;
	} else {
		var idCheck = document.form.id.value;
		window.open("dupcheck.jsp?idCheck="+idCheck,"아이디 중복확인","width=500,height=400")
	}

}

</script>

		<title>회원가입</title>
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
						<h1>회원가입</h1>
				</header>
					<section>
							<form method="post" action="signupPro.jsp" name="form" id="form" >
								<div class="row uniform 50%">
									<div class="6u 12u$(xsmall)">
										<b>아이디</b>
										<input type="text" name="id" placeholder="ID" />
									</div>
									<div class="6u 12u$(xsmall)">
									<br>
									<input type="button" value = "중복확인" onclick="dupcheck()">
									</div>
									<br><br><br>
									<div class="6u 12u$(xsmall)">
										<b>비밀번호</b> 									
										<input type="password" name="password"   placeholder="Password" />
									</div><br><br><br>
									<div class="6u 12u$(xsmall)">
										<input type="password" name="passCheck" placeholder="Password Check" />
									</div><br><br>
									<div class="6u 12u$(xsmall)">
										<b>이름</b>
										<input type="text" name="name" placeholder="name" />
									</div><br><br><br>
									<div class="2u 12u$(xsmall)">
										<b>생년월일</b>
										<input type="text" name="birth_YEAR" placeholder=Year />
									</div>
									<br>
									<div class="6u$(small)">
										<div class="select-wrapper">
											<select name="birth_MONTH">
												<option value=""> Month 　　　　　</option>
												<option value="1"> 1월 </option>
												<option value="2"> 2월 </option>
												<option value="3"> 3월 </option>
												<option value="4"> 4월 </option>
												<option value="5"> 5월 </option>
												<option value="6"> 6월 </option>
												<option value="7"> 7월 </option>
												<option value="8"> 8월 </option>
												<option value="9"> 9월 </option>
												<option value="10"> 10월 </option>
												<option value="11"> 11월 </option>
												<option value="12"> 12월 </option>
											</select>
										</div>
									</div>
									<div class="2u 4u$(xsmall)">
									<input type="text" name="birth_DAY" placeholder="Day" />
									</div>
									<br><br>
									<div class="2u 12u$(xsmall)">
										<b>성별</b> <br>
										<input type="radio" value="male" name="gender"id="priority-low" checked>
										<label for="priority-low">남자</label>
									</div> <br>
									<div class="2u 12u$(xsmall)">
										<input type="radio" value="female" name="gender"id="priority-normal">
										<label for="priority-normal">여자</label>
									</div><br><br>	
									<div class="2u 12u$(xsmall)">
									<b>주소</b>
									<input type="text" name="zipNo" placeholder="우편번호" readonly/>
									</div><br>
									<div class="row">
										<div class="3u 6u(small) 12u$(xsmall)">
										<ul class="actions vertical">
											<li><a href="#" onclick="goPopup();" class="button special">주소 검색</a></li>
										</ul>
										</div>
									</div>
									<br><br><br>
									<div class="6u 12u$(xsmall)">
										<input type="text"  name="address1" placeholder="전체 주소" readonly/>
									</div>
									<div class="6u$ 12u$(xsmall)">
										<input type="text"  name="address2" placeholder="나머지 주소" />
									</div>
									<div class="6u$ 12u$(xsmall)">
										<b>전화번호</b>
										<input type="text" name="phone" placeholder="010-1111-2222" />
									</div>
									<div class="6u$ 12u$(xsmall)">
										<b>이메일</b>
										<input type="email" name="email" placeholder="qwe@naver.com" />
									</div>
									<div class="3u 12u$(small)">
										<input type="checkbox" id="copy" name="agree" value="email" checked>
										<label for="copy">Email</label>
									</div>
									<div class="3u$ 12u$(small)">
										<input type="checkbox" id="human" name="agree" value="sms">
										<label for="human">SMS</label>
									</div>
									
									<div class="12u$">
										<ul class="actions">
											<li><input type="submit" value="회원가입" class="special" /></li>
											<li><input type="reset" value="Reset" /></li>
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