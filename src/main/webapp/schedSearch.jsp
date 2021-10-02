<%@page import="DAO.exhDAO"%>
<%@page import="VO.exhVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="VO.membersVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ page import="java.util.Calendar"%>

<!DOCTYPE html>
<html>
<head>
<%
//�α��� �� ���� �޾ƿ���
membersVO vo = (membersVO) session.getAttribute("vo");

//������ ��¥�� ����Ʈ �޾ƿ���
exhDAO edao = new exhDAO();
ArrayList<exhVO> day_list = (ArrayList<exhVO>) session.getAttribute("day_list");
%>

<%
// ���� ��¥�� �޷� ���
Calendar currentCal = Calendar.getInstance();
Calendar todayCheck_currentCal = Calendar.getInstance();

// request ��ü�� ���� �Ѿ�� ���� ������ ó��
if (request.getParameter("year") != null) {
   currentCal.set(Calendar.YEAR, Integer.parseInt(request.getParameter("year")));
}
if (request.getParameter("month") != null) {
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
int tday = todayCheck_currentCal.get(Calendar.DATE);
//int day = currentCal.get(Calendar.DAY_OF_MONTH);
%>





<title>38�� - Schedule</title>
<meta charset="utf-8" />
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
<script type="text/javascript">
   (function() {
      var css = document.createElement('link');
      css.href = 'https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css';
      css.rel = 'stylesheet';
      css.type = 'text/css';
      document.getElementsByTagName('head')[0].appendChild(css);
   })();
</script>
<link rel="stylesheet" href="assets/css/app.css">
<link rel="stylesheet" href="assets/css/theme.css">
<link rel="stylesheet" href="assets/css/s_main.css" />
<link rel="stylesheet" href="assets/css/main.css" />

</head>
<body class="is-preload">
   <header id="header">
      <div class="inner">
         <nav class="navbar navbar-expand-lg navbar-light bg-white fixed-top">
            <a class="navbar-brand font-weight-bolder mr-3" href="Main.jsp"><img
               src="images/logo.png" width="5%" id="logoima"></a>
            <button class="navbar-light navbar-toggler" type="button"
               data-toggle="collapse" data-target="#navbarsDefault"
               aria-controls="navbarsDefault" aria-expanded="false"
               aria-label="Toggle navigation">
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
                  <li class="nav-item"><a class="nav-link active"
                     href="Main.jsp">HOME</a></li>
                  <li class="nav-item"><a class="nav-link" href="sched.jsp">SCHEDULE</a>
                  </li>
                  <li class="nav-item"><a class="nav-link" href="all.jsp">SEARCH</a></li>
                  <%
                  if (vo != null) {
                  %>
                  <li class="nav-item"><a class="nav-link"
                     href="summernote.jsp">POSTING</a></li>
                  <%
                  } else {
                  %>
                  <li class="nav-item"><a class="nav-link" href="login2.jsp">POSTING</a>
                  </li>

                  <%
                  }
                  %>
                  <%
                  if (vo != null) {
                  %>
                  <li class="nav-item"><a class="nav-link" href="bookMark.jsp"><span
                        class="icon solid fa-bookmark"></span></a></li>

                  <li class="nav-item"><a class="nav-link" href="myPage.jsp"><span
                        class="icon solid fa-user"></span></a></li>

                  <%
                  } else {
                  %>
                  <!-- �α��� �ȵǾ� ���� ��� �ٸ� �̺�Ʈ �ֱ� -->
                  <li class="nav-item"><a class="nav-link" href="login2.jsp"><span
                        class="icon solid fa-bookmark"></span></a></li>

                  <li class="nav-item"><a class="nav-link" href="login2.jsp"><span
                        class="icon solid fa-user"></span></a></li>


                  <%
                  }
                  %>

               </ul>
            </div>
         </nav>
      </div>
   </header>

   <div id="content">


      <div class="inner">

         <!-- Post -->

         <article class="box post post-excerpt">
            <div class="info">

               <span class="date"> <span class="month"><%=day_list.get(0).getEx_month()%>��</span>
                     <%=day_list.get(0).getEx_day()%>��
               </span>

            </div>
            <div class="d"></div>
            <div class="c">
            <!-- ����.. -->
            
            	<table>
            	<caption><%=day_list.get(0).getEx_year()%>�� <%=day_list.get(0).getEx_month()%>�� <%=day_list.get(0).getEx_day()%>���� �˻� ���</caption>
            		<thead align='center'>
            			<td colspan='2'><b>Titles</b></td>
            			<td><b>Periods</b></td>
            			<td colspan='2'><b>Places</b></td>
            			<td colspan='3'><b>Explains</b></td>
            		</thead>
            		<%
            		for(int i = 0 ; i<day_list.size();i++){
            		%>
            		<tr>
            			<td colspan='2'><%=day_list.get(i).getEx_title() %></td>
            			<td><%=day_list.get(i).getEx_date() %></td>
            			<td colspan='2'><%=day_list.get(i).getEx_location() %></td>
            			<td colspan='3'><%=day_list.get(i).getEx_content() %></td>
            		</tr>
            		<%} %>
            		
            	</table>
            </div>
         </article>



      </div>
   </div>

   <!-- Sidebar -->
   <div id="sidebar">

      <!-- Logo -->
      <!--<h1 id="logo"><a href="Main.jsp">38��</a></h1>-->


      <!-- Calendar -->
      <div class="box calendar inner">
         <table>
            <tr height="30">
               <td width="30" align="center"><a
                  href="javascript:goMonth(<%=month - 1%>);">��</a></td>
               <td width="110" align="center" id='tddd'><%=year%> / <%=month + 1%></td>
               <td width="30" align="center"><a
                  href="javascript:goMonth(<%=month + 1%>);">��</a></td>
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
            for (int i = 0; weekSize > i; i++) {
               out.println("<tr>");

               // �������� 7�� �̴� 7�� �ݺ�
               for (int j = 0; (7 > j); j++) {
                     out.println("<td class='tdd'");

                  // ���� ���� 1���� ���Ͽ� �ش��ϴ� ������ ����ϱ�����
                  if (oneDayNum == j + 1 || dayCheck) {
               // ���� ���� �ִ� �ϼ��ϰ��
               if (monthMaxNum >= day) {
                  /// �Ͽ����� ��� ���ڻ� '����'
                  if (currentCal.get(Calendar.DAY_OF_WEEK) == 1) {
                     // �Ͽ����̸鼭 ������ ��� ���ڻ��� '����', ���� ���ϰ� �ƴϸ� ���ڻ��� '����'
                     if (todayCheck_currentCal.equals(currentCal)) {
                     	 out.println("id="+day+" align='center'><font color='Indianred'><b>" + day + "</b></font>");
                     	
                     } else {
                        out.println("id="+day+" align='center'><font color='Indianred'>" + day + "</font>");
                     }
                     currentCal.set(Calendar.DATE, ++day);
                     dayCheck = true;
                     // ������� ��� ���ڻ� '�Ķ�'
                  } else if (currentCal.get(Calendar.DAY_OF_WEEK) == 7) {
                     // ������̸鼭 ������ ��� ���ڻ��� '�Ķ�', ���� ���ϰ� �ƴϸ� ���ڻ��� '�Ķ�'
                     if (todayCheck_currentCal.equals(currentCal)) {
                        out.println(" id='"+day+"' align='center'><font color='royalblue'><b>" + day + "</b></font>");
                     } else {
                        out.println(" id='"+day+"' align='center'><font color='royalblue'>" + day + "</font>");
                     }
                     currentCal.set(Calendar.DATE, ++day);
                     dayCheck = true;
                     // �Ͽ��ϵ� �ƴϰ� ����ϵ� �ƴϸ� �⺻�Ӽ� ������� 
                  } else {
                     //  �Ͽ��ϵ� �ƴϰ� ����ϵ� �ƴѵ� �����̸� �������ϰ�
                     if (todayCheck_currentCal.equals(currentCal)) {
                        out.println(" id='"+day+"' align='center'> <b>" + day + "</b>");
                     } else {
                        out.println(" id='"+day+"' align='center'>"+day);
                     }
                     currentCal.set(Calendar.DATE, ++day);
                     dayCheck = true;
                  }

               } else {
                  out.println(" align='center'>&nbsp;");
               }
                  } else {
               out.println(" align='center'>&nbsp;");
                  }

                  out.println("</td>");

               }
               out.println("</tr>");
            }
            %>

         </table>

         <!-- �� / �� �� �ش��ϴ� �� -->
         <form name="calendarHiddenForm" method="post">
            <input type="hidden" name="year" value="" /> <input type="hidden"
               name="month" value="" />
         </form>

      </div>



   </div>

   <!-- Copyright -->

   

   <!-- Scripts -->
   <script src="assets/js/jquery.min.js"></script>
   <script src="assets/js/browser.min.js"></script>
   <script src="assets/js/breakpoints.min.js"></script>
   <script src="assets/js/util.js"></script>
   <script src="assets/js/s_main.js"></script>
   <script
      src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
   <script lang="javascript">
   
      
   </script>

   <script src="assets/js/jquery-3.6.0.min.js"></script>
   <script>
      
      
      $(".tdd").click(function(){
		    var day = $(this).text();
		    var year_month = $("#tddd").text();
		    alert(day);
		    alert(year_month);
		
      
		    $.ajax({
    	  		url :'date',
    	  		type : 'get',
    	  		data : {"day" : day, "year_month":year_month},
    	  		success : function(data){
    		  	/*alert("����..")*/
    		  	window.location.href = "schedSearch.jsp";
    	  }
    	  
      })
      });
   </script>

</body>
</html>