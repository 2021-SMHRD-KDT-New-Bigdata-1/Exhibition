<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
    <head>
<<<<<<< HEAD
        <title>로그인 / 회원가입 폼 템플릿</title>
=======
        <title>�α��� / ȸ������ </title>
>>>>>>> branch 'master' of https://github.com/2021-SMHRD-KDT-New-Bigdata-1/Exhibition.git
        <link rel="stylesheet" href="STYLE.css">
    </head>
    <body>
        <div class="wrap">
            <div class="form-wrap">
                <div class="button-wrap">
                    <div id="btn"></div>
                    <button type="button" class="togglebtn" onclick="login()">LOG IN</button>
                    <button type="button" class="togglebtn" onclick="register()">REGISTER</button>
                </div>
                <form id="login" action="loginCon" class="input-group">
                    <input type="text" class="input-field" name="id" placeholder="Enter ID" required>
                    <input type="password" class="input-field" name="pw" placeholder="Enter Password" required>
                    <input type="checkbox" class="checkbox"><span>Remember Password</span>
                    <button class="submit">Login</button>
                </form>
<<<<<<< HEAD
                <form id="register" action="joinCon" name = "f" class="input-group">
                    <input type="text" class="input-field" id="input_id" name="id" placeholder="Your id" required >
=======
                <form id="register" action="joinCon" class="input-group">
                    <input type="text" class="input-field" id="input_id1" name="id" placeholder="Enter ID" required >
>>>>>>> branch 'master' of https://github.com/2021-SMHRD-KDT-New-Bigdata-1/Exhibition.git
                   
                   <button class="check" onclick="idcheck()">ID Check<span id="sp1"></span></button>
                
                   
                    <input type="password" class="input-field" name="pw" placeholder="Enter Password" required>
<<<<<<< HEAD
                    <input type="text" class="input-field" id="input_nick" name="nick"placeholder="Enter nickname" required>
=======
                    <input type="text" class="input-field" id="input_id2" name="nick"placeholder="Enter Nickname" required>
>>>>>>> branch 'master' of https://github.com/2021-SMHRD-KDT-New-Bigdata-1/Exhibition.git
                    
                    <button class="check" onclick="nickcheck()">NICK check<span id="sp2"></span></button>
                
                   
                    <input type="text" class="input-field" name="name" placeholder="Enter Name" required>
                    <input type="text" class="input-field" name="tel"placeholder="Enter tel" required>
                    <input type="text" class="input-field" name="bn"placeholder="Enter Business number">
                    <input type="checkbox" class="checkbox"><span>Terms and conditions</span>
                    <button type="button" class="submit" onclick = "allcheck()" >REGISTER</button>
                </form>
            </div>
        </div>
        <script>
            var x = document.getElementById("login");
            var y = document.getElementById("register");
            var z = document.getElementById("btn");
            
            
            function login(){
                x.style.left = "50px";
                y.style.left = "450px";
                z.style.left = "0";
                x.style.outline = red;
                z.style.outline = red;
                
            }

            function register(){
                x.style.left = "-400px";
                y.style.left = "50px";
                z.style.left = "110px";
               
            }
        </script>
        
    <script src="assets/js/jquery.min.js"></script>    
   <script>
    function idcheck(){
    	
		var joinform = document.f;
		var id = joinform.id.value;
		var RegExp = /^[a-zA-z0-9]{4,15}$/; 
		
		if(id.length > 15 || id.length < 4 || !id || !RegExp.test(id))
		  {alert("아이디는 영문 대소문자, 숫자 4~15자 입력하세요.");
		  id.select();}
		else{
    	
         var input1 = document.getElementById("input_id");
         $.ajax({
            
            url : "idcheckCon", 
            type : "post", 
            data : {id : input1.value}, 
            dataType : "text",
            success : function(data){

            var span_tag1 = document.getElementById("sp1");
               if(data=="true"){
                  alert("중복된 아이디입니다.")
                  
               }else{
<<<<<<< HEAD
            	   alert("사용가능한 아이디입니다.")
=======
                  alert("��밡���� ���̵��Դϴ�.")
>>>>>>> branch 'master' of https://github.com/2021-SMHRD-KDT-New-Bigdata-1/Exhibition.git
               }
            },
            error : function(){
               alert("통신실패")
            }
         })}
    }
      function nickcheck(){
    	  
    	  var joinform = document.f;
    	  var nick = joinform.nick.value;
    	  var RegExp = /^[a-zA-z0-9_]{4,15}$/;
    	  
		  if(nick.length > 15 || nick.length < 4 || !nick || !RegExp.test(nick))
		  {alert("닉네임은 영문 대소문자, _ , 숫자 4~15자 입력하쇼.");
			  nick.select();}
		  
		  else{
         	var input2 = document.getElementById("input_nick");
         $.ajax({
            
            url : "nickcheckCon", 
            type : "post",
            data : {nick : input2.value},
            dataType : "text", 
            success : function(data){ 

            var span_tag2 = document.getElementById("sp2");
               if(data=="true"){
                  alert("중복된 닉네임입니다.")
                  
               }else{
<<<<<<< HEAD
            	   alert("사용가능한 닉네임입니다.")
=======
                  alert("��밡���� �г����Դϴ�.")
>>>>>>> branch 'master' of https://github.com/2021-SMHRD-KDT-New-Bigdata-1/Exhibition.git
               }
            },
            error : function(){
               alert("통신실패")
            }
            
         })}
    
      }
      
      
      function allcheck(){
    	  
    	  var joinform = document.f;
    	  
    	  var id = joinform.id.value;
    	  var nick = joinform.nick.value;
    	  var pw = joinform.pw.value;
    	  var name = joinform.name.value;
    	  var tel = joinform.tel.value;
    	  var bn = joinform.bn.value;
    	  
    	  var RegExp = /^[a-zA-z0-9]{4,15}$/;  
		  var nameRegExp = /^[가-힣]{2,5}/;
		  var telRegExp = /^[0-9]{3}-[0-9]{4}-[0-9]{4}$/;
		  var bnRegExp =  /^[0-9]{3}-[0-9]{2}-[0-9]{5}$/;

			 
    	 
    	  	
    	  	if(pw.length > 15 || pw.length < 4 || !pw || !RegExp.test(pw))
    		  {alert("비밀번호는 영문 대소문자, 숫자 4~15자 입력하세요.");
    		  	pw.select();}
    	  	else if(pw == id){
    	  		alert("비밀번호는 아이디와 같을 수 없습니다. 다시 입력하세요.");
    	  		pw.select();
    	  	}else if(pw == nick){
    	  		alert("비밀번호는 닉네임과 같을 수 없습니다. 다시 입력하세요.")
    	  		pw.select();
    	  	}
    	  	else if(!nameRegExp.test(name)){
				alert("이름은 한글만 입력하세요.")
    			  name.select();
				}
			else if(tel.length < 12 || !telRegExp.test(tel)){
				alert("전화번호는 000-0000-0000 방식으로 입력하세요.");
    		  	tel.select();
    		  	}
			
			else if(!bnRegExp.test(bn)){
				if(bn == ""){
					joinform.submit();
				}else{
				alert("사업자번호는 000-00-00000 방식으로 입력하세요.");
    		  	bn.select();
    		  	}	  
			}else{joinform.submit();
      }
    		  
      }
   </script>
    </body>