<%@page import="DAO.adpostDAO"%>
<%@page import="VO.adpostVO"%>
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
<title>38℃ - Selected Post</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript"> (function() { var css = document.createElement('link'); css.href = 'https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'; css.rel = 'stylesheet'; css.type = 'text/css'; document.getElementsByTagName('head')[0].appendChild(css); })(); </script>
    	<link rel="stylesheet" href="assets/css/app.css">
    	<link rel="stylesheet" href="assets/css/theme.css">
<link rel="stylesheet" href="assets/css/main.css" />
</head>
 <body class="is-preload">
    <%
    //로그인 한 세션 받아오기
    membersVO vo = (membersVO)session.getAttribute("vo");
    postDAO pdao = new postDAO();
    adpostDAO adao = new adpostDAO();
	request.setCharacterEncoding("euc-kr");

	
	ArrayList<postVO> list = (ArrayList<postVO>)session.getAttribute("list"); //일반포스팅만 받아왔는데..
	
	//광고게시물도 search결과에 포함되도록 하기
	ArrayList<adpostVO> adlist = (ArrayList<adpostVO>)session.getAttribute("adlist");

	
    %>
    
    
        <!-- Wrapper -->
        <div id="wrapper">

            	<!-- Header -->
					<header id="header">
						<div class="inner">

							<!-- Logo -->
								<nav class="navbar navbar-expand-lg navbar-light bg-white fixed-top">
					<a class="navbar-brand font-weight-bolder mr-3" href="Main.jsp"><img src="images/logo.png" width="5%" id="logoima"></a>
					<button class="navbar-light navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsDefault" aria-controls="navbarsDefault" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarsDefault">
					   <ul class="navbar-nav mr-auto align-items-center">
					      <form class="bd-search hidden-sm-down">
					         <div class="dropdown-menu bd-search-results" id="search-results">
					         </div>
					      </form>
					   </ul>
					   <ul class="navbar-nav ml-auto align-items-center">
					      <li class="nav-item">
					      <a class="nav-link active" href="Main.jsp">HOME</a>
					      </li>
					      <li class="nav-item">
					      <a class="nav-link" href="sched.jsp">SCHEDULE</a>
					      </li>
					      <li class="nav-item">
					      <a class="nav-link" href="all.jsp">SEARCH</a>
					      </li>
					      <%if(vo!=null){ %>
					      <li class="nav-item">
					      <a class="nav-link" href="summernote.jsp">POSTING</a>
					      </li>
					      <%}else{ %>
					      <li class="nav-item">
					      <a class="nav-link" href="summernote.jsp">POSTING</a>
					      </li>
					      
					       <%} %>
                        <%if(vo!=null){ %>
                                 <li class="nav-item">
                                 <a class="nav-link" href="bookMark.jsp"><span class="icon solid fa-bookmark"></span></a>
                                 </li>
                                 
                                 <li class="nav-item">
                                 <a class="nav-link" href="myPage.jsp"><span class="icon solid fa-user"></span></a>
                                 </li>
                              
                              <%}else{ %>
                              <!-- 로그인 안되어 있을 경우 다른 이벤트 넣기 -->
                              <li class="nav-item">
                                 <a class="nav-link" href="login2.jsp"><span class="icon solid fa-bookmark"></span></a>
                                 </li>
                                 
                                 <li class="nav-item">
                                 <a class="nav-link" href="login2.jsp"><span class="icon solid fa-user"></span></a>
                                 </li>
                              
                              
                              <%} %>
     
							   </ul>
							</div>
							</nav>
								
								
						</div>
					</header>
					<%if(vo!=null){ %>
   		<%=vo.getMB_nick() %> 님 어서오세영
   	<%}else{ %>
   	로그인하세요
   	<%} %>
			

							<!-- Main -->
							<div id="main">
							    <div class="inner">
							    	<div class="table-wrapper">
									<div class="field">
									<form action = "SearchCon">
										<table>
										
										<colgroup>

										<col style="width:20%;">
										
										<col style="width:80%;">
										
										</colgroup>
											<tr>
												<td><strong>지역별 태그</strong></td>
												<td>
													<input type="checkbox" name="region" value="Seoul|Gyeonggi|Gangwon|Daejeon|Daegu|Busan|Gwangju|Ulsan|Incheon|Jeju|Chungnam|Chungbuk|Gyeongnam|Kyeongbuk|Jeonnam|Jeonbuk" id="region1">
													<label for="region1">전체지역</label>
													<input type="checkbox" name="region" value="Seoul" id="region2">
													<label for="region2">서울</label> 
													<input type="checkbox" name="region" value="Gyeonggi" id="region3">
													<label for="region3">경기</label> 
													<input type="checkbox" name="region" value="Gangwon" id="region4" >
													<label for="region4">강원</label>
													<input type="checkbox" name="region" value="Daejeon" id="region5"> 
													<label for="region5">대전</label> 
													<input type="checkbox" name="region" value="Daegu" id="region6" >
													<label for="region6">대구</label> 
													<input type="checkbox" name="region" value="Busan" id="region7" > 
													<label for="region7">부산</label> 
													<input type="checkbox" name="region" value="Gwangju" id="region8" > 
													<label for="region8">광주</label>
													<input type="checkbox" name="region" value="Ulsan" id="region9" > 
													<label for="region9">울산</label> 
													<input type="checkbox" name="region" value="Incheon" id="region10" >
													<label for="region10">인천</label> 
													<input type="checkbox" name="region" value="Jeju" id="region11" > 
													<label for="region11">제주</label> 
													<input type="checkbox" name="region" value="Chungnam" id="region12" > 
													<label for="region12">충남</label> 
													<input type="checkbox" name="region" value="Chungbuk" id="region13" > 
													<label for="region13">충북</label> 
													<input type="checkbox" name="region" value="Gyeongnam" id="region14" > 
													<label for="region14">경남</label> 
													<input type="checkbox" name="region" value="Kyeongbuk" id="region15" > 
													<label for="region15">경북</label> 
													<input type="checkbox" name="region" value="Jeonnam" id="region16" > 
													<label for="region16">전남</label> 
													<input type="checkbox" name="region" value="Jeonbuk" id="region17" >
													<label for="region17">전북</label>
												</td>
											</tr>
											
											<tr>
												<td><strong>장르별 태그</strong></td>
												<td>
													<input type="checkbox" name="genre" value="Western|Oriental|Design|Installation|Formative|Crafts|Architecture|Picture|Hands-on" id="genre0">
													<label for="genre0">모든 장르</label>
													<input type="checkbox" name="genre" value="Western" id="genre1">
													<label for="genre1">서양화</label> 
													<input type="checkbox" name="genre" value="Oriental" id="genre2">
													<label for="genre2">동양화</label> 
													<input type="checkbox" name="genre" value="Design" id="genre3" >
													<label for="genre3">디자인</label>
													<input type="checkbox" name="genre" value="Installation" id="genre4">
													<label for="genre4">설치미술</label> 
													<input type="checkbox" name="genre" value="Formative" id="genre5" >
													<label for="genre5">조형미술</label> 
													<input type="checkbox" name="genre" value="Crafts" id="genre6">
													<label for="genre6">공예</label>
													<input type="checkbox" name="genre" value="Architecture" id="genre7" >
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
											<input type="checkbox" name="color" value="White|Black|Gray|Brown|Beige|Green|Blue|Purple|Yellow|Pink|Red|Ivory|LightGray|Khaki|Mint|NeonGreen|Olive|Navy|SkyBlue|Lavender|Mustard|DeepRed" id="color0">
											<label for="color0">ALL COLOR</label>
											<input type="checkbox" name="color" value="White" id="color1" >
											<label for="color1">White</label> 
											<input type="checkbox" name="color" value="Black" id="color2"  >
											<label for="color2">Black</label> 
											<input type="checkbox" name="color" value="Gray" id="color3"  >
											<label for="color3">Gray</label> 
											<input type="checkbox" name="color" value="Brown" id="color4"  >
											<label for="color4">Brown</label>
											<input type="checkbox" name="color" value="Beige" id="color5"  >
											<label for="color5">Beige</label> 
											<input type="checkbox" name="color" value="Green" id="color6"  >
											<label for="color6">Green</label> 
											<input type="checkbox" name="color" value="Blue" id="color7"  >
											<label for="color7">Blue</label> 
											<input type="checkbox" name="color" value="Purple" id="color8"  >
											<label for="color8">Purple</label>
											<input type="checkbox" name="color" value="Yellow" id="color9"  >
											<label for="color9">Yellow</label> 
											<input type="checkbox" name="color" value="Pink" id="color10"  >
											<label for="color10">Pink</label> 
											<input type="checkbox" name="color" value="Red" id="color11"  >
											<label for="color11">Red</label> 
											<input type="checkbox" name="color" value="Ivory" id="color12" >
											<label for="color12">Ivory</label>
											<input type="checkbox" name="color" value="LightGray" id="color13" onclick=CountChecked(this)>
											<label for="color13">Light Gray</label>
											<input type="checkbox" name="color" value="Khaki" id="color14" >
											<label for="color14">Khaki</label> 
											<input type="checkbox" name="color" value="Mint" id="color15" >
											<label for="color15">Mint</label> 
											<input type="checkbox" name="color" value="NeonGreen" id="color16" onclick=CountChecked(this)>
											<label for="color16">Neon Green</label> 
											<input type="checkbox" name="color" value="Olive" id="color17" >
											<label for="color17">Olive</label> 
											<input type="checkbox" name="color" value="Navy" id="color18" >
											<label for="color18">Navy</label> 
											<input type="checkbox" name="color" value="SkyBlue" id="color19" onclick=CountChecked(this)>
											<label for="color19">Sky Blue</label> 
											<input type="checkbox" name="color" value="Lavender" id="color20" >
											<label for="color20">Lavender</label> 
											<input type="checkbox" name="color" value="Mustard" id="color21" >
											<label for="color21">Mustard</label> 
											<input type="checkbox" name="color" value="DeepRed" id="color22" onclick=CountChecked(this)>
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
		//광고게시물
			for(int i = 0; i<adlist.size(); i++){
				String region1 = adlist.get(i).getRegion();
				String[] region_tag1 = region1.split("\\|");
				String genre1 = adlist.get(i).getGenre();
				String[] genre_tag1 = genre1.split("\\|");
				String color1 = adlist.get(i).getColor();
				String[] color_tag1 = color1.split("\\|");
				
				//region.replace(String.valueOf('|'),"");
				%>
				<tr onclick="location.href='adOnePost.jsp?seq=<%=adlist.get(i).getSeq()%>'" style="cursor:pointer;">
				
				<%
				out.print("<td>"+adlist.get(i).getSeq()+"</td>");
				out.print("<td>"+adlist.get(i).getContent()+"</td>");
				out.print("<td>"+adlist.get(i).getLike_cnt()+"</td>");
				out.print("<td>"+adlist.get(i).getNick()+"</td>");
				out.print("<td>"+adlist.get(i).getAd_title()+"</td>");
				out.print("<td>");
				if(adao.count(region1,'|')!=0){
					for(int j =0; j<region_tag1.length; j++){
						out.print(region_tag1[j]);
						}
				
				out.print("</td>");
				}else{
					out.print(region1+"</td>");
				}
				out.print("<td>");
				if(pdao.count(genre1,'|')!=0){
					for(int j =0; j<genre_tag1.length; j++){
						out.print(genre_tag1[j]);
						}
				
				out.print("</td>");
				}else{
					out.print(genre1+"</td>");
				}
					
				out.print("<td>");
				if(pdao.count(color1,'|')!=0){
					for(int j =0; j<color_tag1.length; j++){
						out.print(color_tag1[j]);
						}
				
				out.print("</td>");
				}else{
					out.print(color1+"</td>");
				}
				out.print("</tr>");}
		
		//일반게시물
		for(int i = 0; i<list.size(); i++){
			String region = list.get(i).getRegion_tag();
			String[] region_tag = region.split("\\|");
			String genre = list.get(i).getGenre_tag();
			String[] genre_tag = genre.split("\\|");
			String color = list.get(i).getColor_tag();
			String[] color_tag = color.split("\\|");
			
			//region.replace(String.valueOf('|'),"");
			
			out.print("<tr>");
			out.print("<td>"+list.get(i).getSeq()+"</td>");
			out.print("<td>"+list.get(i).getContent()+"</td>");
			out.print("<td>"+list.get(i).getCnt()+"</td>");
			out.print("<td>"+list.get(i).getNick()+"</td>");
			out.print("<td>"+list.get(i).getTitle()+"</td>");
			out.print("<td>");
			if(pdao.count(region,'|')!=0){
				for(int j =0; j<region_tag.length; j++){
					out.print(region_tag[j]);
					}
			
			out.print("</td>");
			}else{
				out.print(region+"</td>");
			}
			out.print("<td>");
			
			if(pdao.count(genre,'|')!=0){
				for(int j =0; j<genre_tag.length; j++){
					out.print(genre_tag[j]);
					}
			
			out.print("</td>");
			
			}else{
				out.print(genre+"</td>");
			}
			out.print("<td>");
			
			if(pdao.count(color,'|')!=0){
				for(int j =0; j<color_tag.length; j++){
					out.print(color_tag[j]);
					}
			
			out.print("</td>");
			}else{
				out.print(color+"</td>");
			}
			//out.print("<td>"+list.get(i).getGenre_tag()+"</td>");
			//out.print("<td>"+list.get(i).getColor_tag()+"</td>");
			out.print("</tr>");
		} %>
	</table>
	</div>
	<section class="tiles">
		<!-- 광고게시물 그리드 -->
		<%for(int i = 0;i<adlist.size();i++){ %>
    	<%
    	String f = adlist.get(i).getAd_img_name();
    	f.replaceAll("null", "");
    	String[] ad_img_nm = f.split("\\|");
    	%>
    	<%
    	for(int j = 0; j<4;j++){
    	%>
			<%if(!ad_img_nm[j].equals("null")){ %>
        <article class="style1">
            <span class="image">
                <img src="images/<%=ad_img_nm[j]%>" alt=""/>
            </span>
            <%if(vo!=null){ %>
            <a href="adOnePost.jsp?seq=<%=adlist.get(i).getSeq() %>"><!-- 쿼리스트링으로 seq 같이 넘기기 -->
             <%}else{ %>
            <a href="login2.jsp">
            <%} %>
            <h2><%=adlist.get(i).getAd_title()%></h2>
                <div class="content">
                    <p><%=adlist.get(i).getNick() %></p>
                </div>
            </a>
        </article>
        <%j=3;}}%>
        <%} %>
		
		
		<!-- 일반게시물 그리드 -->
		<%for(int i = 0;i<list.size();i++){ %>
    	<%
    	String f = list.get(i).getImg_name();
    	f.replaceAll("null", "");
    	String[] img_nm = f.split("\\|");
    	%>
    	<%
    	for(int j = 0; j<4;j++){
    	%>
			<%if(!img_nm[j].equals("null")){ %>
        <article class="style1">
            <span class="image">
                <img src="images/<%=img_nm[j]%>" alt=""/>
            </span>
            <%if(vo!=null){ %>
            <a href="onepost.jsp?seq=<%=list.get(i).getSeq() %>"><!-- 쿼리스트링으로 seq 같이 넘기기 -->
                <h2><%=list.get(i).getTitle()%></h2>
                <div class="content">
                    <p>writer :<%=list.get(i).getNick() %></p>
                </div>
            </a>
             <%}else{ %>
            <a href="login2.jsp">
            <h2><%=list.get(i).getTitle()%></h2>
                <div class="content">
                    <p><%=list.get(i).getNick() %></p>
                </div>
            </a>
            <%} %>
        </article>
        <%j=3;}}%>
        <%} %>
			      
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
			var maxChecked1 = 3;
			var totalChecked1 = 0;
			var maxChecked2 = 3;
			var totalChecked2 = 0;
			var maxChecked3 = 3;
			var totalChecked3 = 0;
			// 설정 끝
			
			/*function CountChecked(field) {
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
				}*/
			
			 $('input[type="checkbox"][name="region"]').click(function(){
 
 				 if($(this).prop('checked'))
 					 totalChecked1 +=1;
 				 else
 					 totalChecked1 -=1;
 				 
 				 if(totalChecked1 > maxChecked1){
 					 alert("최대 3개까지 선택 가능합니다.");
 					 $(this).prop('checked', false);
 					 totalChecked1 -=1;
 					 
 				 }});
				
 				
 				
			 $('input[type="checkbox"][name="color"]').click(function(){
 
 				 if($(this).prop('checked'))
 					 totalChecked2 +=1;
 				 else
 					 totalChecked2 -=1;
 				 
 				 if(totalChecked2 > maxChecked2){
 					 alert("최대 3개까지 선택 가능합니다.");
 					 $(this).prop('checked', false);
 					 totalChecked2 -=1;
 					 
 				 }});
 				
			 $('input[type="checkbox"][name="genre"]').click(function(){
 
 				 if($(this).prop('checked'))
 					 totalChecked3 +=1;
 				 else
 					 totalChecked3 -=1;
 				 
 				 if(totalChecked3 > maxChecked3){
 					 alert("최대 3개까지 선택 가능합니다.");
 					 $(this).prop('checked', false);
 					 totalChecked3 -=1;
 					 
 				 }});
 				
  
  		 
			</script>
			<script src="assets/js/app.js"></script>
<script src="assets/js/theme.js"></script>
</body>
</html>