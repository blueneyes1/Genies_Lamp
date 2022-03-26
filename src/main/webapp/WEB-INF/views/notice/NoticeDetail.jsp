<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<meta charset="UTF-8">

<style>
body {
    margin: 0;
    padding: 0;
    height: 100%;
}
 





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

.writebtn{
float:right;

}
.body-wrapper {
    min-height: 100%;
    position: relative;
}

.body-content {
    margin-top: 100px;
    padding-bottom: 250px; /* footer의 높이 */
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
 <!-- Bootstrap CSS -->
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
	

<body>
<div class="body-wrapper">
<div class="body-content">

<div class="main">



<div class="tablesize">
	<table class="table table-sm"  style="margin-left: auto; margin-right: auto;">
	<input type="hidden" name="notice_idx" value="${viewDto.notice_idx }"/>
  <thead>
    <tr>
      <th scope="row">번호</th>
       <td>${notice_dto.notice_idx }</td>
     
    </tr>
  </thead>
  <tbody>
     
     <tr>
      	<th scope="row">제목</th>
      		<td>${notice_dto.notice_title }</td>		
     </tr>
    
    <tr>
      	<th scope="row">작성일</th>
      <td> 
		<fmt:formatDate pattern="yyyy-MM-dd" value="${ notice_dto.notice_date }" /></td>
    </tr>
    
    <tr>
      	<th scope="row">내용</th>
    	<td colspan="2" width="800" height="80">${notice_dto.notice_content }</td>
    </tr>
 
  </tbody>
</table>

</div>

<div class="writebtn">
<input type="hidden" name="notice_idx" value="${ notice_dto.notice_idx }">
	<c:if test="${ member_grade eq 'A' }">
	<a href="/notice/NoticeContent?notice_idx=${ notice_dto.notice_idx }">
		<button id="notice_btn" >수정</button>
	</a></c:if>

	<input type="button" id="notice_btn" value="목록" onclick="window.location.href='/notice/NoticeForm'">
	
</div>

</div>
</div>
</div>
 <!-- Bootstrap CSS -->
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
	
