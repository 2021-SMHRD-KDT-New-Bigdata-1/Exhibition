<%@page import="VO.membersVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="assets/css/main.css" />
</head>
 <body class="is-preload">
    <%
    //로그인 한 세션 받아오기
    membersVO vo = (membersVO)session.getAttribute("vo");
    
    %>
    <%if(vo!=null){ %>
   		<%=vo.getMB_nick() %> 님 어서오세영
   	<%}else{ %>
   	로그인하세요
   	<%} %>
    
        <!-- Wrapper -->
        <div id="wrapper">

            	<!-- Header -->
					<header id="header">
						<div class="inner">

							<!-- Logo -->
								<a href="main.html" class="logo">
									<span class="symbol"><img src="images/logo.svg" alt="" /></span><span class="title">38℃</span>
								</a>

							
									<nav id="nav">
										<ul>
											<li class="current"><a href="Main.jsp">HOME</a></li>
											<li><a href="schedule.jsp">SCHEDULE</a></li>
											<li><a href="all.jsp">ALL POSTING</a></li>
											
											<%if(vo!=null){ %>
											<!-- <li><a href="posting.jsp">POST</a></li>-->
											<li><a href="summernote.jsp">POST</a></li>
											<%}else{ %>
											<li><a href="login.jsp">POST</a></li>
											<%} %>
											
										</ul>
										<%if(vo!=null){ %>
										<a href="bookMark.jsp"><img src="images/bookmark.svg" alt=""/></span>
											<span class="title"></span></a>
										<a href="myPage.jsp"><img src="images/user.svg" alt=""/></span>
											<span class="title"></span></a>
										<%}else{ %>
										<!-- 로그인 안되어 있을 경우 다른 이벤트 넣기 -->
										<a href="bookMark.jsp"><img src="images/bookmark.svg" alt=""/></span>
											<span class="title"></span></a>
										<a href="login.jsp"><img src="images/user.svg" alt=""/></span>
											<span class="title"></span></a>
										
										<%} %>
									</nav>
								
								
						</div>
					</header>
					
			

							<!-- Main -->
							<div id="main">
							    <div class="inner">
							    	<div class="table-wrapper" method = "post">
									<div class="field">
									<form action = "tagpost">
										<table>
										<colgroup>

										<col style="width:20%;">
										
										<col style="width:80%;">
										
										</colgroup>
											<tr>
												<th>지역별 태그</th>
												<td>
													<input type="checkbox" name="region" value="allregion" id="region1">
													<label for="region1">전체지역</label>
													<input type="checkbox" name="region" value="seoul" id="region2">
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
													<input type="checkbox" name="region" value="ulsan" id="region9"> 
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
													<input type="checkbox" name="region" value="Jeonman" id="region16"> 
													<label for="region16">전남</label> 
													<input type="checkbox" name="region" value="Jeonbuk" id="region17">
													<label for="region17">전북</label>
												</td>
											</tr>	
											<tr>
												<th>장르별 태그</th>
												<td>
													<input type="checkbox" name="genre" value="Western" id="genre1">
													<label for="genre1">서양화</label> 
													<input type="checkbox" name="genre" value="Oriental" id="genre2">
													<label for="genre2">동양화</label> 
													<input type="checkbox" name="genre" value="design" id="genre3">
													<label for="genre3">디자인</label>
													<input type="checkbox" name="genre" value="installation" id="genre4">
													<label for="genre4">설치미술</label> 
													<input type="checkbox" name="genre" value="formative" id="genre5">
													<label for="genre5">조형미술</label> 
													<input type="checkbox" name="genre" value="crafts" id="genre6">
													<label for="genre6">공예</label>
													<input type="checkbox" name="genre" value="architecture" id="genre7">
													<label for="genre7">건축</label> 
													<input type="checkbox" name="genre" value="picture" id="genre8">
													<label for="genre8">사진</label> 
													<input type="checkbox" name="genre" value="hands-on" id="genre9">
													<label for="genre9">체험형</label>
												</td>
											</tr>
											<tr>
												<th>색감별(분위기) 태그</th>
												<td>
													<input type="checkbox" name="color" value="white" id="color1">
													<label for="color1">White</label> 
													<input type="checkbox" name="color" value="black" id="color2">
													<label for="color2">Black</label> 
													<input type="checkbox" name="color" value="gray" id="color3">
													<label for="color3">Gray</label> 
													<input type="checkbox" name="color" value="brown" id="color4">
													<label for="color4">Brown</label>
													<input type="checkbox" name="color" value="beige" id="color5">
													<label for="color5">Beige</label> 
													<input type="checkbox" name="color" value="green" id="color6">
													<label for="color6">Green</label> 
													<input type="checkbox" name="color" value="blue" id="color7">
													<label for="color7">Blue</label> 
													<input type="checkbox" name="color" value="purple" id="color8">
													<label for="color8">Purple</label>
													<input type="checkbox" name="color" value="yellow" id="color9">
													<label for="color9">Yellow</label> 
													<input type="checkbox" name="color" value="pink" id="color10">
													<label for="color10">Pink</label> 
													<input type="checkbox" name="color" value="red" id="color11">
													<label for="color11">Red</label> 
													<input type="checkbox" name="color" value="ivory" id="color12">
													<label for="color12">Ivory</label>
													<input type="checkbox" name="color" value="lightgray" id="color13">
													<label for="color13">Light Gray</label>
													<input type="checkbox" name="color" value="khaki" id="color14">
													<label for="color14">Khaki</label> 
													<input type="checkbox" name="color" value="mint" id="color15">
													<label for="color15">Mint</label> 
													<input type="checkbox" name="color" value="neongreen" id="color16">
													<label for="color16">Neon Green</label> 
													<input type="checkbox" name="color" value="olive" id="color17">
													<label for="color17">Olive</label> 
													<input type="checkbox" name="color" value="navy" id="color18">
													<label for="color18">Navy</label> 
													<input type="checkbox" name="color" value="skyblue" id="color19">
													<label for="color19">Sky Blue</label> 
													<input type="checkbox" name="color" value="lavender" id="color20">
													<label for="color20">Lavender</label> 
													<input type="checkbox" name="color" value="mustard" id="color21">
													<label for="color21">Mustard</label> 
													<input type="checkbox" name="color" value="deepred" id="color22">
													<label for="color22">Deep Red</label>
														
													</td>
												</tr>
											</table>
										</form>
										</div>
										</div>
										
        
			    <section class="tiles">
			        <article class="style1">
			            <span class="image">
			                <img src="images/pic01.jpg" alt=""/>
			            </span>
			            
			            <a href="generic.html">
			                <h2>Magna</h2>
			                <div class="content">
			                    <p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor veroeros et feugiat.</p>
			                </div>
			            </a>
			        </article>
			        <article class="style2">
			            <span class="image">
			                <img src="images/pic02.jpg" alt=""/>
			            </span>
			            <a href="generic.html">
			                <h2>Lorem</h2>
			                <div class="content">
			                    <p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor veroeros et feugiat.</p>
			                </div>
			            </a>
			        </article>
			        <article class="style3">
			            <span class="image">
			                <img src="images/pic03.jpg" alt=""/>
			            </span>
			            <a href="generic.html">
			                <h2>Feugiat</h2>
			                <div class="content">
			                    <p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor veroeros et feugiat.</p>
			                </div>
			            </a>
			        </article>
			        <article class="style4">
			            <span class="image">
			                <img src="images/pic04.jpg" alt=""/>
			            </span>
			            <a href="generic.html">
			                <h2>Tempus</h2>
			                <div class="content">
			                    <p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor veroeros et feugiat.</p>
			                </div>
			            </a>
			        </article>
			        <article class="style5">
			            <span class="image">
			                <img src="images/pic05.jpg" alt=""/>
			            </span>
			            <a href="generic.html">
			                <h2>Aliquam</h2>
			                <div class="content">
			                    <p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor veroeros et feugiat.</p>
			                </div>
			            </a>
			        </article>
			        <article class="style6">
			            <span class="image">
			                <img src="images/pic06.jpg" alt=""/>
			            </span>
			            <a href="generic.html">
			                <h2>Veroeros</h2>
			                <div class="content">
			                    <p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor veroeros et feugiat.</p>
			                </div>
			            </a>
			        </article>
			        <article class="style2">
			            <span class="image">
			                <img src="images/pic07.jpg" alt=""/>
			            </span>
			            <a href="generic.html">
			                <h2>Ipsum</h2>
			                <div class="content">
			                    <p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor veroeros et feugiat.</p>
			                </div>
			            </a>
			        </article>
			        <article class="style3">
			            <span class="image">
			                <img src="images/pic08.jpg" alt=""/>
			            </span>
			            <a href="generic.html">
			                <h2>Dolor</h2>
			                <div class="content">
			                    <p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor veroeros et feugiat.</p>
			                </div>
			            </a>
			        </article>
			        <article class="style1">
			            <span class="image">
			                <img src="images/pic09.jpg" alt=""/>
			            </span>
			            <a href="generic.html">
			                <h2>Nullam</h2>
			                <div class="content">
			                    <p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor veroeros et feugiat.</p>
			                </div>
			            </a>
			        </article>
			        <article class="style5">
			            <span class="image">
			                <img src="images/pic10.jpg" alt=""/>
			            </span>
			            <a href="generic.html">
			                <h2>Ultricies</h2>
			                <div class="content">
			                    <p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor veroeros et feugiat.</p>
			                </div>
			            </a>
			        </article>
			        <article class="style6">
			            <span class="image">
			                <img src="images/pic11.jpg" alt=""/>
			            </span>
			            <a href="generic.html">
			                <h2>Dictum</h2>
			                <div class="content">
			                    <p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor veroeros et feugiat.</p>
			                </div>
			            </a>
			        </article>
			        <article class="style4">
			            <span class="image">
			                <img src="images/pic12.jpg" alt=""/>
			            </span>
			            <a href="generic.html">
			                <h2>Pretium</h2>
			                <div class="content">
			                    <p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor veroeros et feugiat.</p>
			                </div>
			            </a>
			        </article>
			    </section>
			    </div>
			</div>
			</div>
			<script src="assets/js/jquery.min.js"></script>
			<!-- <script src="assets/js/browser.min.js"></script> -->
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script> 
</body>
</html>