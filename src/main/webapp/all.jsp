<%@page import="VO.postVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.postDAO"%>
<%@page import="VO.membersVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>38℃ - All Post</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="assets/css/main.css" />
</head>
 <body class="is-preload">
    <%
    //로그인 한 세션 받아오기
    membersVO vo = (membersVO)session.getAttribute("vo");
    postDAO dao = new postDAO();
	ArrayList<postVO> list = dao.allpost();
	request.setCharacterEncoding("euc-kr");
	
    
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
								<a href="Main.jsp" class="logo">
									<span class="symbol"><img src="images/logo.svg" alt="" /></span><span class="title">38℃</span>
								</a>

							
									<nav id="nav">
										<ul>
											<li class="current"><a href="Main.jsp">HOME</a></li>
											<li><a href="sched.jsp">SCHEDULE</a></li>
											<li><a href="all.jsp">ALL POST</a></li>
											
											<%if(vo!=null){ %>
											<!-- <li><a href="posting.jsp">POST</a></li>-->
											<li><a href="summernote.jsp">POSTING</a></li>
											<%}else{ %>
											<li><a href="login.jsp">POSTING</a></li>
											<%} %>
											
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
					
			

							<!-- Main -->
							<div id="main">
							    <div class="inner">
							    	<div class="table-wrapper">
									<div class="field">
									<form action = "tagpost">
										<table>
										<colgroup>

										<col style="width:20%;">
										
										<col style="width:80%;">
										
										</colgroup>
											<tr>
												<td><strong>지역별 태그</strong></td>
												<td>
													<input type="checkbox" name="region" value="" id="region1"  onclick=CountChecked(this)>
													<label for="region1">전체지역</label>
													<input type="checkbox" name="region" value="Seoul" id="region2" onclick=CountChecked(this)>
													<label for="region2">서울</label> 
													<input type="checkbox" name="region" value="Gyeonggi" id="region3" onclick=CountChecked(this)>
													<label for="region3">경기</label> 
													<input type="checkbox" name="region" value="Gangwon" id="region4" onclick=CountChecked(this)>
													<label for="region4">강원</label>
													<input type="checkbox" name="region" value="Daejeon" id="region5" onclick=CountChecked(this)> 
													<label for="region5">대전</label> 
													<input type="checkbox" name="region" value="Daegu" id="region6" onclick=CountChecked(this)>
													<label for="region6">대구</label> 
													<input type="checkbox" name="region" value="Busan" id="region7" onclick=CountChecked(this)> 
													<label for="region7">부산</label> 
													<input type="checkbox" name="region" value="Gwangju" id="region8" onclick=CountChecked(this)> 
													<label for="region8">광주</label>
													<input type="checkbox" name="region" value="Ulsan" id="region9" onclick=CountChecked(this)> 
													<label for="region9">울산</label> 
													<input type="checkbox" name="region" value="Incheon" id="region10" onclick=CountChecked(this)>
													<label for="region10">인천</label> 
													<input type="checkbox" name="region" value="Jeju" id="region11" onclick=CountChecked(this)> 
													<label for="region11">제주</label> 
													<input type="checkbox" name="region" value="Chungnam" id="region12" onclick=CountChecked(this)> 
													<label for="region12">충남</label> 
													<input type="checkbox" name="region" value="Chungbuk" id="region13" onclick=CountChecked(this)> 
													<label for="region13">충북</label> 
													<input type="checkbox" name="region" value="Gyeongnam" id="region14" onclick=CountChecked(this)> 
													<label for="region14">경남</label> 
													<input type="checkbox" name="region" value="Kyeongbuk" id="region15" onclick=CountChecked(this)> 
													<label for="region15">경북</label> 
													<input type="checkbox" name="region" value="Jeonnam" id="region16" onclick=CountChecked(this)> 
													<label for="region16">전남</label> 
													<input type="checkbox" name="region" value="Jeonbuk" id="region17" onclick=CountChecked(this)>
													<label for="region17">전북</label>
												</td>
											</tr>	
											<tr>
												<td><strong>장르별 태그</strong></td>
												<td>
													<input type="checkbox" name="genre" value="AllGenre" id="genre0" onclick=CountChecked(this)>
													<label for="genre0">All Genre</label> 
													<input type="checkbox" name="genre" value="Western" id="genre1" onclick=CountChecked(this)>
													<label for="genre1">서양화</label> 
													<input type="checkbox" name="genre" value="Oriental" id="genre2" onclick=CountChecked(this)>
													<label for="genre2">동양화</label> 
													<input type="checkbox" name="genre" value="Design" id="genre3" onclick=CountChecked(this)>
													<label for="genre3">디자인</label>
													<input type="checkbox" name="genre" value="Installation" id="genre4" onclick=CountChecked(this)>
													<label for="genre4">설치미술</label> 
													<input type="checkbox" name="genre" value="Formative" id="genre5" onclick=CountChecked(this)>
													<label for="genre5">조형미술</label> 
													<input type="checkbox" name="genre" value="Crafts" id="genre6" onclick=CountChecked(this)>
													<label for="genre6">공예</label>
													<input type="checkbox" name="genre" value="Architecture" id="genre7" onclick=CountChecked(this)>
													<label for="genre7">건축</label> 
													<input type="checkbox" name="genre" value="Picture" id="genre8" onclick=CountChecked(this)>
													<label for="genre8">사진</label> 
													<input type="checkbox" name="genre" value="Hands-on" id="genre9" onclick=CountChecked(this)>
													<label for="genre9">체험형</label>
												</td>
											</tr>
											<tr>
												<td><strong>색감별(분위기) 태그</strong></td>
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
											<input type="checkbox" name="color" value="Lightgray" id="color13" onclick=CountChecked(this)>
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
													</td>
												</tr>
											</table>
											<div align="right"><input type="submit" value="검색" id="search_btn"></div>
											
										</form>
										</div>
										</div>
										
		<div class="table-wrapper">
		<table>
		<tr>
			<td><strong>게시물번호</strong></td>
			<td><strong>내용</strong></td>
			<td><strong>좋아요</strong></td>
			<td><strong>작성자</strong></td>
			<td><strong>제목</strong></td>
			<td><strong>지역</strong></td>
			<td><strong>장르</strong></td>
			<td><strong>색감</strong></td>
		</tr>
		
		<%
		for(int i = 0; i<list.size(); i++){
			String region = list.get(i).getRegion_tag();
			String[] region_tag = region.split("\\|");
			String genre = list.get(i).getGenre_tag();
			String[] genre_tag = genre.split("\\|");
			String color = list.get(i).getColor_tag();
			String[] color_tag = color.split("\\|");
			
			//region.replace(String.valueOf('|'),"");
			%>
			<tr onclick="location.href='onepost.jsp?seq=<%=list.get(i).getSeq()%>'" style="cursor:pointer;">
			
			<%
			out.print("<td>"+list.get(i).getSeq()+"</td>");
			out.print("<td>"+list.get(i).getContent()+"</td>");
			out.print("<td>"+list.get(i).getCnt()+"</td>");
			out.print("<td>"+list.get(i).getNick()+"</td>");
			out.print("<td>"+list.get(i).getTitle()+"</td>");
			out.print("<td>");
			if(dao.count(region,'|')!=0){
				for(int j =0; j<region_tag.length; j++){
					out.print(region_tag[j]);
					}
			
			out.print("</td>");
			}else{
				out.print(region+"</td>");
			}
			out.print("<td>");
			if(dao.count(genre,'|')!=0){
				for(int j =0; j<genre_tag.length; j++){
					out.print(genre_tag[j]);
					}
			
			out.print("</td>");
			}else{
				out.print(genre+"</td>");
			}
			
			out.print("<td>");
			if(dao.count(color,'|')!=0){
				for(int j =0; j<color_tag.length; j++){
					out.print(color_tag[j]);
					}
			
			out.print("</td>");
			}else{
				out.print(color+"</td>");
			}
			//out.print("<td>"+list.get(i).getGenre_tag()+"</td>");
			//out.print("<td>"+list.get(i).getColor_tag()+"</td>");
			%>
			
			<!-- 게시물보기 버튼 삭제하고 tr자체 클릭 시 onepost로 가도록 설정했음, tr태그의 onclick속성 참고 -->
			<!-- <td><a href="onepost.jsp?seq=<'%=list.get(i).getSeq()%>">게시물 보기</a></td> -->
			<!-- tr에 커서 올리면 모양 바뀌게 설정??? 어떻게 하더랑 -->
			
			<%
			out.print("</tr>");
		} %>
	</table>
										</div>
										
        
			    <section class="tiles">
			        <article class="style1">
			            <span class="image">
			                <img src="images/pic01.jpg" alt=""/>
			            </span>
			            
			            <a href="onepost.jsp">
			                <h2>Magna</h2>
			                <div class="content">
			                    <p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor veroeros et feugiat.</p>
			                </div>
			               
			            </a>
			        </article>
			       <!--  <article class="style2">
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
			        </article>-->
			    </section>
			    </div>
			</div>
			</div>
			<script src="assets/js/jquery.min.js"></script>
			<!-- <script src="assets/js/browser.min.js"></script> -->
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