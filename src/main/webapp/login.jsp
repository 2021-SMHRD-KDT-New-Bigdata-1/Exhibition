<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>�α��� ������</h1>
	<form action="loginCon" method="post">
	<table>
		<tr>
			<td>ID</td>
			<td><input type="text" name="id"></td>
			<td rowspan="2"><input type="submit" value="�α���"></td>
		</tr>
		<tr>
			<td>PW</td>
			<td><input type="text" name="pw"></td>
		</tr>
		<tr>
			<td colspan="3">������ ���ٸ�? <a href="join.jsp">ȸ�������ϱ�</a></td>
		</tr>
	</table>
	</form>
</body>
</html>