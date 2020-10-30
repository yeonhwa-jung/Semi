<%@page import="dto.MemberDto"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<style>
@import url(https://fonts.googleapis.com/css?family=Roboto:300);

body {
  background-image : url('img/YH/03.jpg');   /* 배경 이미지 불러오기 */
  background-repeat : no-repeat;  /* 반복 안함 */
  background-size : cover;
  background-position: center;
  text-align: left;
}

.container{
 width: 800px;
  padding: 20% 0 0;
  margin: auto;
 }
  
 .di {
  width: 700px;
  height: 800px;
  margin: 90px 200px 100px;
  padding: 5px;
  text-align: center;
  background-color: #FFFFFF;
  box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
} 

.ta {
width: 620px;
margin: 80px 100px 100px;
border: 10px;
border-color: green;
}

.ta th {
color: #0D6400;
}

.ta td, .ta th {
padding: 10px 10px;
font-size: 17px;
}

input {
border:0;
border-bottom: 1px solid #0D6400; 
text-align: center;
font-size: 12px;
}

.div{
font-size: 13px;
}

.bbtn {
  outline: 0;
  background: #0D6400;
  width: 100px;
  height: 40px;
  border: 0;
  padding: 5px;
  color: #FFFFFF;
  font-size: 15px;
  -webkit-transition: all 0.3 ease;
  transition: all 0.3 ease;
  cursor: pointer;
  border-radius: 10px;
}

</style>

<head>
<meta charset="utf-8">
<title>회원정보수정</title>
<%@ include file="parts/header.jsp" %> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</head>
<body>

<!-- body--------------------------------------------------------------------------------------- -->
<div class="container" >
<div class="di">
<form action="member?action=update" method="post" onsubmit="return checkAll()">
<hr>
<H1>회원정보수정</H1>
<hr>
<table class="ta">
<col><col><col>
	 <tr>
 		<th>아&ensp;이&ensp;디</th><td><input readonly="readonly" class="input" type="text" id="id" name="id" value="<%=mem.getId() %>"></td>
 	</tr>
 	<tr>
 		 <td></td><td><div class="div" id="idcheck"></div></td>
 	</tr>
	<tr>
 		<th>비&nbsp;밀&nbsp;번&nbsp;호</th><td><input class="input" oninput="pwdcheck1()" type="password" id="pwd1" name="pwd1" placeholder="비밀번호 입력"></td>
	</tr>
 	<tr>
 		<th>비밀번호 확인</th><td><input oninput="pwdcheck2()" class="input" type="password" id="pwd2" name="pwd2" placeholder="비밀번호 확인"></td>
	</tr>
	<tr>
 		 <td></td><td><div id="pwdcheck" class="div"></div></td>
 	</tr> 
	<tr>
 		<th>이&emsp;&emsp;름</th><td><input value="<%=mem.getName() %>" readonly="readonly" class="input" type="text" id="name1" name="name1" ></td>
	</tr>
	<tr>
 		<th>주&emsp;&emsp;소</th><td><input value="<%=mem.getAddress() %>" type="text" readonly="readonly" id="add1" name="add1"></td>
 								<td align="left"><button type="button" id="addbtn" class="bbtn" >주소 검색</button></td>
	</tr>
 	<tr>				
 		<th>상&nbsp;세&nbsp;주&nbsp;소</th><td><input class="input" type="text" id="add2" name="add2" placeholder="상세주소를 입력하세요"></td>
 	</tr>
 	<tr>
 		<th>휴대폰 번호</th><td><input oninput="numcheck()" value="<%=mem.getPhone() %>" class="input" type="text" id="num" name="num" placeholder=" - 빼고 입력하세요."></td>
 	</tr>
 	<tr>
 		<td colspan="3"><div class="div" id="numcheck"></div></td>
 	</tr>
 	<tr>
 		<th>이&ensp;메&ensp;일</th><td><input oninput="emailcheck()" value="<%=mem.getEmail() %>" class="input" type="text" id="email" name="email" placeholder="이메일을 입력하세요."></td>
 	</tr>
 	<tr>
 		<td colspan="3"><div class="div" id="emailcheck"></div></td>
 	</tr>
 	<tr>
 		<td colspan="3"><button class="bbtn" type="submit">수정완료</button></td>
 	</tr>
</table>
</form>

</div>  
</div>    

<script type="text/javascript">

function pwdcheck1() {	/* 비밀번호 설정 */
	
	let ipCheck = /^[a-zA-Z0-9]{4,12}$/;
	
	 if(!ipCheck.test(pwd1.value)){
		 $("#pwdcheck").css("color", "#ff0000");
		 $("#pwdcheck").text('비밀번호는 영문 대소문자와 숫자 4~12자리로 입력해야합니다.');	
		 pwd1.focus();
	 }else if(pwd1.value == id.value){
			$("#pwdcheck").css("color", "#ff0000");
			$("#pwdcheck").text('아이디와 같은 비밀번호는 사용불가능 합니다.'); 
			$("#pwd1").val("");
			pwd1.focus();
	 }else{
		 $("#pwdcheck").css("color", "#0000ff");
		 $("#pwdcheck").text('사용 가능한 비밀번호 입니다.');	 
	 }
}

function pwdcheck2(){	/* 비밀번호 확인 */
	
if(pwd1.value != pwd2.value){
	$("#pwdcheck").css("color", "#ff0000");
	$("#pwdcheck").text('비밀번호가 일치하지 않습니다');	
  
 }else if(pwd1.value == pwd2.value){
	$("#pwdcheck").css("color", "#0000ff");
	$("#pwdcheck").text('비밀번호가 일치합니다');
  }
}
 
function emailcheck() {
		
	let emailcheck = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
	
	if(!emailcheck.test(email.value)){ 
		$("#emailcheck").css("color", "#ff0000");
		$("#emailcheck").text('메일형식에 맞게 입력해 주세요.'); 
	
	}else{
		$("#emailcheck").css("color", "#0000ff");
		$("#emailcheck").text('사용가능한 이메일 입니다.'); 
	}
}

function numcheck() {
	
	let numcheck = /^[0-9]{11}/;
	
	if(!numcheck.test(num.value)){ 
		$("#numcheck").css("color", "#ff0000");
		$("#numcheck").text('형식에 맞게 입력해 주세요.'); 
		num.focus();
		
	}else{
		$("#numcheck").css("color", "#0000ff");
		$("#numcheck").text('사용가능한 연락처 입니다.'); 
		}
}

function checkAll() { //회원가입으로 넘기기전에 마지막으로 검사하는 함수
	
	let ipCheck = /^[a-zA-Z0-9]{4,12}$/;
	 let namecheck = /^[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]{2,5}$/;
	 let emailcheck = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
	 let numcheck = /^[0-9]{11}/;

	if ($("#pwd1").val() == ""){
		 aalert("비밀번호를 입력하세요!");
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

}

/* 주소검색 */
 
$("#addbtn").click(function(addSearch) { 
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