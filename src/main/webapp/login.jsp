<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>로그인 페이지</h1>
	<form action="loginCon" method="post">
	<table>
		<tr>
			<td>ID</td>
			<td><input type="text" name="id"></td>
			<td rowspan="2"><input type="submit" value="로그인"></td>
		</tr>
		<tr>
			<td>PW</td>
			<td><input type="text" name="pw"></td>
		</tr>
		<tr>
			<td colspan="3">계정이 없다면? <a href="join.jsp">회원가입하기</a></td>
		</tr>
	</table>
	</form>
</body>
</html>