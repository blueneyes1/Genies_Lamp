<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <link rel="stylesheet" href="/css/common.css">
  <link rel="stylesheet" href="/css/main.css">
  
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
  <!-- Bootstarp JS -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

</head>



 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>문의내용</title>
	<style>

.menu{width:800px; margin: auto; position: center;}


table.121table{
border-collapse:separate;
border-spacing:0;
text-align:left;
line-height:1.5;
border-top:1px solid #ccc;
border-left:1px solid #ccc;
margin: auto;
}

table.121table th{
width:50px;
padding : 10px;
font-weight:bold;
vertical-align:top;
border-right :1px solid #ccc;
border-bottom : 1px solid #ccc;
border-top: 1px solid #fff;
border-left: 1px solid #fff;
background:	#F5F5DC;
}
table.121table td{
width:250px;
padding : 10px;
vertical-align:top;
border-right :1px solid #ccc;
border-bottom : 1px solid #ccc;
}

.contanier-fluid{
margin:auto;
}
.writebtn
color:cyan;

.topline{
position:relative;
}

.name{
position: absolute;
top: 50%;
text-align: center;

}






	</style>
	
</head>
<body>
 <div class="menu">

	<form action="updateAction" method="post">
		<table class="121table" border="1" color="black" width="500">
			<input type="hidden" name="one2one_idx" value="${ dto.one2one_idx }" />
			<tr>
				<td>번호</td>
				<td>${ dto.one2one_idx }</td>
			</tr>
			<tr>
				<td>아이디</td>
				<td>${ dto.one2one_member_id }</td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="one2one_title" value="${ dto.one2one_title }" size="50"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<textarea rows="10" cols="50" name="one2one_content"> ${ dto.one2one_content } </textarea>
				</td>
			</tr>
			<tr>
			<c:if test="${ member_grade ne 'A' }">
				<td colspan="2">
					&nbsp;&nbsp;<input type="submit" value="수정하기">&nbsp;&nbsp;
					<a href="121listForm"><input type="button" value="목록보기"></a>&nbsp;&nbsp;
					<a href="deleteAction?one2one_idx=${ dto.one2one_idx }"><input type="button" value="삭제하기"></a>
				</td>
			</c:if>	
			</tr>
		
		</table>
	</form>

	<br>	
	
	<form action="writeReplyAction" method="post">
	<input type="hidden" name="one2one_reply_one2one_idx" value="${ dto.one2one_idx }" />
		<table width="500" cellpadding="0" cellspacing="0" border="1">
			<tr>
	    	<c:if test="${ member_grade eq 'A' }">
	    		
				<td colspan=""2>
					
					<label>댓글</label><textarea rows="2" cols="50" name="one2one_reply_content"></textarea><br>
					<label>아이디</label><input type="text" name="one2one_reply_member_id" value="${ member_id }"><br>
					<input type="submit" value="답글달기">
				</td>
				
			</c:if>
			</tr>
		</table>
	</form>
	
	<br>
	<input type="hidden" name="one2one_reply_one2one_idx" value="${ dto.one2one_idx }" />
	
	<table width="500" cellpadding="0" cellspacing="0" border="1">
		<tr>
			<th>아이디</th>
			<th>내용</th>
			<th>날짜</th>
			
		</tr>
		<c:forEach var="reply_dto" items="${ reply_list }">
			<tr>
				<td>${ reply_dto.one2one_reply_member_id }</td>
				<td>${ reply_dto.one2one_reply_content }</td>
				<td>
					<c:set var="dateVar" value="${ reply_dto.one2one_reply_date }" />
					<fmt:formatDate value="${dateVar}" pattern="yyyy-MM-dd" />
				</td>
				
			</tr>
		</c:forEach>
	</table>
	</div>
	
	
</body>
</html>


















