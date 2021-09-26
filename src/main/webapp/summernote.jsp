<%@ page import="VO.membersVO"%>
<%@ page language="java" contentType="text/html; charset=euc-kr"
	pageEncoding="euc-kr"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="euc-kr">
<title>38℃ - Posting</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="assets/css/bootstrap5.css" />
<link rel="stylesheet" href="assets/css/main.css" />

<!-- include libraries(jQuery, bootstrap) -->
<!-- <link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet"> -->
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<!-- include summernote css/js-->
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
</head>
<body class="is-preload">
	<%
	//로그인 한 세션 받아오기
	membersVO vo = (membersVO) session.getAttribute("vo");
	%>

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Header -->
		<header id="header">
			<div class="inner">

				<!-- Logo -->
				<a href="Main.jsp" class="logo"> <span class="symbol"><img
						src="images/logo.png" alt="" /></span><span class="title">38℃</span>
				</a>

				<!-- Nav -->
				<nav id="nav">
					<ul>
						<li class="current"><a href="Main.jsp">HOME</a></li>
						<li><a href="sched.jsp">SCHEDULE</a></li>
						<li><a href="all.jsp">ALL POST</a></li>

						<%
						if (vo != null) {
						%>
						<!-- <li><a href="posting.jsp">POST</a></li>-->
						<li><a href="summernote.jsp">POSTING</a></li>
						<%
						} else {
						%>
						<li><a href="login.jsp">POSTING</a></li>
						<%
						}
						%>
						<!-- 소야니 홧팅 ㅎㅎㅎㅎㅎㅎ -->
						<!-- <li><a href="#">이름4</a></li> -->
						<!-- 필요없으면 개수 지워도 됨 -->
					</ul>
					<%if(vo!=null){ %>
						<a href="bookMark.jsp" class="btn_c"><img src="images/bookmark.svg" alt=""/></span>
						<span class="title"></span></a>
						<a href="myPage.jsp" class="btn_d"><img src="images/user.svg" alt=""/></span>
						<span class="title"></span></a>
						<%}else{ %>
						<!-- 로그인 안되어 있을 경우 다른 이벤트 넣기 -->
										
						<a href="bookMark.jsp" class="btn_c"><img src="images/bookmark.svg" alt=""/></a>
						<a href="login.jsp" class="btn_d"><img src="images/user.svg" alt=""/></a>
										
						<%} %>
				</nav>

			</div>
		</header>



		<div id="main">
			<div class="inner">
				<section>
					<div class="table-wrapper">
						<div class="fields">
						<div class="field">
					
						<!-- <div class="field">
								<div id="summernote"></div> -->
							
								
													
							<form action="Posting" method="post">
								<table border="1px">
								<colgroup>

									<col style="width:20%;">
									
									<col style="width:80%;">
									
									</colgroup>
									<tr>
									<td>Title</td>
									<td><input type="text" id="title" name="title"></td>
									
									</tr>
									
									<tr>
									<td>Content</td>
									<td><textarea id="summernote" name="content"></textarea></td></tr>
									<tr>
										<td><strong>지역태그</strong></td>
										<td>
											<input type="radio" name="region" value="Seoul" id="region2">
											<label for="region2">서울</label> 
											<input type="radio" name="region" value="Gyeonggi" id="region3">
											<label for="region3">경기</label> 
											<input type="radio" name="region" value="Gangwon" id="region4">
											<label for="region4">강원</label>
											<input type="radio" name="region" value="Daejeon" id="region5"> 
											<label for="region5">대전</label> 
											<input type="radio" name="region" value="Daegu" id="region6">
											<label for="region6">대구</label> 
											<input type="radio" name="region" value="Busan" id="region7"> 
											<label for="region7">부산</label> 
											<input type="radio" name="region" value="Gwangju" id="region8"> 
											<label for="region8">광주</label>
											<input type="radio" name="region" value="Ulsan" id="region9"> 
											<label for="region9">울산</label> 
											<input type="radio" name="region" value="Incheon" id="region10">
											<label for="region10">인천</label> 
											<input type="radio" name="region" value="Jeju" id="region11"> 
											<label for="region11">제주</label> 
											<input type="radio" name="region" value="Chungnam" id="region12"> 
											<label for="region12">충남</label> 
											<input type="radio" name="region" value="Chungbuk" id="region13"> 
											<label for="region13">충북</label> 
											<input type="radio" name="region" value="Gyeongnam" id="region14"> 
											<label for="region14">경남</label> 
											<input type="radio" name="region" value="Kyeongbuk" id="region15"> 
											<label for="region15">경북</label> 
											<input type="radio" name="region" value="Jeonnam" id="region16"> 
											<label for="region16">전남</label> 
											<input type="radio" name="region" value="Jeonbuk" id="region17">
											<label for="region17">전북</label>
									</tr>
									<tr>
										<td><strong>장르태그</strong></td>
										<td><input type="radio" name="genre" value="Western" id="genre1">
											<label for="genre1">서양화</label> 
											<input type="radio" name="genre" value="Oriental" id="genre2">
											<label for="genre2">동양화</label> 
											<input type="radio" name="genre" value="Design" id="genre3">
											<label for="genre3">디자인</label>
											<input type="radio" name="genre" value="Installation" id="genre4">
											<label for="genre4">설치미술</label> 
											<input type="radio" name="genre" value="Formative" id="genre5">
											<label for="genre5">조형미술</label> 
											<input type="radio" name="genre" value="Crafts" id="genre6">
											<label for="genre6">공예</label>
											<input type="radio" name="genre" value="Architecture" id="genre7">
											<label for="genre7">건축</label> 
											<input type="radio" name="genre" value="Picture" id="genre8">
											<label for="genre8">사진</label> 
											<input type="radio" name="genre" value="Hands-on" id="genre9">
											<label for="genre9">체험형</label>
										</td>
									</tr>
									<tr>
										<td><strong>색감별 분위기 태그</strong></td>
										<td>
											<input type="checkbox" name="color" value="White" id="color1"  onclick=CountChecked(this)>
											<label for="color1">White</label> 
											<input type="checkbox" name="color" value="Black" id="color2"  onclick=CountChecked(this)>
											<label for="color2">Black</label> 
											<input type="checkbox" name="color" value="Gray" id="color3"  onclick=CountChecked(this)>
											<label for="color3">Gray</label> 
											<input type="checkbox" name="color" value="Brown" id="color4"  onclick=CountChecked(this)>
											<label for="color4">Brown</label>
											<input type="checkbox" name="color" value="Beige" id="color5"  onclick=CountChecked(this)>
											<label for="color5">Beige</label> 
											<input type="checkbox" name="color" value="Green" id="color6"  onclick=CountChecked(this)>
											<label for="color6">Green</label> 
											<input type="checkbox" name="color" value="Blue" id="color7"  onclick=CountChecked(this)>
											<label for="color7">Blue</label> 
											<input type="checkbox" name="color" value="Purple" id="color8"  onclick=CountChecked(this)>
											<label for="color8">Purple</label>
											<input type="checkbox" name="color" value="Yellow" id="color9"  onclick=CountChecked(this)>
											<label for="color9">Yellow</label> 
											<input type="checkbox" name="color" value="Pink" id="color10"  onclick=CountChecked(this)>
											<label for="color10">Pink</label> 
											<input type="checkbox" name="color" value="Red" id="color11"  onclick=CountChecked(this)>
											<label for="color11">Red</label> 
											<input type="checkbox" name="color" value="Ivory" id="color12" onclick=CountChecked(this)>
											<label for="color12">Ivory</label>
											<input type="checkbox" name="color" value="LightGray" id="color13" onclick=CountChecked(this)>
											<label for="color13">Light Gray</label>
											<input type="checkbox" name="color" value="Khaki" id="color14" onclick=CountChecked(this)>
											<label for="color14">Khaki</label> 
											<input type="checkbox" name="color" value="Mint" id="color15" onclick=CountChecked(this)>
											<label for="color15">Mint</label> 
											<input type="checkbox" name="color" value="Neongreen" id="color16" onclick=CountChecked(this)>
											<label for="color16">Neon Green</label> 
											<input type="checkbox" name="color" value="Olive" id="color17" onclick=CountChecked(this)>
											<label for="color17">Olive</label> 
											<input type="checkbox" name="color" value="Navy" id="color18" onclick=CountChecked(this)>
											<label for="color18">Navy</label> 
											<input type="checkbox" name="color" value="Skyblue" id="color19" onclick=CountChecked(this)>
											<label for="color19">Sky Blue</label> 
											<input type="checkbox" name="color" value="Lavender" id="color20" onclick=CountChecked(this)>
											<label for="color20">Lavender</label> 
											<input type="checkbox" name="color" value="Mustard" id="color21" onclick=CountChecked(this)>
											<label for="color21">Mustard</label> 
											<input type="checkbox" name="color" value="Deepred" id="color22" onclick=CountChecked(this)>
											<label for="color22">Deep Red</label>
									</tr>
								</table>
								<input type="submit" value="게시">
								</form>
							</div>
							</div>
						</div>
					</div>
				</section>
			</div>
		</div>
	</div>


		<script>
			// 메인화면 페이지 로드 함수
			$(document).ready(function() {
				$('#summernote').summernote({
					placeholder : '내용을 작성하세요',
					height : 400,
					maxHeight : 400,
					callbacks: {	//여기 부분이 이미지를 첨부하는 부분
						onImageUpload : function(files) {
							uploadSummernoteImageFile(files[0],this);
						},
						onPaste: function (e) {
							var clipboardData = e.originalEvent.clipboardData;
							if (clipboardData && clipboardData.items && clipboardData.items.length) {
								var item = clipboardData.items[0];
								if (item.kind === 'file' && item.type.indexOf('image/') !== -1) {
									e.preventDefault();
								}
							}}
					}});
			});
		</script>
		<!--  <script src="assets/js/jquery.min.js"></script>-->
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script> 
			
			<script language="JavaScript">
			// 설정 시작
			var maxChecked = 3;
			var totalChecked = 0;
			// 설정 끝
			function CountChecked(field) {
			if (field.checked)
			totalChecked += 1;
			else
			totalChecked -= 1; 
			if (totalChecked > maxChecked) {
			alert ("최대 3개 까지만 가능합니다.");
			field.checked = false;
			totalChecked -= 1;
			} 
			}
			function ResetCount(){
			totalChecked = 0;
			}
			
			</script>
</body>
</html>