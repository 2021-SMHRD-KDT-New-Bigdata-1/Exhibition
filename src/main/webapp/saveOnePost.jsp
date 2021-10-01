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
		<script type="text/javascript"> (function() { var css = document.createElement('link'); css.href = 'https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'; css.rel = 'stylesheet'; css.type = 'text/css'; document.getElementsByTagName('head')[0].appendChild(css); })(); </script>
       <link rel="stylesheet" href="assets/css/app.css">
       <link rel="stylesheet" href="assets/css/theme.css">
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
					      <%}%>
                        <%if(vo!=null){ %>
                                 <li class="nav-item">
                                 <a class="nav-link" href="bookMark2.jsp"><span class="icon solid fa-bookmark"></span></a>
                                 </li>
                                 
                                 <li class="nav-item">
                                 <a class="nav-link" href="myPage.jsp"><span class="icon solid fa-user"></span></a>
                                 </li>
                              
                              <%}%>
                              
     
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
                        		<h1><%=list.get(0).getTitle() %></h1>
                        		<p><%=list.get(0).getNick() %></p>
                        		<%for(int i =0; i<4; i++){ %>
                        		<%String f = list.get(0).getImg_name();
                       			 f.replaceAll("null", "");
                        		String[] img_name = f.split("\\|");
                           		if(!img_name[i].equals("null")){%>
                              <span class="image main"><img src="images/<%=img_name[i] %>" alt="" /></span>
                           <% }}%>
								<p><%=list.get(0).getContent() %></p>
							<%}else{
								
							}%>
							
							<%
							//���ƿ� ���� ��ư �ٸ���
							String like_origin = dao.likeselect(seq);
							if(like_origin.contains(vo.getMB_nick())){%>
								<button class="like_btn"><%=list.get(0).getCnt() %></button>
								<button class="like_btn" onclick='location.href="likePostSaveLink?seq=<%=seq%>&nick=<%=vo.getMB_nick()%>"'>
								<i class=" fas fa-thumbs-up fa-2x"></i></button>
							<%}else{%>
								<button class="like_btn"><%=list.get(0).getCnt() %></button>
								<button class="like_btn" onclick='location.href="likePostSaveLink?seq=<%=seq%>&nick=<%=vo.getMB_nick()%>"'>
								<i class="far fa-thumbs-up fa-2x"></i></button>
							<%} %>
							
							<!-- ���� ��ư Ŭ�� �� saved_reviews�� �ش� ������ �г��Ӱ� �Խù������� �߰�-->
							<!-- �̰� ���� ��� ��ư���� ���� -->
							<button class="bookmark_btn" onclick='location.href="delsaveBookmark?seq=<%=seq%>&nick=<%=vo.getMB_nick()%>"'>
							<i class="fas fa-share-square fa-2x"></i></button>
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