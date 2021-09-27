<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
    <head>
        <title>�α��� / ȸ������ </title>
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
                <form id="register" action="joinCon" class="input-group">
                    <input type="text" class="input-field" id="input_id1" name="id" placeholder="Enter ID" required >
                   
                   <button class="check" onclick="idcheck()">ID Check<span id="sp1"></span></button>
                
                   
                    <input type="password" class="input-field" name="pw" placeholder="Enter Password" required>
                    <input type="text" class="input-field" id="input_id2" name="nick"placeholder="Enter Nickname" required>
                    
                    <button class="check" onclick="nickcheck()">NICK check<span id="sp2"></span></button>
                
                   
                    <input type="text" class="input-field" name="name" placeholder="Enter Name" required>
                    <input type="text" class="input-field" name="tel"placeholder="Enter tel" required>
                    <input type="text" class="input-field" name="bn"placeholder="Enter Business number">
                    <input type="checkbox" class="checkbox"><span>Terms and conditions</span>
                    <button class="submit">REGISTER</button>
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
         var input1 = document.getElementById("input_id1");
         $.ajax({
            
            url : "idcheckCon", 
            type : "post", 
            data : {id : input1.value}, 
            dataType : "text",
            success : function(data){

            var span_tag1 = document.getElementById("sp1");
               if(data=="true"){
                  alert("�ߺ��� ���̵��Դϴ�.")
                  
               }else{
                  alert("��밡���� ���̵��Դϴ�.")
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
                  alert("�ߺ��� �г����Դϴ�.")
                  
               }else{
                  alert("��밡���� �г����Դϴ�.")
               }
            },
            error : function(){
               alert("��Ž���")
            }
            
         })}
   </script>
    </body>