<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>HEALTHY & HAPPY</title>
<%@ include file="parts/header.jsp" %> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>

<style>

.container{
  padding: 200px 0px 30px;
  background-image : url('img/YH/01.jpg');   /* 배경 이미지 불러오기 */
  background-repeat : no-repeat;  /* 반복 안함 */
  background-size : cover;
}
.di {
  position: relative;
  z-index: 1;
  background: #FFFFFF;
  max-width: 730px;
  padding: 30px;
  text-align: center;
  box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
}
.di input {
  font-family: "Roboto", sans-serif;
  outline: 0;
  background: #f2f2f2;
  width: 350px;
  border: 0;
  margin: 0 0 15px;
  padding: 15px;
  box-sizing: border-box;
  font-size: 14px;
}
.di button {
  font-family: "Roboto", sans-serif;
  text-transform: uppercase;
  outline: 0;
  background: #0D6400;
  width: 100px;
  height: 50px;
  border: 0;
  padding: 3px;
  color: #FFFFFF;
  font-size: 14px;
  -webkit-transition: all 0.3 ease;
  transition: all 0.3 ease;
  cursor: pointer;
}
.font {
 text-align:center;
 width: 700px;
 height: 100px;  
}
.font tr{
 padding: 50px;
 height: 30px;
}
.font th{
 font-size: 17px;
 height: 30px;
 text-align: center;
 font: #4CAF50;
}
.font td{
 width: 2px;
}
.dldyd:hover{
 color: #0D6400;
 font-weight: 800;
}
input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}
</style>

<body>
 
<!-- body--------------------------------------------------------------------------------------- -->
<div class="container" align="center">
<div class="di">
<H1 style="color: #0D6400;">❧ H&H 회원가입❧</H1>
<hr style="border: 3px; border-color: green;">
<form action="member?action=regi" method="post" onsubmit="return checkAll()">
<br><br>
<table class="font" >
<col><col><col><col>
	 <tr>
 		<th>아&ensp;이&ensp;디</th>
 		<td><input class="input" type="text" id="id" name="id" placeholder="아이디 입력"></td>
		<td align="left" ><button type="button" id="idbtn" >아이디&nbsp;체크</button>
 	</tr>
 	<tr>
 		 <td></td><td><div class="div" id="idcheck"></div></td>
 	</tr>
	<tr>
 		<th>비&nbsp;밀&nbsp;번&nbsp;호</th>
 		<td><input class="input" oninput="pwdcheck1()" type="password" id="pwd1" name="pwd1" placeholder="비밀번호 입력" colspan="2"></td>
	</tr>
 	<tr>
 		<th>비밀번호 확인</th>
 		<td><input oninput="pwdcheck2()" class="input" type="password" id="pwd2" name="pwd2" placeholder="비밀번호 확인" readonly="true"></td>
	</tr>
	<tr>
 		 <td colspan="3"><div id="pwdcheck" class="div"></div></td>
 	</tr>
	<tr>
 		<th>이&emsp;&emsp;름</th>
 		<td><input oninput="namecheck()" class="input" type="text" id="name1" name="name1"  placeholder="이름을 입력하세요"></td>
 	</tr>
 	<tr>	
		<td colspan="3"><div class="div" id="namecheck"></div></td>
	</tr>
	<tr>
 		<th>주&emsp;&emsp;소</th>
		<td><input class="in" oninput="addcheck()" type="text" readonly="readonly" id="add1" name="add1"  placeholder="주소검색 클릭하세요 ☞"></td>
 		<td align="left"><button type="button" id="addbtn" class="Btn" >주&nbsp;소&nbsp;&nbsp;검&nbsp;색</button></td>
	</tr>
 	<tr>				
 		<th>상&nbsp;세&nbsp;주&nbsp;소</th>
 		<td><input class="input" type="text" id="add2" name="add2" placeholder="상세주소를 입력하세요"></td>
 	</tr>
 	<tr>
 		<th>휴대폰 번호</th>
 		<td><input oninput="numcheck()" class="input" type="number" id="num" name="num" placeholder="-빼고 입력하세요."></td>
 	</tr>
 	<tr>	
 		<td colspan="3"><div class="div" id="numcheck"></div></td>
 	</tr>
 	<tr>
 		<th>이&ensp;메&ensp;일</th>
 		<td><input oninput="emailcheck()" class="input" type="text" id="email" name="email" placeholder="이메일을 입력하세요."></td>
 	</tr>
 	<tr>
 		<td colspan="3"><div class="div" id="emailcheck"></div></td>
 	</tr>
 		<tr>
 			<th class="dldyd" align="center" style="cursor:pointer;" colspan="3" onclick="window.open('Yhdldyd.jsp')">회원가입약관 및 개인정보처리 안내</th>
 		</tr>
 	<tr>
 		<td align="center" colspan="3" ><input style="width: 30px" id="checkbox" name="checkbox" type="checkbox">회원가입약관 및 개인정보처리 방침안내 약관에 동의합니다.</td>
 	</tr>
 	
</table>
<br>
<button style="width: 200px; height: 60px; font-size: 20px;" type="submit" class="Btn" >&emsp;회&nbsp;원&nbsp;가&nbsp;입&emsp;</button>
<br><br><br>
</form>

</div>  
   
</div>    

<!-- id체크 -->
<script type="text/javascript">

let re = /^[a-zA-Z0-9]{4,12}$/;	

$(function() {
	
	let ipCheck = /^[a-zA-Z0-9]{4,12}$/;
	
	$("#idbtn").click(function() {
		//alert('id btn click');	
		$.ajax({
			type:"post",
			url:'member',
			data: "action=idtest&id="+$("#id").val(),
			success:function( data ){
				//alert('success');	
				if(!ipCheck.test(id.value)){
			     	$("#idcheck").css("color", "#ff0000");
					$("#idcheck").text('아이디는 영문 대소문자와 숫자 4~12자리로 입력해주세요!');
					$("#id").val("");
			         id.focus();	
			   }else if (data.trim() == "OK"){
					$("#idcheck").css("color", "#0000ff");
					$("#idcheck").text('사용할 수 있는 id입니다');
				}else{
					$("#idcheck").css("color", "#ff0000");
					$("#idcheck").text('사용 중인 id입니다');
					$("#id").val("");
					}	
			},
			error:function(){
				alert("error");
			}
		});//ajax 
	});
});

</script> 


<script type="text/javascript">

$("#pwd1").focusout(function() {
	$("#pwd2").attr("readonly",false);
});

function pwdcheck1() {	/* 비밀번호 설정 */
	
	let ipCheck = /^[a-zA-Z0-9]{4,12}$/;
	
	 if(!ipCheck.test(pwd1.value)){
	   $("#pwdcheck").css("color", "#ff0000");
	   $("#pwdcheck").text('비밀번호는 영문 대소문자와 숫자 4~12자리로 입력해야합니다.');
		
	 }else if(pwd1.value == id.value){
		$("#pwdcheck").css("color", "#ff0000");
		$("#pwdcheck").text('아이디와 같은 비밀번호는 사용불가능 합니다.'); 
			
	 }else{
		 $("#pwdcheck").css("color", "#0000ff");
		 $("#pwdcheck").text('사용 가능한 비밀번호 입니다.');	 
	 }
}

function pwdcheck2(){	/* 비밀번호 확인 */
	
	let ipCheck = /^[a-zA-Z0-9]{4,12}$/;
	
     if(pwd1.value != pwd2.value){
		$("#pwdcheck").css("color", "#ff0000");
		$("#pwdcheck").text('비밀번호가 일치하지 않습니다');	
		
      }else if(!ipCheck.test(pwd1.value)){
		 $("#pwdcheck").css("color", "#ff0000");
		 $("#pwdcheck").text('비밀번호는 영문 대소문자와 숫자 4~12자리로 입력해야합니다.');
	
	  }else{
		$("#pwdcheck").css("color", "#0000ff");
		$("#pwdcheck").text('비밀번호가 일치합니다'); 
 	} 
}

 function namecheck() { /*이름 확인 */
	 
	let namecheck = /^[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]{2,5}$/;
	
	if(!namecheck.test(name1.value)){
		$("#namecheck").css("color", "#ff0000");
		$("#namecheck").text('이름형식에 맞지 않습니다. 다시 입력해 주세요');
	
	}else{
		$("#namecheck").css("color", "#0000ff");
		$("#namecheck").text('사용가능한 이름 입니다.'); 
	}
} 
  
function emailcheck() { /*메일 확인 */
		
	let emailcheck = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
	
	 if(!emailcheck.test(email.value)){ 
		$("#emailcheck").css("color", "#ff0000");
		$("#emailcheck").text('메일형식에 맞게 입력해 주세요.'); 
		 
	}else{
		$("#emailcheck").css("color", "#0000ff");
		$("#emailcheck").text('사용가능한 이메일 입니다.'); 
	}
}

function numcheck() { /* 연락처 확인 */
	
	let numcheck = /^[0-9]{11}/;
	
	if(!numcheck.test(num.value)){ 
		$("#numcheck").css("color", "#ff0000");
		$("#numcheck").text('연락처 형식에 맞게 입력해 주세요.'); 
		
	}else{
		$("#numcheck").css("color", "#0000ff");
		$("#numcheck").text('사용가능한 연락처 입니다.'); 
		}
}

function checkAll() { /* 회원가입으로 넘기기전에 마지막으로 검사하는 함수 */

	 let ipCheck = /^[a-zA-Z0-9]{4,12}$/;
	 let namecheck = /^[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]{2,5}$/;
	 let emailcheck = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
	 let numcheck = /^[0-9]{11}/;

	 if ($("#id").val() == ""){
		 alert("아이디 입력하세요!");
		 id.focus();
		 return false
		 
	}else if ($("#pwd1").val() == ""){
		 alert("비밀번호를 입력하세요!");
		 pwd1.focus();	 
		 return false
	}else if(!ipCheck.test(pwd1.value)){
		alert("비밀번호를 규격에 맞게 바르게 입력해 주세요");
		 return false
		 $("#pwd1").val("");
		  pwd1.focus();
		  
	}else if($("#pwd2").val() == ""){
		 alert("비밀번호 확인하세요!");
		 pwd2.focus();
		 return false
	}else if(pwd1.value != pwd2.value){
		 alert('비밀번호가 일치하지 않습니다');
		 pwd2.focus();
		 return false	
		 
	}else if ($("#name1").val() == ""){
		 alert("이름을 입력하세요!");
		 name1.focus();	
		 return false
	}else if(!namecheck.test(name1.value)){
		alert('이름형식에 맞지 않습니다. 다시 입력해 주세요');
		 name1.focus();	
		 return false
		 
	}else if ($("#add1").val() == ""){
		 alert("주소를 검색해서 입력하세요!");
		 add1.focus();	
		 return false
	}else if ($("#add2").val() == ""){
		 alert("상세주소를 입력하세요!");
		 add2.focus();	
		 return false
		 
	}else if ($("#num").val() == ""){
		 alert("연락처를 입력하세요!");
		 num.focus();
		 return false
	}else if(!numcheck.test(num.value)){ 
		alert('연락처 형식에 맞게 입력해 주세요.');
		 num.focus();
		 return false 
		 
	}else if ($("#email").val() == ""){
		 alert("메일을 입력하세요!");
		 email.focus();
		 return false
	}else if(!emailcheck.test(email.value)){ 
		alert('메일형식에 맞게 입력해 주세요.');
		 email.focus();
		 return false
	}
	
	 
	/* 가입약관체크  */
	if($("#checkbox").is(":checked")){
		} else {
		 alert("회원가입약관 및 개인정보처리 방침안내에 체크 해 주세요.");
		 return false
		} 
	}

	/* 주소검색  */
$("#addbtn").click(function(addSearch) { /* 주소검색 */
    new daum.Postcode({
        oncomplete: function(data) {
            $("#add1").val(data.address);
        }
    }).open();
});
</script>

<!-- footer--------------------------------------------------------------------------------------- -->
<%@ include file="parts/footer.jsp" %>  
<!-- --------------------------------------------- -->
</body>
</html>