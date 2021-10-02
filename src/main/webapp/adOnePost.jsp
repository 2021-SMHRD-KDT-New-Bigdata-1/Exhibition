<%@page import="DAO.adsaveDAO"%>
<%@page import="VO.adpostVO"%>
<%@page import="DAO.adpostDAO"%>
<%@page import="DAO.saveDAO"%>
<%@page import="VO.postVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.postDAO"%>
<%@page import="VO.membersVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
	<%
	//로그인 한 세션 받아오기
	membersVO vo = (membersVO) session.getAttribute("vo");
	
	//파라미터 받아오기
	//우선 all_posting에서 '게시물 보기'를 클릭했을 경우에만 실행됨
	
	int seq = 0;
	if(vo!=null){
		seq = Integer.parseInt(request.getParameter("seq"));
	}else{
		response.sendRedirect("login.jsp");
	}
	
	%>
	
<!DOCTYPE html>
<html>


<head>
<meta charset="EUC-KR">
<title>38℃ - <%=seq %>번째 글</title>
<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<script type="text/javascript"> (function() { var css = document.createElement('link'); css.href = 'https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'; css.rel = 'stylesheet'; css.type = 'text/css'; document.getElementsByTagName('head')[0].appendChild(css); })(); </script>
       <link rel="stylesheet" href="assets/css/app.css">
       <link rel="stylesheet" href="assets/css/theme.css">
		<link rel="stylesheet" href="assets/css/main.css" />
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
	</head>
	<body class="is-preload">
	
	<%
	//DB랑 연결해서 해당 시퀀스의 게시물 vo 받아오기 - DB랑 연결 안해도 될거같긴 한뎅.. 좋아요나 댓글 생각해서 연결했음!
	adpostDAO dao = new adpostDAO();
	ArrayList<adpostVO> list = dao.onepost(seq); //해당 시퀀스의 onepost 보기
	
	%>
	
	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Header -->
		<header id="header">
			<div class="line">

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
					      <a class="nav-link" href="date?int=1">SCHEDULE</a>
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
                                 <a class="nav-link" href="bookMark2.jsp"><span class="icon solid fa-bookmark"></span></a>
                                 </li>
                                 
                                 <li class="nav-item">
                                 <a class="nav-link" href="myPage.jsp"><span class="icon solid fa-user"></span></a>
                                 </li>
                              
                              <%}else{ %>
                              <!-- 로그인 안되어 있을 경우 다른 이벤트 넣기 -->
                              <li class="nav-item">
                                 <a class="nav-link" href="login.jsp"><span class="icon solid fa-bookmark"></span></a>
                                 </li>
                                 
                                 <li class="nav-item">
                                 <a class="nav-link" href="login.jsp"><span class="icon solid fa-user"></span></a>
                                 </li>
                              
                              
                              <%} %>
     
							   </ul>
							</div>
							</nav>

			</div>
		</header>

				

				<!-- Main -->
					<div id="main">
					
						<div class="line">
						<section class="psection">	
							<!-- 게시글 클릭했을 때 해당 게시글의 제목, 내용 등 출력 -->
							<%if(list!=null && vo!=null){%>
                        		<h2 class="myh2"><%=list.get(0).getAd_title() %></h2>
                        		<p class="postnick"><strong><%=list.get(0).getNick() %></strong></p>
                        		<hr class="my-hr3">
                        		
                        		<%for(int i =0; i<4; i++){ %>
                        		<%String f = list.get(0).getAd_img_name();
                       			 f.replaceAll("null", "");
                        		String[] img_name = f.split("\\|");
                           		if(!img_name[i].equals("null")){%>
                              <span class="image main"><img src="images/<%=img_name[i] %>" alt="" /></span>
                           <% }}%>
								<p><%=list.get(0).getContent() %></p>
								<p><b>
								#<%=list.get(0).getRegion() %><br>
								#<%=list.get(0).getGenre() %><br>
								#<%=list.get(0).getColor().replaceAll("[|]", " #") %></b></p>
							<%}else{
								
							}%>
							
							
								
							
								
							
							
							<%
							//좋아요 버튼 다르게
							String like_origin = dao.likeselect(seq);
							if(like_origin.contains(vo.getMB_nick())){%>
								<button class="like_btn"><%=list.get(0).getLike_cnt() %></button>
								<button class="like_btn" onclick='location.href="adlikePost2?seq=<%=seq%>&nick=<%=vo.getMB_nick()%>"' >
								<i class=" fas fa-thumbs-up fa-2x"></i></button>
							<%}else{%>
								<button class="like_btn"><%=list.get(0).getLike_cnt() %></button>
								<button class="like_btn" onclick='location.href="adlikePost2?seq=<%=seq%>&nick=<%=vo.getMB_nick()%>"' >
								<i class="far fa-thumbs-up fa-2x"></i></button>
							<%} %>
							
							
							<!-- 저장 버튼 클릭 시 saved_reviews에 해당 유저의 닉네임과 게시물시퀀스 추가-->
							<%
							//저장 버튼 다르게
							adsaveDAO adsdao = new adsaveDAO();
							if(adsdao.check(seq,vo.getMB_nick())==true){//이미 저장되어 있는경우%>
								<button class="bookmark_btn" onclick='location.href="addelsaveBookmark?seq=<%=seq%>&nick=<%=vo.getMB_nick()%>"' >
								<i class="fas fa-share-square fa-2x"></i></button>
							<%}else{%>
								<button class="bookmark_btn" onclick='location.href="adsaveBookmark?seq=<%=seq%>&nick=<%=vo.getMB_nick()%>"' >
								<i class="far fa-share-square fa-2x "></i></button>
							<%}%>
						
						</div>
						<br>
					<br>
					
					</section>
						<div class="line">
							<section class="psection">
							
								<h2 class="myh22">comment</h2>
								<%
								if(list.get(0).getAd_comment()!=null){
									String comm = list.get(0).getAd_comment();
									String[] commentlist = comm.split("\\|");
									for(int i = 0; i<commentlist.length; i++){%>
										<p><h5><%=commentlist[i]%></h5></p>
								<%}}%>
							
								
								<form method="post" action="adcommentCON?seq=<%=seq%>">
								<hr>
									<div class="fields">
										<div class="field">
											<textarea name="comment" id="message" placeholder="Leave a comment"></textarea>
										</div>
									</div>
									 <div align="right">
									 <input type="submit" value="Post Comment" class="like_btn" />
									 </div>
										
									
								</form>
							</section>
							
							<ul class="copyright">
								<li>&copy; 38℃ All rights reserved</li><br><br>
							</ul>
						</div>

			</div>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
</html>