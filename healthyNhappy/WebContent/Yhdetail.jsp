<%@page import="org.apache.catalina.Session"%>
<%@page import="dto.MemberDto"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>

body {
  background-image : url('img/YH/03.jpg');   
  background-repeat : no-repeat;
  background-size : cover;
  background-position: center;
  text-align: left;
}
.container{
width: 800px;
padding: 20% 0 0;
margin: auto;
}
  
.div {
width: 700px;
height: 600px;
margin: 90px 200px 100px;
padding: 5px;
text-align: center;
background-color: #FFFFFF;
box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
} 
.ta, .ta2 { 
width:600px;
height:300;
padding:10px;
border-spacing: 20px;
text-align: center;
margin: 20px auto;
}
.ta td, .ta th {
border-bottom: 1px solid #0D6400;
text-align: center;
padding: 20px 20px;
font-size: 17px;
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
transition: all 0.3 ease;
cursor: pointer;
border-radius: 10px;
}

</style>

<html lang="en">
<head>
<meta charset="utf-8">
<title>HEALTHY & HAPPY</title>
<%@ include file="parts/header.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>

<%
MemberDto dto = (MemberDto)request.getAttribute("dto123");
%>
<!-- body--------------------------------------------------------------------------------------- -->
<body>
<div class="container" >
<div class="div">
<hr>
<h1 align="center">My Page : 내 정보</h1>
<hr> 
<table class=ta >
<col><col><col><col>
	<tr class="tr">
		<th calss="td">아&nbsp;이&nbsp;디&nbsp; :</th><td>[</td><td><%=dto.getId()%></td><td>]</td>
	</tr>
	<tr>
		<th>이&emsp;름&nbsp; :</th><td>[</td><td><%=dto.getName()%></td><td>]</td>
	</tr>
	<tr>
		<th>주&emsp;소&nbsp; :</th><td>[</td><td><%=dto.getAddress()%></td><td>]</td>
	</tr>
	<tr>
		<th>휴대폰번호&nbsp; :</th><td>[</td><td><%=dto.getPhone()%></td><td>]</td>
	</tr>
	<tr>
		<th>이&nbsp;메&nbsp;일&nbsp; :</th><td>[</td><td><%=dto.getEmail()%></td><td>]</td>
	</tr>
</table>
<br>
<table class="ta2">
<col><col>
	<tr>
		<td><button class="bbtn" onclick="location.href='Yhupdate.jsp'">회원정보 수정</button></td>
		<td><button class="bbtn" onclick="location.href='Yhdelete.jsp'">회원탈퇴</button></td>
	</tr>
</table>


</div>
</div>
<!-- footer--------------------------------------------------------------------------------------- -->
<%@ include file="parts/footer.jsp" %>     
<!-- ----------------------------------------------->
</body>
</html>