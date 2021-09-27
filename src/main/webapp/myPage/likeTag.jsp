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
	<h1>관심분야 설정 페이지</h1>
	<%
	membersVO vo = (membersVO)session.getAttribute("vo");
	%>

	<%=vo.getMB_nick() %>님의 관심태그를 수정합니당~<br><br>
	
	<form action="../likeTagCon" method="post">
	<table border=1>
		<tr>
			<td>지역별 태그</td>
			<td>
				전체지역<input type="checkbox" name="region" value="Seoul|Gyeonggi|Gangwon|Daejeon|Daegu|Busan|Gwangju|Ulsan|Incheon|Jeju|Chungnam|Chungbuk|Gyeongnam|Kyeongbuk|Jeonnam|Jeonbuk">
			 	서울<input type="checkbox" name="region" value="Seoul">
				경기<input type="checkbox" name="region" value="Gyeonggi">
				강원<input type="checkbox" name="region" value="Gangwon">
				대전<input type="checkbox" name="region" value="Daejeon">
				대구<input type="checkbox" name="region" value="Daegu">
				부산<input type="checkbox" name="region" value="Busan">
				광주<input type="checkbox" name="region" value="Gwangju">
			 	울산<input type="checkbox" name="region" value="Ulsan">
				인천<input type="checkbox" name="region" value="Incheon">
				제주<input type="checkbox" name="region" value="Jeju">
				충남<input type="checkbox" name="region" value="Chungnam">
				충북<input type="checkbox" name="region" value="Chungbuk">
				경남<input type="checkbox" name="region" value="Gyeongnam">
				경북<input type="checkbox" name="region" value="Kyeongbuk">
				전남<input type="checkbox" name="region" value="Jeonman">
				전북<input type="checkbox" name="region" value="Jeonbuk">
			</td>
		</tr>	
		<tr>
			<td>장르별 태그</td>
			<td>
				모든 장르<input type="checkbox" name="genre" value="Western|Oriental|Design|Installation|Formative|Crafts|Architecture|Picture|Hands-on">
				서양화<input type="checkbox" name="genre" value="Western">
				동양화<input type="checkbox" name="genre" value="Oriental">
				디자인<input type="checkbox" name="genre" value="Design">
				설치미술<input type="checkbox" name="genre" value="Installation">
				조형미술<input type="checkbox" name="genre" value="Formative">
				공예<input type="checkbox" name="genre" value="Crafts">
				건축<input type="checkbox" name="genre" value="Architecture">
				사진<input type="checkbox" name="genre" value="Picture">
				체험형<input type="checkbox" name="genre" value="Hands-on">
			</td>
		</tr>
		<tr>
			<td>색감별(분위기) 태그</td>
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
		<td colspan="2" ><input type="submit" value="수정"> </td>
		</tr>
	
</form>
</body>
</html>