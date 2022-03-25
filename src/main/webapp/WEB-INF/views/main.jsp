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

<div class="container1">


	<div class="carousel">
		<div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
    <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active" data-bs-interval="1000">

      <img src="/img/carousel/light2.jpg" class="d-block w-100" alt="..." >

      <div class="carousel-caption d-none d-md-block">
        <h5>세상을 빚추는 빛</h5>
        <p>세상을 빛추는 빛처럼 당신을 비추어 보세요</p>
      </div>
    </div>
    <div class="carousel-item">

      <img src="/img/carousel/bed.jpg" class="d-block w-100" alt="..."  >

      <div class="carousel-caption d-none d-md-block">
        <h5>어둠을 밝히는 빛</h5>
        <p>어두운 공간까지 감각적이고 세련되게 밝혀 드립니다.</p>
      </div>
    </div>
    <div class="carousel-item">

      <img src="/img/carousel/light7.jpg" class="d-block w-100" alt="..." >

      <div class="carousel-caption d-none d-md-block">
        <h5>마음을 보이는 빛</h5>
        <p>나만의 공간이 가장 아름답게 드러나도록 보여 보세요</p>
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
	</div>


	

	
	<!-- 베스트아이템 -->
	<div class="besttitem">
	<p class="texttitle">BEST</p>
	<p class="subtitle">지니의 베스트 상품들을 소개합니다</p>
		
		<!-- 메인아이템 -->
		<div class="mainitem">
		<div class="mainbest">
					<a href="product/productDetail?product_idx=45"><img src="/upload/202222202530402.JPG" width="600" height="400"></a>
		</div>

		<!-- 서브아이템 -->
		<div class="subbest">
			<div class="subbest1">
			<div class="sub1best">
					<a href="product/productDetail?product_idx=41"><img src="/upload/2022222115416879.JPG" width="300" height="200"></a>
			</div>
			
			<div class="sub2best">
					<a href="product/productDetail?product_idx=54"><img src="/upload/2022223101516860.JPG" width="300" height="200"></a>
			</div>
			</div>
			<div class="subbest2">
			<div class="sub1best">
					<a href="product/productDetail?product_idx=49"><img src="/upload/202222391113921.JPG" width="300" height="200"></a>
			</div>
					<a href="product/productDetail?product_idx=56"><img src="/upload/20222239281217.JPG" width="300" height="200"></a>
			<div class="sub2best">
			
			</div>

	
	
		</div>
		</div>
		</div>
	
	<!-- 신제품 -->

	<div class="newtext">
	
	<p class="texttitle">NEW</p>
	<p class="subtitle">새로운 상품들을 만나보세요</p>
	</div>

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
	



	
		
	<!-- 빅배너 -->
	<div class="customerevent">
	<p class="texttitle">이벤트</p>
	<p class="subtitle">고객을 위한 지니의 파격 이벤트</p></div>
	<div class="bigbanner">	
		<div><img src="/img/banner/kakaoevent.jpg" width="100%" height="100%"></div>
		<div><img src="/img/banner/newopen.jpg" width="100%" height="100%"></div>
		<div><img src="/img/banner/photoevent.jpg"width="100%" height="100%"></div>		
	</div>



	<!-- 리뷰 보드 -->
	<div class="reviewboard">
	<div class="review">
		
	</div>
	</div>


	<!--  공지사항 FAQ 보드 -->
	
	<div class="boardinner">
	<p class="texttitle">새소식</p>
	<p class="subtitle">지니의 중요사항을 알려드립니다.</p></div>
	<div class="board2">
	
	<div class="noticeboard"><h4>공지사항</h4>
	<c:forEach var="notice_list" items="${notice_list }" begin="1" end="5">
	<input type="hidden" name="notice_idx" value="${ notice_list.notice_idx }">
	<table class="table table-sm">
	
	<tr>
	<td><a href="/notice/NoticeDetail?notice_idx=${notice_list.notice_idx }">${notice_list.notice_title }</a></td>
	
	</tr>
	</table>
	</c:forEach>
		
	</div>
	<div class="faqboard"><h4>FAQ</h4>
		<c:forEach var="faq_list" items="${faq_list }" begin="1" end="5">
		<input type="hidden" name="faq_idx" value="${ faq_list.faq_idx }">
	<table class="table table-sm">
	
	<tr>
	<td><a href="/faq/FaqDetail?faq_idx=${faq_list.faq_idx }">${faq_list.faq_title }</a></td>
	
	</tr>
	</table>
	</c:forEach>
	
	</div>
	</div>
	</div>
	</div>


	 







<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

