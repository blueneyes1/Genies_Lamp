<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<head>
	 <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
  <title>지니의 램프 - Genie's Lamp</title>
</head>

<!-- 메인페이지 -->
<div class="main">
	
	<!-- 캐러샐 --><!-- 사진크기 조절 -->
	<div class="carousel">
		<div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
    <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active" data-bs-interval="1000">
      <img src="/img/carousel/bed.jpg" class="d-block w-100" alt="..." width="20%" height="6%">
      <div class="carousel-caption d-none d-md-block">
        <h5>First slide label</h5>
        <p>Some representative placeholder content for the first slide.</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="/img/carousel/lamp.jpg" class="d-block w-100" alt="..." width="20%" height="6%">
      <div class="carousel-caption d-none d-md-block">
        <h5>Second slide label</h5>
        <p>Some representative placeholder content for the second slide.</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="/img/carousel/rail.jpg" class="d-block w-100" alt="..." width="20%" height="6%">
      <div class="carousel-caption d-none d-md-block">
        <h5>Third slide label</h5>
        <p>Some representative placeholder content for the third slide.</p>
      </div>
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-target="#carouselExampleCaptions" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-target="#carouselExampleCaptions" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </button>
</div>
	</div>
	
	
	<!-- 이벤트배너 -->
	<div class="eventbanner"><h3>이벤트</h3><img src="/img/banner/service_banner.jpg" width="100%" height="20%"></div>
	
	<!-- 베스트아이템 -->
	<div class="betstitem"><h3>BEST</h3>
		
		<!-- 메인아이템 -->
		<div class="mainitem">
		<div class="mainbest"><img src="/upload/202222202530402.JPG" width="600" height="400"></div>

		<!-- 서브아이템 -->
		<div class="subbest">
			<div class="subbest1">
			<div class="sub1best"><img src="/upload/2022222115416879.JPG" width="300" height="200"></div>
			<div class="sub2best"><img src="/upload/2022223101516860.JPG" width="300" height="200"></div>
			</div>
			<div class="subbest2">
			<div class="sub1best"><img src="/upload/202222391113921.JPG" width="300" height="200"></div>
			<div class="sub2best"><img src="/upload/wall4.jpg" width="300" height="200"></div>
			</div>
		</div>
		</div>
		</div>
		
	
	
	<!-- 빅배너 -->
	<div class="customerevent"><h3>고객감사이벤트</h3></div>
	<div class="bigbanner">	
		<div><img src="/img/banner/kakaoevent.jpg" width="100%" height="100%"></div>
		<div><img src="/img/banner/newopen.jpg" width="100%" height="100%"></div>
		<div><img src="/img/banner/photoevent.jpg"width="100%" height="100%"></div>		

	</div>

	
	<!-- 신제품 -->
	<div class="newtext"><h3>NEW</h3></div>
	<div class="newitem">
			<div class="railboard">
				<div class="rail1"><img src="/upload/20222239717289.jpg" width="300" height="200"></div>
				<div class="rail1"><img src="/upload/20222239133209.jpg" width="300" height="200"></div>
			</div>	
			
			<div class="floarboard">
				<div class="floar"><img src="/upload/202222310948254.jpg" width="300" height="200"></div>
				<div class="floar"><img src="/upload/202222395932480.jpg" width="300" height="200"></div>
			</div>
			
			<div class="standboard">
				<div class="stand"><img src="/upload/2022219273879.jpg" width="300" height="200"></div>
				<div class="stand"><img src="/upload/20222237405914.jpg" width="300" height="200"></div>
			</div>
			
			<div class="wallboard">
				<div class="wall"><img src="/upload/202222395215752.jpg" width="300" height="200"></div>
				<div class="wall"><img src="/upload/202222393915731.jpg" width="300" height="200"></div>
			</div>
	</div>


	<!-- 게시판 -->
<!--  div class="board">
	<div class="noticeboard" style="border: solid; width:600px; height:200px;" -->
	<!--  iframe src="/notice/NoticeForm"> </iframe-->
	
	 
	 
<%-- 	 
	<div class="board" style="width:90%"> 
	  <div class="noticeboard" style="width:48%; height:200px;" >
	    <h2><a href="<c:url value='/notice/NoticeForm"'/>">공지사항 </a></h2>
	     <iframe src="/notice/NoticeFormTable"" 
	             frameborder="0" border="0" cellspacing="0" scrolling="no" 
	              style="border-style:none; width:100%; height:125px;"></iframe>
	     
	  </div>
	   <div class="noticeboard" style="width:48%; height:200px;" >
	    <h2><a href="<c:url value='/faq/FaqForm"'/>">FAQ </a></h2>
	     <iframe src="/faq/FaqFormTable"" 
	             frameborder="0" border="0" cellspacing="0" " scrolling="no" 
	             style="border-style:none; width:100%; height:125px;"></iframe>
	     
	  </div> --%>
	
	
	<div class="board2">
	<div class="noticeboard">
	<c:forEach var="notice_list" items="${notice_list }" begin="1" end="5">
	<input type="hidden" name="notice_idx" value="${ notice_list.notice_idx }">
	<table>
	
	<tr>
	<td><a href="/notice/NoticeDetail?notice_idx=${notice_list.notice_idx }">${notice_list.notice_title }</a></td>
	
	</tr>
	</table>
	</c:forEach>
		
	</div>
	<div class="faqboard">
		<c:forEach var="faq_list" items="${faq_list }" begin="1" end="5">
		<input type="hidden" name="faq_idx" value="${ faq_list.faq_idx }">
	<table>
	
	<tr>
	<td><a href="/faq/FaqDetail?faq_idx=${faq_list.faq_idx }">${faq_list.faq_title }</a></td>
	
	</tr>
	</table>
	</c:forEach>
	
	</div>
	</div>
	
	 
	 
	 
</div>




<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

