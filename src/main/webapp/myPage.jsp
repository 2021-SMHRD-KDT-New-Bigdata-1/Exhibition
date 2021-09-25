<%@page import="VO.membersVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
    //로그인 한 세션 받아오기
    membersVO vo = (membersVO)session.getAttribute("vo");
    
    %>
<!DOCTYPE html>
<html>
<head>
<title>38℃ - Modify </title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/mypage_main.css" />
</head>
<body class="is-preload">
    
   
    
	<div id="header">

				<div class="top">

					<!-- Logo -->
						<div id="logo">
							
							<h1 id="title"><%=vo.getMB_nick() %></h1>
						</div>

					<!-- Nav -->
						<nav id="nav">
							<ul>
								<li><a href="Main.jsp" id="Main-link"><span class="icon solid fa-home">Home</span></a></li>
								<li><a href="#myInfo" id="myInfo-link"><span class="icon solid fa-user-edit">개인 정보 수정</span></a></li>
								<li><a href="#myTag" id="myTag-link"><span class="icon solid fa-th">관심 분야 설정</span></a></li>
								<li><a href="logOutCon" id="contact-link"><span class="icon solid fa-power-off">로그아웃</span></a></li>
							</ul>
						</nav>

				</div>

			

			</div>

		<!-- Main -->
			<div id="main">

				<!-- Intro -->
					<section id="top" class="one dark cover">
						<div class="container">

							<header>
								관심태그를 설정하시면 맞춤형 추천을 받을 수 있어요!
							</header>

							

						</div>
					</section>

				<!-- Portfolio -->
					<section id="myInfo" >
						<div class="container">

							<header>
								<h2>개인 정보 수정</h2>
							</header>


							<div class="row">
							<form action = "modifyCon" method = "post">
							<table>
							
							<tr>
								<td>이름</td>
								<td><input type = "text" name = "name" required></td>
							</tr>
							<tr>
								<td>아이디</td>
								<td><input type = "text" name = "id" required></td>
							</tr>
							<tr>
								<td>비밀번호</td>
								<td><input type = "password" name = "pw" required></td>
							</tr>
							<!-- 
								<tr>
								<td>닉네임</td>
								<td><input type = "text" name = "nick" required></td>
							</tr>
							-->
							<tr>
								<td>전화번호</td>
								<td><input type = "text" name = "tel" required> (인증하는거 넣기)</td>
							</tr>
							<!-- 
							<tr> 
								<td>회원구분</td>
								<td><input type = "text" name = "TF"></td>
							</tr>
							-->
							<%
							//기업회원의 경우에만 사업자 번호를 변경하는 인풋창이 나오도록?
							//if(vo.getMB_type().equals("Business")){
							%>
							<!-- 
							<tr>
								<td>사업자번호</td> 
								<td><input type = "text" name = "bn"> 기업회원으로 가입할 경우 입력하세요 (인증하는거 넣기)</td>
							</tr>
							-->
							<%//}%>
							<tr>
								<td colspan="2" align="center"><input type="submit" value="수정"> 
							</tr>
						    
							</table>   
					   </form>
						</div>
						</div>
					</section>

				<!-- About Me -->
					<section id="myTag" class="select_t">
						<div class="container">

							<header>
								<h2>관심 태그 설정</h2>
							</header>

							<form action="likeTagCon" method="post">
							<table>
										<colgroup>

										<col style="width:20%;">
										
										<col style="width:80%;">
										
										</colgroup>
											<tr>
												<td><strong>지역별 태그</strong></td>
												<td>
													<input type="checkbox" name="region" value="" id="region1">
													<label for="region1">전체지역</label>
													<input type="checkbox" name="region" value="Seoul" id="region2">
													<label for="region2">서울</label> 
													<input type="checkbox" name="region" value="Gyeonggi" id="region3">
													<label for="region3">경기</label> 
													<input type="checkbox" name="region" value="Gangwon" id="region4">
													<label for="region4">강원</label>
													<input type="checkbox" name="region" value="Daejeon" id="region5"> 
													<label for="region5">대전</label> 
													<input type="checkbox" name="region" value="Daegu" id="region6">
													<label for="region6">대구</label> 
													<input type="checkbox" name="region" value="Busan" id="region7"> 
													<label for="region7">부산</label> 
													<input type="checkbox" name="region" value="Gwangju" id="region8"> 
													<label for="region8">광주</label>
													<input type="checkbox" name="region" value="Ulsan" id="region9"> 
													<label for="region9">울산</label> 
													<input type="checkbox" name="region" value="Incheon" id="region10">
													<label for="region10">인천</label> 
													<input type="checkbox" name="region" value="Jeju" id="region11"> 
													<label for="region11">제주</label> 
													<input type="checkbox" name="region" value="Chungnam" id="region12"> 
													<label for="region12">충남</label> 
													<input type="checkbox" name="region" value="Chungbuk" id="region13"> 
													<label for="region13">충북</label> 
													<input type="checkbox" name="region" value="Gyeongnam" id="region14"> 
													<label for="region14">경남</label> 
													<input type="checkbox" name="region" value="Kyeongbuk" id="region15"> 
													<label for="region15">경북</label> 
													<input type="checkbox" name="region" value="Jeonnam" id="region16"> 
													<label for="region16">전남</label> 
													<input type="checkbox" name="region" value="Jeonbuk" id="region17">
													<label for="region17">전북</label>
												</td>
											</tr>	
											<tr>
												<td><strong>장르별 태그</strong></td>
												<td>
													<input type="checkbox" name="genre" value="Western" id="genre1">
													<label for="genre1">서양화</label> 
													<input type="checkbox" name="genre" value="Oriental" id="genre2">
													<label for="genre2">동양화</label> 
													<input type="checkbox" name="genre" value="Design" id="genre3">
													<label for="genre3">디자인</label>
													<input type="checkbox" name="genre" value="Installation" id="genre4">
													<label for="genre4">설치미술</label> 
													<input type="checkbox" name="genre" value="Formative" id="genre5">
													<label for="genre5">조형미술</label> 
													<input type="checkbox" name="genre" value="Crafts" id="genre6">
													<label for="genre6">공예</label>
													<input type="checkbox" name="genre" value="Architecture" id="genre7">
													<label for="genre7">건축</label> 
													<input type="checkbox" name="genre" value="Picture" id="genre8">
													<label for="genre8">사진</label> 
													<input type="checkbox" name="genre" value="Hands-on" id="genre9">
													<label for="genre9">체험형</label>
												</td>
											</tr>
											<tr>
												<td><strong>색감별(분위기) 태그</strong></td>
												<td>
													<input type="checkbox" name="color" value="White" id="color1">
													<label for="color1">White</label> 
													<input type="checkbox" name="color" value="Black" id="color2">
													<label for="color2">Black</label> 
													<input type="checkbox" name="color" value="Gray" id="color3">
													<label for="color3">Gray</label> 
													<input type="checkbox" name="color" value="Brown" id="color4">
													<label for="color4">Brown</label>
													<input type="checkbox" name="color" value="Beige" id="color5">
													<label for="color5">Beige</label> 
													<input type="checkbox" name="color" value="Green" id="color6">
													<label for="color6">Green</label> 
													<input type="checkbox" name="color" value="Blue" id="color7">
													<label for="color7">Blue</label> 
													<input type="checkbox" name="color" value="Purple" id="color8">
													<label for="color8">Purple</label>
													<input type="checkbox" name="color" value="Yellow" id="color9">
													<label for="color9">Yellow</label> 
													<input type="checkbox" name="color" value="Pink" id="color10">
													<label for="color10">Pink</label> 
													<input type="checkbox" name="color" value="Red" id="color11">
													<label for="color11">Red</label> 
													<input type="checkbox" name="color" value="Ivory" id="color12">
													<label for="color12">Ivory</label>
													<input type="checkbox" name="color" value="LightGray" id="color13">
													<label for="color13">Light Gray</label>
													<input type="checkbox" name="color" value="Khaki" id="color14">
													<label for="color14">Khaki</label> 
													<input type="checkbox" name="color" value="Mint" id="color15">
													<label for="color15">Mint</label> 
													<input type="checkbox" name="color" value="NeonGreen" id="color16">
													<label for="color16">Neon Green</label> 
													<input type="checkbox" name="color" value="Olive" id="color17">
													<label for="color17">Olive</label> 
													<input type="checkbox" name="color" value="Navy" id="color18">
													<label for="color18">Navy</label> 
													<input type="checkbox" name="color" value="SkyBlue" id="color19">
													<label for="color19">Sky Blue</label> 
													<input type="checkbox" name="color" value="Lavender" id="color20">
													<label for="color20">Lavender</label> 
													<input type="checkbox" name="color" value="Mustard" id="color21">
													<label for="color21">Mustard</label> 
													<input type="checkbox" name="color" value="DeepRed" id="color22">
													<label for="color22">Deep Red</label>
														
													</td>
												</tr>
	
												<tr>
													<td colspan="2" ><input type="submit" value="수정"> </td>
												</tr>
											</table>
											
										</form>

						</div>
					</section>

				<!-- Contact -->
					
			</div>

		<!-- Footer -->
			<div id="footer">

				<!-- Copyright -->
					<ul class="copyright">
						<li>&copy; Untitled. All rights reserved.</li><li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
					</ul>

			</div>

	
	
	
	<h1>로그인 한 상태 마이페이지</h1>
	<ul>
		<li><a href="./myPage/modify.jsp">개인 정보 수정</a></li>
		<li><a href="./myPage/likeTag.jsp">관심 분야 설정</a></li>
		<li><a href="logOutCon">로그아웃</a></li>

	</ul>
	
		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.scrolly.min.js"></script>
			<script src="assets/js/jquery.scrollex.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
	
	
</body>
</html>