<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
				<td>수량</td>
				<td>금액</td>
				<td>배송상태</td>
			</tr>
			<c:forEach var="dto" items="${ orderDetail }">
				<c:if test="${ order_count = 1 }">
					<tr>
						<td>구매일</td>
						<td>상품명</td>
						<td>수량</td>
						<td>금액</td>
						<td>배송상태</td>
					</tr>
				</c:if>
				<c:if test="${ order_count = 0 }">
					<tr>
						<td colspan=5 align="center">구매내역이 없습니다.</td>
					</tr>
				</c:if>
			</c:forEach>
		</table>
		
	</div>
