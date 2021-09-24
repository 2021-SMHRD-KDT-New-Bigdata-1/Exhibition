<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="java.util.Calendar" %>
  
<!DOCTYPE html>
<%
  // 오늘 날짜로 달력 취득
  Calendar currentCal = Calendar.getInstance();
  Calendar todayCheck_currentCal = Calendar.getInstance();

  // request 객체로 부터 넘어온 값이 있으면 처리
  if(request.getParameter("year") != null){
   currentCal.set(Calendar.YEAR, Integer.parseInt(request.getParameter("year")));
  }
  if(request.getParameter("month") != null){
   currentCal.set(Calendar.MONTH, Integer.parseInt(request.getParameter("month")));
  }
    
  // 날을 1일로 셋팅
  currentCal.set(Calendar.DATE, 1);
  
  // 1일의 '요일'을 취득
  int oneDayNum = currentCal.get(Calendar.DAY_OF_WEEK);
  // 현재달의 최대 일 수
  int monthMaxNum = currentCal.getActualMaximum(Calendar.DAY_OF_MONTH);
  // 현재달의 주 수
  int weekSize = currentCal.getActualMaximum(Calendar.WEEK_OF_MONTH);
  // 현재 '년'을 취득
  int year = currentCal.get(Calendar.YEAR);
  // 현재 '월'을 취득(0월 부터 11월 까지)
  int month = currentCal.get(Calendar.MONTH);
  // 현재 '일'을 취득
  int day = currentCal.get(Calendar.DATE);
  //int day = currentCal.get(Calendar.DAY_OF_MONTH);

%>




<html>
	<head>
		<title>월별 전시일정</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/s_main.css" />
	</head>
	<body class="is-preload">

		<!-- Content -->
			<div id="content">
				<div class="inner">

					<!-- Post -->
						<article class="box post post-excerpt">
							<header>
								
								<h2><a href="#">Welcome to Striped</a></h2>
								<p>A free, fully responsive HTML5 site template by HTML5 UP</p>
							</header>
							<div class="info">
								
								<span class="date"><span class="month">Jul<span>y</span></span> <span class="day">14</span><span class="year">, 2014</span></span>
								
							</div>
							<a href="#" class="image featured"><img src="images/pic01.jpg" alt="" /></a>
							<p>
								<strong>Hello!</strong> You're looking at <strong>Striped</strong>, a fully responsive HTML5 site template designed by <a href="http://twitter.com/ajlkn">AJ</a>
								for <a href="http://html5up.net">HTML5 UP</a> It features a clean, minimalistic design, styling for all basic page elements (including blockquotes, tables and lists), a
								repositionable sidebar (left or right), and HTML5/CSS3 code designed for quick and easy customization (see code comments for details).
							</p>
							<p>
								Striped is released for free under the <a href="http://html5up.net/license">Creative Commons Attribution license</a> so feel free to use it for personal projects
								or even commercial ones &ndash; just be sure to credit <a href="http://html5up.net">HTML5 UP</a> for the design. If you like what you see here, be sure to check out
								<a href="http://html5up.net">HTML5 UP</a> for more cool designs or follow me on <a href="http://twitter.com/ajlkn">Twitter</a> for new releases and updates.
							</p>
						</article>

					<!-- Post -->
						<article class="box post post-excerpt">
							<header>
								<h2><a href="#">Lorem ipsum dolor sit amet</a></h2>
								<p>Feugiat interdum sed commodo ipsum consequat dolor nullam metus</p>
							</header>
							<div class="info">
								<span class="date"><span class="month">Jul<span>y</span></span> <span class="day">8</span><span class="year">, 2014</span></span>
								<ul class="stats">
									<li><a href="#" class="icon fa-comment">16</a></li>
									<li><a href="#" class="icon fa-heart">32</a></li>
									<li><a href="#" class="icon brands fa-twitter">64</a></li>
									<li><a href="#" class="icon brands fa-facebook-f">128</a></li>
								</ul>
							</div>
							<a href="#" class="image featured"><img src="images/pic02.jpg" alt="" /></a>
							<p>
								Quisque vel sapien sit amet tellus elementum ultricies. Nunc vel orci turpis. Donec id malesuada metus.
								Nunc nulla velit, fermentum quis interdum quis, tate etiam commodo lorem ipsum dolor sit amet dolore.
								Quisque vel sapien sit amet tellus elementum ultricies. Nunc vel orci turpis. Donec id malesuada metus.
								Nunc nulla velit, fermentum quis interdum quis, convallis eu sapien. Integer sed ipsum ante.
							</p>
						</article>

					<!-- Pagination -->
						<div class="pagination">
							<!--<a href="#" class="button previous">Previous Page</a>-->
							<div class="pages">
								<a href="#" class="active">1</a>
								<a href="#">2</a>
								<a href="#">3</a>
								<a href="#">4</a>
								<span>&hellip;</span>
								<a href="#">20</a>
							</div>
							<a href="#" class="button next">Next Page</a>
						</div>

				</div>
			</div>

		<!-- Sidebar -->
			<div id="sidebar">

				<!-- Logo -->
					<h1 id="logo"><a href="Main.jsp">38℃</a></h1>

				<!-- Calendar -->
					<section class="box calendar">
						<div class="inner">
						<table>
							 <tr height="30">
							  <td width="30" align="center"> <a href="javascript:goMonth(<%=month-1%>);">◀</a> </td>
							  <td width="110" align="center"> <%=year %> / <%=month+1 %>  </td>
							  <td width="30" align="center"> <a href="javascript:goMonth(<%=month+1%>);">▶</a></td>
							 </tr> 
							</table>

							<table>
							
							 <tr>
							  <th scope="col" title="Sunday"><font color='Indianred'>S</font></th>
							  <th scope="col" title="Monday">M</th>
							  <th scope="col" title="Tuesday">T</th>
							  <th scope="col" title="Wednesday">W</th>
							  <th scope="col" title="Thursday">T</th>
							  <th scope="col" title="Friday">F</th>
							  <th scope="col" title="Saturday"><font color='royalblue'>S</font></th>
							 </tr>
							
							 <%
							  //int dayNum = 1;
							  boolean dayCheck = false;
							  // 현재 달의 주 수만큰 반복
							  for(int i=0; weekSize > i;i++){
							   out.println("<tr>");
							   
							   // 일주일이 7일 이니 7번 반복
							   for(int j=0; (7 > j); j++){
							    out.println("<td align='center'>");
							    
							    // 현재 달의 1을의 요일에 해당하는 곳부터 출력하기위함
							    if(oneDayNum == j+1 || dayCheck){
							     // 현재 달의 최대 일수일경우
							     if(monthMaxNum >= day ){
							      /// 일요일의 경우 글자색 '빨강'
							      if(currentCal.get(Calendar.DAY_OF_WEEK) == 1){
							       // 일요일이면서 오늘일 경우 글자색은 '빨강', 글자 진하게 아니면 글자색만 '빨강'
							       if(todayCheck_currentCal.equals(currentCal)){
							        out.println("<font color='Indianred'><b>" + day + "</b></font>");
							       }else{
							        out.println("<font color='Indianred'>" + day + "</font>");
							       }
							       currentCal.set(Calendar.DATE, ++day);
							       dayCheck = true;
							      // 토요일의 경우 글자색 '파랑'
							      }else if(currentCal.get(Calendar.DAY_OF_WEEK) == 7){
							       // 토요일이면서 오늘일 경우 글자색은 '파랑', 글자 진하게 아니면 글자색만 '파랑'
							       if(todayCheck_currentCal.equals(currentCal)){
							        out.println("<font color='royalblue'><b>" + day + "</b></font>");
							       }else{
							        out.println("<font color='royalblue'>" + day + "</font>");
							       }
							       currentCal.set(Calendar.DATE, ++day);
							       dayCheck = true;
							      // 일요일도 아니고 토요일도 아니면 기본속성 글자출력 
							      }else {
							       //  일요일도 아니고 토요일도 아닌데 오늘이면 글자진하게
							       if(todayCheck_currentCal.equals(currentCal)){
							       out.println("<b>" + day + "</b>");
							       }else{
							        out.println(day);
							       }
							       currentCal.set(Calendar.DATE, ++day);
							       dayCheck = true;
							      }
							       
							     }else{
							      out.println("&nbsp;");
							     }
							    }else{
							     out.println("&nbsp;");
							    }
							    
							    out.println("</td>");
							    
							   }
							   out.println("</tr>");
							  }
							
							 %>
							 
							</table>
							
							<!-- ◀ / ▶ 에 해당하는 폼 -->
							<form name="calendarHiddenForm" method="post">
							 <input type="hidden" name="year" value="" />
							 <input type="hidden" name="month" value="" />
							</form>


						
						
							
						</div>
					</section>

				<!-- Copyright -->
					
			</div>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/s_main.js"></script>
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
			<script lang="javascript">
			 function goCalendar(){
			  var form = document.calendarTextBoxForm;
			
			  if( (form.year.value == "") ) {
			   alert("'년'을 입력 주세요");
			   return;
			  }
			  if( form.year.value < 1970 ){
			   alert("1970년 1월 1일 이후로 검색해 주세요.");
			   return;
			  }
			  if( (form.month.value == "") ) {
			   alert("'월'을 입력 주세요");
			   return;
			  }
			  if( (form.month.value < 1) || form.month.value > 12) {
			   alert("'월'을 올바르게 입력 주세요");
			   return;
			  }
			  form.month.value = form.month.value - 1;
			  form.action="Calendar.jsp";
			  form.target = "_self";
			  form.submit();
			 }
			
			 function goMonth(month){
			  var form = document.calendarHiddenForm;
			
			  if( (<%=year%> <= 1970) && (month == -1) ){
			   alert("1970년 1월 1일 이후로 검색해 주세요.");
			   return;
			  }
			  if(month==-1){
			   form.year.value = <%=year-1%>;
			   form.month.value = 11;
			  }else if(month==12) {
			   form.year.value = <%=year+1%>;
			   form.month.value = 0;
			  }else{
			   form.year.value = <%=year%>;
			   form.month.value = month;
			  }
			
			  form.action="sched.jsp";
			  form.target = "_self";
			  form.submit();
			 }
			</script>

	</body>
</html>