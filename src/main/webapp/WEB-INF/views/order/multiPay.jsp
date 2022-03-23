<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


	<link rel="stylesheet" href="/css/order/pay.css">
		<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">

<head>
	<title>결제정보</title>
</head>



<!-- 멀티 결제페이지 -->

<div class="box">
	<form action="/multiPayAction" method="post" class="order_form">
		<table>
			<tr>
				<td>받는사람</td>
				<td>
					<input type ="text" name="pay_receiver" >
				</td>
			</tr>
			
			<tr>
				<td>전화번호</td>
				<td>
					<input type="text" name="pay_phone">
				</td>
			</tr>
			
			<tr>
				<td>주소</td>
	            <td>
	            	<input type="text" style="margin-bottom:10px;" name="pay_address1" id="pay_address1" placeholder="우편번호">
	            	<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
	            	<input type="text" style="margin-bottom:10px;" class="inputStyle1" name="pay_address2" id="pay_address2" placeholder="주소"><br>
	            	<input type="text" class="inputStyle1" name="pay_address3" id="pay_address3" placeholder="상세주소">
	            	<input type="hidden" class="inputStyle1" id="sample6_extraAddress" placeholder="참고항목">
	            </td>
	        </tr>
	        
	        <tr>
	        	<td>배송메세지</td>
	        	<td>
	        		<input type="text" name="pay_message" >
	        	</td>
	        </tr>
	        	        
		</table>
				
		<br>
		
		<!-- 구매물품 리스트 -->
		<table>
			<c:set var="sum" value="0" />
			<c:forEach items="${dto}" var="dto">
			<tr>
				<td class="goods_table_price_td">
					<input type="hidden" class="order_product_idx" value="${dto.order_product_idx}">
					<input type="hidden" class="order_product_name" value="${dto.order_product_name}">
					<input type="hidden" class="order_count" value="${dto.order_count}">	
					<input type="hidden" class="order_price" value="${dto.order_price}">				
				</td>				
			</tr>
			<c:set var="sum" value="${sum + (dto.order_price * dto.order_count)}" />
			</c:forEach>			
		</table>
		
		<div>
			<table>					        	        
		        <tr>
		        	<td>합계</td>
		        	<td><span class="totalPrice_span"></span>원</td>
		        </tr>
		        
		        <tr>
		        	<td>배송비</td>
		        	<td><span class="delivery_price_span"></span>원</td>
		        </tr>
		        
		        <tr>
		        	<td>결제금액</td>
		        	<td><span class="finalTotalPrice_span"></span>원</td>
		        </tr>
		        <tr>
		        	<c:if test="${ sum >= 50000 }">
			    		<input type="hidden" name="pay_cost" value="0">
			    		<input type="hidden" name="pay_total" value="${sum}">
			    	</c:if>
			    	<c:if test="${ sum < 50000 }">
			    		<input type="hidden" name="pay_cost" value="3000">
			    		<input type="hidden" name="pay_total" value="${sum + 3000}">
			    	</c:if>
		        </tr>
			</table>
		</div>
		<div class="imageBtn2">
		     <input type="image" name="submit" class="order_btn"  value="submit" src="/img/member/btn_confirm.gif">
		     <input type="image" name="historyback" onclick="history.back(-1)" src="/img/member/btn_cancel.gif" >
		</div>			
	</form>
		
</div>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
  

<!-- 다음 우편번호 서비스 API -->
<!-- http://postcode.map.daum.net/guide -->
	
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>

	$(document).ready(function(){
		
		/* 주문 조합정보란 최신화 */
		setTotalInfo();
		
	});
	
	/* 총 주문 정보 세팅(금액합계, 배송비, 결게금액) */
	function setTotalInfo(){
	
		var totalPrice = ${sum};				// 금액합계
		var deliveryPrice = 0;			// 배송비
		var finalTotalPrice = 0; 		// 결제금액( 금액합계 + 배송비 )	
									
		/* 배송비 결정 */
		if(totalPrice >= 50000){
			deliveryPrice = 0;
		} else if(totalPrice == 0){
			deliveryPrice = 0;
		} else {
			deliveryPrice = 3000;	
		}
		
		finalTotalPrice = totalPrice + deliveryPrice;
		
		/* 값 삽입 */
		// 금액합계
		$(".totalPrice_span").text(totalPrice.toLocaleString());
		// 배송비
		$(".delivery_price_span").text(deliveryPrice.toLocaleString());	
		// 결제금액(금액합계 + 배송비)
		$(".finalTotalPrice_span").text(finalTotalPrice.toLocaleString());		
		
	};
</script>

<script>

	/* 주문 페이지 이동 */	
	$(".order_btn").on("click", function(){
		
		/* 상품정보 */
		var form_content = ''; 
		$(".goods_table_price_td").each(function(index, element){
			var order_product_idx = $(element).find(".order_product_idx").val();
			var order_product_name = $(element).find(".order_product_name").val();
			var order_count = $(element).find(".order_count").val();
			var order_price = $(element).find(".order_price").val();
			
			var order_product_idx_input = "<input name='orderList[" + index + "].order_product_idx' type='hidden' value='" + order_product_idx + "'>";
			form_content += order_product_idx_input;
			var order_product_name_input = "<input name='orderList[" + index + "].order_product_name' type='hidden' value='" + order_product_name + "'>";
			form_content += order_product_name_input;
			var order_count_input = "<input name='orderList[" + index + "].order_count' type='hidden' value='" + order_count + "'>";
			form_content += order_count_input;
			var order_price_input = "<input name='orderList[" + index + "].order_price' type='hidden' value='" + order_price + "'>";
			form_content += order_price_input;
		});	
		$(".order_form").append(form_content);
		
		/* 서버 전송 */
		$(".order_form").submit();	
		
	});
</script>

<script>
	/* 주소검색 */
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('pay_address1').value = data.zonecode;
                document.getElementById("pay_address2").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("pay_address3").focus();
            }
        }).open();
    }
</script>
  