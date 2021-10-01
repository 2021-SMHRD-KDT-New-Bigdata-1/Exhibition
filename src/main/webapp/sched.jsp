<%@page import="VO.membersVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.util.Calendar"%>

<!DOCTYPE html>
<html>
<head>
<%
//로그인 한 세션 받아오기
membersVO vo = (membersVO) session.getAttribute("vo");
%>

<%
// 오늘 날짜로 달력 취득
Calendar currentCal = Calendar.getInstance();
Calendar todayCheck_currentCal = Calendar.getInstance();

// request 객체로 부터 넘어온 값이 있으면 처리
if (request.getParameter("year") != null) {
	currentCal.set(Calendar.YEAR, Integer.parseInt(request.getParameter("year")));
}
if (request.getParameter("month") != null) {
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
int tday = todayCheck_currentCal.get(Calendar.DATE);
//int day = currentCal.get(Calendar.DAY_OF_MONTH);
%>





<title>38℃ - Schedule</title>
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
						<!-- 로그인 안되어 있을 경우 다른 이벤트 넣기 -->
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

					<span class="date"> <span class="month"><%=month + 1%>월</span>
							
					</span>

				</div>
				<div class="d"></div>
				<div class="c"></div>
			</article>



		</div>
	</div>

	<!-- Sidebar -->
	<div id="sidebar">

		<!-- Logo -->
		<!--<h1 id="logo"><a href="Main.jsp">38℃</a></h1>-->


		<!-- Calendar -->
		<div class="box calendar inner">
			<table>
				<tr height="30">
					<td width="30" align="center"><a
						href="javascript:goMonth(<%=month - 1%>);">◀</a></td>
					<td width="110" align="center"><%=year%> / <%=month + 1%></td>
					<td width="30" align="center"><a
						href="javascript:goMonth(<%=month + 1%>);">▶</a></td>
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
				for (int i = 0; weekSize > i; i++) {
					out.println("<tr>");

					// 일주일이 7일 이니 7번 반복
					for (int j = 0; (7 > j); j++) {
							out.println("<td");

						// 현재 달의 1을의 요일에 해당하는 곳부터 출력하기위함
						if (oneDayNum == j + 1 || dayCheck) {
					// 현재 달의 최대 일수일경우
					if (monthMaxNum >= day) {
						/// 일요일의 경우 글자색 '빨강'
						if (currentCal.get(Calendar.DAY_OF_WEEK) == 1) {
							// 일요일이면서 오늘일 경우 글자색은 '빨강', 글자 진하게 아니면 글자색만 '빨강'
							if (todayCheck_currentCal.equals(currentCal)) {
								out.println(" id='"+day+"'  align='center' onclick='location.href=date?year="+year+"&month="+(month+1)+"&day="+day+"'><font color='Indianred'><b>" + day + "</b></font>");
							} else {
								out.println("id='"+day+"' align='center' onclick='location.href=date?year="+year+"&month="+(month+1)+"&day="+day+"'><font color='Indianred'>" + day + "</font>");
							}
							currentCal.set(Calendar.DATE, ++day);
							dayCheck = true;
							// 토요일의 경우 글자색 '파랑'
						} else if (currentCal.get(Calendar.DAY_OF_WEEK) == 7) {
							// 토요일이면서 오늘일 경우 글자색은 '파랑', 글자 진하게 아니면 글자색만 '파랑'
							if (todayCheck_currentCal.equals(currentCal)) {
								out.println(" id='"+day+"' align='center' onclick='location.href=dateCON?year="+year+"&month="+(month+1)+"&day="+day+"'><font color='royalblue'><b>" + day + "</b></font>");
							} else {
								out.println(" id='"+day+"' align='center' onclick='location.href=date?year="+year+"&month="+(month+1)+"&day="+day+"'><font color='royalblue'>" + day + "</font>");
							}
							currentCal.set(Calendar.DATE, ++day);
							dayCheck = true;
							// 일요일도 아니고 토요일도 아니면 기본속성 글자출력 
						} else {
							//  일요일도 아니고 토요일도 아닌데 오늘이면 글자진하게
							if (todayCheck_currentCal.equals(currentCal)) {
								out.println(" id='"+day+"' align='center' onclick='location.href=date?year="+year+"&month="+(month+1)+"&day="+day+"'> <b>" + day + "</b>");
							} else {
								out.println(" id='"+day+"' align='center' onclick='location.href=date?year="+year+"&month="+(month+1)+"&day="+day+"'>"+day);
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

			<!-- ◀ / ▶ 에 해당하는 폼 -->
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
	
	function date(day){
		$.ajax({
			url : 'exlist21oct.csv',
			type : 'post',
			//                    contentType: 'application/x-www-form-urlencoded;charset=EUC-KR',
			contentType : 'text/html;charset=utf-8',

			dataType : 'text'
		}).done(successFunction);

		function successFunction(data) {
			var allRows = data.split("\|"); //allRows 한 줄씩으로 바꿔줌
			var table = '<table>';
			for (var singleRow = 0; singleRow < allRows.length - 1; singleRow++) {
				if (singleRow === 0) { // singleRow 한줄 <tr> 해주는거
					table += '<thead>';
					table += '<tr>';
				} else {
					table += '<tr>';
				}
				var rowCells = allRows[singleRow].replace('<', '-').replace(
						'전시소개 ', '').replace('>', '-').replace('전시기간 :', '')
						.replace('전시기간:', '').replaceAll('"', '').replace('전시장소:', '').replace('전시장소 :', '')
						.replace('전시명:', '').replace('전시명 :', '').split(',');
				for (var rowCell = 0; rowCell < rowCells.length - 1; rowCell++) {
					
					if (singleRow === 0) {
						
						if (rowCell == 4) {
							table += '<th colspan="2">';
							table += rowCells[rowCell];
							table += '</th>';
						} else {

							table += '<th>';
							table += rowCells[rowCell];
							table += '</th>';
						}
					} else {
						//여기에 조건 주기
						if (rowCells[0]==day){
			
						if (rowCell == 0){
							table += '<td>';
							table += rowCells[rowCell];
							table += '일';
							table += '</td>';
						}
						else if (rowCell == 4) {

							table += '<td colspan="2">';
							table += rowCells[rowCell];
							table += '</td>';
						} else {

							table += '<td>';
							table += rowCells[rowCell];
							table += '</td>';
						
						}
						
					}}
				}
				if (singleRow === 0) {
					table += '</tr>';
					table += '</thead>';
					table += '<tbody>';
				} else {
					table += '</tr>';
				}
			}
			table += '</tbody>';
			table += '</table>';
			$('div.d').append(table);
		}
		
		}
	
	
	
		function goCalendar() {
			var form = document.calendarTextBoxForm;

			if ((form.year.value == "")) {
				alert("'년'을 입력 주세요");
				return;
			}
			if (form.year.value < 1970) {
				alert("1970년 1월 1일 이후로 검색해 주세요.");
				return;
			}
			if ((form.month.value == "")) {
				alert("'월'을 입력 주세요");
				return;
			}
			if ((form.month.value < 1) || form.month.value > 12) {
				alert("'월'을 올바르게 입력 주세요");
				return;
			}
			form.month.value = form.month.value - 1;
			form.action = "Calendar.jsp";
			form.target = "_self";
			form.submit();
		}

		function goMonth(month) {
			var form = document.calendarHiddenForm;

			if ((<%=year%><= 1970) && (month == -1)) {
				alert("1970년 1월 1일 이후로 검색해 주세요.");
				return;
			}
			if (month == -1) {
				form.year.value = <%=year - 1%>;
				form.month.value = 11;
			} else if (month == 12) {
				form.year.value =<%=year + 1%>;
				form.month.value = 0;
			} else {
				form.year.value =<%=year%>;
				form.month.value = month;
			}

			form.action = "sched.jsp";
			form.target = "_self";
			form.submit();
		}
	</script>

	<script src="assets/js/jquery-3.6.0.min.js"></script>
	<script>
		$.ajax({
			url : 'exlist21oct.csv',
			type : 'post',
			//                    contentType: 'application/x-www-form-urlencoded;charset=EUC-KR',
			contentType : 'text/html;charset=utf-8',

			dataType : 'text'
		}).done(successFunction);

		function successFunction(data) {
			var allRows = data.split("\|");
			var table = '<table>';
			for (var singleRow = 0; singleRow < allRows.length - 1; singleRow++) {
				if (singleRow === 0) {
					table += '<thead>';
					table += '<tr>';
				} else {
					table += '<tr>';
				}
				var rowCells = allRows[singleRow].replace('<', '-').replace(
						'전시소개 ', '').replace('>', '-').replace('전시기간 :', '')
						.replace('전시기간:', '').replaceAll('"', '').replace('전시장소:', '').replace('전시장소 :', '')
						.replace('전시명:', '').replace('전시명 :', '').split(',');
				for (var rowCell = 0; rowCell < rowCells.length - 1; rowCell++) {
					if (singleRow === 0) {
						
						if (rowCell == 4) {
							table += '<th colspan="2">';
							table += rowCells[rowCell];
							table += '</th>';
						} else {

							table += '<th>';
							table += rowCells[rowCell];
							table += '</th>';
						}
					} else {
						if (rowCell == 0){
							table += '<td>';
							table += rowCells[rowCell];
							table += '일';
							table += '</td>';
						}
						else if (rowCell == 4) {

							table += '<td colspan="2">';
							table += rowCells[rowCell];
							table += '</td>';
						} else {

							table += '<td>';
							table += rowCells[rowCell];
							table += '</td>';
						}
					}
				}
				if (singleRow === 0) {
					table += '</tr>';
					table += '</thead>';
					table += '<tbody>';
				} else {
					table += '</tr>';
				}
			}
			table += '</tbody>';
			table += '</table>';
			$('div.c').append(table);
		}
	</script>

</body>
</html>