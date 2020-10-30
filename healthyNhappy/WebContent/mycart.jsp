<%@page import="dto.CartDto"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Array"%>
<%@page import="dto.ProductDto"%>
<%@page import="dto.OrderDto"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">

<title>HEALTHY & HAPPY</title>
<%@ include file="parts/header.jsp"%>


<%
List<CartDto> cartlist = (List<CartDto>) request.getAttribute("cart");
List<ProductDto> productlist = (List<ProductDto>) request.getAttribute("cartProduct");
%>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		
<style type="text/css">
.fixed-footer{
	margin-top: 200px; 
}


span.title{

	font-family: 'Noto Sans KR', sans-serif;
	font-size: 2.7em;
	font-weight: 700;
	vertical-align: middle;
	margin-left: 30px;
}

span.content{

	font-family: 'Noto Sans KR', sans-serif;
	font-size: 1.7em;
	font-weight: 700;
	vertical-align: middle;
	margin-left: 30px;
}

span.content_big{

	font-family: 'Noto Sans KR', sans-serif;
	font-size: 2.7em;
	font-weight: 700;
	vertical-align: middle;
	margin-left: 30px;
}



tr.tr_top{


	border-top: 3px solid black;
	border-bottom: 3px solid #d9d9d9;
	color: #737373;
	text-align: center;
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 400;
	font-size: 17px;

	}

tr.tr_content{

	background-color: #f2f2f2;
	border-bottom: 1px solid #d9d9d9;
	text-align: center;
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 400;
	font-size: 16px;
	
}

.tr_content td{

	padding: 2px;

}
tr.tr_top td{

	padding: 15px;

}

tr.tr_bottom{

	text-align: center;
	
}


.tr_bottom td{

	padding: 10px;
}


.tr_content td.chbox{

	text-align: center;
	
	
}


.tr_content td.prd_image{

	padding:14px;
	text-align: center;

	background-color: #f2f2f2;

}

img.prd_image{

	max-width: 100px; 
	height: auto;
	
}

img.cart{

	margin-left: 70px;
}

button.orderBtn{

	border: 0;
	border-radius: 0.3em;
	background-color: #0d6400;
	color: white;
	padding: 0 3em;
	margin: 20px;
	height: 40px;
	line-height: 40px;
	font-size: 1.2em;
}
button.orderBtn:active {
	outline: none;
	background-color: #0a4d00;
}

div.top_banner{
	display: flex;
	height: 70px;
	width:100%;
	
	margin-top: 60px;
	margin-bottom: 40px;
	padding-left: 80px;
	

}

.top_banner .title{
	height:100%;
	width:50%;
	padding-left: 5px;
	
} 
.top_banner .content{
	height:100%;
	width:50%;
	padding-top: 13px;
	padding-left: 6px;

}

hr.bottom{

width: 1600px;
border: solid 1px #cccccc;
margin-top: 5px; 
margin-bottom: 80px;
float:none;

}

</style>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">	
</head>
<body>

<div class="container">
	<img alt="" src="img/main/08.jpg" width="100%">  
	
	 
	<div class="top_banner">
		<div class="title">
			<img  src="./img/cart_image/shopping-cart.png" class="cart">
			<span class="title">장바구니 페이지</span>
		</div>
		<div class="content">
			<img  src="./img/cart_image/one_big.png" class="cart">
			<span class="content_big">장바구니</span>
			<img  src="./img/cart_image/two.png" class="cart">
			<span class="content">결제</span>
			<img  src="./img/cart_image/three.png" class="cart">
			<span class="content">주문완료</span>
		</div>
	</div>
	
	<hr class="bottom">	



		<div align="center">
			<form id="cartFrm">
				<!-- <table border="1"> -->
				<table >
					<caption style="font-family: 'Noto Sans KR', sans-serif;font-weight: 400;font-size: 30px; color: #0d6400"">
					내가 담은 상품 리스트
					</caption>
					<col width="50">
					<col width="200">
					<col width="600">
					<col width="120">
					<col width="100">
					<col width="120">
					<col width="150">
					
					<tr class="tr_top">
						<td class="td_top"><input type="checkbox" name="functionAll"
							onclick="functionChecks(this.checked)"></td>

						<td>제품사진</td>
						
						<td>제품</td>

						<td>가격</td>

						<td>수량</td>

						<td>총결제액</td>

						<td>변경사항 저장</td>

					</tr>
					

					<%
						if (cartlist.size() == 0) {
					%>
					<tr >
						<td colspan="7" align="center" height="100">상품 리스트가 존재하지 않습니다</td>
					</tr>
					<tr>
						<td height="2" bgcolor="#cccccc" colspan="7"></td>
					</tr>
					<%
						} else {
						for (int i = 0; i < cartlist.size(); i++) {
							CartDto cdto = cartlist.get(i);
							ProductDto pdto = productlist.get(i);
					%>

					<tr class="tr_content">

						<td align="center"><input type="checkbox" class="chkbx"
							name="funCk" value="<%=cdto.getPrd_num()%>">
							<input	type="hidden" value="<%=cdto.getId() %>" name="ids" class="ids">
						</td>

						<td class="prd_image" onclick="location.href='product?work=detail&prd_num=<%=cdto.getPrd_num()%>'"><img src="img/prdimg/<%=pdto.getImg_name()%>" class="prd_image"> 
							<input type="hidden" value="<%=cdto.getPrd_num()%>" class="productNum">
						</td>

						<td onclick="location.href='product?work=detail&prd_num=<%=cdto.getPrd_num()%>'"><input type="hidden" class="goodProduct" value="<%=pdto.getPrd_num()%>">
							(상품번호:<%=cdto.getPrd_num()%>)<%=pdto.getName()%><br>							
						<td align="center"><input type="hidden" class="goodPrice"
							name="price" value="<%=pdto.getPrice()%>"><%=pdto.getPrice()%>원</td>


						<td align="center"><input type="text" class="goodAmount"
							name="amount" value="<%=cdto.getAmount()%>" style="width: 35pt; text-align: center"
							maxlength="2"></td>

						<td align="center"><input type="text" class="goodTotal"
							readonly="readonly" name="totalPrice" style="width: 150pt;border:none; outline:none; text-align: center; background-color: #f2f2f2"
							value="<%=pdto.getPrice() * cdto.getAmount()%>"></td>
						<td>
							<button type="button" class="btnUpdate btn btn-primary"
								style="background-color: #0D6400">수정</button>
						</td>
					</tr>
				
					<%
						}
					}
					%>
					
					<tr  class="tr_bottom">

						<td colspan="7">
							<button type="button" onclick="btnDelete()"
								class="orderBtn">삭제</button>
							<button type="button" onclick="btnOrder()"
								class="orderBtn">주문</button>	
															
						</td>
						

					</tr>


				</table>
			</form>

		</div>
	</div>


	<!-- 
		수정기능
		각각 수정된거 저장하는 버튼으로....
		seq=?&amount=?
		getparamete
		
		구매기능
		장바구니 체크박스한 물품만 구매하고 값 확인페이지로만 넘어가서.
		값 변경은 없고 체크박스 seq 번호로 뿌려주면서 구매하시겠습니까 확인페이지
		
		
		-->

	<script type="text/javascript">
		//필요한 기능?
		//수량 바뀌면 값 바뀌게...엔터키
		//수량 수정 기능..
		//여기 들어가면 체크박스 체크로 바뀌게...

		//값
		$(".goodAmount").on(
				"input",
				function() {
					//console.log(1);
					//let lastAmount = $(".goodAmount").val();		//확인...! 어딘가 렉나면 this...
					let lastAmount, price, total = null;
					lastAmount = $(this).val();
					//alert(lastAmount);
					price = $(this).closest('tr').children('td').children(
							'input.goodPrice').val();
					total = lastAmount * price;
					$(this).closest('tr').children('td').children(
							'input.goodTotal').val(total);

				});

		//버튼-----------------------------------------------------

		//수정 한개씩
		$(document)
				.ready(
						function() {
							$(".btnUpdate")
									.click(
											function() {

												let updateBtn = $(this);

												let fixNum = updateBtn
														.closest('tr')
														.children('td')
														.children(
																'input.productNum')
														.val();
												//alert(fixNum);
												let fixAmount = updateBtn
														.closest('tr')
														.children('td')
														.children(
																'input.goodAmount')
														.val();
												//alert(fixAmount);

												let fixTotal = $(this)
														.closest('tr')
														.children('td')
														.children(
																'input.goodTotal')
														.val();

												//alert(fixTotal);
												
												let fixId = $(this)
														.closest('tr')
														.children('td')
														.children(
																'input.ids')
														.val();

												location.href = "product?work=updateOne&fixNum="
														+ fixNum
														+ "&fixAmount="
														+ fixAmount
														+ "&fixTotal="
														+ fixTotal
														+ "&ids="
														+ fixId	;
												alert("수정 되었습니다");
											});
							

						});

		//구매 버튼
		function btnOrder() {

			$("#cartFrm").attr("action", "product?work=ordAll");
			$("#cartFrm").attr("method", "post");

			if (!$('.chkbx').is(':checked')) {
				alert('구매할 상품을 선택해주세요');
			} else {
				$("#cartFrm").submit();
			}
		}
		//삭제 기능
		function btnDelete() {
			//action="product?work=delAll" method="post"
			$("#cartFrm").attr("action", "product?work=delAll");
			$("#cartFrm").attr("method", "post");

			if (!$('.chkbx').is(':checked')) {
				alert('삭제할 상품을 선택해주세요');
			} else {
				$("#cartFrm").submit();

			}
		}

		//다중 체크
		function functionChecks(ch) {
			let arrCheck = document.getElementsByName("funCk");
			for (i = 0; i < arrCheck.length; i++) {
				arrCheck[i].checked = ch;
			}
		}
	</script>
	

	<%@ include file="parts/footer.jsp"%>
</body>
</html>