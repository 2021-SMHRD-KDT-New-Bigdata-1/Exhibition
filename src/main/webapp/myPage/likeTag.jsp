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
				��ü����<input type="checkbox" name="region" value="Seoul|Gyeonggi|Gangwon|Daejeon|Daegu|Busan|Gwangju|Ulsan|Incheon|Jeju|Chungnam|Chungbuk|Gyeongnam|Kyeongbuk|Jeonnam|Jeonbuk">
			 	����<input type="checkbox" name="region" value="Seoul">
				���<input type="checkbox" name="region" value="Gyeonggi">
				����<input type="checkbox" name="region" value="Gangwon">
				����<input type="checkbox" name="region" value="Daejeon">
				�뱸<input type="checkbox" name="region" value="Daegu">
				�λ�<input type="checkbox" name="region" value="Busan">
				����<input type="checkbox" name="region" value="Gwangju">
			 	���<input type="checkbox" name="region" value="Ulsan">
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
				��� �帣<input type="checkbox" name="genre" value="Western|Oriental|Design|Installation|Formative|Crafts|Architecture|Picture|Hands-on">
				����ȭ<input type="checkbox" name="genre" value="Western">
				����ȭ<input type="checkbox" name="genre" value="Oriental">
				������<input type="checkbox" name="genre" value="Design">
				��ġ�̼�<input type="checkbox" name="genre" value="Installation">
				�����̼�<input type="checkbox" name="genre" value="Formative">
				����<input type="checkbox" name="genre" value="Crafts">
				����<input type="checkbox" name="genre" value="Architecture">
				����<input type="checkbox" name="genre" value="Picture">
				ü����<input type="checkbox" name="genre" value="Hands-on">
			</td>
		</tr>
		<tr>
			<td>������(������) �±�</td>
			<td>
				ALL COLOR <input type="checkbox" name="color" value="White|Black|Gray|Brown|Beige|Green|Blue|Purple|Yellow|Pink|Red|Ivory|LightGray|Khaki|Mint|NeonGreen|Olive|Navy|SkyBlue|Lavender|Mustard|DeepRed">
				White<input type="checkbox" name="color" value="White">
				Black<input type="checkbox" name="color" value="Black">
				Gray<input type="checkbox" name="color" value="Gray">
				Brown<input type="checkbox" name="color" value="Brown">
				Beige<input type="checkbox" name="color" value="Beige">
				Green<input type="checkbox" name="color" value="Green">
				Blue<input type="checkbox" name="color" value="Blue">
				Purple<input type="checkbox" name="color" value="Purple">
				Yellow<input type="checkbox" name="color" value="Yellow">
				Pink<input type="checkbox" name="color" value="Pink">
				Red<input type="checkbox" name="color" value="Red">
				Ivory<input type="checkbox" name="color" value="Ivory">
				Light Gray<input type="checkbox" name="color" value="LightGray">
				Khaki<input type="checkbox" name="color" value="Khaki">
				Mint<input type="checkbox" name="color" value="Mint">
				Neon Green<input type="checkbox" name="color" value="NeonGreen">
				Olive<input type="checkbox" name="color" value="Olive">
				Navy<input type="checkbox" name="color" value="Navy">
				Sky Blue<input type="checkbox" name="color" value="SkyBlue">
				Lavender<input type="checkbox" name="color" value="Lavender">
				Mustard<input type="checkbox" name="color" value="Mustard">
				DeepRed<input type="checkbox" name="color" value="DeepRed">
				
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