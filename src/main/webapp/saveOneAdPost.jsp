<%@page import="VO.adpostVO"%>
<%@page import="DAO.adsaveDAO"%>
<%@page import="DAO.adpostDAO"%>
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
<title>38℃ - Saved Posts</title>
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
	//로그인 한 세션 받아오기
	membersVO vo = (membersVO) session.getAttribute("vo");
	
	//파라미터 받아오기
	//우선 all_posting에서 '게시물 보기'를 클릭했을 경우에만 실행됨
	
	int seq = Integer.parseInt(request.getParameter("seq"));
	%>
	<%=seq %>
	
	<%
	//DB랑 연결해서 해당 시퀀스의 게시물 vo 받아오기 - DB랑 연결 안해도 될거같긴 한뎅.. 좋아요나 댓글 생각해서 연결했음!
	adpostDAO adao = new adpostDAO();
	ArrayList<adpostVO> list = adao.onepost(seq);
		
	%>
	<%
	//메모 세션 받아오기 - 세션 말고 다른 방법 생각하기......................그냥 디비에서 가져오자...
	//String memo = (String)session.getAttribute("memo");
	adsaveDAO adsdao = new adsaveDAO();
	String memo = adsdao.memoSelect(seq, vo.getMB_nick());
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
					      <a class="nav-link" href="date?int=1">SCHEDULE</a>
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
							<!-- 게시글 클릭했을 때 해당 게시글의 제목, 내용 등 출력 -->
							<%if(list!=null && vo!=null){%>
                        		<h1><%=list.get(0).getAd_title() %></h1>
                        		<p><%=list.get(0).getNick() %></p>
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
                              <span class="image main"><img id="imggg" src="images/<%=img_name[cnt_i] %>" alt="" /></span>
                           
                            <!--<input type="button" id="btn1" class="btn pre" value="<" onclick="pre('</%=img_name[cnt_i-1]%>',</%=cnt_i%>)">  수정전 -->
                            <input type="button" id="btn1" class="btn pre" value="<" onclick="pre(<%=cnt_i%>,'<%=img_name[0]%>','<%=img_name[1]%>','<%=img_name[2]%>','<%=img_name[3]%>')">
							<input type="button" id="btn2" class="btn next" value=">" onclick="next(<%=cnt_i%>,'<%=img_name[0]%>','<%=img_name[1]%>','<%=img_name[2]%>','<%=img_name[3]%>','<%=img_name[cnt_i]%>')">
                           
								<p><%=list.get(0).getContent() %></p>
								<p><b>
								#<%=list.get(0).getRegion() %><br>
								#<%=list.get(0).getGenre() %><br>
								#<%=list.get(0).getColor().replaceAll("[|]", " #") %></b></p>
							<%}else{
								
							}%>
							
							<%
							//좋아요 관련 버튼 다르게
							String like_origin = adao.likeselect(seq);
							if(like_origin.contains(vo.getMB_nick())){%>
								<button class="like_btn"><%=list.get(0).getLike_cnt() %></button>
								<button class="like_btn" onclick='location.href="adlikePostSaveLink?seq=<%=seq%>&nick=<%=vo.getMB_nick()%>"'>
								<i class=" fas fa-thumbs-up fa-2x"></i></button>
							<%}else{%>
								<button class="like_btn"><%=list.get(0).getLike_cnt() %></button>
								<button class="like_btn" onclick='location.href="adlikePostSaveLink?seq=<%=seq%>&nick=<%=vo.getMB_nick()%>"'>
								<i class="far fa-thumbs-up fa-2x"></i></button>
							<%} %>
							
							<!-- 저장 버튼 클릭 시 saved_reviews에 해당 유저의 닉네임과 게시물시퀀스 추가-->
							<!-- 이거 저장 취소 버튼으로 변경 -->
							<button class="bookmark_btn" onclick='location.href="addelsaveBookmark?seq=<%=seq%>&nick=<%=vo.getMB_nick()%>"'>
							<i class="fas fa-share-square fa-2x"></i></button>
							<!-- 저장되면 '저장되었습니다' alert뜨도록 설정 -->
						
						</div>
					</div>

				<!-- Footer -->
					<footer id="footer">
						<div class="inner">
							<section>
								<h2>댓글</h2>
								<%
								if(list.get(0).getAd_comment()!=null){
									String comm = list.get(0).getAd_comment();
									String[] commentlist = comm.split("\\|");
									for(int i = 0; i<commentlist.length; i++){%>
										<p><%=commentlist[i]%></p>
								<%}}%>
							
								<h2>메모 작성</h2>
								<%if(memo!=null){
									out.print("<p>"+memo+"</p>");
								}%>
								
								<form method="post" action="adsavememo?seq=<%=seq%>&nick=<%=vo.getMB_nick()%>">
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
			<script>
			
			var img_src = document.getElementById("imggg").getAttribute('src');
			var next_cnt = 0;
			
			
				function next(cnt,src0,src1,src2,src3,src){
					//alert(">버튼클릭");
					next_cnt++ ; //1
					
					var list = [src0,src1,src2,src3]; //파일명이 담긴 list
					for(var i = 0; i<4 ;i++){ //null없애기
						if(list[i] == 'null'){
							list.splice(i,1);
							i--;
						}
					}
					var filenum = list.indexOf(src);
					
					//img_src_change = "images/"+list[filenum+next_cnt];
					img_src_change = "images/"+list[next_cnt];
						
					if(filenum+next_cnt >= list.length){ //만약 null제외한 배열길이인 2와 같아진다면
						alert("마지막 사진입니당~");
						next_cnt--;
						//img_src_change = "images/"+list[filenum+next_cnt];
						img_src_change = "images/"+list[next_cnt];
					}
					
					document.getElementById("imggg").src = img_src_change;
				}
				
				
				function pre(cnt,src0,src1,src2,src3,src){
					
					next_cnt-- ; 
					
					var list = [src0,src1,src2,src3]; //파일명이 담긴 list
					for(var i = 0; i<4 ;i++){ //null없애기
						if(list[i] == 'null'){
							list.splice(i,1);
							i--;
						}
					}
					
					var filenum = list.indexOf(src);
					
					//alert("현재 내 인덱스 위치"+filenum+next_cnt+1); //1번째면.
					
					//alert("움직일 인덱스 위치"+(filenum+next_cnt)); //0번째로
					
					img_src_change = "images/"+list[next_cnt];
						
					if(next_cnt<0){
						alert("첫 사진 입니당~");
						next_cnt++;
						img_src_change = "images/"+list[next_cnt];
					}
					document.getElementById("imggg").src = img_src_change;
				}
				
				
			</script>
	</body>
</html>