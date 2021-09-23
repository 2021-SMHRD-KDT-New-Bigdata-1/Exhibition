<%@page import="VO.membersVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Phantom by HTML5 UP</title>
        <meta charset="utf-8"/>
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1, user-scalable=no"/>
        <link rel="stylesheet" href="assets/css/main.css"/>
        <noscript><link rel="stylesheet" href="assets/css/noscript.css"/></noscript>
    </head>

    <body class="is-preload">
    <%
    //�α��� �� ���� �޾ƿ���
    membersVO vo = (membersVO)session.getAttribute("vo");
    
    %>
    <%if(vo!=null){ %>
   		<%=vo.getMB_nick() %> �� �������
   	<%}else{ %>
   	�α����ϼ���
   	<%} %>
    
        <!-- Wrapper -->
        <div id="wrapper">

            	<!-- Header -->
					<header id="header">
						<div class="inner">

							<!-- Logo -->
								<a href="main.html" class="logo">
									<span class="symbol"><img src="images/logo.svg" alt="" /></span><span class="title">38��</span>
								</a>

							
									<nav id="nav">
										<ul>
											<li class="current"><a href="Main.jsp">HOME</a></li>
											<li><a href="schedule.jsp">SCHEDULE</a></li>
											<li><a href="all.jsp">ALL POSTING</a></li>
											
											<%if(vo!=null){ %>
											<li><a href="posting.jsp">POST</a></li>
											<%}else{ %>
											<li><a href="login.jsp">POST</a></li>
											<%} %>
											
											<!-- <li><a href="#">�̸�4</a></li> -->
											<!-- �ʿ������ ���� ������ �� -->
										</ul>
										<%if(vo!=null){ %>
										<a href="bookMark.jsp"><img src="images/bookmark.svg" alt=""/></span>
											<span class="title"></span></a>
										<a href="myPage.jsp"><img src="images/user.svg" alt=""/></span>
											<span class="title"></span></a>
										<%}else{ %>
										<!-- �α��� �ȵǾ� ���� ��� �ٸ� �̺�Ʈ �ֱ� -->
										<a href="bookMark.jsp"><img src="images/bookmark.svg" alt=""/></span>
											<span class="title"></span></a>
										<a href="login.jsp"><img src="images/user.svg" alt=""/></span>
											<span class="title"></span></a>
										
										<%} %>
									</nav>
								
								
						</div>
					</header>

<!-- Main -->
<div id="main">
    <div class="inner">
        <header>
            <h1>38��<br></h1>
            template designed by
            <a href="http://html5up.net">HTML5 UP</a>.</h1>
        <p>Etiam quis viverra lorem, in semper lorem. Sed nisl arcu euismod sit amet
            nisi euismod sed cursus arcu elementum ipsum arcu vivamus quis venenatis orci
            lorem ipsum et magna feugiat veroeros aliquam. Lorem ipsum dolor sit amet nullam
            dolore.</p>
    </header>
    <section class="tiles">
        <article class="style1">
            <span class="image">
                <img src="images/pic01.jpg" alt=""/>
            </span>
            <a href="generic.html">
                <h2>Magna</h2>
                <div class="content">
                    <p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor veroeros et feugiat.</p>
                </div>
            </a>
        </article>
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
        </article>
    </section>
</div>
</div>

<!-- Footer -->
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