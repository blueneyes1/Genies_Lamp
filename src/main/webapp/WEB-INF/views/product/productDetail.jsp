<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <!-- Bootstrap CSS -->
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
  <title>product</title>
  
  <link rel="stylesheet" href="/css/product/productDetail.css">
  
  
  <script language="javascript">
  function showPopup() { 
  	var product_idx = $('#product_idx').val();
  	window.open("reviewActionForm?review_product_idx=" + product_idx, "a", "width=700, height=700, left=100, top=50");
  	}
  
  function counter() {
  	var counterP = document.getElementById('counterP');
  	var count = document.getElementById('product_count');
  	var maxcount = document.getElementById('max_count');
  	var price = document.getElementById('product_price');
  	var total = document.getElementById('total_price');
  	
  	counterP.onclick = function(){
  		if ( count.value < maxcount.value ) {
  			count.value = Number(count.value) + 1;
  			total.value = Number(price.value) * Number(count.value) + "원";
  			}
  		
  	}
  	
  	counterM.onclick = function(){
  		if ( count.value > 1 ) {
  			count.value = Number(count.value) - 1;
  			total.value = Number(price.value) * Number(count.value) + "원";
  			}    		
  	}
  }    	  	
   
  </script>
</head>
<body>
  <div class="box">
    <c:forEach var="dto" items="${list}">
    <div class="head_box">
      <div class="img_box">
        <img src="${dto.product_img1}" id="product_img">
      </div>
      <div class="section">
      <form method="post">
        <table class="table">
        <input type="hidden" id="product_idx" name="product_idx" value="${product_idx }" />
          <thead>
            <tr>
              <th scope="col" colspan="2" name="product_name" >${dto.product_name}</th>
            </tr>
          </thead>
          <tbody>
           <tr>
              <th scope="row">판매 가격</th>
              <td name="product_price">${dto.product_price}원</td>
              <input type="hidden" name="product_price" id="product_price" value="${dto.product_price}" >
            </tr>
            <tr>
              <th scope="row">수량 <br>( 최대 ${dto.product_count}개 )</th>
              <td>
             <input type="text" id="product_count" name="product_count" value="1" min="1" max="${dto.product_count}" >
             <input type="hidden" id="max_count" value="${dto.product_count}">
                  <button type="button" class="amount_btn" id="counterP" onclick="counter();">+</button>
                  <button type="button" class="amount_btn" id="counterM" onclick="counter();">-</button>
             </td>
            </tr>
            <tr>
              <th scope="row">총 제품가격</th>
              <td>
              <input type="text" readonly value="${dto.product_price }원" name="total_price" id="total_price">
              </td>
            </tr>
            <tr>
              <th scope="row">배송비</th>
              <td>
              		3000원 <br>
              		( 50,000원 이상 구매시 배송비 무료 )
              </td>
            </tr>
            <tr>
              <th scope="row" colspan="2" class="order_btn_box">
                <input type="submit" value="장바구니" formaction="/basketAdd" name="payment" id="order_btn"/>
                <input type="submit" value="구매하기" formaction="/order/orderForm?product_idx=${dto.product_idx}" name="payment" id="order_btn"/>
    	      </th>
            </tr>
          </tbody>
        </table>
        </form>
      </div>
    </div>
    <div class="info">
      <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
              <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="#detail">상품 상세 보기</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#delivery">배송 정보 보기</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#refund">교환 및 환불 정보 보기</a>
              </li>
        <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="#reviews">상품평 보기</a>
              </li>
            </ul>
          </div>
        </div>
      </nav>
      <a name="detail">
        <div class="product_detail">
          <p>${dto.product_content}</p>
        </div>
        </a>
       </c:forEach>
        <a name="delivery">
        <div class="product_delivery">
        <p><b>[배송 안내]</b></p>
		<p>지니의 램프는 우체국택배를 이용합니다.</p>
		<p>대부분 출고 다음날에 바로 도착하며 (주말 제외)</p>
		<p>지역 택배 기사님들의 일정과 기상상황에 따라 변동이 있을 수 있습니다.</p>
		<p>기본 배송 준비일은 입고지연 상품 제외, 2~5일 정도가 소요되고 있습니다.</p>
        </div>
      </a>
      <a name="refund">
        <div class="product_refund">
	            <p><b>[교환/반품 안내]</b></p>
				<p>물품 수령 후(택배 도착일자 기준) 7일 이내에 고객센터 [000-000-0000] 로 반드시 접수 해주세요. </p>
				<p>사전에 신청해 주신 상품에 한해서만 교환/반품이 가능합니다.</p>
				<p>접수 시 지니의 램프에서 우체국 택배 회수접수를 도와드리고 있습니다.</p>
				
				
				<p>*패킹하여 보내실 때는 물품 수령시와 동일하게 포장해 주세요.</p>
				<p>택에 손상이 있는 경우에는 반품과 교환이 모두 불가합니다.</p>
				<p>성함,주소,전화번호,보내시는 상품,사유등 반품카드 양식에 맞게 적어 보내주셔야 처리가 가능합니다.</p>
				
				
				<p>보내시는 주소지 : 서울시 지니로 지니구</p>
				
				<br />
				
				<p><b>[교환반품 불가사항]</b></p>
				<p>-상품 수령 후 7일 이상 경과된 경우</p>
				<p>-상품 구매시 교환/환불 불가능이 명시되어 있는경우</p>
				<p>-텍 제거 및 바코드 훼손, 오염이 발견된 상품</p>
				
				<p>-배송이나 제작과정에서 발생하는 냄새나 초크자국 등 대량생산으로 인해 생긴 사유는 불량으로 간주되지 않습니다.</p>
				
				<p>*불량상품의 재발송 시 왕복배송비는 지니의 램프가 부담합니다.</p>
        </div>
        </a>
        <a name="reviews">
        <div class="product_review">
          <div class="product_review_list">
            <table width="900" cellpadding="0" cellspacing="0" id="review_table">
          <tr>
          	<th>상품 이미지</th>
            <th>상품평</th>
            <th>아이디</th>
            <th>날짜</th>
          </tr>
          <c:forEach var="review_list" items="${ review_list }">
            <tr>
            <td class="review_img_box">
            <img src=${ review_list.review_img } id="review_img">
            </td>
            <td>${ review_list.review_content }</td>
            <td>${ review_list.review_member_id }</td>
              <td>
					<c:set var="dateVar" value="${ review_list.review_date }" />
					<fmt:formatDate value="${dateVar}" pattern="yyyy-MM-dd" />
				</td>
            </tr>
          </c:forEach>
        </table>
        <!-- 데이터가 없을 때 표시할 텍스트 -->
				<c:if test="${ review_list == null }">
					<div class="row-group">
						<div class="cell">
							작성된 리뷰가 없습니다.
						</div>
					</div>
				</c:if>
          </div>
          <div class="review_btn_box">
            <input type="button" value="상품평 작성하기" id="review_btn" onclick="showPopup();"/>
          </div>
        </div>
        </a>
    </div>
  </div>
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>