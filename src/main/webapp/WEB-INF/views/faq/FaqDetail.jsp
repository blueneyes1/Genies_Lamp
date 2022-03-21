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
table.noticetable{
border-collapse:separate;
border-spacing:0;
text-align:left;
line-height:1.5;
border-top:1px solid #ccc;
border-left:1px solid #ccc;
margin: auto;
width:800px;
}

table.noticetable th{
width:50px;
padding : 10px;
font-weight:bold;
vertical-align:top;
border-right :1px solid #ccc;
border-bottom : 1px solid #ccc;
border-top: 1px solid #fff;
border-left: 1px solid #fff;
background:	#F5F5DC;
text-align:center;
}
table.noticetable td{
width:250px;
padding : 10px;
vertical-align:top;
border-right :1px solid #ccc;
border-bottom : 1px solid #ccc;
}
.btn{
background-color: #87CEFA;
float:right;
}

.writelistbtn{
margin: auto;
}

</style>
<body>


  <table class="noticetable">
		<colgroup>
    	<col width="20%"/>
    	<col width="80%"/>
	<tr>
		<th>제목</th>
		<th>내용</th>
				
	</tr>
	
	 <tr> 
	 	<td>${faq_dto.faq_title }</td>
	 	<td>${faq_dto.faq_content }</td>
	 </tr>
</table>
	
	
	
	<div class="writelistbtn">
	<input type="hidden" name="faq_idx" value="${ faq_dto.faq_idx }" >
	<input type="button"  value="목록" onclick="window.location.href='/faq/FaqForm'">
	<c:if test="${ member_grade eq 'A' }">
	<a href="/faq/FaqContent?faq_idx=${ faq_dto.faq_idx }"><input type="button"  value="수정" ></a>
	</c:if>
	</div>
	<div></div>

</body>
</html>