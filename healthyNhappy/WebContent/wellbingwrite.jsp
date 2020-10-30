<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>HEALTHY & HAPPY</title>


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



		.wellbing__write-wrap {
			width: 70%;
			padding-bottom: 10px;
			margin: 0 auto;
			margin-bottom: 5%;
			margin-top:50px;

		}

		.btn-primary {
			font-weight: bold;
			background: #0D6400 !important;
			border-color: #0D6400 !important;
			text-transform: uppercase;
			min-width: 90px;
		}
		.wellbing__btn-align {
			display: flex;
			align-content: center;
			justify-content: center;
			width: 100%;
		}
		.wellbing__btn-align button {
			margin-right: 0.75rem !important; /* 임폴턴트 >> 다른것보다 최우선으로 적용 시켜라 */
		}

	</style>


<title>HEALTHY & HAPPY</title>
<%@ include file="parts/header.jsp" %>

<body>



<div class="container ">
	<img class='max-small' src="img/main/05.jpg" width="100%">
	<div class="wellbing__write-wrap" >
		<h2 align="center" style="font-family: 'Gothic A1', sans-serif; color:#0d6400">Well Being Notice Board Write</h2>

	<div>
		<form action="wbbbs?wrtie=dataWrite" method="post" class="ac">
			<input type="hidden" name="write"  value="dataWrite">
			<div class="form-group">
				<label for="id">작성자</label>
				<input type="text" class="form-control" id="id" name="id" aria-describedby="emailHelp" value="<%=mem.getId() %>" >
			</div>
			<div class="form-group">
				<label for="title">제목</label>
				<input type="text" class="form-control" id="title" name="title">
			</div>

			<div class="form-group">
				<label for="content">내용</label>
				<textarea class="form-control" id="content" name="content" rows="10" style="resize: none"></textarea>
			</div>
			<div class="wellbing__btn-align">
				<button type="submit" class="btn btn-primary">등록</button>
				<button type="reset" class="btn btn-primary">취소</button>
			</div>
		</form>
	</div>
	</div>
</div>

	<%@ include file="parts/footer.jsp" %>
</body>
</html>
