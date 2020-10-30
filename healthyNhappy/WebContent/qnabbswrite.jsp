<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>HEALTHY & HAPPY</title>
<%@ include file="parts/header.jsp" %>  


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="QAcss/QA.css?after" />	


</head>
<body>

  


<!-- body--------------------------------------------------------------------------------------- -->
<div class="container">
  <img alt="" src="img/main/07.jpg" width="100%">      

    
<div align="center" style="margin-bottom: 140px">
	<h1 class="title">Q&A 게시판</h1>
	<form id="QAfrm" action="bbs?work=QAwriteBbs" method="post" enctype="multipart/form-data">
	
		<table class="alt" >
			<col span="100"><col span="500"> <col span="200">	
		
			
			<tr>
				
				<th class="write">작성자&nbsp;&nbsp;</th>
				<th class="write">
					
					<input type="text" class="txt2" readonly="readonly" 
					class="txt" style="outline: none"
					id="id" name="id"  value="<%=mem.getId() %>" >
				</th>
				
				<th align="right" class="write">
				
					<select name="open" >
					<option value="0" selected="selected">공개</option>
					<option value="1">비공개</option>
					</select>
				</th>
			</tr>
			
			
			
			
			<tr>
				
				<td colspan="3" style="text-align: left;">
				<input type="file" name="fileload" accept=".gif, .jpg, .png" style="width: 300px">
				</td>
			</tr>
			
			<tr>
			
				<td colspan="3"><input type="text" id="title" name="title" class="txt3" maxlength="50" placeholder="제목을 입력하세요"> 
				</td>
			</tr>
			
			<tr>
			
				<td colspan="3">
					<textarea id="content" name="content" class="area1"placeholder="내용을 입력하세요" ></textarea>
					
				</td>
				
			</tr>
		
		</table>
	
	
	
	</form>


<button type="button" id="addBtn" class="button">등록</button>
</div>


<script type="text/javascript">





	

$(function () {
	
	
	$('#listBtn').click(function() {
		
		location.href="main?work=QAlistView";
	});
	
	$('#addBtn').click(function() {
		if($('#title').val().trim() == ""){
			
			alert("제목을 입력해주세요");
			$('#title').focus();
		}
		else if($('#content').val().trim() == ""){
			
			alert("내용을 입력해주세요");
			$('#content').focus();
		}
		
		else{
			
			$('#QAfrm').submit();
		}
		
	});
	
	
});


</script>   
    	
   
</div>    
<%@ include file="parts/footer.jsp" %>  
</body>
</html>