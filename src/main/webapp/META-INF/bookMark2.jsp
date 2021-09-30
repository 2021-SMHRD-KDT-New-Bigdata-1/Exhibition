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
    //�α��� �� ���� �޾ƿ���
    membersVO vo = (membersVO)session.getAttribute("vo");
    membersDAO mdao = new membersDAO();
    
    saveDAO sdao = new saveDAO();
	ArrayList<saveVO> list = sdao.savepostselect(vo.getMB_nick());
	
	postDAO pdao = new postDAO();
%>
        
<!DOCTYPE html>
<html>
    <head>
        <title>38�� <%=vo.getMB_nick() %>�� ����� �Խù�</title>
        <meta charset="utf-8"/>
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1, user-scalable=no"/>
        <script type="text/javascript"> (function() { var css = document.createElement('link'); css.href = 'https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'; css.rel = 'stylesheet'; css.type = 'text/css'; document.getElementsByTagName('head')[0].appendChild(css); })(); </script>
  
     
       <link rel="stylesheet" href="assets/css/bookMark.css"/>
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
							class="icon solid fa-home">Home</span></a></li>
					<li><a href="#" id="myInfo-link"><span
							class="icon solid fa-user-edit">���� �Խù�</span></a></li>
					<li><a href="ad.jsp" id="myTag-link"><span
							class="icon solid fa-th">���� ���� �Խù�</span></a></li>
				</ul>
			</nav>

		</div>



	</div>



    <body class="is-preload">
    <!-- <h1>�ϸ�ũ ������</h1> -->
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
                <img src="images/<%=img_nm[j]%>" alt=""/>
            </span>
            <%if(vo!=null){ %>
            <a href='saveOnePost.jsp?seq=<%=list.get(i).getSeq()%>'><!-- ������Ʈ������ seq ���� �ѱ�� -->
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
    
    <div class="table-wrapper">
		<table>
		<tr>
			<td><strong>�Խù���ȣ</strong></td>
			<td><strong>����</strong></td>
			<td><strong>���ƿ�</strong></td>
			<td><strong>�ۼ���</strong></td>
			<td><strong>����</strong></td>
			<td><strong>����</strong></td>
			<td><strong>�帣</strong></td>
			<td><strong>����</strong></td>
		</tr>
		<%
		
		for(int i = 0; i<list.size(); i++){
			String region = list.get(i).getRegion_tag();
			String[] region_tag = region.split("\\|");
			String genre = list.get(i).getGenre_tag();
			String[] genre_tag = genre.split("\\|");
			String color = list.get(i).getColor_tag();
			String[] color_tag = color.split("\\|");
			
			//region.replace(String.valueOf('|'),"");
			%>
			<tr onclick="location.href='saveOnePost.jsp?seq=<%=list.get(i).getSeq()%>'">
			
			<%
			out.print("<td>"+list.get(i).getSeq()+"</td>");
			out.print("<td>"+list.get(i).getContent()+"</td>");
			out.print("<td>"+list.get(i).getCnt()+"</td>");
			out.print("<td>"+list.get(i).getNick()+"</td>");
			out.print("<td>"+list.get(i).getTitle()+"</td>");
			out.print("<td>");
			if(pdao.count(region,'|')!=0){
				for(int j =0; j<region_tag.length; j++){
					out.print(region_tag[j]);
					}
			
			out.print("</td>");
			}else{
				out.print(region+"</td>");
			}
			out.print("<td>");
			if(pdao.count(genre,'|')!=0){
				for(int j =0; j<genre_tag.length; j++){
					out.print(genre_tag[j]);
					}
			
			out.print("</td>");
			}else{
				out.print(genre+"</td>");
			}
			
			out.print("<td>");
			if(pdao.count(color,'|')!=0){
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
			
			<!-- �Խù����� ��ư �����ϰ� tr��ü Ŭ�� �� onepost�� ������ ��������, tr�±��� onclick�Ӽ� ���� -->
			<!-- <td><a href="onepost.jsp?seq=<'%=list.get(i).getSeq()%>">�Խù� ����</a></td> -->
			<!-- tr�� Ŀ�� �ø��� ��� �ٲ�� ����??? ��� �ϴ��� -->
			
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