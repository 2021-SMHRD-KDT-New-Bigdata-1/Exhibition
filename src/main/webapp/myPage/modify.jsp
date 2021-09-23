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
	<h1>개인정보수정페이지</h1>
	<%
	membersVO vo = (membersVO)session.getAttribute("vo");
	%>
	<%=vo.getMB_nick() %>님의 회원정보를 수정합니당~<br><br>
	
	<form action = "../modifyCon" method = "post">
	<table align="center">
	
	<tr>
		<td>이름</td>
		<td><input type = "text" name = "name" required></td>
	</tr>
	<tr>
		<td>아이디</td>
		<td><input type = "text" name = "id" required></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type = "password" name = "pw" required></td>
	</tr>
	<!-- 
		<tr>
		<td>닉네임</td>
		<td><input type = "text" name = "nick" required></td>
	</tr>
	-->
	<tr>
		<td>전화번호</td>
		<td><input type = "text" name = "tel" required> (인증하는거 넣기)</td>
	</tr>
	<!-- 
	<tr> 
		<td>회원구분</td>
		<td><input type = "text" name = "TF"></td>
	</tr>
	-->
	<%
	//기업회원의 경우에만 사업자 번호를 변경하는 인풋창이 나오도록?
	//if(vo.getMB_type().equals("Business")){
	%>
	<!-- 
	<tr>
		<td>사업자번호</td> 
		<td><input type = "text" name = "bn"> 기업회원으로 가입할 경우 입력하세요 (인증하는거 넣기)</td>
	</tr>
	-->
	<%//}%>
	<tr>
		<td colspan="2" align="center"><input type="submit" value="수정"> 
	</tr>
    
	</table>   
   </form>
</body>
</html>