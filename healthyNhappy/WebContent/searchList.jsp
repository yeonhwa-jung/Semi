<%@page import="dto.ProductDto"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.HashMap"%>

<%@page import="java.util.List"%>
<%@ page import="dto.WbBbsDto" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">

<title>HEALTHY & HAPPY</title>
<%@ include file="parts/header.jsp" %>  

<style>

.container{
    padding-top: 250px;
    padding-bottom: 150px;
}
.menu{
	color: #0D6400;
	font-weight: bold;
	font-size: 20px;
}
.category{
	margin: 0 400px;
	font-size: 17px;
	color: grey;
}
hr{
	margin-left: 400px;
	margin-right: 400px; 
}
.firstrow{
	border-top: 1.5px solid #0D6400;
    width: 200px;
    margin-left: 0px;
    margin-right: 0px;
}
a{
	color: grey;
} 
a:hover{
	color: black;
	text-decoration: none;
}
.bbs tr{
	height: 40px;
	text-align: center;
	border-bottom: 1px solid grey;
}
.bbs th{
	text-align: center;
	background-color: lightgrey;
}
.bbs table{
	margin-bottom: 30px;
}
img:hover{
	transform: scale(1.1);
  -webkit-transform: scale(1.05);
  -moz-transform: scale(1.05);
  -ms-transform: scale(1.05);
  -o-transform: scale(1.05);
   transition: all 0.2s ease-in-out;
}
.frame{ 
	overflow: hidden; 
}
</style>
</head>
<body>

  
 <%
HashMap<String, Object> map = (HashMap<String, Object>)request.getAttribute("map");
List<ProductDto> list = (List<ProductDto>)map.get("list");

//가격 표기 함수
DecimalFormat formatter = new DecimalFormat("###,###");

//진하씨----
List<WbBbsDto> wlist = (List<WbBbsDto>)map.get("wlist");
int pageNumber = (int)map.get("pageNumber");
int wbBbsPage = (int)map.get("wbBbsPage");
%>
<div class="container">
    
   <br><br> 
  <div class="result">
   <div class="menu" align="center">검색결과</div>
   <div align="center"><hr class="firstrow"></div>
   <div class="category">제품</div>
	<hr>
	<div class="list" align="center">
    	<table>
    		<tr>
			<%
			if(list.size() > 0){
			
			   for(int i=0; i<list.size(); i++){
				%>
			   	<td class="frame" style="padding-top: 10px">
			   		<a href="product?work=detail&prd_num=<%=list.get(i).getPrd_num()%>">
			   			<img src="img/prdimg/<%=list.get(i).getImg_name() %>" width="280px">
			   		</a>
			   	</td>	
				<%     
			   }
			   %>
   			</tr>
   			<tr style="text-align: center">
   				<%
			   for(int i=0; i<list.size(); i++){
				%>
   				<td style="padding-top: 30px">
   					<a href="product?work=detail&prd_num=<%=list.get(i).getPrd_num()%>">
   						<%=list.get(i).getName() %>
   					</a>
   				</td>
   				<%     
			   }
			   %>
   			</tr>
   			<tr style="text-align: center">
   				<%
			   for(int i=0; i<list.size(); i++){
				%>
   				<td><%=formatter.format(list.get(i).getPrice())  %>원</td>
   				<%     
			   }
			   %>
   			</tr>
   			<%
   			}else{
				%>
				<tr>
					<td>"${map.searchWord}"에 일치하는 제품이 없습니다.</td>
				</tr>
				<% 
			 }
   			%>
   		</table>
   </div>
   <br><br>
   
   <div class="category">게시글</div> 
   <hr>
  <br>
	<div class="bbs" align="center">
	<form id="wellBingTable">
		<table>
		<col width="100"> <col width="600"> <col width="130"> <col width="155">

			<tr>
				<th style="text-align: center">번호</th><th style="text-align: center">제목</th><th style="text-align: center">작성자</th><th style="text-align: center">작성일</th>
			</tr>
			<%
				if(wlist ==null || wlist.size() ==0){
			%>
			<tr>
			<td colspan="4" align="center">"${map.searchWord}"에 일치하는  게시글이 없습니다. </td>
			</tr>
			<%
				}else{

					for(int i =0; i< wlist.size(); i++){
						WbBbsDto wbs =wlist.get(i);
						%>
			<tr>
				<td><%=i+1 %></td>

				<td>
				<%
					if(wbs.getDel() ==0){
				%>
					<a href="wbbbs?write=detailView&seq=<%=wbs.getSeq() %>">
						<%=wbs.getTitle() %>
					</a>
				<%
						}else{
				%>
					<font color="#ff0000"> *********** 이글은 작성자에 의해 삭제 되었습니다.</font>
				<%
						}
				%>
				</td>
				<td align="center"><%=wbs.getId() %></td>
				<td align="center"><%=wbs.getWdate() %></td>
			</tr>
			<%
				}
				}
			%>
		</table>
		<%
			for(int i =0; i<wbBbsPage; i++){
				if(pageNumber == i){
		%>
		<span style="font-size: 15pt; color: #000; font-weight: bold;">
			<%=i+1 %>
		</span>
		<%
		}
		else{
		%>
		<a href="#" title="<%=i+1 %>페이지" onclick="goPage(<%=i %>)"
		   style="font-size:  15pt; color: #000; font-weight: bold; text-decoration: none">
			[<%=i+1 %>]
		</a>
		<%
				}
			}
		%>

	</form>
	</div>
  </div> 
</div>
	<script type="text/javascript">

		function goPage(pageNum) {
			var search = '${map.searchWord}';

			$.ajax({
				url: './wbbbs', //메인 컨트롤러로 보내겠어용
				type: 'get',  // 타입은 겟과 포스트가 있는데 저는 겟으로 보냈어용
				data: {
					write:'tableSearch',  // write.equals("tableSearch"){  컨트롤러에 이렇게 쓰는 양식
					searchWord: search,  //  서치의 키와 밸류  페이지의 키와 밸류 값이 있어야함
					pageNumber: pageNum
				},
				success: function(response) {   // 성공 할때 왤빙테이블 아이디 값을 받아  .html 값을 받음.
					$("#wellBingTable").html(response);
				},
				error: function (error) {
					console.log(error);
				}
			})
		}
	<%--ajax 로 바꾸기--%>
	// 		location.href = "main?write=choice&search=" +word + "&choice=" + choice + "&pageNumber=" + pageNum;

	</script>
  
  <%@ include file="parts/footer.jsp" %>  
</body>
</html>