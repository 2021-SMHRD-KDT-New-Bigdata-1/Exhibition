<%@page import="VO.postVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.postDAO"%>
<%@page import="VO.membersVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
	<%
	//稽益昔 廃 室芝 閤焼神奄
	membersVO vo = (membersVO) session.getAttribute("vo");
	
	//督虞耕斗 閤焼神奄
	//酔識 all_posting拭辞 '惟獣弘 左奄'研 適遣梅聖 井酔拭幻 叔楳喫
	
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
<title>38” - <%=seq %>腰属 越</title>
<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
	</head>
	<body class="is-preload">
	
	<%
	//DB櫛 尻衣背辞 背雁 獣碇什税 惟獣弘 vo 閤焼神奄 - DB櫛 尻衣 照背亀 吃暗旭延 廃記.. 疏焼推蟹 奇越 持唖背辞 尻衣梅製!
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
						src="images/logo.svg" alt="" /></span><span class="title">38”</span>
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
						<!-- 社醤艦 髪特 ぞぞぞぞぞぞ -->
						<!-- <li><a href="#">戚硯4</a></li> -->
						<!-- 琶推蒸生檎 鯵呪 走趨亀 喫 -->
					</ul>
						<%if(vo!=null){ %>
										<a href="bookMark.jsp" class="btn_c"><img src="images/bookmark.svg" alt=""/></span>
											<span class="title"></span></a>
										<a href="myPage.jsp" class="btn_d"><img src="images/user.svg" alt=""/></span>
											<span class="title"></span></a>
										<%}else{ %>
										<!-- 稽益昔 照鞠嬢 赤聖 井酔 陥献 戚坤闘 隔奄 -->
										
										<a href="bookMark.jsp" class="btn_c"><img src="images/bookmark.svg" alt=""/></a>
										<a href="login.jsp" class="btn_d"><img src="images/user.svg" alt=""/></a>
										
										<%} %>
				</nav>

			</div>
		</header>

				

				<!-- Main -->
					<div id="main">
						<div class="inner">
							<!-- 惟獣越 適遣梅聖 凶 背雁 惟獣越税 薦鯉, 鎧遂 去 窒径 -->
							<%if(list!=null && vo!=null){%>
								<h1>TITLE:<%=list.get(0).getTitle() %></h1>
								<p>WRITER:<%=list.get(0).getNick() %></p>
								<span class="image main"><img src="images/pic13.jpg" alt="" /></span>
								<p>CONTENT:<%=list.get(0).getContent() %></p>
							<%}else{
								
							}%>
							<div id="like_btn"><button onclick='location.href="likePost?seq=<%=seq %>"'>疏焼推</button><%=list.get(0).getCnt() %></div>
							
							<!-- 煽舌 獄動 適遣 獣 saved_reviews拭 背雁 政煽税 莞革績引 惟獣弘獣碇什 蓄亜-->
							<div id="bookmark_btn"><button onclick='location.href="saveBookmark?seq=<%=seq%>&nick=<%=vo.getMB_nick()%>"'>煽舌馬奄</button></div>
							<!-- 煽舌鞠檎 '煽舌鞠醸柔艦陥' alert襟亀系 竺舛 -->
						
						</div>
					</div>

				<!-- Footer -->
					<footer id="footer">
						<div class="inner">
							<section>
								<h2>奇越</h2>
								<%
								if(list.get(0).getComment()!=null){
									String comm = list.get(0).getComment();
									String[] commentlist = comm.split("\\|");
									for(int i = 0; i<commentlist.length; i++){%>
										<p><%=commentlist[i]%></p>
								<%}}%>
							
								
								<form method="post" action="commentCON?seq=<%=seq%>">
									<div class="fields">
										<div class="field">
											<textarea name="comment" id="message" placeholder="comment"></textarea>
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