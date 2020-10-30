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




<style type="text/css">



div.about_title{
	
	display: flex;
	
	margin-top: 180px;
	margin-bottom: 100px;
	justify-content: center;
	
	
}


div.about_title2{
	
	display: flex;
	flex-direction: column;
	
	
	margin-bottom: 50px;
	
	margin-left: 280px;
	justify-content: center;
}



div.about_content{
	
	display: flex;
	justify-content: center;
	
}

div.about_content2{
	
	display: flex;
	justify-content: center;
	
}

div.item_image{

	
	width: 500px;
	margin : 20px;
	margin-top: 50px;
	margin-right: 110px;


}



div.item_content{

	
	width: 500px;
	margin : 100px;
	margin-top: 28px;
	
	padding-top: 0;
	text-align: center;
	
}


div.item_image2{

	
	width: 500px;
	margin : 130px;
	margin-top: 170px;


}



div.item_content2{

	
	width: 500px;
	margin : 65px;
	margin-top: 150px;
	
	padding-top: 0;
	text-align: center;
	
}

div.item_content3{

	
	width: 390px;
	
	margin-top: 60px;
	margin-left: 0;
	margin-right: 60px;
	margin-bottom: 180px;
	padding-top: 0;
	text-align: center;
	
}




div.rootline{

	vertical-align: middle;
}


div.mymap{

	
	width: 450px;
	height:320px;
	
	
	margin-bottom: 140px;
	margin-left: 0;
	padding-top: 0;
	text-align: center;	
	
}


img.content_image{

	width:500px;
	height:300px;

}






h1.title{


font-size: 6em;
font-family: 'Gothic A1', sans-serif;
color: #0d6400;

}
h1.root{


font-size: 3.5em;
font-family: 'Gothic A1', sans-serif;
color: #4d4d4d;

}
h2.title{

font-size: 3em;
font-family: 'Gothic A1', sans-serif;
color: #0d6400;
margin-bottom: 40px;
}

p{
font-size: 1.4em;
font-family: 'Gothic A1', sans-serif;
}



hr.middle{


width: 80%;
border: solid 1px #bfbfbf; 
margin-top: 20px; 
margin-bottom: 40px;

}

hr.bottom{

width: 1300px;
border: solid 1px #bfbfbf; 
float: left;
}

</style>


</head>
<body>



<!-- body--------------------------------------------------------------------------------------- -->

	

<div class="container">
<img alt="" src="img/main/04.jpg" width="100%">
	
	
	<div class="about_content">
		
		<div class="item_content2">
		
			<h2 class="title">HEALTHY&HAPPY</h2>
			<p>HEALTHY&HAPPY에서는 사람과 자연, 도시와 농촌이 생명의 끈으로
			이어져 있다는 생각에서</p>
			<p>자연을 지키고 생명을 살리는 마음으로</p>
			<p>농사짓고 물품을 만드는 생산자들과 </p>
			<p>이들의 마음이 담긴 물품을 이해하고 믿으며 이용하는
				소비자들을 위한 쇼핑몰입니다.</p>
		
			
		</div>
		
		<div class="item_image2">
			<img src="./img/about_image/about1.jpg" class="content_image"/>
		</div>
		
	</div>
	
	
	
	
	<div class="about_content">
	
	
		<div class="item_image">
			<img src="./img/about_image/about2.png" class="content_image"/>
		</div>
		
		<div class="item_content">
		
			<h2 class="title">소비자 건강 행복</h2>
			<p>HEALTHY&HAPPY에서는 신선하고,</p>
			<p>품질 좋은 상품을 공급하고, 안정성이 검증된 안심상품을 공급합니다.</p>
			<p>원료 고유의 풍미를 살리고, 기능성을 유지할 수 있도록</p>
			<p>인위적 첨가물을 최소화했습니다.</p>
		</div>
	
	</div>
	
	
	
	
	
	<div class="about_content">
		
		<div class="item_content2">
		
			<h2 class="title">친환경 패키지</h2>
			<p>HEALTHY&HAPPY에서는</p>
			<p>자원의 순환을 고려한 재활용 용기와</p>
			<p>분해성 포장지 도입, 과대포장을 금지합니다.</p>
		
			
		</div>
		
		<div class="item_image2">
			<img src="./img/about_image/about3.png" class="content_image"/>
		</div>
		
	</div>
	
	

	
		
	<div class="about_title2">
	
		<div class="rootline"><h1 class="root">오시는 길</h1></div>	
		<div class="rootline"><hr class="bottom"></div>
	
	</div>
	
	
	
	
	<div class="about_content2">
		<div class="item_content3">
			<p>서울시 강남구 테헤란로5길 11 YBM빌딩 2층</p>
			<p>강남역 12번 출구</p>
			<p>버스 146,341,360.740,N13,N61</p>
			<p>연락처	02-3453-5404 | 1588-6457</p>
			<p>(평일 10:00 ~ 13:00, 14:00 ~ 18:00 )</p>
		</div>
		
		<div id="map" class="mymap"></div>
		
	</div>
	
	
	
	
	


   </div>
<%@ include file="parts/footer.jsp" %>     

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e85c7c4970370735e7072234f59a9671&libraries=services"></script>
<script type="text/javascript">

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
};  

//지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

//주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

//주소로 좌표를 검색합니다
geocoder.addressSearch('서울 강남구 테헤란로5길 11 YOO빌딩 2,3층', function(result, status) {

// 정상적으로 검색이 완료됐으면 
 if (status === kakao.maps.services.Status.OK) {

    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

    // 결과값으로 받은 위치를 마커로 표시합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: coords
    });

    // 인포윈도우로 장소에 대한 설명을 표시합니다
    var infowindow = new kakao.maps.InfoWindow({
        content: '<div style="width:150px;text-align:center;padding:6px 0;">HEALTHY&HAPPY</div>'
    });
    infowindow.open(map, marker);

    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
    map.setCenter(coords);
} 
});

</script>
</body>
</html>