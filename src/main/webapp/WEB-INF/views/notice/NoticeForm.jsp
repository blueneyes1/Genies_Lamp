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
<body>  

<!-- Header -->
	<div class="toTopScroll">
	  <img src="/img/icon-top.png" onClick="javascript:window.scrollTo(0,0)">
	</div>
	
	<div class="top d-none d-md-block">
	  <div class="topMenu d-none d-md-block container">
	    <span class="home"><a href="/main">HOME</a></span>
	    
	    
	    	<span><a href="/login">로그인</a></span>
	    	<span><a href="/join">회원가입</a></span>
	    
	  </div>
	</div>
	
	<!-- 메인로고 -->
	<div class="mainlogo">
		<a href="/main"><img src="/img/mainlogo.gif" alt="메인로고"></a>
	</div>

	<!-- 네비바 -->
	<nav class="navbar navbar-expand-md navbar-light bg-white sticky-top">
	  <div class="container">
	    <a class="navbar-brand" href="/main"><img src="/img/logo.jpg" width="150" height="50" alt="로고"></a>
	    <button class="navbar-toggler" type="button" data-toggle="collapse" 
	            data-target="#collapsibleNavbar"> 
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse" id="collapsibleNavbar">
	      <!-- ml-auto : margin-left  -->
	      <ul class="navbar-nav ml-auto">
	        <li class="nav-item dropdown">
	          <a class="nav-link" href="#">Genie's Lamp</a>
	          <div class="dropdown-content">
	            <a href="/company/company">Genie's Lamp 소개</a>
	            <a href="/company/companyMap">오시는 길</a>
	          </div>
	        </li>
	        <li class="nav-item dropdown">
	          <a class="nav-link" href="#">제품안내</a>
	          <div class="dropdown-content">
	            <a href="/product/productList01?product_type=스탠드등">스탠드등</a>
	            <a href="/product/productList02?product_type=레일등">레일등</a>
	            <a href="/product/productList03?product_type=천장등">천장등</a>
	            <a href="/product/productList04?product_type=벽등">벽등</a>
	          </div>
	        </li>
	        <li class="nav-item dropdown">
	          <a class="nav-link" href="#">커뮤니티</a>
	          <div class="dropdown-content">
	            <a href="/notice/NoticeForm">공지사항</a>
	            <a href="/customer/customer01">1:1 문의</a>
	            <a href="/faq/FaqForm">FAQ</a>
	          </div>
	        </li>	       
	      </ul>
	    </div>
	  </div>
	</nav>






<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title></title>
<style>

.menu{width:800px; margin: 0 auto}




table.NFForm{
border-collapse:separate;
border-spacing:0;
text-align:left;
line-height:1.5;
border-top:1px solid #ccc;
border-left:1px solid #ccc;
margin: 20px 10px;
width:800px;
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
text-align:center;
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

.btnwrite{
background-color: #87CEFA;
float:right;
}

.writebtn{
margin: auto;
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
	<!-- 부트스트랩 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" 
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	
</head>
<body>

  
  <!-- 메인 -->


 	<div class="topline">
       <div class="name">
          <p><font color="white"> 공지사항</font></p>
          </div>
     
         </div>
  <div class="menu">
<div class="NFtable">
      <table class="NFForm">
        <colgroup>
    	<col width="10%"/>
    	<col width="70%"/>
    	<col width="20%"/>
  </colgroup>
        <tr>
          <th scope="row" colspan="1" >번호</th>
         
          <th scope="row" colspan="1">제목</th>
       
          <th scope="row" colspan="1">작성일</th>
       
        </tr>
        
        
      		<c:forEach var="dto" items="${ notice_list }" varStatus="status">
	        <tr onclick="window.location.href='/notice/NoticeDetail?notice_idx=${dto.notice_idx}';"  style="cursor:pointer;">
	          <td class="num" >${ status.count  }</td>
	          <td >${ dto.notice_title }</td>
	          <td ><fmt:formatDate pattern="yyyy-MM-dd" value="${ dto.notice_date }" /></td>
	        </tr>
        	</c:forEach>
       
      </table>
       
       
     <div class="writebtn">
     <c:if test="${ member_grade eq 'A' }">
	 <button onclick="location.href='/notice/NoticeWrite'" class="btnwrite">글작성</button>
	</c:if>
	</div>
 	<div></div>
 </div> 	
<div class="contanier-fluid">
  	<div class="row">
  	<nav aria-label="Page navigation example">
  <ul class="pagination">
    <li class="page-item <c:if test="${ page == 1 }">disabled</c:if>">
		    	<a class="page-link" href="/notice/NoticeForm?page=${page-1}">Previous</a>
		    </li>
		    
		    <li class="page-item <c:if test="${ page == 1 }">active</c:if>">
		    	<a class="page-link" href="/notice/NoticeForm?page=1">1</a>
		    </li>
		    <li class="page-item <c:if test="${ page == 2 }">active</c:if>">
		    	<a class="page-link" href="/notice/NoticeForm?page=2">2</a>
		    </li>
		    <li class="page-item <c:if test="${ page == 3 }">active</c:if>">
		    	<a class="page-link" href="/notice/NoticeForm?page=3">3</a>
		    </li>
		    <li class="page-item <c:if test="${ page == 4 }">active</c:if>">
		    	<a class="page-link" href="/notice/NoticeForm?page=4">4</a>
		    </li>
		    <li class="page-item <c:if test="${ page == 5 }">active</c:if>">
		    	<a class="page-link" href="/notice/NoticeForm?page=5">5</a>
		    </li>
		    <li class="page-item <c:if test="${ page == 5 }">disabled</c:if>">
		    	<a class="page-link" href="/notice/NoticeForm?page=${page+1}">Next</a>
		    </li>
  </ul>
</nav>
  	</div>
 </div>
 
 
  	<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
  
  

  </div>
<!-- footer -->

<div class="footer">
  <div class="container text-center">
    <div>
      <a href="/company/company">회사소개&nbsp;&nbsp;<span>|</span></a>
      <a href="#">개인정보보호정책&nbsp;&nbsp;<span>|</span></a>
      <a href="#">이메일무단수집거부&nbsp;&nbsp;<span>|</span></a>
      <a href="#">묻고답하기&nbsp;&nbsp;<span>|</span></a>
      <a href="/company/companyMap">오시는길&nbsp;&nbsp;<span>|</span></a>
    </div>
    <div>
      <span>회사 : Genie's Lamp &nbsp; 주소 : 서울특별시 노원구 상계로 64 화랑빌딩 4F  &nbsp; 대표 : 지니 <br>
        고객지원 : 010-2222-3333, FAX : 070-888-5555, EMAIL : support@gmail.com, 사업자등록번호 : 111-22-33333, 통신판매업 : 1234-서울노원-12345호<br>COPYRIGHT(C) 2021 GENIES_LAMP. ALL RIGHT RESERVED.</span>
    </div>
    <div>
      <img src="/img/mf-icon01.png" alt="">
      <img src="/img/mf-icon02.png" alt="">
      <img src="/img/mf-icon03.png" alt="">
      <img src="/img/mf-icon04.png" alt="">
    </div>
  </div>
</div>

</body>
</html>

