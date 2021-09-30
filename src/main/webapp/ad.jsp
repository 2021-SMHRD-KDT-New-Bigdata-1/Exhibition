<%@page import="DAO.adpostDAO"%>
<%@page import="VO.adsaveVO"%>
<%@page import="DAO.adsaveDAO"%>
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
    adsaveDAO adsdao = new adsaveDAO();
	ArrayList<adsaveVO> adlist = adsdao.savepostselect(vo.getMB_nick());
	
	adpostDAO apdao = new adpostDAO();
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
					<li><a href="Main.jsp" id="Main-link"><span
							 class="fas fa-home">Home</span></a></li>
					<li><a href="bookMark2.jsp" id="myInfo-link"><span
							class="fas fa-file-export">저장 게시물</span></a></li>
					<li><a href="#" id="myTag-link"><span
							class="icon solid fa-th">광고 저장 게시물</span></a></li>
				</ul>	
			</nav>

		</div>



	</div>







    <body class="is-preload">
    <!-- <h1>광고 북마크 페이지</h1> -->
        <!-- Wrapper -->
        <div id="wrapper">

              
       
<!-- Main -->

<div id="main">
    <div class="inner">
       
    <section class="tiles">
    
    <%for(int i = 0;i<adlist.size();i++){ %>
    	<%
    	String f = adlist.get(i).getAd_img_name();  
    	f.replaceAll("null", "");
    	String[] ad_img_nm = f.split("\\|");
    	%>
    	<%
    	for(int j = 0; j<4;j++){
    	%>
			<%if(!ad_img_nm[j].equals("null")){ %>
        <article class="style1">
            <span class="image">
                <img src="images/<%=ad_img_nm[j]%>" alt=""/>
            </span>
            <%if(vo!=null){ %>
            <a href='saveOneAdPost.jsp?seq=<%=adlist.get(i).getAd_rv_seq()%>'><!-- 쿼리스트링으로 seq 같이 넘기기 -->
                <h2><%=adlist.get(i).getAd_title()%></h2>
                <div class="content">
                    <p>writer :<%=adlist.get(i).getMb_nick() %></p>
                </div>
            </a>
            <%} %>
        </article>
        <%j=3;}}%>
        <%} %>
        
    </section>
    
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
		
		for(int i = 0; i<adlist.size(); i++){
			String region = adlist.get(i).getRegion_tag();
			String[] region_tag = region.split("\\|");
			String genre = adlist.get(i).getGenre_tag();
			String[] genre_tag = genre.split("\\|");
			String color = adlist.get(i).getColor_tag();
			String[] color_tag = color.split("\\|");
			
			//region.replace(String.valueOf('|'),"");
			%>
			<tr onclick="location.href='saveOneAdPost.jsp?seq=<%=adlist.get(i).getAd_rv_seq()%>'">
			
			<%
			out.print("<td>"+adlist.get(i).getAd_rv_seq()+"</td>");
			out.print("<td>"+adlist.get(i).getAd_content()+"</td>");
			out.print("<td>"+adlist.get(i).getAd_like_cnt()+"</td>");
			out.print("<td>"+adlist.get(i).getAd_mb_nick()+"</td>");
			out.print("<td>"+adlist.get(i).getAd_title()+"</td>");
			out.print("<td>");
			if(apdao.count(region,'|')!=0){
				for(int j =0; j<region_tag.length; j++){
					out.print(region_tag[j]);
					}
			
			out.print("</td>");
			}else{
				out.print(region+"</td>");
			}
			out.print("<td>");
			if(apdao.count(genre,'|')!=0){
				for(int j =0; j<genre_tag.length; j++){
					out.print(genre_tag[j]);
					}
			
			out.print("</td>");
			}else{
				out.print(genre+"</td>");
			}
			
			out.print("<td>");
			if(apdao.count(color,'|')!=0){
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