<%@page import="VO.saveVO"%>
<%@page import="DAO.saveDAO"%>
<%@page import="VO.postVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.postDAO"%>
<%@page import="DAO.membersDAO"%>
<%@page import="VO.membersVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
    //로그인 한 세션 받아오기
    membersVO vo = (membersVO)session.getAttribute("vo");
    membersDAO mdao = new membersDAO();
    
    saveDAO sdao = new saveDAO();
	ArrayList<saveVO> list = sdao.savepostselect(vo.getMB_nick());
	
	postDAO pdao = new postDAO();
%>
        
<!DOCTYPE html>
<html>
    <head>
        <title>38℃ <%=vo.getMB_nick() %>의 저장된 게시물</title>
        <meta charset="utf-8"/>
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1, user-scalable=no"/>
        <script type="text/javascript"> (function() { var css = document.createElement('link'); css.href = 'https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'; css.rel = 'stylesheet'; css.type = 'text/css'; document.getElementsByTagName('head')[0].appendChild(css); })(); </script>
  
     
       <link rel="stylesheet" href="assets/css/bookMark2.css"/>
    </head> 

	<div id="header">

		<div class="top">

			<!-- Logo -->
			<div id="logo">

				<h1 id="title"><%=vo.getMB_nick()%></h1>
			</div>

			<!-- Nav -->
			<nav id="nav">
				<ul>
					<li><a href="Main.jsp" id="Main-link" class="icon solid fa-home"> </a></li>
					<li><a href="bookMark2.jsp" id="myInfo-link" class="icon solid fa-file-export"> </a></li>
					<li><a href="ad.jsp" id="myTag-link" class="icon solid fa-th"> </a></li>
					<li><a href="" id="myPost-link" class="icon solid fas fa-pencil-alt"> </a></li>
				</ul>
			</nav>

		</div>



	</div>



    <body class="is-preload">
    <!-- <h1>북마크 페이지</h1> -->
        <!-- Wrapper -->
        <div id="wrapper">

      

<!-- Main -->

<div id="main">
    <div class="inner">
       
    <section class="tiles">
    
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
                <img class="cover" src="images/<%=img_nm[j]%>" alt=""/>
            </span>
            <%if(vo!=null){ %>
            <a href='saveOnePost.jsp?seq=<%=list.get(i).getSeq()%>'><!-- 쿼리스트링으로 seq 같이 넘기기 -->
                <h2><%=list.get(i).getTitle()%></h2>
                <div class="content">
                    <p>writer :<%=list.get(i).getNick() %></p>
                </div>
            </a>
            <%} %>
        </article>
        <%j=3;}}%>
        <%} %>
        
    </section>
    
    



<!-- Scripts -->
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/browser.min.js"></script>
<script src="assets/js/breakpoints.min.js"></script>
<script src="assets/js/util.js"></script>
<script src="assets/js/main.js"></script>
<script src="assets/js/app.js"></script>
<script src="assets/js/theme.js"></script>

<script>
	$(document).ready(function(){
  		//1 HOME
  		$('#Main-link').mouseover(function(){
  			$(this).removeClass("icon solid fa-home");
  			$(this).html("HOME");
  		});
  		
  		$('#Main-link').mouseout(function(){
  			$(this).addClass("icon solid fa-home");
  			$(this).html("");
  		});
  		//2.내가 쓴 게시물
  		$('#myPost-link').mouseover(function(){
  			$(this).removeClass("icon solid fas fa-pencil-alt");
  			$(this).html("MY POST");
  		});
  		
  		$('#myPost-link').mouseout(function(){
  			$(this).addClass("icon solid fas fa-pencil-alt");
  			$(this).html("");	
  		});
  		//3. 저장 게시물
  		$('#myInfo-link').mouseover(function(){
  			$(this).removeClass("icon solid fa-file-export");
  			$(this).html("BOOKMARK");
  		});
  		
  		$('#myInfo-link').mouseout(function(){
  			$(this).addClass("icon solid fa-file-export");
  			$(this).html("");
  		});
  		//4. 광고 저장 게시물
  		$('#myTag-link').mouseover(function(){
  			$(this).removeClass("icon solid fa-th");
  			$(this).html("AD BOOKMARK");
  		});
  		
  		$('#myTag-link').mouseout(function(){
  			$(this).addClass("icon solid fa-th");
  			$(this).html("");	
  		});
  		
	});
  			
</script>
</body>
</html>