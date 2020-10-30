<%@page import="org.apache.commons.collections.map.HashedMap"%>
<%@page import="java.util.HashMap"%>
<%@page import="dao.MemberDao"%>
<%@page import="dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>HEALTHY & HAPPY</title>
<%@ include file="parts/header.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>

.container{
	padding-top:140px;
}

.list{
	padding: 20px;
	margin-top: 30px;
	margin-left: 20px;
	margin-bottom:50px;
	text-align: center;
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

.ta{
	width:1200px;
	margin:50px 500px 60px;
	padding:20px ;
	background-color: white;
	align-content: center;

}
.ta tr{
	border-bottom: 1px solid lightgrey;
	padding: 5px;
	height: 50px;
}
.ta th{
	text-align: center;
	background-color: #F0F0F0;
}
.ta a{
	text-decoration: none;
	color: black;
}
.btn a{
   	text-decoration: none;
   	color: #fff;
}
.paging span{
	font-size: 16px;
	font-weight: bold;
}
.paging a{
	text-decoration: none;
	font-size: 14px;
	color: grey;
	font-weight: bold;
}

</style>

</head>
<body>

<%
HashMap<String, Object> mep = (HashMap<String, Object>)request.getAttribute("map");

List<MemberDto> list = (List<MemberDto>)mep.get("list"); 
int bbsPage = (Integer)mep.get("bbsPage");
int pageNumber = (Integer)mep.get("pageNumber");
String choice = (String)mep.get("choice");
String searchWord = (String)mep.get("searchWord"); 
%>

<script type="text/javascript">
$(document).ready(function() {
	let searchWord = "<%=searchWord %>";
	if(searchWord == "") return; 
	
	document.getElementById("category").value = "<%=choice%>";
	document.getElementById("category").setAttribute("selected", "selected");
	document.getElementById("txt").value = "<%=searchWord%>";
	
});
</script>

<!-- body--------------------------------------------------------------------------------------- -->
<div class="container">
	<div class="menu">
		<table>
			<tr><td><a href="authProduct?work=chart">제품차트</a></td></tr>
			<tr><td><a href="authProduct?work=list">제품관리</a></td></tr>
			<tr><td><a href="authProduct?work=order">주문관리</a></td></tr>
			<tr class="active"><td><a href="Manager?action=list">회원정보관리</a></td></tr>
		</table>
	</div>
<div class="list">
<h1 align="left">&emsp;&emsp;&emsp;관리자 회원목록 게시판</h1>
<table class="ta">
	<tr>
		<td align="right" colspan="7">
			<select id="category">
				<option value="sel">선택</option>
				<option value="NAME">이름</option>
				<option value="ADDRESS">주소</option>
			</select>
			<input type="text" id="txt" placeholder="검색어를 입력해주세요">
			<button onclick="searchBbs()">검색</button>
	</tr>
	<tr>
		<th>번호</th><th>아이디</th><th>이름</th><th>주소</th><th>전화번호</th><th>이메일</th><th colspan="2">정보</th>
	</tr>
<%
if(list.size() == 0 ){
%>
	<tr>
		<td colspan="7">고객의 정보가 없습니다.</td>
	</tr>
<%
}else{
	for(int i = 0; i < list.size(); i++){
		MemberDto dto = list.get(i);	
%>	
	<tr>
		<td width="50px;"  ><%=i+1 %></td>
		<td width="150px;" ><%=dto.getId() %> </td>
		<td width="150px;" ><%=dto.getName() %></td>
		<td width="300px;" ><%=dto.getAddress() %></td>
		<td width="150px;" ><%=dto.getPhone() %></td>
		<td width="150px;" ><%=dto.getEmail() %></td>	
		<td width="40px;"  ><input class="bbtn" type="submit" name="sjbtn" onclick="upbtn('<%=dto.getId() %>')" value="수정"></td>
		<td width="40px;"  ><input class="bbtn" type="submit" name="szbtn" onclick="delbtn('<%=dto.getId() %>')" value="삭제"> </td>
	</tr>
<%
	}
}
%>
</table>
</form>
 
<!-- 페이징 -->
<div class="paging" align="center">
<%
for(int i = 0; i < bbsPage; i++){
	if(pageNumber == i){ // 1 [2] [3]
	//현재 페이지
		%>
			<%=i+1 %>
		</span>&nbsp;
		<%	
	}else{	//그외 페이지
		%>
		<a href="#none" title="<%=i+1 %>페이지" onclick="goPage(<%=i %>)">
			<%=i+1 %>
		</a>&nbsp;
		<%
	}
}
%> 
</div>	
</div>
</div>
<script type="text/javascript">

function upbtn(id) {
		location.href="Manager?action=inid&id="+id;
}

function delbtn(id) {
	location.href="Manager?action=authdel&id="+id;
}

function searchBbs() {
	let choice = document.getElementById("category").value;
	let word = document.getElementById("txt").value;
	location.href = "Manager?action=list&searchWord="+ word +"&choice="+choice;
}

function goPage( pageNum ) {
	var choice = document.getElementById("category").value;
	var word = document.getElementById("txt").value;
	location.href = "Manager?action=list&searchWord=" + word + "&choice=" + choice + "&pageNumber=" + pageNum;
}

</script>

<!-- 페이지 번호 -->


   
</div>    
<%@ include file="../parts/footer.jsp" %>
</body>
</html>












