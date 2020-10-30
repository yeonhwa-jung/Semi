<%@page import="dto.ReviewBbsDto"%>
<%@page import="dto.CartDto"%>
<%@page import="dto.ProductDto"%>
<%@page import="dto.OrderDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">

<title>HEALTHY & HAPPY</title>
<%@ include file="parts/header.jsp"%>

<%
	List<OrderDto> orderlist = (List<OrderDto>) request.getAttribute("order");
%>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<style type="text/css">
div#sideBar {
	position: relative;
	width: 20%;
	height:800px;
	float: left;
	border-right: 1px solid #e7e7e7;
	text-align: center;
	font-size: 20px;
	line-height:50px;
}
#sideBar p{
	padding-top: 30px;
	color:  #777;
}


div#mypageview {
	width: 80%;
	height: auto;
    min-height: 100%;
    margin-bottom: 50px;
	float: left;
	position: relative;
}

/* order */
#orderTable{
	margin-top: 50px;
	margin-left: 180px;
	margin-bottom: 50px;
}
#orderTable th{
 text-align: center;
}
#orderTable .ordContenct:hover{
	color: #0D6400;	/* 메인 초록 */
	font-weight: bold;
}
.ordContenct td{
	text-align: center;
}
/* orderDetail */
#orderDetailPage td{
	text-align: center;
}

/* review */				
#reviewTable {
	margin-top: 50px;
	margin-left: 180px;
}
#reviewTable th{
	text-align: center;
	color: black;
	font-weight: bold;
}
#reviewTable td {
	text-align: center;
}
#reviewTable .revCtt:hover{
	color: #0D6400;
	font-weight: bold;
}
#reviewPage{			/* 페이지 위치 */
	position: absolute;
	top: 640px;
	left: 660px;
}

/* qna */
#qnaTable {
	margin-top: 50px;
	margin-left: 180px;
}
#qnaTable th{
	text-align: center;
	color: black;
	font-weight: bold;
}
#qnaTable td {
	text-align: center;
}
#qnaTable .qnaCtt:hover{
	color: #0D6400;
	font-weight: bold;
}
#qnaPage{			/* 페이지 위치 */
	position: absolute;
	top: 560px;
	left: 660px;
}
#qnaSearchWindow{	/* 검색 기능 위치 */
	position: absolute;
	top: 610px;
	left: 520px;
	
}
#qnaSearch{
	padding: 5px;
}
#qnaSearch:focus{
	outline:2px solid #0D6400;
}
#qnaSearchword{
	padding: 5px;
}
#qnaSearchword:focus {
		outline:2px solid #0D6400;
}


</style>

</head>
<body>

			
	<div class="container">
		
		<div id="sideBar">
	
		<br>
			<p>My Order</p>
			<p>My Review</p>
			<p>My QnA</p>
			<p onclick='location.href="member?action=meminfo"'>
				My Info
			</p>
		</div>
		
		<div id="mypageview">
		<br>
		<br>
			
			<table>
				<tr>
				<td align="left"><img src="img/mypageicon/odricon.png" style="margin-left: 70px; height: 55px; width:auto;" id="menuPhoto"></td>
				<td align="left"><p style="font-size: 35px; margin-left: 30px; margin-top: 25px; color: #000000; font-weight: bold;" id="menuChange">My Order</p></td>
				</tr>
			</table>
			
			
			<hr>
			
			<div id="tableStandard">  
				
				<table id="orderTable" 
					style="border-top: 2px solid #0D6400; border-bottom: 2px solid #0D6400;">
					<col width="150px"><col width="350px"><col width="150px"><col width="350px">
					<tr style="border-bottom: 1px solid #0D6400; color: black; font-weight: bold" height="40px">
						<th>주문날짜</th>
						<th>요청</th>
						<th>총가격</th>
						<th>배달주소</th>
					</tr>
					<%
						if (orderlist.size() == 0) {
							%>
							<tr>
							<td colspan='4' align='center'>게시된 글이 없습니다.</td>
							</tr>									
							<tr>																										
							<td height='2' bgcolor='#cccccc' colspan='4' style='border-bottom: 1px solid grey;'></td>			
							</tr>																		
							<%
					} else {
						for (int i = 0; i < orderlist.size(); i++) {
							OrderDto odto = orderlist.get(i);
					%>
					<tr class="ordContenct" height="30px" bgcolor="white" data-seq="<%=odto.getSeq()%>" style='border-bottom: 1px solid #ccc;'>
						
						<td>
						<%=odto.getOdate().substring(0, 10) %>
						<input type="hidden" class="ordSeq" value="<%=odto.getSeq()%>">
						</td>
						<td><%=odto.getAdd_req()%></td>
						<td><%=odto.getPrice()%>원</td>
						<td><%=odto.getDeli_addr()%></td>
						<!-- <td class="ab">
						</td> -->
					</tr>
					<tr align="center">
					 <td colspan="4" class="ab" align="center"></td>
					</tr>
					<%
						}
					}
					%>
				</table>
				</div>
			
		</div>
		
		
	</div>

	<script type="text/javascript">
		$(document).ready(function() {
			
			$('#sideBar p').hover(function() {
				  $(this).css({"color":"#0D6400","font-weight":"bold"});
				}, function(){
				  $(this).css({"color":"#777","font-weight":"normal"});
				});
			
			
			$("#orderTable .ordContenct").click( function() {
				
				let odSeq = $(this);
				let ordSeq= odSeq.closest('tr').children('td').children("input.ordSeq").val();
				
				$.ajax({
					url: "product",
					type:"get",
					data:{
						work : "mypageOrder",
						seq : ordSeq
					},
					datatype : "json",
					success : function(json) {
						let cartlist = json.map.orderOrdCart;
						let productlist = json.map.orderOrdProduct;
						console.log(cartlist);
						console.log(productlist);
						console.log(ordSeq);
						
						let orderDetail = "";
						
						orderDetail += "<table id='orderDetailPage' style='border-top: 2px solid black; border-bottom: 2px solid black; margin: 20px 20px 20px 20px;'>"									
									+ "<col width='100px'><col width='250px'><col width='150px'><col width='110px'><col width='100px'>"
									+ "<tr bgcolor='#0D6400' style='color: white;'>"
									+ "<th colspan='2'>제품</th>"
									+ "<th>주문 수량</th>"
									+ "<th>개당 가격</th>"
									+ "<th>합계</th>"
									+ "</tr>";
						
						for (let i = 0; i < cartlist.length; i++) {
							orderDetail += "<tr height='30px' onclick='location.href=\"product?work=detail&prd_num=" + productlist[i].prd_num + "\"\' style='border-bottom: 1px solid grey;' bgcolor='#e7e7e7'>"
										+ 	"<td style='padding : 10px 10px 10px 10px;'><img src='img/prdimg/" + productlist[i].img_name + "' style='max-width: 75px; height: auto;'></td>"
										+	"<td align='center'>" + productlist[i].name + "</td>"
										+	"<td>" + cartlist[i].amount + "</td>"
										+	"<td>" + productlist[i].price + "원</td>"
										+	"<td>" + (productlist[i].price*cartlist[i].amount) + "원</td>"
										+ 	"</tr>";
						}
						
						orderDetail += "<tr height='30px'>" 
									+"<td></td>" 
									+"<td>배송비</td>" 
									+"<td></td>" 
									+"<td></td>" 
									+"<td>2500원</td>" 
									+"</tr>"
									+"</table>";
									
						$("#orderDetailPage").remove();
						
						//$(odSeq).find('.ab').append(orderDetail);
						
						$(odSeq).next('tr').find('.ab').append(orderDetail);
						
					}
				});
			});
			
			//사이드바 기능
			$("#sideBar p").click(function() {
				let menu = $(this).text();
				console.log(menu);
				if (menu == "My Order") {
					location.href = "product?work=mypage";
				} else if (menu == "My Review") {//revlist
					$("#menuChange").text("My Review");
					$("#menuPhoto").attr("src","img/mypageicon/revicon.png")
					//테이블 생성된거 삭제
					$("#orderTable").remove();
					$("#reviewTable").remove();
					$("#qnaTable").remove();
					
					$.ajax({
						url : "product",
						type : "get",
						data : {
							work : "mypageReview"
						},
						datatype : "json",
						success : function(json) {
							let revlist = json.map.review;
							let revProductlist = json.map.reviewProduct;
							let bbsPage = json.map.reviewPagingNum;
							let pageNumber = json.map.reviewPageNum;
							console.log(revlist);
							console.log(revProductlist);
							console.log(bbsPage);
							console.log(pageNumber);
							
							let revTable = "";
							revTable += "<div style='height: 400px' id='reviewTable'>"	//400px
									+ "<table style='border-top: 2px solid #0D6400; border-bottom: 2px solid #0D6400;'>"
									+ "<col width='150px'><col width='180px'><col width='330px'><col width='190px'><col width='150px'>"	
									+ "<tr style='border-bottom: 1px solid #0D6400;' align='center' height='40px'>"
									+ "<th colspan='2'>제품</th>"
									+ "<th>제목</th>"
									+ "<th>별점</th>"
									+ "<th>작성일</th>"
									+ "</tr>";
							if(revlist.length == 0){																							
							revTable += "<tr><td colspan='5' align='center'>게시된 글이 없습니다.</td></tr>"											
									+"<tr>"																										
									+"<td height='2' bgcolor='#cccccc' colspan='5' style='border-bottom: 1px solid grey;'></td>"				
									+"</tr>";																									
								}else{																											
							for (let i = 0; i < revlist.length; i++) {
								revTable += "<tr class='revCtt' bgcolor='white' style='border-bottom: 1px solid #ccc;' onclick='location.href=\"product?work=detail&prd_num=" + revProductlist[i].prd_num + "\"\'>"	
											+"<td><img src='img/prdimg/" + revProductlist[i].img_name + "' style='max-width: 75px; height: auto;'></td>"
											+"<td>" + revProductlist[i].name + "</td>"
											+"<td id='title' class='title'>" + revlist[i].title + "</td>"
											+"<td><img src='img/stars/star" + revlist[i].score + ".png' style='max-width: 100px; height: auto;'></td>"
											+"<td>" + revlist[i].wdate.substr(0, 10) + "</td>"
											+"</tr>";
								}
							}																													
							revTable += "</table>";
							
							revTable += "<div id='reviewPage'>";
							for (let i = 0; i < bbsPage; i++) {
								if(pageNumber == i){
									revTable += '<span style="font-size: 13pt; color: #0D6400; font-weight: bold">' + (i+1) + '</span>&nbsp;';
								}else{
									revTable += '<a title="'+(i+1)+'페이지" onclick="goPage(' + i + ')"' +
										  'style="font-size: 13pt; color: #000; font-weight: bold; text-decoration: none">[' + (i+1) + ']' + 
										  '</a>&nbsp;';
								}
							}		 
							revTable += "<div>";
							
							revTable +"</div>";
							$("#reviewTable").remove();
							$("#tableStandard").append(revTable);		
							
						}
					});
					//--------------리뷰 끝
				} else if (menu == "My QnA") {//qnalist
					
					$("#menuChange").text("My QnA");
					$("#menuPhoto").attr("src","img/mypageicon/qnaicon.png")
					$("#orderTable").remove();
					$("#reviewTable").remove();
					$("#qnaTable").remove();
					
					$.ajax({
						url : "product",
						type : "get",
						data : {
							work : "mypageQna"
						},
						datatype : "json",
						success : function(json) {
							let qnaSearch = json.map.qnaSearch;
							let qnaSearchWord = json.map. qnaSearchWord;
							let qnaNowPage = json.map.qnaNowPage;
							let qnaPageNumber = json.map.qnaPageNumber;
							let qnaList = json.map.qnaList;
							console.log(qnaSearch);
							console.log(qnaSearchWord);
							console.log(qnaPageNumber);
							console.log(qnaNowPage);
							console.log(qnaList);
							
							let qnaTable = "";
							var num = 1;
							qnaTable += "<div style='height: 400px' id='qnaTable'>"	
									+ "<table style='border-top: 2px solid #0D6400; border-bottom: 2px solid #0D6400;'>"
									+ "<col width='60px'><col width='670px'><col width='100px'><col width='70px'><col width='100px'>"
									+ "<tr style='border-bottom: 1px solid #0D6400;' height='40px'>"
									+ "<th>번호</th>"
									+ "<th>제목</th>"
									+ "<th>답변상태</th>"
									+ "<th>조회수</th>"
									+ "<th>작성일</th>"
									+ "</tr>";
									
							if(qnaList.length == 0){																							
								qnaTable += "<tr><td colspan='5' align='center'>게시된 글이 없습니다.</td></tr>"											
									+"<tr>"																										
									+"<td height='2' bgcolor='#cccccc' colspan='5' style='border-bottom: 1px solid grey;'></td>"				
									+"</tr>";																									
								}else{																										
							for (let i = 0; i < qnaList.length; i++) {
								
								let str = "";
								if(qnaList[i].status==0){
									str="<font color='#ff6600'>답변대기</font>";
								}
								else{
									str="<font color='blue'>답변완료</font>";
								}
								
								qnaTable += "<tr bgcolor='white' style='border-bottom: 1px solid #ccc;' class='qnaCtt' onclick=\"location.href='main?work=QAdetailView&seq=" + qnaList[i].seq  + "\'\" height='30px'>"  /*  */
											+"<td>" + (num + i) + "</td>"
											+"<td id='title' class='title'>" + qnaList[i].title.substr(0, 35) + "</td>"
											+"<td>" + str + "</td>"
											+"<td>" + qnaList[i].readcount + "</td>"
											+"<td>" + qnaList[i].wdate.substr(0, 10) + "</td>"
											+"</tr>";
								}
							}																												
							qnaTable += "</table>";
							
							qnaTable += "<div id='qnaPage'>";
							for (let i = 0; i < qnaPageNumber; i++) {
								if(qnaNowPage == i){
									qnaTable  += '<span style="font-size: 15pt; color: #0D6400; font-weight: bold">' + (i+1) + '</span>&nbsp;';
								}else{
									qnaTable  += '<a title="'+(i+1)+'페이지" onclick="goQnaPage(' + i + ')"' +
										  'style="font-size: 15pt; color: #000; font-weight: bold; text-decoration: none">[' + (i+1) + ']' + 
										  '</a>&nbsp;';
								}
							}		 
							qnaTable += "</div>";
							
							//버튼 추가
							
							qnaTable += "<div>"
										+"<table id='qnaSearchWindow'>"
										+"<col width='50'><col width='200'><col width='75'>"
										+"<tr><td>"
										+"<select id='qnaSearch'>"
										+"<option value='cho'>선택</option>"
										+"<option value='tit'>제목</option>"
										+"<option value='ctt'>내용</option>"
										+"<select>"
										+"</td>"
										+"<td><input type='text' id='qnaSearchword'></td>"
										+"<td><button type='button' style='background-color: #0D6400' class='btn btn-primary' onclick='goQnaPage()'>SEARCH</button></td>"
										+"</tr>"
										+"</table>"
										+"</div>";
										
										
							qnaTable + "</div>";
							$("#qnaTable").remove();
							$("#tableStandard").append(qnaTable);		
						
						}
					});
				}
			});
	
		});
		
		//------------------------------------------------------------------------
		//REVIEW GOPAGE	
		function goPage( pageNum ) {
			$("#reviewTable").remove();
			$.ajax({
				url : "product",
				type : "get",
				data : {
					work : "mypageReview",
					pageNumber : pageNum
				},
				datatype : "json",
				success : function(json) {
					let revlist = json.map.review;
					let revProductlist = json.map.reviewProduct;
					let bbsPage = json.map.reviewPagingNum;
					let pageNumber = json.map.reviewPageNum;
					console.log(revlist);
					console.log(revProductlist);
					console.log(bbsPage);
					console.log(pageNumber);


					let revTable = "";
					revTable += "<div style='height: 400px' id='reviewTable'>"	//400px
							+ "<table style='border-top: 2px solid #0D6400; border-bottom: 2px solid #0D6400;'>"
							+ "<col width='150px'><col width='180px'><col width='330px'><col width='190px'><col width='150px'>"	
							+ "<tr style='border-bottom: 1px solid #0D6400;' align='center' height='40px'>"
							+ "<th colspan='2'>제품</th>"
							+ "<th>제목</th>"
							+ "<th>별점</th>"
							+ "<th>작성일</th>"
							+ "</tr>";
					if(revlist.length == 0){																							
					revTable += "<tr><td colspan='5' align='center'>게시된 글이 없습니다.</td></tr>"											
							+"<tr>"																										
							+"<td height='2' bgcolor='#cccccc' colspan='5' style='border-bottom: 1px solid grey;'></td>"				
							+"</tr>";																									
						}else{																											
					for (let i = 0; i < revlist.length; i++) {
						revTable += "<tr class='revCtt' bgcolor='white' style='border-bottom: 1px solid #ccc;' onclick='location.href=\"product?work=detail&prd_num=" + revProductlist[i].prd_num + "\"\'>"	
									+"<td><img src='img/prdimg/" + revProductlist[i].img_name + "' style='max-width: 75px; height: auto;'></td>"
									+"<td>" + revProductlist[i].name + "</td>"
									+"<td id='title' class='title'>" + revlist[i].title + "</td>"
									+"<td><img src='img/stars/star" + revlist[i].score + ".png' style='max-width: 100px; height: auto;'></td>"
									+"<td>" + revlist[i].wdate.substr(0, 10) + "</td>"
									+"</tr>";
						}
					}																													
					revTable += "</table>";
					
					revTable += "<div id='reviewPage'>";
					for (let i = 0; i < bbsPage; i++) {
						if(pageNumber == i){
							revTable += '<span style="font-size: 13pt; color: #0D6400; font-weight: bold">' + (i+1) + '</span>&nbsp;';
						}else{
							revTable += '<a title="'+(i+1)+'페이지" onclick="goPage(' + i + ')"' +
								  'style="font-size: 13pt; color: #000; font-weight: bold; text-decoration: none">[' + (i+1) + ']' + 
								  '</a>&nbsp;';
						}
					}		 
					revTable += "<div>";
					
					revTable +"</div>";
					$("#reviewTable").remove();
					$("#tableStandard").append(revTable);		
					
				}
			});
			
		}
		
		
		
		//------------------------------------------qna 기능 고치기
		//검색 
		function goQnaPage( pageQnaNum , qnaSearch, qnaSearchword) {
			let qnaSearchVal = $("#qnaSearch").val();
			let qnaSearchwordVal = $("#qnaSearchword").val();
			console.log(qnaSearchVal + "검색1");
			console.log(qnaSearchwordVal + "검색값1");
			/* 검색 */
			if(qnaSearch != null) {
				qnaSearchVal = qnaSearch;
			}
			
			if(qnaSearchword != null) {
				qnaSearchwordVal = qnaSearchword;
			}
			console.log(qnaSearchVal + "검색2");
			console.log(qnaSearchwordVal + "검색값2");
			
			$("#qnaTable").remove();
			
			$.ajax({
				url : "product",
				type : "get",
				data : {
					work : "mypageQna",
					nowPage : pageQnaNum,
					qnaSearch : qnaSearchVal,
					qnaSword : qnaSearchwordVal
				},
				datatype : "json",
				success : function(json) {
					let qnaSearch = json.map.qnaSearch;
					let qnaSearchWord = json.map. qnaSearchWord;
					let qnaNowPage = json.map.qnaNowPage;
					let qnaPageNumber = json.map.qnaPageNumber;
					let qnaList = json.map.qnaList;
					console.log(qnaSearch);
					console.log(qnaSearchWord);
					console.log(qnaPageNumber);
					console.log(qnaNowPage);
					console.log(qnaList);
					
					let qnaTable = "";
					var num = 1;
					qnaTable += "<div style='height: 400px' id='qnaTable'>"	//400px
							+ "<table style='border-top: 2px solid #0D6400; border-bottom: 2px solid #0D6400;'>"
							+ "<col width='60px'><col width='670px'><col width='100px'><col width='70px'><col width='100px'>"
							+ "<tr style='border-bottom: 1px solid #0D6400;' height='40px'>"
							+ "<th>번호</th>"
							+ "<th>제목</th>"
							+ "<th>답변상태</th>"
							+ "<th>조회수</th>"
							+ "<th>작성일</th>"
							+ "</tr>";
							
					if(qnaList.length == 0){																							
						qnaTable += "<tr><td colspan='5' align='center'>게시된 글이 없습니다.</td></tr>"											
							+"<tr>"																										
							+"<td height='2' bgcolor='#cccccc' colspan='5' style='border-bottom: 1px solid grey;'></td>"				
							+"</tr>";																									
						}else{																										
					for (let i = 0; i < qnaList.length; i++) {
						
						let str = "";
						if(qnaList[i].status==0){
							str="<font color='#ff6600'>답변대기</font>";
						}
						else{
							str="<font color='blue'>답변완료</font>";
						}
						
						qnaTable += "<tr class='qnaCtt' style='border-bottom: 1px solid #ccc;' bgcolor='white' onclick=\"location.href='main?work=QAdetailView&seq=" + qnaList[i].seq  + "\'\" height='30px'>" 
									+"<td>" + (num + i) + "</td>"
									+"<td id='title' class='title'>" + qnaList[i].title.substr(0, 35) + "</td>"
									+"<td>" + str + "</td>"
									+"<td>" + qnaList[i].readcount + "</td>"
									+"<td>" + qnaList[i].wdate.substr(0, 10) + "</td>"
									+"</tr>";
						}
					}																												
					qnaTable += "</table>";
					
					qnaTable += "<div id='qnaPage'>";
					for (let i = 0; i < qnaPageNumber; i++) {
						if(qnaNowPage == i){
							qnaTable  += '<span style="font-size: 15pt; color: #0D6400; font-weight: bold">' + (i+1) + '</span>&nbsp;';
						}else{
							qnaTable  += '<a title="'+(i+1)+'페이지" onclick="goQnaPage(' + i + ', '+'\'' +qnaSearch+'\''+', '+'\''+qnaSearchWord+'\''+')"' +
								  'style="font-size: 15pt; color: #000; font-weight: bold; text-decoration: none">[' + (i+1) + ']' + 
								  '</a>&nbsp;';
						}
					}		 
					qnaTable += "</div>";
					
					//버튼 추가
					
					qnaTable += "<div>"
								+"<table id='qnaSearchWindow'>"
								+"<col width='50'><col width='200'><col width='75'>"
								+"<tr><td>"
								+"<select id='qnaSearch'>"
								+"<option value='cho'>선택</option>"
								+"<option value='tit'>제목</option>"
								+"<option value='ctt'>내용</option>"
								+"<select>"
								+"</td>"
								+"<td><input type='text' id='qnaSearchword'></td>"
								+"<td><button type='button' style='background-color: #0D6400' class='btn btn-primary' onclick='goQnaPage()'>SEARCH</button></td>"
								+"</tr>"
								+"</table>"
								+"</div>";
								
								
					qnaTable + "</div>";
					$("#qnaTable").remove();
					$("#tableStandard").append(qnaTable);		
				
				}
			});
		}
		
	</script>

	<%@ include file="parts/footer.jsp"%> 
</body>
</html>