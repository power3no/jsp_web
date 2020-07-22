<%@page import="board.Paging"%>
<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
		<title>JSP Project - JUN</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="../assets/css/main.css" />
	</head>
	<body>

		<!-- Header -->
<jsp:include page="../inc/top.jsp"></jsp:include>
		<!-- Banner -->
			<section id="banner">
				<div class="inner">
					<h1>JSP <span> 개인 프로젝트 <br />
					이경준</span></h1>
					<ul class="actions">
						<li><a href="#" class="button alt">Get Started</a></li>
					</ul>
				</div>
			</section>

		<!-- Two -->
			<section id="two">
				<div class="inner">
					<article>
						<div class="content">
							<header>
								<h3><a href="../board/board.jsp">게시판</a></h3>
							</header>
							<div class="image fit">
								<img src="images/pic01.jpg" alt="" />
							<div class="table-wrapper">
								<table>
							<thead>
								<tr>
									<th style="width: 200px;">글번호</th>
									<th style="width: 800px;">글제목</th>
									<th style="width: 200px;">작성자</th>
								</tr>
							</thead>
<!-- 							최근 게시물 5개 -->
							<tbody>
								<%
								BoardDAO dao = new BoardDAO();
								ArrayList<BoardDTO> list;
								if(!dao.boardSelect(1).isEmpty()){
									list = dao.boardSelect(1);
									Paging p = new Paging(5,list,1);
									for(int i = p.getStartContent(); i >= p.getEndContent(); i--){
										BoardDTO dto = list.get(i);
								%>							
								<tr>
									<td><%=i+1%></td>
									<td style="width: 700px;">
									<a href = "../board/content.jsp?num=<%=dto.getNum()%>" ><%=dto.getSubject()%></a>
									</td>
									<td><%=dto.getId()%></td>
								</tr>
								<%
									}}
								%>							
								
								
							</tbody>
									<tfoot>
										<tr>
											<td colspan="3"></td>
											
										</tr>
									</tfoot>
								</table>
							</div>
							</div>
							</div>
					</article>
					<article class="alt">
						<div class="content">
							<header>
								<h3><a href="../board/imageBoard.jsp">이미지 게시판</a></h3>
							</header>
							<section>
							<div class="box alt">
								<div class="row 50% uniform">
								<%
								ArrayList<BoardDTO> imageList;
								if(!dao.boardSelect(2).isEmpty()){
								imageList = dao.boardSelect(2);
								Paging p = new Paging(6, imageList, 1);
									int count = 0;
									for(int i = p.getStartContent(); i >= p.getEndContent(); i--){
										BoardDTO dto = imageList.get(i); 
										count++;
										if(count%3 != 0){%>
										<div class="4u">
										<%} else{
											%><div class="4u$"><%
										}
										%>
									<span class="image fit">
									<a href = "../board/imageContent.jsp?num=<%=dto.getNum()%>" >
									<img src="<%=request.getContextPath()%>/images/<%=dto.getFile()%>" />
									<%=dto.getSubject()%> <b style="float: right;">views : <%=dto.getViews() %></b> <br>
									<code><%=dto.getId() %></code>
									</a>
									</span></div>	
									<%
									}}
									%>
									</div>
							</div>
							</section>
							</div>
					</article>
				</div>
			</section>
		<!-- One -->
			<section id="one">
				<div class="inner">
					<header>
						<h2>Kakao 지도 Web API</h2>
					</header>
					<div id="map" style="width:100%; height:400px;"></div>
					<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=	49200b3ed99a4b8484df2cc34962c9e3&libraries=services"></script>
					<script>
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
					    mapOption = {
					        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
					        level: 3 // 지도의 확대 레벨
					    };  
					
					// 지도를 생성합니다    
					var map = new kakao.maps.Map(mapContainer, mapOption); 
					
					// 주소-좌표 변환 객체를 생성합니다
					var geocoder = new kakao.maps.services.Geocoder();
					
					// 주소로 좌표를 검색합니다
					geocoder.addressSearch('부산광역시 부산진구 부전동 동천로 109', function(result, status) {
					
					    // 정상적으로 검색이 완료됐으면 
					     if (status === kakao.maps.services.Status.OK) {
					
					        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
					
					        // 결과값으로 받은 위치를 마커로 표시합니다
					        var marker = new kakao.maps.Marker({
					            map: map,
					            position: coords
					        });
					
					        // 인포윈도우로 장소에 대한 설명을 표시합니다
					        var infowindow = new kakao.maps.InfoWindow({
					            content: '<div style="width:150px;text-align:center;padding:6px 0;">부산아이티윌교육센터</div>'
					        });
					        infowindow.open(map, marker);
					
					        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
					        map.setCenter(coords);
					    } 
					});    
					</script>					
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