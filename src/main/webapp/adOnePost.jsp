<%@page import="DAO.membersDAO"%>
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
		<!-- <link rel="stylesheet" href="assets/css/imageSlide.css"> -->
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
					      <a class="nav-link" href="Main.jsp">HOME</a>
					      </li>
					      <li class="nav-item">
					      <a class="nav-link" href="date?int=1">SCHEDULE</a>
					      </li>
					      <li class="nav-item">
					      <a class="nav-link" href="all.jsp">SEARCH</a>
					      </li>
					      <li class="nav-item">
      						<%
      						if(vo!=null){
      						membersDAO mdao = new membersDAO();
      						%>
      						
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
                              <!-- �α��� �ȵǾ� ���� ��� �ٸ� �̺�Ʈ �ֱ� -->
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
					
						<div class="line">
						
						<section class="psection">	
							<!-- �Խñ� Ŭ������ �� �ش� �Խñ��� ����, ���� �� ��� -->
							<%if(list!=null && vo!=null){%>
                        		<h2 class="myh2"><%=list.get(0).getAd_title() %></h2>
                        		<p class="postnick"><strong><%=list.get(0).getNick() %> &nbsp 
                        		<%
                        		String nnick = list.get(0).getNick();
                        		if(nnick.equals("60ART") || list.get(0).getNick().equals("60limmm")){ //������%>
                        			<img class="userimg" src='images/60vv.jpg'>
                        		<%}else if(nnick.equals("ssossososo") || list.get(0).getNick().equals("yeoni") || list.get(0).getNick().equals("yeoni")){ //��ҿ�93%>
                        			<img class="userimg" src='images/so93.jpg'>
                        		<%}else if(nnick.equals("gjBiennale") || list.get(0).getNick().equals("soyanee")){ //��ҿ�98%>
                        			<img class="userimg" src='images/so982.jpg'>
                        		<%}else if(nnick.equals("smhrd") || list.get(0).getNick().equals("admin")){ //��â��%>
                        			<img class="userimg" src='images/pairi.jpg'>
                        		<%}else{ %>
                        			<img class="userimg" src='images/pic06.jpg'>
                        		<%} %>
                        		
                        		</strong></p>
                        		<hr class="my-hr3">
                        		<%int cnt_i = 0;
                        		String f = list.get(0).getAd_img_name();
                        		String[] img_name = f.split("\\|");
                        		//f.replaceAll("null", "");
                        		%>
                        		<%for(int i =0; i<4; i++){ %>
                        			<%if(!img_name[i].equals("null")){
                           			cnt_i = i;
                           			i = 4;}
                           			%>
                           		<% }%>
                              <span class="image main"><img id="imggg" src="images/<%=img_name[cnt_i] %>" alt="" />
                           		
                           		<%
                           		String f_nn = f.replaceAll("null\\|", "");
                           		String[] img_name_nn = f_nn.split("\\|");
                           		if(img_name_nn.length>=2){
                           		%>
                              <div class="divvv" align="center">
                              <input type="button" id="btn1" class="btnpre" value="<" onclick="pre(<%=cnt_i%>,'<%=img_name[0]%>','<%=img_name[1]%>','<%=img_name[2]%>','<%=img_name[3]%>')">
							  <input type="button" id="btn2" class="btnnext" value=">" onclick="next(<%=cnt_i%>,'<%=img_name[0]%>','<%=img_name[1]%>','<%=img_name[2]%>','<%=img_name[3]%>','<%=img_name[cnt_i]%>')">
                           	  </div>
                           	  <%} %>
                           	  </span>
                           	  
								<p class="pcontent"><%=list.get(0).getContent() %></p>
								<br>
                    			<br>
								<p class="p_tag"><b>
								#AD<br>
								#<%=list.get(0).getRegion() %><br>
								#<%=list.get(0).getGenre() %><br>
								#<%=list.get(0).getColor().replaceAll("[|]", " #") %></b></p>
							<%}else{
								
							}%>
							
							
								
							
								
							
							
							<%
							//���ƿ� ��ư �ٸ���
							String like_origin = dao.likeselect(seq);
							if(like_origin.contains(vo.getMB_nick())){%>
								<button class="like_btn"><%=list.get(0).getLike_cnt() %></button>
								<button class="like_btn" onclick='location.href="adlikePost2?seq=<%=seq%>&nick=<%=vo.getMB_nick()%>"' >
								<i class=" fas fa-thumbs-up fa-2x"></i></button>
							<%}else{%>
								<button class="like_btn"><%=list.get(0).getLike_cnt() %></button>
								<button class="like_btn" onclick='location.href="adlikePost2?seq=<%=seq%>&nick=<%=vo.getMB_nick()%>"' >
								<i class="far fa-thumbs-up fa-2x"></i></button>
							<%} %>
							
							
							<!-- ���� ��ư Ŭ�� �� saved_reviews�� �ش� ������ �г��Ӱ� �Խù������� �߰�-->
							<%
							//���� ��ư �ٸ���
							adsaveDAO adsdao = new adsaveDAO();
							if(adsdao.check(seq,vo.getMB_nick())==true){//�̹� ����Ǿ� �ִ°��%>
								<button class="bookmark_btn" onclick='location.href="addelsaveBookmark?seq=<%=seq%>&nick=<%=vo.getMB_nick()%>"' >
								<i class="fas fa-share-square fa-2x"></i></button>
							<%}else{%>
								<button class="bookmark_btn" onclick='location.href="adsaveBookmark?seq=<%=seq%>&nick=<%=vo.getMB_nick()%>"' >
								<i class="far fa-share-square fa-2x "></i></button>
							<%}%>
						
						</div>
					<br>
					<br>
					
					</section>
					
						<div class="line">
							<section class="psection">
							
								
							<h2 class="myh22">comment</h2>
                        <%
                        if(list.get(0).getAd_comment()!=null){
                           String comm = list.get(0).getAd_comment();
                           String[] commentlist = comm.split("\\|");
                           for(int i = 1; i<commentlist.length; i++){%>
                              <% if(i%2==0){%>

                                 <h5><i class="fas fa-user fa-lg"></i>&nbsp;<%=commentlist[i]%></h5>
                              <%}else{ %>

                                 <h5><i class="far fa-user fa-lg"></i>&nbsp;<%=commentlist[i]%></h5>
                              <% }%>
                        <%}}%>
                     
                        
                        <form method="post" action="adcommentCON?seq=<%=seq%>">
                        <hr>
                           <div class="fields">
                              <div class="field">
                                 <textarea name="comment" id="message" placeholder="Leave a comment"></textarea>
                              </div>
                           </div>
                            <div align="right">
                            <input type="submit" value="Post Comment" class="like_btn" />
                            </div>
                              
                           
                        </form>
                     </section>
							
							<ul class="copyright">
								<li>&copy; 38�� All rights reserved</li><br><br>
							</ul>
						</div>
					
				</div>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
			<script>
			
			var img_src = document.getElementById("imggg").getAttribute('src');
			var next_cnt = 0;
			
			
				function next(cnt,src0,src1,src2,src3,src){
					//alert(">��ưŬ��");
					next_cnt++ ; //1
					
					var list = [src0,src1,src2,src3]; //���ϸ��� ��� list
					for(var i = 0; i<4 ;i++){ //null���ֱ�
						if(list[i] == 'null'){
							list.splice(i,1);
							i--;
						}
					}
					var filenum = list.indexOf(src);
					
					//img_src_change = "images/"+list[filenum+next_cnt];
					img_src_change = "images/"+list[next_cnt];
						
					if(filenum+next_cnt >= list.length){ //���� null������ �迭������ 2�� �������ٸ�
						alert("������ �����Դϴ�~");
						next_cnt--;
						//img_src_change = "images/"+list[filenum+next_cnt];
						img_src_change = "images/"+list[next_cnt];
					}
					
					document.getElementById("imggg").src = img_src_change;
				}
				
				
				function pre(cnt,src0,src1,src2,src3,src){
					
					next_cnt-- ; 
					
					var list = [src0,src1,src2,src3]; //���ϸ��� ��� list
					for(var i = 0; i<4 ;i++){ //null���ֱ�
						if(list[i] == 'null'){
							list.splice(i,1);
							i--;
						}
					}
					
					var filenum = list.indexOf(src);
					
					//alert("���� �� �ε��� ��ġ"+filenum+next_cnt+1); //1��°��.
					
					//alert("������ �ε��� ��ġ"+(filenum+next_cnt)); //0��°��
					
					img_src_change = "images/"+list[next_cnt];
						
					if(next_cnt<0){
						alert("ù ���� �Դϴ�~");
						next_cnt++;
						img_src_change = "images/"+list[next_cnt];
					}
					document.getElementById("imggg").src = img_src_change;
				}
				
				
			</script>

	</body>
</html>