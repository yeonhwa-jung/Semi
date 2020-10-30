<%@ page import="dto.WbBbsDto" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
    WbBbsDto dto = (WbBbsDto)request.getAttribute("update");
    System.out.println(dto);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
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
            padding-top: 300px;
        }
        .wellbing__btn-align {
            display: flex;
            align-content: center;
            justify-content: center;
            width: 100%;
        }


        .wellbing__btn-align button{
            margin-right: 0.75rem !important;
        }
        .wellbing__update-wrap{
            width: 70%;
            padding: 15px;
            margin: 0 auto;

        }

    </style>
<title>HEALTHY & HAPPY</title>
<%@ include file="parts/header.jsp" %>  
</head>
<body>




<%--<form action="wbbbs?write=updateAf" method="get">
    <input type="hidden" name="write" value="updateAf">
    <input type="hidden" name="seq" value="<%=dto.getSeq() %>">
    <table border="1" align="center">
        <colgroup>
        <col width="200">
        <col width="400">
        </colgroup>
        <tr>
            <th>작성자</th>
            <td><input type="text" name="id" value="<%=dto.getId() %>" readonly="readonly"></td>
        </tr>

        <tr>
            <th>제목</th>
            <td><input type="text" name="title" value="<%=dto.getTitle() %>"></td>
        </tr>

        <tr>
            <th>내용</th>
            <td><textarea rows="30" cols="110" name="content"><%=dto.getContent() %></textarea></td>
        </tr>

    </table>
    <div align="center">
     <input  type="submit" value="글 수정">
   <input type="reset" value="취소">
    </div>
</form>--%>

       <div class="container">
           <img class='max-small' src="img/main/05.jpg" width="100%">


            <div class="wellbing__update-wrap">
                <h2 align="center" style="font-family: 'Gothic A1', sans-serif; color:#0d6400"> Well Being Update</h2>
            <form action=""wbbbs?write=updateAf" method="get">
                <input type="hidden" name="write" value="updateAf">
                <input type="hidden" name="seq" value="<%=dto.getSeq() %>">
                <br>
                <br>
                <div class="form-group">
                    <label for="id">작성자</label>
                    <input type="text" class="form-control" id="id" name="id" readonly="readonly" value="<%=dto.getId() %>">
                </div>
                <div class="form-group">
                    <label for="title">제목</label>
                    <input type="text" class="form-control" id="title" name="title" value=" <%=dto.getTitle() %>">
                </div>


                <div class="form-group">
                    <label for="content">내용</label>
                    <textarea class="form-control" id="content" name="content" rows="10" style="resize: none"><%=dto.getContent() %></textarea>
                </div>

                <div class="wellbing__btn-align">
                    <input type="submit"  style="background-color:#0d6400" class="btn btn-primary" value="글 수정">

                </div>
                </form>
            </div>
        </div>
<%@ include file="parts/footer.jsp" %>  
</body>
</html>
