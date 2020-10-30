<%@page import="dto.ProductDto"%>
<%@page import="java.util.List"%>
<%@page import="dao.ProductDao"%>
<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8"> 
<title>HEALTHY & HAPPY</title>
<%@ include file="parts/header.jsp" %>  
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

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
	padding-bottom: 30px;
	padding-top: 60px;
}
.swiper-slide a {
	text-decoration: none;
}
.swiper-pagination-bullet-active{
background:#0D6400;
}
.swiper-pagination-progressbar-fill{
background:#0D6400;
}
.swiper-button-next{
background-image:url("data:image/svg+xml;charset=utf-8,%3Csvg%20xmlns%3D'http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg'%20viewBox%3D'0%200%2027%2044'%3E%3Cpath%20d%3D'M27%2C22L27%2C22L5%2C44l-2.1-2.1L22.8%2C22L2.9%2C2.1L5%2C0L27%2C22L27%2C22z'%20fill%3D'%23fff'%2F%3E%3C%2Fsvg%3E");
}
.swiper-button-prev{
background-image:url("data:image/svg+xml;charset=utf-8,%3Csvg%20xmlns%3D'http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg'%20viewBox%3D'0%200%2027%2044'%3E%3Cpath%20d%3D'M0%2C22L22%2C0l2.1%2C2.1L4.2%2C22l19.9%2C19.9L22%2C44L0%2C22L0%2C22L0%2C22z'%20fill%3D'%23fff'%2F%3E%3C%2Fsvg%3E");
}
.swiper-wrapper{
	height: 300px;
}
.swiper-container{
	height: 450px
}
.swiper-container-horizontal>.swiper-pagination-bullets{
	bottom: 26px;
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
a{
	color: grey;
	font-weight: bold;
}
a:hover{
	color: black;
}
.swiper-container img:hover{
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

.bx-wrapper{
	margin-left: 200px;
	margin-top: 50px;
	border: 0px;
}
</style>

<%
 ProductDao dao = ProductDao.getInstance();
 List<ProductDto> list = dao.getAllProduct();
%>
</head>
<body>

   
    

<!-- body--------------------------------------------------------------------------------------- -->
<div class="container">
<a href="product?work=list&category=all"><img src="img/main/main01-12.jpg" width="100%"></a>
	<br><br><br>
  
<!-- 클래스명은 변경하면 안 됨 -->
<div class="swiper-container" align="center">
	<div class="title" align="left">BEST SELLER</div>  
	<div class="swiper-wrapper">
		<div class="swiper-slide">
			<div class="frame">
			<a href="product?work=detail&prd_num=<%=list.get(3).getPrd_num()%>">
			<img src="img/prdimg/<%=list.get(3).getImg_name() %>">
			<span class="seller"><%=list.get(3).getName()%></span>
			</a></div>
		</div>
		<div class="swiper-slide">
			<a href="product?work=detail&prd_num=<%=list.get(4).getPrd_num()%>">
			<img src="img/prdimg/<%=list.get(4).getImg_name() %>">
			<%=list.get(4).getName()%>
			</a>
		</div>
		<div class="swiper-slide">
			<a href="product?work=detail&prd_num=<%=list.get(11).getPrd_num()%>">
			<img src="img/prdimg/<%=list.get(11).getImg_name() %>">
			<%=list.get(11).getName()%>
			</a>
		</div>
		<div class="swiper-slide">
			<a href="product?work=detail&prd_num=<%=list.get(16).getPrd_num()%>">
			<img src="img/prdimg/<%=list.get(16).getImg_name() %>">
			<%=list.get(16).getName()%>
			</a>
		</div>
		<div class="swiper-slide">
			<a href="product?work=detail&prd_num=<%=list.get(21).getPrd_num()%>">
			<img src="img/prdimg/<%=list.get(21).getImg_name() %>">
			<%=list.get(21).getName()%>
			</a>
		</div>
		<div class="swiper-slide">
			<a href="product?work=detail&prd_num=<%=list.get(17).getPrd_num()%>">
			<img src="img/prdimg/<%=list.get(17).getImg_name() %>">
			<%=list.get(17).getName()%>
			</a>
		</div>
		<div class="swiper-slide">
			<a href="product?work=detail&prd_num=<%=list.get(13).getPrd_num()%>">
			<img src="img/prdimg/<%=list.get(13).getImg_name() %>">
			<%=list.get(13).getName()%>
			</a>
		</div>
		<div class="swiper-slide">
			<a href="product?work=detail&prd_num=<%=list.get(5).getPrd_num()%>">
			<img src="img/prdimg/<%=list.get(5).getImg_name() %>">
			<%=list.get(5).getName()%>
			</a>
		</div>
		<div class="swiper-slide">
			<a href="product?work=detail&prd_num=<%=list.get(24).getPrd_num()%>">
			<img src="img/prdimg/<%=list.get(24).getImg_name() %>">
			<%=list.get(24).getName()%>
			</a>
		</div>
		<div class="swiper-slide">
			<a href="product?work=detail&prd_num=<%=list.get(0).getPrd_num()%>">
			<img src="img/prdimg/<%=list.get(0).getImg_name() %>">
			<%=list.get(0).getName()%>
			</a>
		</div>
	</div>

	<!-- 네비게이션 -->
	
	<div class="swiper-button-prev"></div><!-- 이전 버튼 -->
	<div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
	<!-- 페이징 --><br>
	<div class="swiper-pagination"></div>
</div>
<!-- 두번쨰 -->
<div class="swiper-container" align="center">
	<div class="title" align="left">NEW PRODUCT</div>  
	<div class="swiper-wrapper">
		<div class="swiper-slide">
			<a href="product?work=detail&prd_num=<%=list.get(2).getPrd_num()%>">
			<img src="img/prdimg/<%=list.get(2).getImg_name() %>">
			<%=list.get(2).getName()%>
			</a>
		</div>
		<div class="swiper-slide">
			<a href="product?work=detail&prd_num=<%=list.get(1).getPrd_num()%>">
			<img src="img/prdimg/<%=list.get(1).getImg_name() %>">
			<%=list.get(1).getName()%>
			</a>
		</div>
		<div class="swiper-slide">
			<a href="product?work=detail&prd_num=<%=list.get(19).getPrd_num()%>">
			<img src="img/prdimg/<%=list.get(19).getImg_name() %>">
			<%=list.get(19).getName()%>
			</a>
		</div>	
		<div class="swiper-slide">
			<a href="product?work=detail&prd_num=<%=list.get(6).getPrd_num()%>">
			<img src="img/prdimg/<%=list.get(6).getImg_name() %>">
			<%=list.get(6).getName()%>
			</a>
		</div>
		<div class="swiper-slide">
			<a href="product?work=detail&prd_num=<%=list.get(22).getPrd_num()%>">
			<img src="img/prdimg/<%=list.get(22).getImg_name() %>">
			<%=list.get(22).getName()%>
			</a>
		</div>
		<div class="swiper-slide">
			<a href="product?work=detail&prd_num=<%=list.get(12).getPrd_num()%>">
			<img src="img/prdimg/<%=list.get(12).getImg_name() %>">
			<%=list.get(12).getName()%>
			</a>
		</div>
		<div class="swiper-slide">
			<a href="product?work=detail&prd_num=<%=list.get(7).getPrd_num()%>">
			<img src="img/prdimg/<%=list.get(7).getImg_name() %>">
			<%=list.get(7).getName()%>
			</a>
		</div>
		<div class="swiper-slide">
			<a href="product?work=detail&prd_num=<%=list.get(15).getPrd_num()%>">
			<img src="img/prdimg/<%=list.get(15).getImg_name() %>">
			<%=list.get(15).getName()%>
			</a>
		</div>
		<div class="swiper-slide">
			<a href="product?work=detail&prd_num=<%=list.get(23).getPrd_num()%>">
			<img src="img/prdimg/<%=list.get(23).getImg_name() %>">
			<%=list.get(23).getName()%>
			</a>
		</div>
		<div class="swiper-slide">
			<a href="product?work=detail&prd_num=<%=list.get(18).getPrd_num()%>">
			<img src="img/prdimg/<%=list.get(18).getImg_name() %>">
			<%=list.get(18).getName()%>
			</a>
		</div>
	</div>

	<!-- 네비게이션 -->
	
	<div class="swiper-button-prev"></div><!-- 이전 버튼 -->
	<div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
	<!-- 페이징 --><br>
	<div class="swiper-pagination"></div>
</div>


			<!-- 배너 -->
	<div class="bxslider">
	  		<div class="bannerSlide">
	  			<a href="product?work=detail&prd_num=<%=list.get(2).getPrd_num()%>"><img src="img/main/watermelon2.jpg"></a>
	  		</div>
	  		<div class="bannerSlide">
	  			<a href="wbbbs?write=detailView&seq=115"><img src="img/main/vegi5.jpg"></a>
	  		</div>
	  		<div class="bannerSlide">
	  			<a href="main?work=about"><img src="img/main/vegi01.jpg"></a>
	  		</div>
	</div>
	
	<div align="center">
		<img alt="" src="img/main/nature.jpg">
	</div>  
</div>		
<!-- 베스트상품 -->
	<script type="text/javascript">
	new Swiper('.swiper-container', {

		slidesPerView : 5, // 동시에 보여줄 슬라이드 갯수
		spaceBetween : 5, // 슬라이드간 간격
		slidesPerGroup : 5, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음

		// 그룹수가 맞지 않을 경우 빈칸으로 메우기
		// 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
		loopFillGroupWithBlank : true,

		loop : true, // 무한 반복

		pagination : { // 페이징
			el : '.swiper-pagination',
			clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
		},
		navigation : { // 네비게이션
			nextEl : '.swiper-button-next', // 다음 버튼 클래스명
			prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
		},
	});
	</script>
 <!-- 배너 -->
   <script type="text/javascript">
   $('.bxslider').bxSlider({
	   auto: true,
	   autoControls: true,
	   stopAutoOnClick: true,
	   pager: true,
	   slideWidth: 1500
	 });
   
   </script>
<%@ include file="parts/footer.jsp" %>     
</body>
</html>