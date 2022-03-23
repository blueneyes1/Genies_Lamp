<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head>

<!-- Bootstrap CSS -->
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">


<title>장바구니</title>

  <link rel="stylesheet" href="/css/mypage/basket.css">


</head>


	
	<div class="wrap">
	
      <div class="box" >
	<form method="post" >
		<div class="basket">
	
	
      <table class="table table-sm">

      <tr>
      	<td></td>
        <td>이미지</td>
        <td>상품명</td>
        <td>판매가</td>
        <td>수량</td>
        <td>합계</td>
      </tr>

      <c:set var="sum" value="0" />
      <c:forEach var="basket_list" items="${basket_list }">
      	
			<tr>
	      		<td class="td cart_info_td">
	        		<input type="checkbox" class="cart_checkbox input_size_20" checked="checked">
	        		<input type="hidden" class="product_idx_input" value="${basket_list.product_idx}" >
	        		<input type="hidden" class="product_name_input" value="${basket_list.product_name}" >
	        		<input type="hidden" class="product_price_input" value="${basket_list.product_price}" >
	        		<input type="hidden" class="product_count_input" value="${basket_list.basket_count}" >	        		
	        		<input type="hidden" class="total_price_input" value="${basket_list.product_price * basket_list.basket_count}"  >
	        	</td>
	        	<td>
	        		<img src="${basket_list.product_img1 }" id="basket_img">
	        	</td>	       
		        <td>${basket_list.product_name }</td>
		        <td>${basket_list.product_price}</td>
		        <td>${basket_list.basket_count }</td>
		        <td>${basket_list.product_price * basket_list.basket_count }</td>
		    </tr>
		    <c:set var="sum" value="${sum + (basket_list.product_price * basket_list.basket_count)}" />
	   </c:forEach>


      <tr>
        <td colspan="2">총 상품금액</td>
        <td colspan="2">배송비</td>
        <td colspan="2">결제 예정금액</td>
      </tr>

      <tr>
        <td colspan="2">
        	<span class="totalPrice_span" ></span>원
        </td>
        <td colspan="2">
        	<span class="delivery_price" ></span>원
        </td>
        <td colspan="2">
        	<span class="finalTotalPrice_span" ></span>원
        </td>
      </tr>
        
        <tr>
          <td colspan="5"  id="basket_btn_box">
            <button type="button" class="order_btn" id="basket_btn">주문하기</button>
            <input type="submit" formaction="/mypage_basket_delete" value="장바구니 비우기"  id="basket_btn"/>
          </td>
        </tr>

      </table>



    </div>
	</form>
	
	<!-- 주문 form -->
	<form action="/pay/${member_id}" method="post" class="order_form">
		
	</form>
	
	<script>
	/* 주문 페이지 이동 */	
	$(".order_btn").on("click", function(){
		
		var form_contents ='';
		var orderNumber = 0;
		
		$(".cart_info_td").each(function(index, element){
			
			if($(element).find(".cart_checkbox").is(":checked") === true){	//체크여부
				
				var product_idx = $(element).find(".product_idx_input").val();
				var product_name = $(element).find(".product_name_input").val();
				var product_price = $(element).find(".product_price_input").val();
				var product_count = $(element).find(".product_count_input").val();
				
				var order_product_idx = "<input name='orderList[" + orderNumber + "].order_product_idx' type='hidden' value='" + product_idx + "'>";
				form_contents += order_product_idx;
				var order_product_name = "<input name='orderList[" + orderNumber + "].order_product_name' type='hidden' value='" + product_name + "'>";
				form_contents += order_product_name;
				var order_count = "<input name='orderList[" + orderNumber + "].order_count' type='hidden' value='" + product_count + "'>";
				form_contents += order_count;
				var order_price = "<input name='orderList[" + orderNumber + "].order_price' type='hidden' value='" + product_price + "'>";
				form_contents += order_price;
				
				orderNumber += 1;
				
			}
		});	
	
		$(".order_form").html(form_contents);
		$(".order_form").submit();
		
	});
	</script>
	
	</div>
	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
	
	<script>

		$(document).ready(function(){
			
			/* 종합 정보 섹션 정보 삽입 */
			setTotalInfo();	
		});
		
		/* 체크여부에따른 종합 정보 변화 */
		$(".cart_checkbox").on("change", function(){
			/* 총 주문 정보 세팅(배송비, 총 가격) */
			setTotalInfo($(".cart_info_td"));
		});
		
		/* 총 주문 정보 세팅(배송비, 총 가격) */
		function setTotalInfo(){
			
			/* 종합 정보 섹션 정보 삽입 */
			let totalPrice = 0;				// 총 가격
			let deliveryPrice = 0;			// 배송비
			let finalTotalPrice = 0; 		// 최종 가격(총 가격 + 배송비)	
			
			$(".cart_info_td").each(function(index, element){
				
				if($(element).find(".cart_checkbox").is(":checked") === true){
					// 총 가격
					totalPrice += parseInt($(element).find(".total_price_input").val());
				}
			})
			
			/* 배송비 결정 */
			if(totalPrice >= 50000){
				deliveryPrice = 0;
			} else if(totalPrice == 0){
				deliveryPrice = 0;
			} else {
				deliveryPrice = 3000;	
			}	
			
			/* 최종 가격 */
			finalTotalPrice = totalPrice + deliveryPrice;
			
			/* 값 삽입 */
			// 총 가격
			$(".totalPrice_span").text(totalPrice.toLocaleString());
			// 배송비
			$(".delivery_price").text(deliveryPrice);	
			// 최종 가격(총 가격 + 배송비)
			$(".finalTotalPrice_span").text(finalTotalPrice.toLocaleString());
			
		}
	
	</script>
