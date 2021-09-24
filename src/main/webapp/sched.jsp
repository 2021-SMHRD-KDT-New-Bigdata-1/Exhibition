<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="java.util.Calendar" %>
  
<!DOCTYPE html>
<%
  // ���� ��¥�� �޷� ���
  Calendar currentCal = Calendar.getInstance();
  Calendar todayCheck_currentCal = Calendar.getInstance();

  // request ��ü�� ���� �Ѿ�� ���� ������ ó��
  if(request.getParameter("year") != null){
   currentCal.set(Calendar.YEAR, Integer.parseInt(request.getParameter("year")));
  }
  if(request.getParameter("month") != null){
   currentCal.set(Calendar.MONTH, Integer.parseInt(request.getParameter("month")));
  }
    
  // ���� 1�Ϸ� ����
  currentCal.set(Calendar.DATE, 1);
  
  // 1���� '����'�� ���
  int oneDayNum = currentCal.get(Calendar.DAY_OF_WEEK);
  // ������� �ִ� �� ��
  int monthMaxNum = currentCal.getActualMaximum(Calendar.DAY_OF_MONTH);
  // ������� �� ��
  int weekSize = currentCal.getActualMaximum(Calendar.WEEK_OF_MONTH);
  // ���� '��'�� ���
  int year = currentCal.get(Calendar.YEAR);
  // ���� '��'�� ���(0�� ���� 11�� ����)
  int month = currentCal.get(Calendar.MONTH);
  // ���� '��'�� ���
  int day = currentCal.get(Calendar.DATE);
  //int day = currentCal.get(Calendar.DAY_OF_MONTH);

%>




<html>
	<head>
		<title>���� ��������</title>
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
					<h1 id="logo"><a href="Main.jsp">38��</a></h1>

				<!-- Calendar -->
					<section class="box calendar">
						<div class="inner">
						<table>
							 <tr height="30">
							  <td width="30" align="center"> <a href="javascript:goMonth(<%=month-1%>);">��</a> </td>
							  <td width="110" align="center"> <%=year %> / <%=month+1 %>  </td>
							  <td width="30" align="center"> <a href="javascript:goMonth(<%=month+1%>);">��</a></td>
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
							  // ���� ���� �� ����ū �ݺ�
							  for(int i=0; weekSize > i;i++){
							   out.println("<tr>");
							   
							   // �������� 7�� �̴� 7�� �ݺ�
							   for(int j=0; (7 > j); j++){
							    out.println("<td align='center'>");
							    
							    // ���� ���� 1���� ���Ͽ� �ش��ϴ� ������ ����ϱ�����
							    if(oneDayNum == j+1 || dayCheck){
							     // ���� ���� �ִ� �ϼ��ϰ��
							     if(monthMaxNum >= day ){
							      /// �Ͽ����� ��� ���ڻ� '����'
							      if(currentCal.get(Calendar.DAY_OF_WEEK) == 1){
							       // �Ͽ����̸鼭 ������ ��� ���ڻ��� '����', ���� ���ϰ� �ƴϸ� ���ڻ��� '����'
							       if(todayCheck_currentCal.equals(currentCal)){
							        out.println("<font color='Indianred'><b>" + day + "</b></font>");
							       }else{
							        out.println("<font color='Indianred'>" + day + "</font>");
							       }
							       currentCal.set(Calendar.DATE, ++day);
							       dayCheck = true;
							      // ������� ��� ���ڻ� '�Ķ�'
							      }else if(currentCal.get(Calendar.DAY_OF_WEEK) == 7){
							       // ������̸鼭 ������ ��� ���ڻ��� '�Ķ�', ���� ���ϰ� �ƴϸ� ���ڻ��� '�Ķ�'
							       if(todayCheck_currentCal.equals(currentCal)){
							        out.println("<font color='royalblue'><b>" + day + "</b></font>");
							       }else{
							        out.println("<font color='royalblue'>" + day + "</font>");
							       }
							       currentCal.set(Calendar.DATE, ++day);
							       dayCheck = true;
							      // �Ͽ��ϵ� �ƴϰ� ����ϵ� �ƴϸ� �⺻�Ӽ� ������� 
							      }else {
							       //  �Ͽ��ϵ� �ƴϰ� ����ϵ� �ƴѵ� �����̸� �������ϰ�
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
							
							<!-- �� / �� �� �ش��ϴ� �� -->
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
			   alert("'��'�� �Է� �ּ���");
			   return;
			  }
			  if( form.year.value < 1970 ){
			   alert("1970�� 1�� 1�� ���ķ� �˻��� �ּ���.");
			   return;
			  }
			  if( (form.month.value == "") ) {
			   alert("'��'�� �Է� �ּ���");
			   return;
			  }
			  if( (form.month.value < 1) || form.month.value > 12) {
			   alert("'��'�� �ùٸ��� �Է� �ּ���");
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
			   alert("1970�� 1�� 1�� ���ķ� �˻��� �ּ���.");
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