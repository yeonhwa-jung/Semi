<%@ page import="dto.WbBbsDto" %>
<%@ page import="dao.WbBbsDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
    WbBbsDto dto = (WbBbsDto)request.getAttribute("wb");

%>
<%
    String sseq = request.getParameter("seq");
    int seq = Integer.parseInt(sseq);

    WbBbsDao wao = WbBbsDao.getInstance();

    wao.readCount(seq);
    WbBbsDto wto = wao.getWbs(seq);

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

        .wellbing__btn-align {
            display: flex;
            align-content: center;
            justify-content: center;
            width: 100%;
        }
        .wellbing__detail-wrap{
            width: 70%;
            padding-bottom: 10px;
            margin: 0 auto;
            padding-top: 30px;


        }
        .wellbing__btn-align button{
            margin-right: 0.75rem !important;
        }
        .id{
            padding:5px;

        }
        .tit{
            padding:5px;

        }


    </style>

    <title>HEALTHY & HAPPY</title>
    <%@ include file="parts/header.jsp" %>
    <script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>

</head>
<body>

<%--
<h1 align="center" class="wellbing__info">웰빙 정보</h1>


    <div align="center">
      <table border="1">
        <colgroup>
            <col style="width: 200px">
            <col style="width: 400px">
        </colgroup>

        <tr>
            <th>작성자</th>
            <td id="id"><%=dto.getId()%>

            </td>
        </tr>

        <tr>
            <th>제목</th>
            <td><%=dto.getTitle() %></td>
        </tr>

        <tr>
            <th>작성일</th>
            <td><%=dto.getWdate() %></td>
        </tr>

        <tr>
            <th>조회수</th>
            <td><%=dto.getReadCount() %></td>
        </tr>

        <tr>

         <th>내용</th>
            <td><textarea rows="30" cols="110" readonly="readonly"><%=dto.getContent() %></textarea></td>
        </tr>
    </table>
 </div>
--%>

<div class="container">

    <img class='max-small' src="img/main/05.jpg" width="100%">



    <div class="wellbing__detail-wrap">
        <h2 align="center"  style="font-family: 'Gothic A1', sans-serif; color:#0d6400">Well Being Info</h2>
<br>
        <br>
         <%--   <div class="form-group">
                <label for="id">작성자</label>
                <label for="title">제목</label>
                <input type="text" class="form-control" id="id" name="id" readonly="readonly" value="<%=wto.getId() %>">
                <input type="text" class="form-control" id="title" name="title" readonly="readonly" value="<%=wto.getTitle() %>">
            </div>--%>

            <table  style="background-color: #f2f2f2; border-radius: 0.3em;"  class="table1" >
                <colgroup>
                    <col style="width: 200px;">
                    <col style="width: 1500px;">
                </colgroup>
                <tr>
                    <th class="id">작성자</th>
                    <td><%=wto.getId() %></td>
                </tr>

               <tr>
                   <th class="tit">제목</th>
                   <td><%=wto.getTitle() %></td>
               </tr>
            </table>
            <br>

           <div class="form-group">
                <label for="content">내용</label>
                <textarea class="form-control" id="content" name="content" readonly="readonly" rows="20" style="resize: none"><%=wto.getContent() %></textarea>
           </div>

            <div class="form-group">
                <label for="wdate">작성일</label>
                <input type="text" class="form-control" id="wdate" name="wdate" readonly="readonly" value="<%=wto.getWdate() %>">
            </div>

            <div class="form-group">
                <label for="readCount">조회수</label>

                <input type="text" class="form-control" id="readCount" name="readCount" readonly="readonly"
                       value="<%=wto.getReadCount() %>">

            </div>


            <%if(mem !=null && mem.getAuth() ==1){ %>
            <div class="wellbing__btn-align">
                <button type="button" id="updateBtn" style="background-color:#0d6400" class="btn btn-primary">수정</button>
                <button type="button" id="deleteBtn" style="background-color:#0d6400" class="btn btn-primary">삭제</button>
            </div>
            <%}%>
        </form>
    </div>

</div>



    <script type="text/javascript">
        $(document).ready(function () {
            let seq="<%=dto.getSeq() %> ";
            $("#updateBtn").click(function () {
                location.href= "wbbbs?write=updateView&seq=" + seq;

            })

            $("#deleteBtn").click(function () {

                if(seq){
                    if(confirm("정말 삭제하시겠습니까?") ==true){
                    $.ajax({
                        type: "get",
                        url: 'wbbbs',
                        data: "write=delete&seq=<%=dto.getSeq()%>",
                        success: function (data) {
                            alert("삭제되었습니다.");
                            location.href = "wbbbs?write=delete&seq=" + seq;
                        },
                        error: function () {
                            alert("error");
                        }

                    });

                }
               /* location.href= "wbbbs?write=delete&seq=" + seq;*/
<%--                <%=dto.getId() %>--%>
<%--               --%>}
            })
        })
    </script>


<%@ include file="parts/footer.jsp" %>  
</body>
</html>
