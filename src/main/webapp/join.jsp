<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<style>
</style>
<body>
	<h1>ȸ������ ������</h1>
	<form action = "joinCon" method = "post">
	<table>
	<tr>
		<td>�̸�</td>
		<td><input type = "text" name = "name" required></td>
		<td></td>
	</tr>
	<tr>
		<td>���̵�</td>
		<td><input type = "text" name = "id" id = "input_id1" required></td>
		<td><input type="button" value="ID�ߺ�üũ" onclick="idcheck()"><span id="sp1"></span></td>
	</tr>
	<tr>
		<td>��й�ȣ</td>
		<td><input type = "password" name = "pw" required></td>
		<td></td>
	</tr>
	<tr>
		<td>�г���</td>
		<td><input type = "text" name = "nick" id = "input_id2" required></td>
		<td><input type="button" value="NICK�ߺ�üũ" onclick="nickcheck()"><span id="sp2"></span></td>
	</tr>
	<tr>
		<td>��ȭ��ȣ</td>
		<td><input type = "text" name = "tel" required></td>
		<td>(�����ϴ� �� �ֱ�!)</td>
	</tr>
	<!-- 
	<tr> 
		<td>ȸ������</td>
		<td><input type = "text" name = "TF"></td>
	</tr>
	-->
	<tr>
		<td>����ڹ�ȣ</td> 
		<td><input type = "text" name = "bn"></td>
		<td><input type="button" value="�ߺ�Ȯ��"></td>
	</tr>
	<tr>
		<td colspan="3" align="left"><input type="submit" value="ȸ������"> 
	</tr>
    
	</table>   
   </form>
   
   <script src="assets/js/jquery.min.js"></script>
	
	<script>
	 function idcheck(){
			var input1 = document.getElementById("input_id1");
			$.ajax({
				
				url : "idcheckCon", 
				type : "post", 
				data : {id : input1.value}, 
				dataType : "text",
				success : function(data){

				var span_tag1 = document.getElementById("sp1");
					if(data=="true"){
						span_tag1.innerHTML="�ߺ��� ���̵��Դϴ�.";
					}else{
						span_tag1.innerHTML="��밡���� ���̵� �Դϴ�.";
					}
				},
				error : function(){
					alert("��Ž���")
				}
			})}
	
		function nickcheck(){
			var input2 = document.getElementById("input_id2");
			$.ajax({
				
				url : "nickcheckCon", 
				type : "post",
				data : {nick : input2.value},
				dataType : "text", 
				success : function(data){ 

				var span_tag2 = document.getElementById("sp2");
					if(data=="true"){
						span_tag2.innerHTML="�ߺ��� �г��� �Դϴ�.";
					}else{
						span_tag2.innerHTML="��밡���� �г��� �Դϴ�.";
					}
				},
				error : function(){
					alert("��Ž���")
				}
				
			})}
	</script>
   
</body>
</html>