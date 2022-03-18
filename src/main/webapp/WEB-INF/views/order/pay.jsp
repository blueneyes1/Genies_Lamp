<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>


  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

   <!-- Bootstrap CSS -->
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">



	<title>주문내역</title>

  <link rel="stylesheet" href="/css/order/pay.css">



</head>



	<!-- 주문내역 페이지 -->
	
	<div class="box">
		<h5>주문내역</h5>
		
		<table class="table table-hover">
			<tr>
				<td>구매일</td>
				<td>상품명</td>
				<td>수량</td>
				<td>금액</td>
				<td>배송상태</td>
			</tr>
			<c:forEach var="dto" items="${ orderDetail }">
				<c:if test="${ order_count == 1 }">
					<tr>
						<td>구매일</td>
						<td>상품명</td>
						<td>수량</td>
						<td>금액</td>
						<td>배송상태</td>
					</tr>
				</c:if>
				<c:if test="${ order_count == 0 }">
					<tr>
						<td colspan=5 align="center">구매내역이 없습니다.</td>
					</tr>
				</c:if>
			</c:forEach>
		</table>
		
	</div>
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
  