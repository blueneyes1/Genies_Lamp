<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


	<link rel="stylesheet" href="/css/order/singlePay.css">
		<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">

<head>
	<title>결제정보</title>
</head>

<script>

  $(document).ready(function(){
	  var deliveryPrice = 0;			// 배송비
	  var totalPrice = 0;				// 총 가격
	  var finalTotalPrice = 0;			// 결제금액
	  
		var count = document.getElementById('product_count');
		var price = document.getElementById('product_price');
		totalPrice = Number(price.value) * Number(count.value);
		
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
		// 총 가격
		$(".totalPrice_span").text(totalPrice.toLocaleString());
		// 배송비
		$(".delivery_price").text(deliveryPrice.toLocaleString());	
		// 최종 가격(총 가격 + 배송비)
		$(".finalTotalPrice_span").text(finalTotalPrice.toLocaleString());
		
						

	});

</script>

<!-- 결제페이지 -->

<div class="box">
	<form action="/singlePayAction" method="post">
		<table class="table table-hover">
				<input type="hidden" id="product_idx" name="order_product_idx" value="${list[0]}" >
				<input type="hidden" id="product_name" name="order_product_name" value="${list[1]}" >
				<input type="hidden" id="product_price" name="order_price" value="${list[2]}" >
				<input type="hidden" id="product_count" name="order_count" value="${list[3]}" >
			<tr>
				<td>받는사람</td>
				<td>
					<input type ="text" name="pay_receiver" required >
				</td>
			</tr>
			
			<tr>
				<td>전화번호</td>
				<td>
					<input type="text" name="pay_phone" required>
				</td>
			</tr>
			
			<tr>
				<td>주소</td>
	            <td>
	            	<input type="text" style="margin-bottom:10px;" name="pay_address1" id="pay_address1" placeholder="우편번호" required>
	            	<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" required><br>
	            	<input type="text" style="margin-bottom:10px;" class="inputStyle1" name="pay_address2" id="pay_address2" placeholder="주소" required><br>
	            	<input type="text" class="inputStyle1" name="pay_address3" id="pay_address3" placeholder="상세주소">
	            	<input type="hidden" class="inputStyle1" id="sample6_extraAddress" placeholder="참고항목">
	            </td>
	        </tr>
	        
	        <tr>
	        	<td>배송메세지</td>
	        	<td>
	        		<input type="text" name="pay_message"  required>
	        	</td>
	        </tr>
	        	        
		</table>
		
		<br>
		
		<div class="price_box">
		<div>
			<table>
					        	        
		        <tr>
		        	<td><b>합계</b></td>
		        	<td>　</td>
		        	<td><span class="totalPrice_span"></span>원</td>
		        </tr>
		        
		        <tr>
		        	<td><b>배송비</b></td>
		        	<td>　</td>
		        	<td><span class="delivery_price"></span>원</td>
		        </tr>
		        
		        <tr>
		        	<td><b>결제금액</b></td>
		        	<td>　</td>
		        	<td><span class="finalTotalPrice_span"></span>원</td>
		        </tr>
		        <tr>
		        	<c:if test="${ (list[2] * list[3]) >= 50000 }">
			    		<input type="hidden" name="pay_cost" value="0">
			    		<input type="hidden" name="pay_total" value="${list[2] * list[3]}">
			    	</c:if>
			    	<c:if test="${ (list[2] * list[3]) < 50000 }">
			    		<input type="hidden" name="pay_cost" value="3000">
			    		<input type="hidden" name="pay_total" value="${(list[2] * list[3])+3000}">
			    	</c:if>
		        </tr>
			</table>
			</div>
		</div>
		
		<div class="btn_box">
		
	    <input type="submit" name="submit" value="확인" id="pay_btn"/>
	     <input type="button" name="historyback" onclick="history.back(-1)" value="취소" id="pay_btn"/>
	   </div>
	
		
	</form>
	
	
	
</div>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
  

<!-- 다음 우편번호 서비스 API -->
<!-- http://postcode.map.daum.net/guide -->
	
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
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
  