<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<head>
	 <!-- Bootstrap CSS -->
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
	
	
	<title>지니의 램프 - Genie's Lamp</title>


</head>

지니의 램프 - Genie's Lamp

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
    <div class="carousel-item active">
      <img src="/img/carousel/bed.jpg" class="d-block w-100" alt="..." width="600" height="400">
      <div class="carousel-caption d-none d-md-block">
        <h5>First slide label</h5>
        <p>Some representative placeholder content for the first slide.</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="/img/carousel/lamp.jpg" class="d-block w-100" alt="..." width="600" height= "400">
      <div class="carousel-caption d-none d-md-block">
        <h5>Second slide label</h5>
        <p>Some representative placeholder content for the second slide.</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="/img/carousel/rail.jpg" class="d-block w-100" alt="..." width="600" height="400">
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
	<div class="eventbanner"><img src="/img/banner/service_banner.jpg" width="100%" height="10%"></div>
	
	<!-- 베스트아이템 -->
	<div class="betstitem">
		
		<!-- 메인아이템 -->
		<div class="mainitem">
		<div class="mainbest"><img src="/img/test/lamp1.jpg" width="300" height="200"></div>

		<!-- 서브아이템 -->
		<div class="subbest"></div>
			<div class="subbest1">
			<div class="sub1best"><img src="/img/test/lamp2.jpg" width="150" height="100"></div>
			<div class="sub2best"><img src="/img/test/lamp3.jpg" width="150" height="100"></div>
			</div>
			<div class="subbest2">
			<div class="sub1best"><img src="/img/test/lamp4.jpg" width="150" height="100"></div>
			<div class="sub2best"><img src="/img/test/lamp4.jpg" width="150" height="100"></div>
			</div>
		</div>
		</div>
	
	
	<!-- 빅배너 -->
	<div class="bigbanner">	
		<div><img src="/img/banner/kakaoevent.jpg" width="150" height="100"></div>
		<div><img src="/img/banner/newopen.jpg" width="150" height="100"></div>
		<div><img src="/img/banner/photoevent.jpg"width="150" height="100"></div>		

	</div>
	<!-- 신제품 -->
	<div class="newitem">
		<div class="rail"></div>
		<div class="floar"></div>
		<div class="stand"></div>
		<div class="wall"></div>
	</div>

	<%-- <!-- 게시판 -->
	<div class="board">
		<div class="noticeboard">
			 <table class="NFForm">
        <colgroup>
        <col width="10%"/>
        <col width="70%"/>
        <col width="20%"/>
        <tr>
          <th scope="row">번호</th>
          <th scope="row">제목</th>
          <th scope="row">작성일</th>
        </tr>
        
        
      		<c:forEach var="dto" items="${ notice_list }" varStatus="status">
	        <tr onclick="window.location.href='/notice/NoticeDetail?notice_idx=${dto.notice_idx}';"  style="cursor:pointer;">
	          <td class="num">${ status.count  }</td>
	          <td>${ dto.notice_title }</td>
	          <td><fmt:formatDate pattern="yyyy-MM-dd" value="${ dto.notice_date }" /></td>
	        </tr>
        	</c:forEach>
       
      </table>
		
		</div>
		<div class="one2oneboard"></div>
		
		
		
		
		<div class="faqboard">
		 <table>
		   <colgroup>
        	<col width="20%"/>
        	<col width="80%"/>
        <tr>
          <th>번호</th>
          <th>제목</th>
          
        </tr>
        
        
      		<c:forEach var="faq_dto" items="${ faq_list }" varStatus="status">
	        <tr onclick="window.location.href='/faq/FaqDetail?faq_idx=${faq_dto.faq_idx}';"  style="cursor:pointer;">
	          <td>${ status.count  }</td>
	          <td>${ faq_dto.faq_title }</td>
	         
	        </tr>
        	</c:forEach>
       
      </table>
		</div>
	</div>		
		
	<!-- 메인끝 -->	
</div> --%>
	
	</div>




<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

