<%@page import="VO.membersVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>���ɺо� ���� ������</h1>
	<%
	membersVO vo = (membersVO)session.getAttribute("vo");
	%>

	<%=vo.getMB_nick() %>���� �����±׸� �����մϴ�~<br><br>
	
	<form action="../likeTagCon" method="post">
	<table border=1>
		<tr>
			<td>������ �±�</td>
			<td>
				��ü����<input type="checkbox" name="region" value="allregion">
			 	����<input type="checkbox" name="region" value="seoul">
				���<input type="checkbox" name="region" value="Gyeonggi">
				����<input type="checkbox" name="region" value="Gangwon">
				����<input type="checkbox" name="region" value="Daejeon">
				�뱸<input type="checkbox" name="region" value="Daegu">
				�λ�<input type="checkbox" name="region" value="Busan">
				����<input type="checkbox" name="region" value="Gwangju">
			 	���<input type="checkbox" name="region" value="ulsan">
				��õ<input type="checkbox" name="region" value="Incheon">
				����<input type="checkbox" name="region" value="Jeju">
				�泲<input type="checkbox" name="region" value="Chungnam">
				���<input type="checkbox" name="region" value="Chungbuk">
				�泲<input type="checkbox" name="region" value="Gyeongnam">
				���<input type="checkbox" name="region" value="Kyeongbuk">
				����<input type="checkbox" name="region" value="Jeonman">
				����<input type="checkbox" name="region" value="Jeonbuk">
			</td>
		</tr>	
		<tr>
			<td>�帣�� �±�</td>
			<td>
				����ȭ<input type="checkbox" name="genre" value="Western">
				����ȭ<input type="checkbox" name="genre" value="Oriental">
				������<input type="checkbox" name="genre" value="design">
				��ġ�̼�<input type="checkbox" name="genre" value="installation">
				�����̼�<input type="checkbox" name="genre" value="formative">
				����<input type="checkbox" name="genre" value="crafts">
				����<input type="checkbox" name="genre" value="architecture">
				����<input type="checkbox" name="genre" value="picture">
				ü����<input type="checkbox" name="genre" value="hands-on">
			</td>
		</tr>
		<tr>
			<td>������(������) �±�</td>
			<td>
				white<input type="checkbox" name="color" value="white">
				black<input type="checkbox" name="color" value="black">
				gray<input type="checkbox" name="color" value="gray">
				brown<input type="checkbox" name="color" value="brown">
				beige<input type="checkbox" name="color" value="beige">
				green<input type="checkbox" name="color" value="green">
				blue<input type="checkbox" name="color" value="blue">
				purple<input type="checkbox" name="color" value="purple">
				yellow<input type="checkbox" name="color" value="yellow">
				pink<input type="checkbox" name="color" value="pink">
				red<input type="checkbox" name="color" value="red">
				ivory<input type="checkbox" name="color" value="ivory">
				light gray<input type="checkbox" name="color" value="lightgray">
				khaki<input type="checkbox" name="color" value="khaki">
				mint<input type="checkbox" name="color" value="mint">
				neon green<input type="checkbox" name="color" value="neongreen">
				olive<input type="checkbox" name="color" value="olive">
				navy<input type="checkbox" name="color" value="navy">
				sky blue<input type="checkbox" name="color" value="skyblue">
				lavender<input type="checkbox" name="color" value="lavender">
				mustard<input type="checkbox" name="color" value="mustard">
				deepred<input type="checkbox" name="color" value="deepred">
				
			</td>
		</tr>
	</table>
	
		<br>
		<br>
		<tr>
		<td colspan="2" ><input type="submit" value="����"> </td>
		</tr>
	
</form>
</body>
</html>