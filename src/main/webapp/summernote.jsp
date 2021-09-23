<%@ page import="VO.membersVO"%>
<%@ page language="java" contentType="text/html; charset=euc-kr"
	pageEncoding="euc-kr"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="euc-kr">
<title>Summernote</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="assets/css/bootstrap5.css" />
<link rel="stylesheet" href="assets/css/main.css" />

<!-- include libraries(jQuery, bootstrap) -->
<!-- <link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet"> -->
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<!-- include summernote css/js-->
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
</head>
<body class="is-preload">
	<%
	//�α��� �� ���� �޾ƿ���
	membersVO vo = (membersVO) session.getAttribute("vo");
	%>

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Header -->
		<header id="header">
			<div class="inner">

				<!-- Logo -->
				<a href="index.html" class="logo"> <span class="symbol"><img
						src="images/logo.svg" alt="" /></span><span class="title">38��</span>
				</a>

				<!-- Nav -->
				<nav id="nav">
					<ul>
						<li class="current"><a href="Main.jsp">HOME</a></li>
						<li><a href="schedule.jsp">SCHEDULE</a></li>
						<li><a href="all.jsp">ALL POSTING</a></li>

						<%
						if (vo != null) {
						%>
						<!-- <li><a href="posting.jsp">POST</a></li>-->
						<li><a href="posting.jsp">POST</a></li>
						<%
						} else {
						%>
						<li><a href="login.jsp">POST</a></li>
						<%
						}
						%>
						<!-- �Ҿߴ� ȱ�� ������������ -->
						<!-- <li><a href="#">�̸�4</a></li> -->
						<!-- �ʿ������ ���� ������ �� -->
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



		<div id="main">
			<div class="inner">
				<section>
					<div class="table-wrapper">
						<div class="fields">
						<div class="field">
					
						<!-- <div class="field">
								<div id="summernote"></div> -->
							
								
													
							<form action="Posting" method="post">
								<table border="1px">
								<colgroup>

									<col style="width:20%;">
									
									<col style="width:80%;">
									
									</colgroup>
									<tr>
									<td>Title</td>
									<td><input type="text" id="title" name="title"></td>
									
									</tr>
									
									<tr>
									<td>Content</td>
									<td><textarea id="summernote" name="content"></textarea></td></tr>
									<tr>
										<td><strong>�����±�</strong></td>
										<td>
											<input type="checkbox" name="region" value="Seoul" id="region2">
											<label for="region2">����</label> 
											<input type="checkbox" name="region" value="Gyeonggi" id="region3">
											<label for="region3">���</label> 
											<input type="checkbox" name="region" value="Gangwon" id="region4">
											<label for="region4">����</label>
											<input type="checkbox" name="region" value="Daejeon" id="region5"> 
											<label for="region5">����</label> 
											<input type="checkbox" name="region" value="Daegu" id="region6">
											<label for="region6">�뱸</label> 
											<input type="checkbox" name="region" value="Busan" id="region7"> 
											<label for="region7">�λ�</label> 
											<input type="checkbox" name="region" value="Gwangju" id="region8"> 
											<label for="region8">����</label>
											<input type="checkbox" name="region" value="Ulsan" id="region9"> 
											<label for="region9">���</label> 
											<input type="checkbox" name="region" value="Incheon" id="region10">
											<label for="region10">��õ</label> 
											<input type="checkbox" name="region" value="Jeju" id="region11"> 
											<label for="region11">����</label> 
											<input type="checkbox" name="region" value="Chungnam" id="region12"> 
											<label for="region12">�泲</label> 
											<input type="checkbox" name="region" value="Chungbuk" id="region13"> 
											<label for="region13">���</label> 
											<input type="checkbox" name="region" value="Gyeongnam" id="region14"> 
											<label for="region14">�泲</label> 
											<input type="checkbox" name="region" value="Kyeongbuk" id="region15"> 
											<label for="region15">���</label> 
											<input type="checkbox" name="region" value="Jeonnam" id="region16"> 
											<label for="region16">����</label> 
											<input type="checkbox" name="region" value="Jeonbuk" id="region17">
											<label for="region17">����</label>
									</tr>
									<tr>
										<td><strong>�帣�±�</strong></td>
										<td><input type="checkbox" name="genre" value="Western" id="genre1"><label for="genre1">����ȭ</label> 
											<input type="checkbox" name="genre" value="Oriental" id="genre2">
											<label for="genre2">����ȭ</label> 
											<input type="checkbox" name="genre" value="Design" id="genre3">
											<label for="genre3">������</label>
											<input type="checkbox" name="genre" value="Installation" id="genre4">
											<label for="genre4">��ġ�̼�</label> 
											<input type="checkbox" name="genre" value="Formative" id="genre5">
											<label for="genre5">�����̼�</label> 
											<input type="checkbox" name="genre" value="Crafts" id="genre6">
											<label for="genre6">����</label>
											<input type="checkbox" name="genre" value="Architecture" id="genre7">
											<label for="genre7">����</label> 
											<input type="checkbox" name="genre" value="Picture" id="genre8">
											<label for="genre8">����</label> 
											<input type="checkbox" name="genre" value="Hands-on" id="genre9">
											<label for="genre9">ü����</label>
										</td>
									</tr>
									<tr>
										<th>������ ������ �±�</th>
										<td>
											<input type="checkbox" name="color" value="White" id="color1">
											<label for="color1">White</label> 
											<input type="checkbox" name="color" value="Black" id="color2">
											<label for="color2">Black</label> 
											<input type="checkbox" name="color" value="Gray" id="color3">
											<label for="color3">Gray</label> 
											<input type="checkbox" name="color" value="brown" id="color4">
											<label for="color4">Brown</label>
											<input type="checkbox" name="color" value="Beige" id="color5">
											<label for="color5">Beige</label> 
											<input type="checkbox" name="color" value="Green" id="color6">
											<label for="color6">Green</label> 
											<input type="checkbox" name="color" value="Blue" id="color7">
											<label for="color7">Blue</label> 
											<input type="checkbox" name="color" value="Purple" id="color8">
											<label for="color8">Purple</label>
											<input type="checkbox" name="color" value="Yellow" id="color9">
											<label for="color9">Yellow</label> 
											<input type="checkbox" name="color" value="Pink" id="color10">
											<label for="color10">Pink</label> 
											<input type="checkbox" name="color" value="Red" id="color11">
											<label for="color11">Red</label> 
											<input type="checkbox" name="color" value="Ivory" id="color12">
											<label for="color12">Ivory</label>
											<input type="checkbox" name="color" value="Lightgray" id="color13">
											<label for="color13">Light Gray</label>
											<input type="checkbox" name="color" value="Khaki" id="color14">
											<label for="color14">Khaki</label> 
											<input type="checkbox" name="color" value="Mint" id="color15">
											<label for="color15">Mint</label> 
											<input type="checkbox" name="color" value="Neongreen" id="color16">
											<label for="color16">Neon Green</label> 
											<input type="checkbox" name="color" value="Olive" id="color17">
											<label for="color17">Olive</label> 
											<input type="checkbox" name="color" value="Navy" id="color18">
											<label for="color18">Navy</label> 
											<input type="checkbox" name="color" value="Skyblue" id="color19">
											<label for="color19">Sky Blue</label> 
											<input type="checkbox" name="color" value="Lavender" id="color20">
											<label for="color20">Lavender</label> 
											<input type="checkbox" name="color" value="Mustard" id="color21">
											<label for="color21">Mustard</label> 
											<input type="checkbox" name="color" value="Deepred" id="color22">
											<label for="color22">Deep Red</label>
									</tr>
								</table>
								<input type="submit" value="�Խ�">
								</form>
							</div>
							</div>
						</div>
					</div>
				</section>
			</div>
		</div>
	</div>


		<script>
			// ����ȭ�� ������ �ε� �Լ�
			$(document).ready(function() {
				$('#summernote').summernote({
					placeholder : '������ �ۼ��ϼ���',
					height : 400,
					maxHeight : 400,
					callbacks: {	//���� �κ��� �̹����� ÷���ϴ� �κ�
						onImageUpload : function(files) {
							uploadSummernoteImageFile(files[0],this);
						},
						onPaste: function (e) {
							var clipboardData = e.originalEvent.clipboardData;
							if (clipboardData && clipboardData.items && clipboardData.items.length) {
								var item = clipboardData.items[0];
								if (item.kind === 'file' && item.type.indexOf('image/') !== -1) {
									e.preventDefault();
								}
							}}
					}});
			});
		</script>
		<!--  <script src="assets/js/jquery.min.js"></script>-->
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script> 
</body>
</html>