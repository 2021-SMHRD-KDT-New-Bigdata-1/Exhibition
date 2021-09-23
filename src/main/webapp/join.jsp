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
	<h1>회원가입 페이지</h1>
	<form action = "joinCon" method = "post">
	<table>
	<tr>
		<td>이름</td>
		<td><input type = "text" name = "name" required></td>
		<td></td>
	</tr>
	<tr>
		<td>아이디</td>
		<td><input type = "text" name = "id" id = "input_id1" required></td>
		<td><input type="button" value="ID중복체크" onclick="idcheck()"><span id="sp1"></span></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type = "password" name = "pw" required></td>
		<td></td>
	</tr>
	<tr>
		<td>닉네임</td>
		<td><input type = "text" name = "nick" id = "input_id2" required></td>
		<td><input type="button" value="NICK중복체크" onclick="nickcheck()"><span id="sp2"></span></td>
	</tr>
	<tr>
		<td>전화번호</td>
		<td><input type = "text" name = "tel" required></td>
		<td>(인증하는 거 넣기!)</td>
	</tr>
	<!-- 
	<tr> 
		<td>회원구분</td>
		<td><input type = "text" name = "TF"></td>
	</tr>
	-->
	<tr>
		<td>사업자번호</td> 
		<td><input type = "text" name = "bn"></td>
		<td><input type="button" value="중복확인"></td>
	</tr>
	<tr>
		<td colspan="3" align="left"><input type="submit" value="회원가입"> 
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
						span_tag1.innerHTML="중복된 아이디입니다.";
					}else{
						span_tag1.innerHTML="사용가능한 아이디 입니다.";
					}
				},
				error : function(){
					alert("통신실패")
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
						span_tag2.innerHTML="중복된 닉네임 입니다.";
					}else{
						span_tag2.innerHTML="사용가능한 닉네임 입니다.";
					}
				},
				error : function(){
					alert("통신실패")
				}
				
			})}
	</script>
   
</body>
</html>