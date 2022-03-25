<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head>

 <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

   <!-- Bootstrap CSS -->
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">



	<title>주문내역</title>
	
	 <link rel="stylesheet" href="/css/mypage/orderDetails.css">
	
</head>

<div class="menu_box">
        <div class="menu_btn">
          <button onclick="location.href='/mypage/memberInfo' " id="btns">회원정보수정</button>
        </div>
        
        <div class="menu_btn">
          <button onclick="location.href='/mypage/orderDetails'" id="btns">주문내역</button>
        </div>

        <div class="menu_btn">
          <button onclick="location.href='/mypage/basket' " id="btns">장바구니</button>
        </div>
        
        <div class="menu_btn">
          <button onclick="location.href='/mypage/myReviewList' " id="btns">나의 상품평 보기</button>
        </div>

        <div class="menu_btn">
          <button onclick="location.href='/mypage/121listForm' " id="btns">1:1문의</button>
        </div>
        
      </div>

	<div class="box">
      

	<!-- 주문내역 페이지 -->
	
	<div class="section_box">
		
		<table class="table table-hover">
			<tr>
				<td>구매일</td>
				<td>상품명</td>
				<td>금액</td>
				<td>구매수량</td>
				<td>배송상태</td>
				<td>리뷰</td>
			</tr>
			<c:forEach var="dto" items="${ orderDetail }">
				<c:if test="${ not empty orderDetail }">
					<tr>
						<td>
							<c:set var="paydate" value="${dto.pay_date}" />
							<fmt:formatDate value="${paydate}" pattern="yyyy-MM-dd" />
						</td>
						<td>${dto.order_product_name}</td>
						<td>${dto.order_price}</td>
						<td>${dto.order_count} 개</td>
						<td>
							<c:if test="${dto.pay_delivery == 1 }">
								<span>배송준비</span>
							</c:if>	
							<c:if test="${dto.pay_delivery == 2 }">
								<span>배송중</span>
							</c:if>
							<c:if test="${dto.pay_delivery == 3 }">
								<span>배송완료</span>
							</c:if>
							<c:if test="${dto.pay_delivery == 0 }">
								<span>결제취소</span>
							</c:if>			
						</td>
						<td>
							<c:if test="${dto.pay_delivery eq '3' }">
								<c:if test="${dto.order_review eq 'N' }">
									<input type="hidden" id="order_product_idx" value="${dto.order_product_idx}">
									<input type="button" value="리뷰쓰기" id="review_btn" onclick="showPopup();">
								</c:if>
								<c:if test="${dto.order_review eq 'Y' }">
									<input type="button" value="리뷰보기" onclick="location.href='/mypage/myReviewList'">
								</c:if>
							</c:if>
						</td>
					</tr>
				</c:if>
				<c:if test="${ empty orderDetail }">
					<tr>
						<td colspan=5 align="center">구매내역이 없습니다.</td>
					</tr>
				</c:if>
			</c:forEach>
		</table>
		
	</div>
	</div>
	
	
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
	
	
<script>

function showPopup() {
  	var product_idx = $('#order_product_idx').val();
  	window.open("/product/reviewActionForm?review_product_idx=" + product_idx, "a", "width=700, height=700, left=100, top=50");
  	}

</script>
