<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>공지사항 상세</title>
</head>



<style>
.main{
padding-bottom:20px;
font-size: 12px;
}

#notice_btn {
background-color: rgb(178, 178, 238);
border: none;
width: 90px;
height: 25px;
color: rgb(17, 17, 17);
border-radius: 3px;
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
float:right;

}

.contanier-fluid{
margin:auto;
}

.topline{
position:relative;
}

.name{
position: absolute;
top: 50%;
text-align: center;

}
</style>


<body>
 <div class="main">

<div class="tablesize">
<form action="writeAction" method="post">

	<table class="table table-sm"  style="margin-left: auto; margin-right: auto;">
	<input type="hidden" name="notice_idx" value="${ viewDto.notice_idx }"/>
  <thead>
    <tr>
      <th scope="row">번호</th>
       <td>${ viewDto.notice_idx }</td>
     
    </tr>
  </thead>
  <tbody>
     
     <tr>
      <th scope="row">제목</th>
      <td><input type="text" name="notice_title" value="" size="78"></td>
      </tr>
    
    <tr>
      <th scope="row">작성일</th>
     <td>   <c:set var="dateVar" value="${ notice_list.notice_date }" />
		<fmt:formatDate pattern="yyyy-MM-dd" value="${ notice_dto.notice_date }" /></td>
    </tr>
    
    <tr>
      <th scope="row">내용</th>
    <td><textarea rows="10" cols="80" name="notice_content"></textarea></td>
    </tr>
  
  </tbody>
</table>
</div>
<div class="writebtn">
	
	<button type="submit" id="notice_btn">작성</button>
		</form>

	<button type="button" id="notice_btn" onclick="window.location.href='/notice/NoticeForm'">목록</button>
</div>
</div>


</body>
</html>