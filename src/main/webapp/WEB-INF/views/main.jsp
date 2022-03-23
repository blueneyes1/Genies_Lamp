<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


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
    <div class="carousel-item active">
      <img src="/img/carousel/bed.jpg" class="d-block w-100" alt="..." width="900" height="600">
      <div class="carousel-caption d-none d-md-block">
        <h5>First slide label</h5>
        <p>Some representative placeholder content for the first slide.</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="/img/carousel/lamp.jpg" class="d-block w-100" alt="..." width="900" height= "600">
      <div class="carousel-caption d-none d-md-block">
        <h5>Second slide label</h5>
        <p>Some representative placeholder content for the second slide.</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="/img/carousel/rail.jpg" class="d-block w-100" alt="..." width="900" height="600">
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
	<div class="eventbanner"><img src="/img/banner/service_banner.jpg" width="100%" height="2%"></div>
	
	<!-- 베스트아이템 -->
	<div class="betstitem">
		
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
		
	
	
	<!-- 빅배너 -->
	<div class="bigbanner">	
		<div><img src="/img/banner/kakaoevent.jpg" width="400" height="200"></div>
		<div><img src="/img/banner/newopen.jpg" width="400" height="200"></div>
		<div><img src="/img/banner/photoevent.jpg"width="400" height="200"></div>		

	</div>
	<!-- 신제품 -->
	<div class="newitem">
		<div class="rail"></div>
		<div class="floar"></div>
		<div class="stand"></div>
		<div class="wall"></div>
	</div>

	<!-- 게시판 -->
	<div class="board">
	<div class="noticeboard"><h2 class="boardmov">공지사항</h2>
	<div class="notice_link"><a href="notice/NoticeForm">전체공지보기</a></div>
		<ul id="noticeslide">
			<li><a href="notice/NoticeDetail?notice_idx=1">방역 배송 안내</a></li>
			<li><a href="notice/NoticeDetail?notice_idx=2">지니의 램프 상품 댓글 안내</a></li>
			<li><a href="notice/NoticeDetail?notice_idx=3">지니의 램프 origin 상품 안내</a></li>
			<li><a href="notice/NoticeDetail?notice_idx=4">대리구매 이용 자제를 부탁드립니다</a></li>
			<li><a href="notice/NoticeDetail?notice_idx=5">택배배송 정상화 지연 안내</a></li>
		</ul>
	</div>

	<div class="faqboard"><h2 class="faqmov">자주묻는질문</h2>
	<div class="faq_link" ><a href="faq/FaqForm">전체Faq보기</a></div>
		<ul id="faqslide">
			<li><a href="faq/FaqDetail?faq_idx=1">수령자/배송지 주소를 변경하고 싶어요.</a></li>
			<li><a href="faq/FaqDetail?faq_idx=2">최저가 보상 제도는 어떤 제도인가요?</a></li>
			<li><a href="faq/FaqDetail?faq_idx=3">ID/ 비밀번호가 기억나지 않아요 찾을수 있나요?</a></li>
			<li><a href="faq/FaqDetail?faq_idx=4">아이디/비밀번호/회원정보 변경이 가능한가요?</a></li>
			<li><a href="faq/FaqDetail?faq_idx=5">회원가입을 해야지만 주문할수 있나요?</a></li>
		</ul>
	</div>
	
	
	</div>
</div>
</div>



<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

