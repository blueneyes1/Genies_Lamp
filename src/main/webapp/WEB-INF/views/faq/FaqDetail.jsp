<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<meta charset="UTF-8">
<title>FAQ 상세</title>
</head>

<style>
body {
    margin: 0;
    padding: 0;
    height: 100%;
}
 





.main{
padding-bottom:20px;
width:60%; 
margin: 0 auto;

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
	<input type="hidden" name="faq_idx" value="${viewDto.faq_idx }"/>
  <thead>
    <tr>
     	<th scope="row" nowrap>제목</th>
       <td>${faq_dto.faq_title }</td>
     
    </tr>
  </thead>
  <tbody>

    <tr>
      	<th scope="row">내용</th>
    	<td>${faq_dto.faq_content }</td>
    </tr>
 
  </tbody>
</table>

</div>



<div class="writebtn">
<input type="hidden" name="faq_idx" value="${ faq_dto.faq_idx }" >
	<c:if test="${ member_grade eq 'A' }">
	<a href="/faq/FaqContent?faq_idx=${ faq_dto.faq_idx }">
		<button id="notice_btn"  >수정</button>
	</a></c:if>

	<input type="button" id="notice_btn" value="목록" onclick="window.location.href='/faq/FaqForm'">
	
</div>
</div>
</div>
</div>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
  