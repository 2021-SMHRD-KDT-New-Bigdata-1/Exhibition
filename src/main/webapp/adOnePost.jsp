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
	//�α��� �� ���� �޾ƿ���
	membersVO vo = (membersVO) session.getAttribute("vo");
	
	//�Ķ���� �޾ƿ���
	//�켱 all_posting���� '�Խù� ����'�� Ŭ������ ��쿡�� �����
	
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
<title>38�� - <%=seq %>��° ��</title>
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
	//DB�� �����ؼ� �ش� �������� �Խù� vo �޾ƿ��� - DB�� ���� ���ص� �ɰŰ��� �ѵ�.. ���ƿ䳪 ��� �����ؼ� ��������!
	adpostDAO dao = new adpostDAO();
	ArrayList<adpostVO> list = dao.onepost(seq); //�ش� �������� onepost ����
	
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
					      <a class="nav-link" href="all.jsp">ALL POST</a>
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
                              <!-- �α��� �ȵǾ� ���� ��� �ٸ� �̺�Ʈ �ֱ� -->
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
						<div class="inner">
							<!-- �Խñ� Ŭ������ �� �ش� �Խñ��� ����, ���� �� ��� -->
							<%if(list!=null && vo!=null){%>
								<h1>TITLE:<%=list.get(0).getAd_title() %></h1>
								<p>WRITER:<%=list.get(0).getNick() %></p>
								<span class="image main"><img src="images/pic13.jpg" alt="" /></span>
								<p>CONTENT:<%=list.get(0).getContent() %></p>
							<%}else{
								
							}%>
							
							<%
							//���ƿ� ��ư �ٸ���
							String like_origin = dao.likeselect(seq);
							if(like_origin.contains(vo.getMB_nick())){%>
								<div id="like_btn"><button onclick='location.href="adlikePost2?seq=<%=seq%>&nick=<%=vo.getMB_nick()%>"'>���ƿ� ���</button><%=list.get(0).getLike_cnt() %></div>
							<%}else{%>
								<div id="like_btn"><button onclick='location.href="adlikePost2?seq=<%=seq%>&nick=<%=vo.getMB_nick()%>"'>���ƿ�</button><%=list.get(0).getLike_cnt() %></div>
							<%} %>
							
							
							<!-- ���� ��ư Ŭ�� �� saved_reviews�� �ش� ������ �г��Ӱ� �Խù������� �߰�-->
							<%
							//���� ��ư �ٸ���
							adsaveDAO adsdao = new adsaveDAO();
							if(adsdao.check(seq,vo.getMB_nick())==true){//�̹� ����Ǿ� �ִ°��%>
								<div id="bookmark_btn"><button onclick='location.href="addelsaveBookmark?seq=<%=seq%>&nick=<%=vo.getMB_nick()%>"'>�������</button></div>
							<%}else{%>
								<div id="bookmark_btn"><button onclick='location.href="adsaveBookmark?seq=<%=seq%>&nick=<%=vo.getMB_nick()%>"'>�����ϱ�</button></div>
							<%}%>
						
						</div>
					</div>

				<!-- Footer -->
					<footer id="footer">
						<div class="inner">
							<section>
								<h2>���</h2>
								<%
								if(list.get(0).getAd_comment()!=null){
									String comm = list.get(0).getAd_comment();
									String[] commentlist = comm.split("\\|");
									for(int i = 0; i<commentlist.length; i++){%>
										<p><%=commentlist[i]%></p>
								<%}}%>
							
								
								<form method="post" action="adcommentCON?seq=<%=seq%>">
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