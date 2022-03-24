<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head>
	<title>주문내역</title>
</head>



	<!-- 주문내역 페이지 -->
	
	<div align="center">
		<h1>주문내역</h1>
		
		<table border=1>
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
	
<script>

function showPopup() {
  	var product_idx = $('#order_product_idx').val();
  	window.open("/product/reviewActionForm?review_product_idx=" + product_idx, "a", "width=700, height=700, left=100, top=50");
  	}

</script>
