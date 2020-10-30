<%@page import="java.util.List"%>
<%@page import="dto.MemberDto"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<style>
.container{
	padding-top: 140px;
}
.menu {
	float: left;
	margin-left: 250px;
	margin-top: 105px;
}
.menu table{
	width: 200px;
	height: 250px;
	font-size: 16px;
}
.menu tr{
	border-bottom: 1px solid lightgrey;
}
.menu tr:hover{
	border-bottom: 2px solid #0D6400;
	font-weight: bold;
}
.menu a{
	text-decoration: none;
	color: black;
}
.menu .active{
	border-bottom: 2px solid #0D6400;
	font-weight: bold;
}
.list table{
	margin-top: 50px;
	width: 600px;
    margin-right: 300px;
    margin-bottom: 150px;
    align-content: center;
    text-align: center;
}
.list table input{
	width: 100%;
}
.list table textarea{
	width: 100%;
    margin-top: 5px;
}
.list table tr{
	border-bottom: 1px solid lightgrey;
	height: 50px;
}
.list table hr{
	border-top: 2px solid #0D6400;
}
.list table th{
	text-align: center;
}
.list table img{
	margin: 5px 0;
}
.container .btn{
   	font-weight: bold;
	background: #0D6400;
	color: #fff;
	border-color: #0D6400;
	min-width: 100px;
	margin: 0 5px;
	margin-bottom: 30px;
}

</style>

<head>
<meta charset="utf-8">
<title>운영자 권한 회원정보수정</title>
<%@ include file="parts/header.jsp" %> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</head>
<body>
<%
MemberDto dto = (MemberDto)request.getAttribute("dto1");
%>

<div class="container">

	<div class="menu">
		<table>
			<tr><td><a href="authProduct?work=chart">제품차트</a></td></tr>
			<tr><td><a href="authProduct?work=list">제품관리</a></td></tr>
			<tr><td><a href="authProduct?work=order">주문관리</a></td></tr>
			<tr class="active"><td><a href="Manager?action=list">회원정보관리</a></td></tr>
		</table>
	</div>

<div class="list" align="center">

<H1 align="left" style="margin-top: 100px;">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;관리자권한 회원정보수정</H1>

<form action="Manager?action=userupdate" method="post" >

<table>
<col><col><col>
	 <tr>
 		<th>아&ensp;이&ensp;디</th><td><input readonly="readonly" class="input" type="text" id="id" name="id" value="<%=dto.getId() %>"></td>
 	</tr>
	<tr>
 		<th>이&emsp;&emsp;름</th><td><input value="<%=dto.getName() %>" readonly="readonly" class="input" type="text" id="name1" name="name1" ></td>
	</tr>
	<tr>
 		<th>주&emsp;&emsp;소</th><td><input value="<%=dto.getAddress() %>" type="text" readonly="readonly" id="add1" name="add1"></td>
 		<td align="left"><button type="button" id="addbtn" class="bbtn" >&emsp;주소 검색</button></td>
	</tr>
 	<tr>				
 		<th>상&nbsp;세&nbsp;주&nbsp;소</th><td><input class="input" type="text" id="add2" name="add2" placeholder="상세주소를 입력하세요"></td>
 	</tr>
 	<tr>
 		<th>휴대폰 번호</th><td><input oninput="numcheck()" value="<%=dto.getPhone() %>" class="input" type="text" id="num" name="num" placeholder=" - 빼고 입력하세요."></td>
 		<td colspan="3">&emsp;<div class="div" id="numcheck"></div></td>
 	</tr>
 	<tr>
 		<th>이&ensp;메&ensp;일</th><td><input oninput="emailcheck()" value="<%=dto.getEmail() %>" class="input" type="text" id="email" name="email" placeholder="이메일을 입력하세요."></td>
 		<td colspan="3">&emsp;<div class="div" id="emailcheck"></div></td>
 	</tr>
 	<tr>
 		<td colspan="3"><button class="bbtn" type="submit">수정완료</button></td>
 	</tr>
</table>

</form>

</div>  
</div>    


<script type="text/javascript">

/* 주소검색 */
 
$("#addbtn").click(function(addSearch) { 
    new daum.Postcode({
        oncomplete: function(data) {
            $("#add1").val(data.address);
        }
    }).open();
});

</script>


<!-- footer----------------------------------------------------------------------------------------->
<%@ include file="parts/footer.jsp" %>    
<!-- ----------------------------------------------->
</body>
</html>