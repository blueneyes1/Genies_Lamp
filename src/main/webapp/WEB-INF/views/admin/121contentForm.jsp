<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	
 <!-- Bootstrap CSS -->
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
	
	<title>문의내용</title>
	
<style>

body {
    margin: 0;
    padding: 0;
    height: 100%;
}

.main{
padding-bottom:20px;
}

.maintable{
display:flex;
flex-direction:column;
justify-content:center;
align-items:center;
}

}
.tablesize{
width:100%;
display:flex;
justify-content:center;
align-items:center;
margin-left: auto; 
margin-right: auto;
}

#one_btn {
background-color: rgb(178, 178, 238);
    border: none;
    width: 100px;
    height: 25px;
    color: rgb(17, 17, 17);
    border-radius: 3px;
    font-size: 12px;
}

.body-wrapper {
    min-height: 100%;
    position: relative;
}

.body-content {
    margin-top: 100px;
    padding-bottom: 250px;
}

footer {
    width: 100%;
    height: 250px; /* footer의 높이 */
    position: absolute;  
    bottom: 0;
    left: 0;
}


	</style>
	
</head>
<body>

<div class="body-wrapper">
<div class="body-content">

<div class="main">
	<div class="maintable">
	<div class="updatetable">
	
 

	<form action="updateAction" method="post">
		<div class="tablesize">
		<table class="table table-sm"  style="margin-left: auto; margin-right: auto;">
			<input type="hidden" name="one2one_idx" value="${ dto.one2one_idx }"/>
			<thead>
			<tr>
				<th scope="row">번호</th>
				<td>${ dto.one2one_idx }</td>
			</tr>
			</thead>
			<tbody>
			<tr>
				<th scope="row">아이디</th>
				<td>${ dto.one2one_member_id }</td>
			</tr>
			<tr>
				<th scope="row">제목</th>
				<td>${ dto.one2one_title }</td>
			</tr>
			<tr>
				<th scope="row">내용</th>
				<td>
					 ${ dto.one2one_content }
				</td>
			</tr>
			
		</tbody>
		</table>
	</form>
</div>

	
	
	<form action="writeReplyAction" method="post">
	<input type="hidden" name="one2one_reply_one2one_idx" value="${ dto.one2one_idx }" />
		<table class="table table-sm"  style="margin-left: auto; margin-right: auto;">
			<tbody>
			<tr>
	    	<c:if test="${ member_grade eq 'A' }">
	    		
				<td>
					
					<label>댓글</label><textarea rows="1" cols="50" name="one2one_reply_content"></textarea><br>
					<label>아이디</label><input type="text" name="one2one_reply_member_id" value="${ member_id }"><br>
					<button type="submit" id="one_btn">답글달기</button>
				</td>
				
			</c:if>
			</tr>
		</tbody>
		</table>
	</form>
	
	
<div class="replytable">
	
	
	<table class="table table-sm"  style="margin-left: auto; margin-right: auto;">
		<thead>
		<tr>
			<th>아이디</th>
			<th>내용</th>
			<th>날짜</th>
			<th>삭제</th>
		</tr>
		</thead>
		<c:forEach var="reply_dto" items="${ reply_list }">
			<tr>
			<input type="hidden" name="one2one_reply_idx" value="${ reply_dto.one2one_reply_idx }" />
			<input type="hidden" name="one2one_reply_one2one_idx" value="${ reply_dto.one2one_reply_one2one_idx }" />
				<td>${ reply_dto.one2one_reply_member_id }</td>
				<td>${ reply_dto.one2one_reply_content }</td>
				<td>
					<c:set var="dateVar" value="${ reply_dto.one2one_reply_date }" />
					<fmt:formatDate value="${dateVar}" pattern="yyyy-MM-dd" />
				</td>
				<td><a href="/admin/deleteReplyAction?one2one_reply_idx=${ reply_dto.one2one_reply_idx }&one2one_reply_one2one_idx=${ reply_dto.one2one_reply_one2one_idx }"><button id="one_btn">삭제</button></a></td>
			</tr>
		</c:forEach>
	</table>
	</div>

</div>
</div>
</div>
</div>











