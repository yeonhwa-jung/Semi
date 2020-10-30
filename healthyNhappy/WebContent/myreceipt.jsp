<%@page import="dto.CartDto"%>
<%@page import="dto.ProductDto"%>
<%@page import="dto.OrderDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
MemberDto memb = (MemberDto)session.getAttribute("login");
%>	

<%

List<CartDto> receipt = (List<CartDto>) request.getAttribute("receipt");
List<ProductDto> receiptProduct = (List<ProductDto>) request.getAttribute("receiptProduct");
//아이디랑 연결된 cartdto? orderdto?

CartDto oneCart = (CartDto)request.getAttribute("cdto");
ProductDto oneProduct = (ProductDto)request.getAttribute("pdtoOne");
System.out.println(oneCart);
%>





<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
 
<title>HEALTHY & HAPPY</title>
<%@ include file="parts/header.jsp" %>  


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


<style>

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

	}.tr_top td{
	padding: 15px;
}	

tr.tr_content{

	background-color: #f2f2f2;
	border-bottom: 1px solid #d9d9d9;
	text-align: center;
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 400;
	font-size: 16px;	
	}.tr_content td{
	padding: 2px;
}




tr.tr_bottom{

	text-align: center;
	
}.tr_bottom td{
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

.tr_foot td{

	padding: 30px;
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 20px;

}

.tr_foot td.title{

	padding: 20px;
	padding-top: 60px;
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 400;
	font-size: 30px;
	color: #0d6400;
	border-bottom: 3px solid black;
	
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
	
	background-color: #0d6400;
	color: white;
	padding: 0 5em;
	margin: 20px;
	height: 50px;
	line-height: 50px;
	font-size: 1.7em;
	font-weight: 500;
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

input[type="text"].sendinfo{


	border: 1px solid #cccccc;
	border-radius: 0;
	outline: none;
	width:600px;
	

}


</style>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">	
</head>
<body>
<div class="container">
	<!-- 	<img alt="" src="img/main/08.jpg" width="100%"> -->																				<!--사진넣기  -->
<%
if(receipt != null) {
%>	
	<!-- body--------------------------------------------------------------------------------------- -->
		
		<div class="top_banner">
				<div class="title">
					<img  src="./img/cart_image/shopping-cart.png" class="cart">
					<span class="title">결제 페이지</span>
				</div>
				<div class="content">
					<img  src="./img/cart_image/one.png" class="cart">
					<span class="content">장바구니</span>
					<img  src="./img/cart_image/two_big.png" class="cart">
					<span class="content_big">결제</span>
					<img  src="./img/cart_image/three.png" class="cart">
					<span class="content">주문완료</span>
				</div>
		</div>
		
		<hr class="bottom">
		
		<div align="center">
		
			<form id="payFrm">
			<table>
				<caption style="font-family: 'Noto Sans KR', sans-serif;font-weight: 400;font-size: 30px; padding: 18px; color: #0d6400" >
					결제할 상품 리스트
					</caption>
				<col width="200">
				<col width="900">
				<col width="120">
				<col width="100">
				<col width="120">
				
				<tr class="tr_top">
					
					

					<td>제품사진</td>

					<td>제품</td>

					<td>가격</td>

					<td>수량</td>

					<td>총결제액
					<input type="hidden" value="<%=memb.getId()%>" name="idindi">
					</td>

				</tr>
				

				<%
					if (receipt.size() == 0) {
				%>
						<tr bgcolor="#f6f6f6">
							<td colspan="5" align="center" height="100">상품 리스트가 존재하지 않습니다</td>
						</tr>
						
				<%
					} else {
					for (int i = 0; i < receipt.size(); i++) {
						CartDto odto = receipt.get(i);
						ProductDto pdto = receiptProduct.get(i);
						/* 	ProductDto pdto = receiptProduct.get(i); */
				%>

				<tr class="tr_content">

					<td class="prd_image"><img src="img/prdimg/<%=pdto.getImg_name()%>"
						class="prd_image"></td>
					<!-- 제품보는 곳으로 앵커 달면 새창으로? -->

					<td style="word-break: break-all" align="center">
					<input type="hidden" name="productNum" value="<%=odto.getPrd_num()%>"> 
					<input type="hidden" name="ids" value="<%=odto.getId()%>"> 
					<input type="hidden" name="productAmount" value="<%=odto.getAmount()%>"> 
					<%-- 상품번호: <%=odto.getPrd_num()%><br> --%>
					상품이름: <%=pdto.getName()%><br>  
						
						</td>
						
						

					<td><%=pdto.getPrice()%></td>


					<td><%=odto.getAmount()%></td>

					<td> <input type="hidden" name="payMon" class="total" value="<%=pdto.getPrice() * odto.getAmount()%>"><%=pdto.getPrice() * odto.getAmount()%></td>
					
				</tr>
				
				<%
					}
				}
				%>
				
				
				<tr class="tr_foot">
					<td colspan="5" class="title">
					
						확인 사항
					</td>
				
				</tr>
				
				
				<tr class="tr_foot">
					<td colspan="5">
					<input type="hidden" value="">
					&nbsp;&nbsp;주소 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="<%=memb.getAddress() %>" name="orderAddress" class="sendinfo">
<!--  -->					<button type="button" class="addressbtn1" style="background-color: #0D6400; color: white; padding: 3px 10px 3px 10px; border: none; font-style: lighter;">주소검색</button>
					</td>
				</tr>
				
				<tr class="tr_foot">
				
					<td colspan="5">
					요청사항 &nbsp;&nbsp;&nbsp;<input type="text" placeholder="요청 사항 없음 " name="orderRequest" class="sendinfo">
					
					</td>
				</tr>
				
				
				<tr  class="tr_foot">
					<td colspan="5" class="title">총 결제금액 </td>
				</tr>
				<tr>
					<td colspan="5" width="500px">
					<div id="sum" style="font-size: 30pt; padding-left: 30px; padding-top: 20px;" ></div>
					</td>
				</tr>


					<!-- 업데이트할때 요청 수량 업뎃하면서 장바구니>구매로? 보내면서 새창 띄우고..총결제액 값..결제하게...
									구매시...SYSDATE로 바꾼다
									결제날...
									둘다... 업데이트...
									-->
					

				
				<tr>
				<td colspan="5" align="center" style="padding-top: 50px; padding-bottom: 50px;" >

						<button type="button" id="btnPay"
							class="orderBtn">결제하기</button>
					</td>
				</tr>
			</table>
			</form>
		
<%
}else { // myCart 기능 확인
%>
	<div class="top_banner">
				<div class="title">
					<img  src="./img/cart_image/shopping-cart.png" class="cart">
					<span class="title">결제 페이지</span>
				</div>
				<div class="content">
					<img  src="./img/cart_image/one.png" class="cart">
					<span class="content">장바구니</span>
					<img  src="./img/cart_image/two_big.png" class="cart">
					<span class="content_big">결제</span>
					<img  src="./img/cart_image/three.png" class="cart">
					<span class="content">주문완료</span>
				</div>
		</div>
		
		<hr class="bottom">
	<div align="center">
		<form id="payNow">
			<table>
				<caption style="font-family: 'Noto Sans KR', sans-serif;font-weight: 400;font-size: 30px; padding: 18px; color: #0d6400" >
					결제할 상품 리스트
				</caption>
				<col width="200">
				<col width="900">
				<col width="120">
				<col width="100">
				<col width="120">
			
				<tr class="tr_top">
					
					<td>제품사진</td>

					<td>제품</td>

					<td>가격</td>

					<td>수량</td>

					<td>총결제액</td>

				</tr>
			
				<tr class="tr_content">
					<td class="prd_image"><img src="img/prdimg/<%=oneProduct.getImg_name() %>" style="max-width: 145px; height: auto;" class="prd_image"></td>
 <!-- name="payNow" -->
					<td style="word-break: break-all" align="center">
					<%=oneProduct.getName() %><!-- 총결제액 수량 제품번호 -->
					<input type="hidden" name="payNowPrdNum" value="<%=oneProduct.getPrd_num() %>">
					<input type="hidden" name="payNowAmount" value="<%=oneCart.getAmount() %>">
					<input type="hidden" name="payNowPrice" value="<%=oneCart.getPrice() %>">
					</td>
					
					<td>
					<%=oneProduct.getPrice() %>
					</td>

					<td>
					<%=oneCart.getAmount() %>
					</td>

					<td>
					<%=oneCart.getPrice() %>
					
					</td>
				</tr>
				
				<tr>
				<td colspan="5">
				<table style="width:100%">
					<tr class="tr_foot">
					<td colspan="5" class="title">
					
						확인 사항
					</td>
				
					</tr>
				
					<tr class="tr_foot">						
						<td>&nbsp;&nbsp;주소 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="<%=memb.getAddress() %>" name="payNowAddress" class="sendinfo">
						<button type="button" class="addressbtn2" style="background-color: #0D6400; color: white; padding: 3px 10px 3px 10px; border: none; font-style: lighter;">주소검색</button>
						</td>
					</tr>
					<tr class="tr_foot">
						<td>요청사항 &nbsp;&nbsp;&nbsp;<input type="text" placeholder="요청사항을 적어주세요" name="payNowRequest" class="sendinfo"></td>
					</tr>
					
				
				<tr  class="tr_foot">
					<td colspan="5" class="title">총 결제금액 </td>
				</tr>
				<tr>
					<td colspan="5">
					<div style="font-size: 30pt; padding-left: 30px; padding-top: 20px;" ><%=oneCart.getPrice() %>원 + 2500원(배송비) = <%=oneCart.getPrice() +2500 %>원</div>
					</td>
				</tr>
				</table>
					
				
				<tr>
				
					<td colspan="5" align="center">
					<button type="button" class="orderBtn" id="payNowBtn">결제하기</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
	
<%
}
%>

<div style="margin-bottom: 80px">

</div>
<!-- ---------------------------------------------------------------------------------------------------------------- -->
		
		
		<script type="text/javascript">
		//list받을때..------------------------------------------
		let content = 0;
			
			//총합계..
			$(document).ready(function(){
				
				content = 0;
				//let len = $(".total").length;
				//alert(len);
				//$("#sum").
				//let aa = $(".total").val();
				//alert(aa);
								
				$( ".total" ).each(function(index) {
					  //alert(aa);
					 // alert($(".total").eq(index).val());
					  //td.eq(index);
					  content += parseInt($(".total").eq(index).val());
					  index++;
				});
				//content += "원"
				var result = content + "원 + 2500원(배송비) = " + (content + 2500) + "원";
				$("#sum").text(result);
			
			 });
		
			//결제 버튼
		$(document).ready(function(){ 
			$('#btnPay').click(function() { 
				var result = confirm('구매하시겠습니까?');
				//alert("얍");
				//alert(content);
				if(result) {//yes 
					//결제창 갈때 총합값 넘겨주기
					//결제창으로 값 넘겨주고 결제 성공시 이후 기능
					$("#payFrm").attr("action", "product?work=payOrder&orderMoney=" + content);
					$("#payFrm").attr("method", "post");
					$("#payFrm").submit();
					
					} else {//no
						
					} 
				}); 
			
		});

			
		 $(document).ready(function() {
				$(".addressbtn1").click(function(addSearch) { 
				    new daum.Postcode({
				        oncomplete: function(data) {
				            $("input[name=orderAddress]").val(data.address);
				        }
				    }).open();
				});
		}); 
		</script>
		
		<script type="text/javascript">
		//제품디테일에서 바로 받는 부분-------------------------------------------------
		$(document).ready(function() {
			$('#payNowBtn').click(function() {
				var result = confirm('구매하시겠습니까?');
				
				if(result) {//yes 
				
					$("#payNow").attr("action", "product?work=payImmediately");
					$("#payNow").attr("method", "post");
					$("#payNow").submit();
					
					} else {//no
						
					} 
			});
		});
		
		$(document).ready(function() {
			$(".addressbtn2").click(function(addSearch) { 
			    new daum.Postcode({
			        oncomplete: function(data) {
			            $("input[name=payNowAddress]").val(data.address);
			        }
			    }).open();
			});
		}); 
		
		</script>

		
		
		

</div>
<%@ include file="parts/footer.jsp" %>  
</body>
</html>