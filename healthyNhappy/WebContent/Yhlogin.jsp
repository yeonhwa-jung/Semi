<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style>

body {
  background-image : url('img/YH/01.jpg');   /* 배경 이미지 불러오기 */
  background-repeat : no-repeat;  /* 반복 안함 */
  background-size : cover;
  background-position: center;
  text-align: left;
}

.login-page {
  width: 800px;
  padding: 20% 0 0;
  margin: auto;
}

.form {
  position: relative;
  z-index: 1;
  background: #FFFFFF;
  max-width: 550px;
  margin: 0 auto 100px;
  padding: 30px;
  text-align: center;
  box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
  
}
.form input {
  font-family: "Roboto", sans-serif;
  outline: 0;
  background: #f2f2f2;
  width: 100%;
  border: 0;
  margin: 0 0 15px;
  padding: 15px;
  box-sizing: border-box;
  font-size: 14px;
}
.form button {
  font-family: "Roboto", sans-serif;
  text-transform: uppercase;
  outline: 0;
  background: #0D6400;
  width: 100%;
  border: 0;
  padding: 15px;
  color: #FFFFFF;
  font-size: 20px;
  -webkit-transition: all 0.3 ease;
  transition: all 0.3 ease;
  cursor: pointer;
  
}
.form .message {
  margin: 15px 0 0;
  color: #b3b3b3;
  font-size: 13px;
}
.form .message a {
  color: #0D6400;
  text-decoration: none;
}
.form .message:hover{
font-weight: 600;
}
.container {
  position: relative;
  z-index: 1;
  max-width: 300px;
  margin: 0 auto;
}
.container:before, .container:after {
  content: "";
  display: block;
  clear: both;
}
.container .info {
  margin: 50px auto;
  text-align: center;
}
.container .info h1 {
  margin: 0 0 15px;
  padding: 0;
  font-size: 36px;
  font-weight: 300;
  color: #1a1a1a;
}
.container .info span {
  color: #4d4d4d;
  font-size: 12px;
}
.container .info span a {
  color: #000000;
  text-decoration: none;
}
.container .info span .fa {
  color: #EF3B3A;
}

</style>

<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<%@ include file="parts/header.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="http://lab.alexcican.com/set_cookies/cookie.js" type="text/javascript" ></script>


</head>
<body>
<div class="login-page">
  <div class="form">
  	<h2>LogIn</h2>
  	<table>
    <form class="login-form" action="member?action=login" method="post" name="frm" id="frm">
     <input id="id" name="id" type="text" placeholder="ID를 입력하세요" >
  	<input id="pwd" name="pwd" " type="password" placeholder="비밀번호를 입력하세요">
     <table style="width: 500px; height: 50px;">
     <col><col>
     	<tr>
         <td class="message" align="left" ><input style="width: 30px" type="checkbox" id="idck" name="idck">아이디 기억하기</td>
    	 <td class="message"align="right"><a href='Yhidpwd.jsp'>아이디.비밀번호 찾기</td>
     </tr>
     </table>
     <br>
      <td><button type="button" id="loginbtn" style="cursor:pointer;">로 그 인</button></td>
      <p class="message">아직 H&H 회원이 아니신가요? 
      <a href="Yhregi.jsp" style="cursor:pointer;">회원가입 하러 가기</a></p>
    </form>
  </div>
</div>

 <script type="text/javascript">
 
/* 로그인 빈칸체크 */
$("#loginbtn").click(function() {
	if($("#id").val().trim() == "" ){
		alert('아이디를 입력하세요!');
		$("#id").focus();
	}else if($("#pwd").val().trim() == ""){
		alert('비밀번호를 입력하세요!');
		$("#pwd").focus();
	}else{
		$("#frm").submit();
	}
 });

/* id체크 */
 
let user_id = $.cookie("user_id");	// cookie를 산출
if(user_id != null){			
	$("#id").val( user_id );
	$("#idck").attr("checked", "checked");
}

$("#idck").click(function () {	
	if( $("#idck").is(":checked") ){	// 첵크되었을 때 on
		if( $("#id").val().trim() == "" ){
			alert('id를 입력해 주십시오');
			$("#chk_save_id").prop("checked", false);
		}else{
			$.cookie("user_id", $("#id").val().trim(), { expires:7, path:'/' } );
		}
	}
	else{

		$.removeCookie("user_id", { path:'/' });
	}
});
</script>
  
</body>
</html>