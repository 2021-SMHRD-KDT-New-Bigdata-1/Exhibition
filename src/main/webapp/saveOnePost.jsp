<%@page import="DAO.saveDAO"%>
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
<title>38�� - Saved Posts</title>
<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
	</head>
	<body class="is-preload">
	<%
	//�α��� �� ���� �޾ƿ���
	membersVO vo = (membersVO) session.getAttribute("vo");
	
	//�Ķ���� �޾ƿ���
	//�켱 all_posting���� '�Խù� ����'�� Ŭ������ ��쿡�� �����
	
	int seq = Integer.parseInt(request.getParameter("seq"));
	%>
	<%=seq %>
	
	<%
	//DB�� �����ؼ� �ش� �������� �Խù� vo �޾ƿ��� - DB�� ���� ���ص� �ɰŰ��� �ѵ�.. ���ƿ䳪 ��� �����ؼ� ��������!
	postDAO dao = new postDAO();
	ArrayList<postVO> list = dao.onepost(seq);
		
	%>
	<%
	//�޸� ���� �޾ƿ��� - ���� ���� �ٸ� ��� �����ϱ�......................�׳� ��񿡼� ��������...
	//String memo = (String)session.getAttribute("memo");
	saveDAO sdao = new saveDAO();
	String memo = sdao.memoSelect(seq, vo.getMB_nick());
	%>

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Header -->
		<header id="header">
			<div class="inner">

				<!-- Logo -->
				<a href="Main.jsp" class="logo"> <span class="symbol"><img
						src="images/logo.svg" alt="" /></span><span class="title">38��</span>
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
						<li><a href="posting.jsp">POSTING</a></li>
						<%
						} else {
						%>
						<li><a href="login.jsp">POSTING</a></li>
						<%
						}
						%>
						<!-- �Ҿߴ� ȱ�� ������������ -->
						<!-- <li><a href="#">�̸�4</a></li> -->
						<!-- �ʿ������ ���� ������ �� -->
					</ul>
						<%if(vo!=null){ %>
										<a href="bookMark.jsp" class="btn_c"><img src="images/bookmark.svg" alt=""/></span>
											<span class="title"></span></a>
										<a href="myPage.jsp" class="btn_d"><img src="images/user.svg" alt=""/></span>
											<span class="title"></span></a>
										<%}else{ %>
										<!-- �α��� �ȵǾ� ���� ��� �ٸ� �̺�Ʈ �ֱ� -->
										
										<a href="bookMark.jsp" class="btn_c"><img src="images/bookmark.svg" alt=""/></a>
										<a href="login.jsp" class="btn_d"><img src="images/user.svg" alt=""/></a>
										
										<%} %>
				</nav>

			</div>
		</header>

				

				<!-- Main -->
					<div id="main">
						<div class="inner">
							<!-- �Խñ� Ŭ������ �� �ش� �Խñ��� ����, ���� �� ��� -->
							<%if(list!=null && vo!=null){%>
								<h1>TITLE:<%=list.get(0).getTitle() %></h1>
								<p>WRITER:<%=list.get(0).getNick() %></p>
								<span class="image main"><img src="images/pic13.jpg" alt="" /></span>
								<p>CONTENT:<%=list.get(0).getContent() %></p>
							<%}else{
								
							}%>
							
							<div id="like_btn"><button></button></div>
							
							<!-- ���� ��ư Ŭ�� �� saved_reviews�� �ش� ������ �г��Ӱ� �Խù������� �߰�-->
							<!-- �̰� ���� ��� ��ư���� ���� -->
							<div id="bookmark_btn"><button onclick='location.href="delsaveBookmark?seq=<%=seq%>&nick=<%=vo.getMB_nick()%>"'>�������</button></div>
							<!-- ����Ǹ� '����Ǿ����ϴ�' alert�ߵ��� ���� -->
						
						</div>
					</div>

				<!-- Footer -->
					<footer id="footer">
						<div class="inner">
							<section>
								<h2>���</h2>
								<%
								if(list.get(0).getComment()!=null){
									String comm = list.get(0).getComment();
									String[] commentlist = comm.split("\\|");
									for(int i = 0; i<commentlist.length; i++){%>
										<p><%=commentlist[i]%></p>
								<%}}%>
							
								<h2>�޸� �ۼ�</h2>
								<%if(memo!=null){
									out.print("<p>"+memo+"</p>");
								}%>
								
								<form method="post" action="savememo?seq=<%=seq%>&nick=<%=vo.getMB_nick()%>">
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