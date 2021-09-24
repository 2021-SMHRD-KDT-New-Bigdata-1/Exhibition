<%@page import="VO.saveVO"%>
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
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="assets/css/main.css" />
</head>
<body>
	<!-- <h1>�ϸ�ũ ������</h1> -->
	<%
    //�α��� �� ���� �޾ƿ���
    membersVO vo = (membersVO)session.getAttribute("vo");
    saveDAO sdao = new saveDAO();
	ArrayList<saveVO> list = sdao.savepostselect(vo.getMB_nick());
	
	
	//���� vo nick�� rv_num�� �޾ƿͼ� �� �Խù����� post_reviews���� ���.��ģ
	%>
	<%
	postDAO pdao = new postDAO();
	%>
    
    
    <%if(vo!=null){ %>
   		<%=vo.getMB_nick() %> �� �������~~~ ����� �Խù� �������Ӵ�~~~
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
											<!-- <li><a href="posting.jsp">POST</a></li>-->
											<li><a href="summernote.jsp">POST</a></li>
											<%}else{ %>
											<li><a href="login.jsp">POST</a></li>
											<%} %>
											
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
			<tr onclick="location.href='onepost.jsp?seq=<%=list.get(i).getSeq()%>'">
			
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
</body>
</html>