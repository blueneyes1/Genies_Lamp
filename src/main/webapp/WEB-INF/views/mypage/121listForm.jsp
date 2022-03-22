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
	<title>1대1문의</title>
	<style>

.menu{width:800px; margin: 0 auto}


table.NFForm{
border-collapse:separate;
border-spacing:0;
text-align:left;
line-height:1.5;
border-top:1px solid #ccc;
border-left:1px solid #ccc;
margin: auto;
}

table.NFForm th{
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
table.NFForm td{
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
	
  <!-- 메인 -->

  <div class="menu">
	<div class="NFtable">

 

      <table class="NFForm">
		  <colgroup>
    	<col width="7%"/>
    	<col width="20%"/>
    	<col width="60%"/>
    	<col widht="13%"/>

<tr>
			<th>번호</th>
			<th>아이디</th>
			<th>제목</th>
			<th>날짜</th>
		</tr>
		
		<c:forEach var="dto" items="${ list }">
			<tr>
				<td>${ dto.one2one_idx }</td>
				<td>${ dto.one2one_member_id }</td>
				<td>
					<a href="contentForm?one2one_idx=${dto.one2one_idx}"> ${ dto.one2one_title } </a>
				</td>
				<td>
					<c:set var="dateVar" value="${ dto.one2one_date }" />
					<fmt:formatDate value="${dateVar}" pattern="yyyy-MM-dd" />
				</td>
			</tr>
		</c:forEach>
		
		<tr>
			<c:if test="${ not empty member_id }">
	    	<c:if test="${ member_grade ne 'A' }">
	    		<td colspan="5"><a href="writeForm">문의작성</a></td>
			</c:if>
			</c:if>
		</tr>
	</table>
	
	<script>
		/* 웹브라우저 back키 누를때, 페이지 재로딩  */
		window.onpageshow = function(event) {
		    if (event.persisted) {
		        document.location.reload();
		    }
		};
	</script>
</body>
</html>
		






