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

.writebtn{
float: right;

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


	</style>

</head>
<body>
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
				<td><input type="text" name="one2one_title" value="${ dto.one2one_title }" size="50"></td>
			</tr>
			<tr>
				<th scope="row">내용</th>
				<td>
					<textarea rows="10" cols="50" name="one2one_content"> ${ dto.one2one_content } </textarea>
				</td>
			</tr>
		
			</tbody>
		</table>
		
		<c:if test="${ member_grade ne 'A' }">
			<div class="writebtn">
				<button type="submit" id="one_btn">수정</button>
		</form>
				<input type="button" id="one_btn" value="목록" onclick="window.location.href='/mypage/121listForm'">
				<a href="deleteAction?one2one_idx=${ dto.one2one_idx }"><input type="button" id="one_btn" value="삭제"></a>
			</div>
		</c:if>	
	
	
	<form action="writeReplyAction" method="post">
	<input type="hidden" name="one2one_reply_one2one_idx" value="${ dto.one2one_idx }" />
		<table class="table table-sm"  style="margin-left: auto; margin-right: auto;">
			<tbody>
			<tr>
	    	<c:if test="${ member_grade eq 'A' }">
	    		
				<td>
					
					<label>댓글</label><textarea rows="2" cols="50" name="one2one_reply_content"></textarea><br>
					<label>아이디</label><input type="text" name="one2one_reply_member_id" value="${ member_id }"><br>
					<button type="submit" id="one_btn">답글달기</button>
				</td>
				
			</c:if>
			</tr>
			</tbody>
		</table>
	</form>
	
<div class="replytable">
	<input type="hidden" name="one2one_reply_one2one_idx" value="${ dto.one2one_idx }" />
	
	<table class="table table-sm"  style="margin-left: auto; margin-right: auto;">
		<thead>
		<tr>
			<th>아이디</th>
			<th>내용</th>
			<th>날짜</th>
			
		</tr>
		</thead>
		<tbody>
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
		</tbody>
	</table>
	</div>
</div>
</div>

</body>
</html>

















