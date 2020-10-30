<%@page import="dto.WbBbsDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	List<WbBbsDto> list = (List<WbBbsDto>) request.getAttribute("searchlist");
	String searchWord = (String)request.getAttribute("searchWord");
	String choice = (String)request.getAttribute("choice");
	int pageNumber = (int)(request.getAttribute("pageNumber"));// 현재 페이지
	int wbBbsPage = (int)(request.getAttribute("wbBbsPage")); // 페이지 번호



%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@500&display=swap" rel="stylesheet">
	<title>HEALTHY & HAPPY</title>

	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
	<style type="text/css">
		.swiper-container {
			margin-top: 50px;
			height:300px;
			width: 1400px;
			margin-left: 240px;
		}
		.swiper-slide {
			text-align:center;
			display:flex; /* 내용을 중앙정렬 하기위해 flex 사용 */
			align-items:center; /* 위아래 기준 중앙정렬 */
			justify-content:center; /* 좌우 기준 중앙정렬 */
		}
		.swiper-slide img {
			max-width:100%; /* 이미지 최대너비를 제한, 슬라이드에 이미지가 여러개가 보여질때 필요 */
		}
		.swiper-pagination-bullet-active{
			background:#0D6400;
		}
		.swiper-pagination-progressbar-fill{
			background:#0D6400;
		}
		.swiper-button-next{
			background-image:url("data:image/svg+xml;charset=utf-8,%3Csvg%20xmlns%3D'http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg'%20viewBox%3D'0%200%2027%2044'%3E%3Cpath%20d%3D'M0%2C22L22%2C0l2.1%2C2.1L4.2%2C22l19.9%2C19.9L22%2C44L0%2C22L0%2C22L0%2C22z'%20fill%3D'%23fff'%2F%3E%3C%2Fsvg%3E");
		}
		.swiper-button-prev{
			background-image:url("data:image/svg+xml;charset=utf-8,%3Csvg%20xmlns%3D'http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg'%20viewBox%3D'0%200%2027%2044'%3E%3Cpath%20d%3D'M27%2C22L27%2C22L5%2C44l-2.1-2.1L22.8%2C22L2.9%2C2.1L5%2C0L27%2C22L27%2C22z'%20fill%3D'%23fff'%2F%3E%3C%2Fsvg%3E");
		}
		.container{
			padding-top: 100px;
			padding-bottom: 100px;
		}
		.title{
			display: flex;
			flex-basis: 100%;
			align-items: left;
			color: rgba(0, 0, 0, 0.55);
			font-size: 20px;
			margin: 8px 0px;
			font-weight: bold;
			padding: 0 30px;
		}
		.title::after {
			content: "";
			flex-grow: 1;
			background: rgba(0, 0, 0, 0.1);
			height: 1px;
			font-size: 0px;
			line-height: 0px;
			margin: 0px 16px;
			margin-top: 15px;
			margin-right: 15px;
		}
		.wellbing-wrap {
			padding-bottom:  20px;
			padding-left: 150px;
			padding:20px;
			margin-bottom: 50px;


		}
		.tit-content {

			margin-bottom: 40px;
		}
		.content{
			padding: 150px;
			padding-top:3vh;
			margin-bottom: 50px;
			padding-bottom: 0;
			margin-top:30px;
		}
		.search-wrap{
			margin-bottom: 10px;
			margin-right: 30px;
		}
		.number{
			padding-top:50px;
			padding-right:27px;
		}
		td.line{
			border-top: none;
			border-bottom: 1px solid #ddd;
		}
		.wrote{
			padding-right: 20px;
			padding-top:20px;
		}


	</style>

</head>
<body>
<%@ include file="parts/header.jsp" %>


<div class="container wellbing-wrap" >
	<img class='max-small' src="img/main/05.jpg" width="100%">



	<div class="content" >
		<h2 class="tit-content" align="center" style="font-family: 'Gothic A1', sans-serif; color:#0d6400"> Well Being  Story
		</h2>


		<%--<input type="hidden" name="tail" value="detailView"> --%>
		<table    class="table">
			<col width="100"> <col width="600"><col width="80"> <col width="110">

			<tr style="border-top:2px solid black; border-bottom: 2px solid black;">
				<th style="text-align: center">번호</th><th style="text-align: center">제목</th><th style="text-align: center">작성자</th><th style="text-align: center">작성일</th>
			</tr>
			<%
				if(list== null || list.size() == 0){
			%>
			<tr>
				<td colspan="4" align="center"> 작성된 글이 없습니다.</td>
			</tr>
			<%
			}else{

				for (int i = 0; i < list.size(); i++) {
					WbBbsDto wbs = list.get(i);

			%>
			<tr>
				<td style="text-align: center" class="line"><%=i+1 %></td>

				<td style="text-align: center;" class="line">

					<%
						if(wbs.getDel() ==0){
					%>
					<a href="wbbbs?write=detailView&seq=<%=wbs.getSeq() %>" style="color: black" >
						<%=wbs.getTitle() %>

					</a>
					<%
					}else{
					%>
					<font color="#ff0000">******** 이글은 작성자에 의해 삭제 되었습니다. ******** </font>
					<%
						}
					%>
				</td>
				<td style="text-align: center" class="line"><%=wbs.getId() %> </td>
				<td style="text-align: center" class="line"><%=wbs.getWdate() %></td>
			</tr>
			<%
					}
				}
			%>
		</table>
		<div align="center" class="number">
		<%
	for(int i =0; i<wbBbsPage; i++){
		if(pageNumber == i){
		%>
		<span style="font-size: 15pt; color: #0000ff; font-weight: bold;">
		 	<%=i+1 %>
		</span>
		<%
			}
		else{
		%>

		<a href="#" title="<%=i+1 %>페이지" onclick="goPage(<%=i %>)"
				style="font-size:  15pt; color: #000; font-weight: bold; text-decoration: none;">
			&nbsp;<%=i+1 %>&nbsp;
		</a>

		<%
			}
			}
		%>
		</div>
	<% if(mem != null && mem.getAuth() ==1 ) {%>
		<br>
		<div align="center" class="wrote">
			<button type="button" onclick="location.href='wbbbs?write=addView'" style="background-color: #0d6400; color:white; border-radius: 0.3em; border: none;height:2em; line-height: 2em; padding:0 0.9em;">글쓰기</button>
		</div>
		<%}%>

	</div>
	<br>
	<form action="wbbbs" method="get" >
		<input type="hidden" name="write" value="choice">
		<div align="center" class="search-wrap">
			<select id="choice" name="choice"  style="border-radius: 0.3em; height:2em; line-height: 2em; padding:0 0.2em ">
				<option value="sel">선택</option>
				<option value="title">제목</option>
				<option value="writer">작성자</option>
				<option value="content">내용</option>
			</select>


			<input type="text" id="search" name="search" style="border-radius: 0.3em;  padding: 0 0.9em; height:2em; line-height: 2em; border: 1px solid gray;"  value="<%=searchWord %> ">

			<input type="submit" style="background-color: #0d6400; color:white; border-radius: 0.3em; border: none;height:2em; line-height: 2em; padding:0 0.9em;"  value="검색">
		</div>
	</form>
	<script type="text/javascript">





		function  searchWbBbs(){
			var choice = document.getElementById("choice").value;
			var word = document.getElementById("search").value;

			location.href = "wbbbs?write=choice&search=" +word + "&choice=" + choice;
		}

		function goPage( pageNum ){
			console.log(pageNum);
			let choice = document.getElementById("choice").value;
			let word =document.getElementById("search").value;

			location.href = "wbbbs?write=choice&search=" +word + "&choice=" + choice + "&pageNumber=" + pageNum;
			//location.href = "main?search=" +word ;
		}
	</script>


</div>
<%@ include file="parts/footer.jsp"%>
</body>
</html>