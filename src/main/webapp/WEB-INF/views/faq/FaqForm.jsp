<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Faq</title>
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

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" 
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

</head>
<body>

  
  <!-- 메인 -->


 	<div class="topline">
       <div class="name">
          
          </div>
     
         </div>
  <div class="menu">
<div class="NFtable">

 

     


 
        <div>
          <h3>Faq</h3>
        </div>
         
  <table class="NFForm">
		  <colgroup>
    	<col width="10%"/>
    	<col width="90%"/>
 


        <tr>
          <th>번호</th>
          <th>제목</th>
          
        </tr>
        
        
      		<c:forEach var="faq_dto" items="${ faq_list }" varStatus="status">
	        <tr onclick="window.location.href='/faq/FaqDetail?faq_idx=${faq_dto.faq_idx}';"  style="cursor:pointer;">

          <td width=300 height=30 style='table-layout:fixed'>${ status.count  }</td>
	      <td width=300 height=30 style='table-layout:fixed'>${ faq_dto.faq_title }</td>
	          </tr>
        	</c:forEach>
       
      </table>

  </div>
 

  <div class="contanier-fluid">
  	<div class="row">
  	<nav aria-label="Page navigation example">
  <ul class="pagination">
    <li class="page-item <c:if test="${ page == 1 }">disabled</c:if>">
		    	<a class="page-link" href="/faq/FaqForm?page=${page-1}">Previous</a>
		    </li>
		    
		    <li class="page-item <c:if test="${ page == 1 }">active</c:if>">
		    	<a class="page-link" href="/faq/FaqForm?page=1">1</a>
		    </li>
		    <li class="page-item <c:if test="${ page == 2 }">active</c:if>">
		    	<a class="page-link" href="/faq/FaqForm?page=2">2</a>
		    </li>
		    <li class="page-item <c:if test="${ page == 3 }">active</c:if>">
		    	<a class="page-link" href="/faq/FaqForm?page=3">3</a>
		    </li>
		    <li class="page-item <c:if test="${ page == 4 }">active</c:if>">
		    	<a class="page-link" href="/faq/FaqForm?page=4">4</a>
		    </li>
		    <li class="page-item <c:if test="${ page == 5 }">active</c:if>">
		    	<a class="page-link" href="/faq/FaqForm?page=5">5</a>
		    </li>
		    <li class="page-item <c:if test="${ page == 5 }">disabled</c:if>">
		    	<a class="page-link" href="/faq/FaqForm?page=${page+1}">Next</a>
		    </li>
  </ul>
</nav>
  	</div>
 </div>

  </div>

  	<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
  

	


  


