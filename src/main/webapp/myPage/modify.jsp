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
	<h1>������������������</h1>
	<%
	membersVO vo = (membersVO)session.getAttribute("vo");
	%>
	<%=vo.getMB_nick() %>���� ȸ�������� �����մϴ�~<br><br>
	
	<form action = "../modifyCon" method = "post">
	<table align="center">
	
	<tr>
		<td>�̸�</td>
		<td><input type = "text" name = "name" required></td>
	</tr>
	<tr>
		<td>���̵�</td>
		<td><input type = "text" name = "id" required></td>
	</tr>
	<tr>
		<td>��й�ȣ</td>
		<td><input type = "password" name = "pw" required></td>
	</tr>
	<!-- 
		<tr>
		<td>�г���</td>
		<td><input type = "text" name = "nick" required></td>
	</tr>
	-->
	<tr>
		<td>��ȭ��ȣ</td>
		<td><input type = "text" name = "tel" required> (�����ϴ°� �ֱ�)</td>
	</tr>
	<!-- 
	<tr> 
		<td>ȸ������</td>
		<td><input type = "text" name = "TF"></td>
	</tr>
	-->
	<%
	//���ȸ���� ��쿡�� ����� ��ȣ�� �����ϴ� ��ǲâ�� ��������?
	//if(vo.getMB_type().equals("Business")){
	%>
	<!-- 
	<tr>
		<td>����ڹ�ȣ</td> 
		<td><input type = "text" name = "bn"> ���ȸ������ ������ ��� �Է��ϼ��� (�����ϴ°� �ֱ�)</td>
	</tr>
	-->
	<%//}%>
	<tr>
		<td colspan="2" align="center"><input type="submit" value="����"> 
	</tr>
    
	</table>   
   </form>
</body>
</html>