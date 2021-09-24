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
		<link rel="stylesheet" href="assets/css/main.css" />
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
	</head>
	<body class="is-preload">
	
	<%
	//DB랑 연결해서 해당 시퀀스의 게시물 vo 받아오기 - DB랑 연결 안해도 될거같긴 한뎅.. 좋아요나 댓글 생각해서 연결했음!
	postDAO dao = new postDAO();
	ArrayList<postVO> list = dao.onepost(seq);
		
	
	%>

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Header -->
		<header id="header">
			<div class="inner">

				<!-- Logo -->
				<a href="Main.jsp" class="logo"> <span class="symbol"><img
						src="images/logo.svg" alt="" /></span><span class="title">38℃</span>
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

				

				<!-- Main -->
					<div id="main">
						<div class="inner">
							<!-- 게시글 클릭했을 때 해당 게시글의 제목, 내용 등 출력 -->
							<%if(list!=null && vo!=null){%>
								<h1>TITLE:<%=list.get(0).getTitle() %></h1>
								<p>WRITER:<%=list.get(0).getNick() %></p>
								<span class="image main"><img src="images/pic13.jpg" alt="" /></span>
								<p>CONTENT:<%=list.get(0).getContent() %></p>
							<%}else{
								
							}%>
							<div id="like_btn"><button onclick='location.href="likePost?seq=<%=seq %>"'>좋아요</button><%=list.get(0).getCnt() %></div>
							
							<!-- 저장 버튼 클릭 시 saved_reviews에 해당 유저의 닉네임과 게시물시퀀스 추가-->
							<div id="bookmark_btn"><button onclick='location.href="saveBookmark?seq=<%=seq%>&nick=<%=vo.getMB_nick()%>"'>저장하기</button></div>
							<!-- 저장되면 '저장되었습니다' alert뜨도록 설정 -->
						
						</div>
					</div>

				<!-- Footer -->
					<footer id="footer">
						<div class="inner">
							<section>
								<h2>댓글 작성</h2>
								<form method="post" action="#">
									<div class="fields">
										<div class="field">
											<textarea name="message" id="message" placeholder="Message"></textarea>
										</div>
									</div>
									<ul class="actions">
										<li><input type="submit" value="Send" class="primary" /></li>
									</ul>
								</form>
							</section>
							<section>
								<h2>Follow</h2>
								<ul class="icons">
									<li><a href="#" class="icon brands style2 fa-twitter"><span class="label">Twitter</span></a></li>
									<li><a href="#" class="icon brands style2 fa-facebook-f"><span class="label">Facebook</span></a></li>
									<li><a href="#" class="icon brands style2 fa-instagram"><span class="label">Instagram</span></a></li>
									<li><a href="#" class="icon brands style2 fa-dribbble"><span class="label">Dribbble</span></a></li>
									<li><a href="#" class="icon brands style2 fa-github"><span class="label">GitHub</span></a></li>
									<li><a href="#" class="icon brands style2 fa-500px"><span class="label">500px</span></a></li>
									<li><a href="#" class="icon solid style2 fa-phone"><span class="label">Phone</span></a></li>
									<li><a href="#" class="icon solid style2 fa-envelope"><span class="label">Email</span></a></li>
								</ul>
							</section>
							<ul class="copyright">
								<li>&copy; Untitled. All rights reserved</li><li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
							</ul>
						</div>
					</footer>

			</div>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
</html>