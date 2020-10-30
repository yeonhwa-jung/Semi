<%@page import="dto.ProductDto"%>
<%@page import="dto.CartDto"%>
<%@page import="java.util.List"%>
<%@page import="dto.OrderDto"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../parts/header.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<style type="text/css">
.container{
	padding-top: 140px;
}
.menu {
	float: left;
	margin-left: 250px;
	margin-top: 50px;
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
    margin-right: 500px;
    text-align: center;
}
.list table input{
	/* width: 100%; */
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
	/* margin-bottom: 30px; */
}
.prd table{
	width: 600px;
	margin-right: 300px;
    margin-left: 250px;
    margin-bottom: 30px;
}
.prd{
    margin-bottom: 100px;
}
.btnUpdate{
	margin-bottom: 0px;
}
.container caption{
	font-weight: bold;
	font-size: 20px;
}
</style>
</head>
<body>
<%
//가격 표기 함수
DecimalFormat formatter = new DecimalFormat("###,###");

HashMap<String, Object> map = (HashMap<String, Object>)request.getAttribute("map");
OrderDto dto = (OrderDto)map.get("dto");
List<CartDto> list = (List<CartDto>)map.get("list");
List<ProductDto> prdlist = (List<ProductDto>)map.get("prdlist");
%>
<br><br><br>
<div class="container">
	
	<div class="menu">
		<table>
			<tr><td><a href="authProduct?work=chart">제품차트</a></td></tr>
			<tr><td><a href="authProduct?work=list">제품관리</a></td></tr>
			<tr class="active"><td><a href="authProduct?work=order">주문관리</a></td></tr>
			<tr><td><a href="Manager?action=list">회원정보관리</a></td></tr>
		</table>
	</div>

	<div class="list" align="center">
		<form action="authProduct?work=orderupdate&seq=<%=dto.getSeq() %>" method="post">
		<table>
			<col width="130px"><col width="50px"><col width="100px"><col width="70px"><col width="130px"><col width="250px">
			<caption>주문내역</caption>
			<tr>
				<td colspan="8"><hr style="margin:0;"></td>
			</tr>
			<tr>
				<th>주문번호</th><td><%=dto.getSeq() %></td>
				<th>주문자 id</th><td><%=dto.getId()%></td>
				<th>주문일시</th><td><%=dto.getOdate()%></td>
			</tr>
			<tr>
				<th>배송지</th>
				<td colspan="3">
					<textarea name="address" rows="4" cols="40"><%=dto.getDeli_addr()%></textarea> 
				</td>
				<th>요청사항</th>
				<td>
					<textarea  name="request" rows="4" cols="40"><%=dto.getAdd_req()%></textarea> 
				</td>
			</tr>
			<tr style="border-bottom: 0px solid black">
				<td colspan="8"><hr style="margin:0;"></td>
			</tr>
		</table><br>
		<input class="btn" type="submit" value="주문수정">
		<input class="btn" type="button" value="주문삭제" onclick="deleteOrder()">
		</form>
	</div>
	
	<div class="list prd" align="center">
		<form id="frm" name="form" method="post">
		<table>
			<caption>구매 제품</caption>
			<tr>
				<td colspan="8"><hr style="margin:0;"></td>
			</tr>
			<tr>
				<th><input type="checkbox" id="chkAll" onclick="checkAll();"></th><th></th><th>제품명</th>
				<th style="width: 150px">주문갯수</th><th>가격</th><th></th>
			</tr>
			<%
			 for(int i=0; i< prdlist.size(); i++){
			%>
				<tr>
					<td><input type="checkbox" name="checkRow" class="chk" value="<%=prdlist.get(i).getPrd_num()%>"></td>
					<td><% 
			   			if( prdlist.get(i).getPrd_num()%10 > 5){
			   			%>
			   				<img src="./upload/<%=prdlist.get(i).getImg_name() %>" width="100px">
			   			<%	
			   			}else{
			   			%>
			   				<img src="img/prdimg/<%=prdlist.get(i).getImg_name() %>" width="100px">
			   			<%	
			   			}
			   			%></td>
					<td><%=prdlist.get(i).getName()%>
						<input type="hidden" value="<%=prdlist.get(i).getPrd_num()%>" class="productNum">
						<input type="hidden" name="id" value="<%=dto.getId()%>" class="ids">
						<input type="hidden" name="seq2" value="<%=dto.getSeq()%>">
					</td>
					<td>
						<input type="hidden" class="goodPrice" name="price" value="<%=prdlist.get(i).getPrice()%>">
						<input style="text-align: right;" type="text" class="goodAmount" name="amount" value="<%=list.get(i).getAmount()%>" size="2">
					</td>
					<td>
						<input type="text" class="goodTotal" name="totalPrice" size="11" style="text-align: right;" value="<%=prdlist.get(i).getPrice() * list.get(i).getAmount()%>" readonly>원
					</td>
					<td>
						<input class="btnUpdate" type="button" value="수정" id="">
					</td>
				</tr>
			<%	 
			 }
			%>
			<tr style="border-bottom: 0px solid black">
				<td colspan="8"><hr style="margin:0;"></td>
			</tr>
		</table>
			<input class="btn" type="button" onclick="goDelete()" value="제품삭제">
		</form>
		
	</div>
</div>

<!-- 제품 수량 변경 -->
<script type="text/javascript">

$(".goodAmount").on(
		"input",
		function() {
			let lastAmount, price, total = null;
			lastAmount = $(this).val();

			price = $(this).closest('tr').children('td').children(
					'input.goodPrice').val();
			total = lastAmount * price;
			$(this).closest('tr').children('td').children(
					'input.goodTotal').val(total);
		});

$(document).ready( function() {
	$(".btnUpdate").click( function() {
		let updateBtn = $(this);

		let fixNum = updateBtn.closest('tr').children('td').children('input.productNum').val();
		//alert(fixNum);
		let fixAmount = updateBtn.closest('tr').children('td').children('input.goodAmount').val();
		//alert(fixAmount);
		let fixTotal = $(this).closest('tr').children('td').children('input.goodTotal').val();
		//alert(fixTotal);
		let fixId = $(this).closest('tr').children('td').children('input.ids').val();

		location.href = "authProduct?work=updateOne&fixNum=" + fixNum
						+ "&fixAmount=" + fixAmount
						+ "&fixTotal=" + fixTotal
						+ "&ids=" + fixId
						+ "&seq=" + <%=dto.getSeq() %>;
		});
});
</script>

<!-- 제품 삭제 -->
<script type="text/javascript">
	function checkAll() {
		 if( $("#chkAll").is(':checked') ){
		        $("input[name=checkRow]").prop("checked", true);
		      }else{
		        $("input[name=checkRow]").prop("checked", false);
		      }
	}
	
	function goDelete() {
		if (!$('.chk').is(':checked')) {
			alert('삭제할 제품을 선택해주세요');
			return false;
		}
		
		if (confirm("정말 삭제하시겠습니까?") == true){
			$("#frm").attr("action", "authProduct?work=deleteCart").submit();
		} else{
			return false;
		}
	}
	
	/* 주문삭제 */
	function deleteOrder() {
		if (confirm("정말 삭제하시겠습니까?") == true){
			location.href="authProduct?work=deleteOrder&seq=" + <%=dto.getSeq()%>;
		} else{
			return false;
		}
	}
</script>	


<%@ include file="../parts/footer.jsp" %>	
</body>
</html>