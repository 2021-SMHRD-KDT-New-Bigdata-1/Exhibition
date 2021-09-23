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
				전체보기<input type="checkbox" name="region" value="allregion">
			 	서울<input type="checkbox" name="region" value="seoul">
				경기<input type="checkbox" name="region" value="Gyeonggi">
				강원<input type="checkbox" name="region" value="Gangwon">
				대전<input type="checkbox" name="region" value="Daejeon">
				대구<input type="checkbox" name="region" value="Daegu">
				부산<input type="checkbox" name="region" value="Busan">
				광주<input type="checkbox" name="region" value="Gwangju">
			 	울산<input type="checkbox" name="region" value="ulsan">
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
				서양화<input type="checkbox" name="genre" value="Western">
				동양화<input type="checkbox" name="genre" value="Oriental">
				디자인<input type="checkbox" name="genre" value="design">
				설치미술<input type="checkbox" name="genre" value="installation">
				조형미술<input type="checkbox" name="genre" value="formative">
				공예<input type="checkbox" name="genre" value="crafts">
				건축<input type="checkbox" name="genre" value="architecture">
				사진<input type="checkbox" name="genre" value="picture">
				체험형<input type="checkbox" name="genre" value="hands-on">
			</td>
		</tr>
		<tr>
			<td>색감별(분위기) 태그</td>
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
		<td colspan="2" ><input type="submit" value="수정"> </td>
		</tr>
	
</form>
</body>
</html>