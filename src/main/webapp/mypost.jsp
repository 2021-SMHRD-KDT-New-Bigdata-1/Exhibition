<%@page import="VO.adpostVO"%>
<%@page import="DAO.adpostDAO"%>
<%@page import="VO.postVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.postDAO"%>
<%@page import="DAO.membersDAO"%>
<%@page import="VO.membersVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
    <head>
        <title>38℃</title>
        <meta charset="utf-8"/>
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1, user-scalable=no"/>
        <script type="text/javascript"> (function() { var css = document.createElement('link'); css.href = 'https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'; css.rel = 'stylesheet'; css.type = 'text/css'; document.getElementsByTagName('head')[0].appendChild(css); })(); </script>
       <link rel="stylesheet" href="assets/css/app.css">
       <link rel="stylesheet" href="assets/css/theme.css">
        
        <link rel="stylesheet" href="assets/css/main.css"/>
    </head> 

    <body class="is-preload">
    <%
    //로그인 한 세션 받아오기
    membersVO vo = (membersVO)session.getAttribute("vo");
    membersDAO mdao = new membersDAO();
    %>
    
    <%
    String nick = vo.getMB_nick(); 
    postDAO pdao = new postDAO();
    ArrayList<postVO> list = pdao.mypost(nick);
    
    adpostDAO adao = new adpostDAO();
    ArrayList<adpostVO> ad_list = adao.allpost(); //우선 여기에 저희도 아냐팡이ㅏ냐 잠깐??
    %>
        <!-- Wrapper -->
        <div id="wrapper">

               <!-- Header -->
               <header id="header">
                  <div class="inner">

                     <!-- Logo -->
                        <nav class="navbar navbar-expand-lg navbar-light bg-white fixed-top">
					<a class="navbar-brand font-weight-bolder mr-3" href="Main.jsp"><img src="images/logo.png" width="5%" id="logoima">MY POST</a>
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
					      <li class="nav-item">
      						<%if(vo!=null){%>
					      		<%if(mdao.bncheck(vo.getMB_nick()) == true) {%>
					      				<a class="nav-link" href="summernoteBN.jsp">POSTING</a>
					      			
								<%}else{%>
					  					<a class="nav-link" href="summernote.jsp">POSTING</a>
					      
					       		<%} %>
					       	<%}else{%>
					    	   <a class="nav-link" href="login2.jsp">POSTING</a>
					       	<%} %>
					       </li>

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

<!-- Main -->

<div id="main">
    <div class="inner">
       
    <section class="tiles">

    <!-- 일반 포스팅 -->
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
                <img class="cover" src="images/<%=img_nm[j]%>" alt="" />
            </span>
            <%if(vo!=null){ %>
            <a href="onepost.jsp?seq=<%=list.get(i).getSeq() %>"><!-- 쿼리스트링으로 seq 같이 넘기기 -->
             <%}else{ %>
            <a href="login2.jsp">
            <%} %>
            	<h2><%=list.get(i).getTitle()%></h2>
                <div class="content">
                    <p><%=list.get(i).getNick() %></p>
                </div>
            </a>
        </article>
        <%j=3;}}%>
        <%} %>
        
        
        
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
        
        
        
    </section>
</div>
</div>

<!-- Footer 
<footer id="footer">
<div class="inner">
    <section>
        <h2>Get in touch</h2>
        <form method="post" action="#">
            <div class="fields">
                <div class="field half">
                    <input type="text" name="name" id="name" placeholder="Name"/>
                </div>
                <div class="field half">
                    <input type="email" name="email" id="email" placeholder="Email"/>
                </div>
                <div class="field">
                    <textarea name="message" id="message" placeholder="Message"></textarea>
                </div>
            </div>
            <ul class="actions">
                <li><input type="submit" value="Send" class="primary"/></li>
            </ul>
        </form>
    </section>
    <section>
        <h2>Follow</h2>
        <ul class="icons">
            <li>
                <a href="#" class="icon brands style2 fa-twitter">
                    <span class="label">Twitter</span></a>
            </li>
            <li>
                <a href="#" class="icon brands style2 fa-facebook-f">
                    <span class="label">Facebook</span></a>
            </li>
            <li>
                <a href="#" class="icon brands style2 fa-instagram">
                    <span class="label">Instagram</span></a>
            </li>
            <li>
                <a href="#" class="icon brands style2 fa-dribbble">
                    <span class="label">Dribbble</span></a>
            </li>
            <li>
                <a href="#" class="icon brands style2 fa-github">
                    <span class="label">GitHub</span></a>
            </li>
            <li>
                <a href="#" class="icon brands style2 fa-500px">
                    <span class="label">500px</span></a>
            </li>
            <li>
                <a href="#" class="icon solid style2 fa-phone">
                    <span class="label">Phone</span></a>
            </li>
            <li>
                <a href="#" class="icon solid style2 fa-envelope">
                    <span class="label">Email</span></a>
            </li>
        </ul>
    </section>
    <ul class="copyright">
        <li>&copy; Untitled. All rights reserved</li>
        <li>Design:
            <a href="http://html5up.net">HTML5 UP</a>
        </li>
    </ul>
</div>
</footer>-->

</div>


<!-- Scripts -->
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/browser.min.js"></script>
<script src="assets/js/breakpoints.min.js"></script>
<script src="assets/js/util.js"></script>
<script src="assets/js/main.js"></script>
<script src="assets/js/app.js"></script>
<script src="assets/js/theme.js"></script>

</body>
</html>