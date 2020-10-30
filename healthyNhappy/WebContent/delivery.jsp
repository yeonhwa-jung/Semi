<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">

<title>HEALTHY & HAPPY</title>
<%@ include file="parts/header.jsp" %>  
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@600&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">


<style type="text/css">


div.about_title{
	
	display: flex;
	margin-top: 100px;
	justify-content: center;
	
	
}

div.notice{

	display: flex;
	
	justify-content: center;
	background-color: #0d6400;
	height: 620px;
	width: 700px;
	margin: 0 auto;
	margin-top: 130px;
	margin-bottom: 160px;
	padding: 13px;
	
}





div.notice_box1{
	
	display: flex;
	flex-direction: column;
	justify-content: center;
	height: 100%;
	width: 100%;
	background-color: #fff;
	
	
}




div.notice_box2{
	
	
	height: 80%;
	width: 100%;
	text-align: center;
	padding: 50px;
	
	
}


div.notice_box3{
	
	
	height: 20%;
	width: 100%;
	padding: 30px;
	text-align: center;
	
	
	
}


div.guide{

	display: flex;
	flex-direction: column;
	
	
	height: 1350px;
	width: 900px;
	margin: 0 auto;
	margin-top: 120px;
	margin-bottom: 160px;
	
	
}

div.guide_head1{
	
	width: 100%;
	height:200px;
	background-color: #e9ffe6;
	text-align: center;
	padding: 35px;

}
div.guide_head2{
	
	width: 100%;
	height:200px;
	background-color: #e6f7ff;
	text-align: center;
	padding: 35px;

}
div.guide_head3{
	
	width: 100%;
	height:200px;
	background-color: #ffe6f2;
	text-align: center;
	padding: 35px;

}

div.guide_content{
	
	display: flex;
	flex-direction: row;
	
	width: 100%;
	height:250px;
	
}




div.guide_box1{
	background-color: #d9d9d9;
	width: 300px;
	height: 100%;
	text-align: center;
	padding: 25px;
}
div.guide_box2{
	background-color: #e6e6e6;
	width: 300px;
	height: 100%;
	text-align: center;
	padding: 25px;
}
div.guide_box3{
	background-color: #f2f2f2;
	width: 300px;
	height: 100%;
	text-align: center;
	padding: 25px;
}


div.caution{
	display: flex;
	flex-direction: column;
	
	width: 700px;
	height: 280px;
	
	
	margin: 0 auto;
	margin-bottom: 100px;
	


}

div.caution_header{

	height: 20%;
	width: 100%;
	background-color: #fff;
	padding-left: 30px;
	
}


div.caution_content{

	height: 80%;
	width: 100%;
	background-color: #f2f2f2;
	
	padding: 40px;
}





h1.title{


	font-size: 4em;
	font-family: 'Gothic A1', sans-serif;
	color: #0d6400;

}

h2.notice{

	font-family: 'Noto Sans KR', sans-serif;
	font-size: 3em;
	font-weight:bold;
	color: #ff4d4d;
	margin-bottom: 20px;
}

p.notice{
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 1.8em;
	font-weight: 100;
}

p.guide{
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 2.7em;
	font-weight: 100;
}


p.guide2{
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 1.2em;
	font-weight: 100;
}

p.caution1{
font-family: 'Do Hyeon', sans-serif;
font-size: 3em;
font-weight: 100;
color: #0d6400;

}


p.caution2{
font-family: 'Noto Sans KR', sans-serif;
font-size: 1.2em;
font-weight: 100;
color: #000;

}



hr.bottom{

width: 500px;
border: solid 1px #0d6400; 
margin-top: 0;
}

.noticeBtn {

    width:500px;
    background-color: #0d6400;
    border: none;
    color:#fff;
    padding: 15px 0;
    text-align: center;
    text-decoration: none;
	font-family: 'Noto Sans KR', sans-serif;
    font-size: 20px;
    cursor: pointer;
	outline: none;
}





</style>


</head>
<body>



<!-- body--------------------------------------------------------------------------------------- -->
<div class="container">
	<img alt="" src="img/main/06.jpg" width="100%">    
   
   
	<div class="about_title">
			<h1 class=title>배송안내</h1>
	</div>
	<div><hr class="bottom"></div>
    
    
    <div class="notice">
    	<div class="notice_box1">
    		
    		<div class="notice_box2">
    			<img alt="" src="./img/delivery_image/van.png" />
    			<h2 class="notice">코로나 관련 배송 안내 공지</h2>
    			<p class="notice">최근 거래처에서</p>
    			<p class="notice">신종 코로나 바이러스 확진자가 발생함에 따라</p>
    			<p class="notice">상품 배송이 일부 취소되었음을 알려드립니다.</p>
    			<p class="notice">이 점 양해 부탁드립니다.</p>
    			
    		</div>
 
    		<div class="notice_box3">
    			<button type="button" class="noticeBtn" onclick="location.href='main?work=QAlistView'">추가 문의사항 바로가기</button>
    		</div>
    	</div>
    
    </div>
    
    
    <div class="guide">
    
    	<div class="guide_head1">
    		<img alt="" src="./img/delivery_image/box.png" />
    		<p class="notice">배송 안내</p>
    	</div>
    	<div class="guide_content">
    		<div class="guide_box1">
    			<p class="guide">01</p>
    			<p class="guide2">배송비 2,500원<br>(도서 산간지역 추가금액 없음)</p>
    			    			
		 			
    		</div>
    		<div class="guide_box2">
    			<p class="guide">02</p>
    			<p class="guide2">당일발송 상품은 오후 3시이전에 결제하시면 다음날 수령가능합니다.<br>(토,일요일 및 공휴일 주문제외)</p>
    			
    		</div>
    		<div class="guide_box3">
    			<p class="guide">03</p>
    			<p class="guide2">재고보유문의<br>(1588-6457)</p>
    			
    			
    		</div>	
    	</div>
    	
    	
    	
    	<div class="guide_head2">
    		<img alt="" src="./img/delivery_image/open_box.png" />
    		<p class="notice">교환/반품 안내</p>
    	</div>
    	
    	<div class="guide_content">
    		<div class="guide_box3">
    			<p class="guide">법률</p>
    			<p class="guide2">소비자보호 관련 법률 제 17조 1항에 의거 청약후 또는 물품 수령후<br>7일이내에는 청약철회가 가능</p>
    			
    		</div>
    		<div class="guide_box2">
    			<p class="guide">배송비</p>
    			<p class="guide2">단순변심에 의한 교환,반품 배송비(5,000원)는 고객님께서 부담하셔야 합니다.<br>하자가 있는 상품,상품정보와 상이한 경우에는 배송비는 판매자가 부담합니다.</p>  			
    			
    			
    		</div>
    		<div class="guide_box1">
    			<p class="guide">불가능한 경우</p>
    			<p class="guide2">구매자 과실로 상품의 가치가 감소 혹은 상실된 경우 교환 및 반품이<br>불가능합니다.</p>
    			
    		</div>		
    	</div>
    	
    	
    	
    	<div class="guide_head3">
    		<img alt="" src="./img/delivery_image/ticket.png" />
    		<p class="notice">취소 안내</p>
    	
    	</div>
    	<div class="guide_content">
    		<div class="guide_box1">  	
    			<p class="guide">01</p>		
    			<p class="guide2">주문 당일 오후 5시 이전에 고객센터로 전화주시면 주문최소 및 내용변경이 가능합니다.<br> 주문취소 및 주문내용 변경은 꼭 전화를 이용해주세요</p>
    			
    		</div>
    		<div class="guide_box2">
    			<p class="guide">02</p>
    			<p class="guide2">오후 5시이후 주문 및 주말 및 공휴일 주문은 다음날 근무일 연략주시면<br>주문취소 및 주문내용 변경이 가능합니다.</p>
    			
    		</div>
    		<div class="guide_box3">
    			<p class="guide">03</p>
    			<p class="guide2">기타 판매자에게 요구사항은 주문시 배송정보란에 메모해주셔야 합니다.</p>
    			
    		</div>
    	</div>
    </div>
    
    	
   <div class="caution">
   
   		<div class="caution_header">
   			<p class="caution1">주의사항</p>
   		</div>
   		
   		<div class="caution_content">
   			<p class="caution2">수취거부나 장기간 부재로 배송이 불가능한 상품은 주문 고객 주소로 반송됩니다.</p>
   			<p class="caution2">신선식품의 경우 수취인 부재 또는 배송지 정보 오류로 인해 반송될 경우 교환/환불이 제한됩니다.</p>
   			<p class="caution2">다수의 상품이 동일 주소지로 배송되는 경우라도 택배사 사정에 의해 일부상품은 동시에<br>배송되지 않을 수 있습니다.</p>
   		</div>
   
   </div>
   
   
   
   
   
</div>
   
<%@ include file="parts/footer.jsp" %>     
</body>
</html>
