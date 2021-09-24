<%@page import="VO.saveVO"%>
<%@page import="DAO.saveDAO"%>
<%@page import="VO.postVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.postDAO"%>
<%@page import="VO.membersVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
	<%
    //로그인 한 세션 받아오기
    membersVO vo = (membersVO)session.getAttribute("vo");
    saveDAO sdao = new saveDAO();
	ArrayList<saveVO> list = sdao.savepostselect(vo.getMB_nick());
	
	
	//현재 vo nick의 rv_num만 받아와서 그 게시물들은 post_reviews에서 출력.미친
	%>
	<%
	postDAO pdao = new postDAO();
	%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>38℃ - <%=vo.getMB_nick() %>의 저장된 게시물</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="assets/css/main.css" />
</head>
<body>
	<!-- <h1>북마크 페이지</h1> -->
   	<!-- Wrapper -->
    <%if(vo!=null){ %>
   		<%=vo.getMB_nick() %> 님 어서오세영~~~ 저장된 게시물 페이지임당~~~
   	<%}%>
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
											<li><a href="summernote.jsp">POSTING</a></li>
											
											
										</ul>
										
										<a href="bookMark.jsp" class="btn_c"><img src="images/bookmark.svg" alt=""/></span>
											<span class="title"></span></a>
										<a href="myPage.jsp" class="btn_d"><img src="images/user.svg" alt=""/></span>
											<span class="title"></span></a>
										
									</nav>
								
								
						</div>
					</header>
					<div id="main">
					<div class="inner">
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
			<tr onclick="location.href='saveOnePost.jsp?seq=<%=list.get(i).getSeq()%>'">
			
			<%
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
			%>
			
			<!-- 게시물보기 버튼 삭제하고 tr자체 클릭 시 onepost로 가도록 설정했음, tr태그의 onclick속성 참고 -->
			<!-- <td><a href="onepost.jsp?seq=<'%=list.get(i).getSeq()%>">게시물 보기</a></td> -->
			<!-- tr에 커서 올리면 모양 바뀌게 설정??? 어떻게 하더랑 -->
			
			<%
			out.print("</tr>");
		} %>
	</table>
					</div>
					</div>
					</div>
					
					
	</div>
</body>
</html>