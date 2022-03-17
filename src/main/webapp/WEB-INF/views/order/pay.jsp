<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>
	<title>결제정보</title>
</head>

<!-- 결제페이지 -->

<div>
	<form action="pay" method="post">
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
	        
	        <tr>
	        	<td>배송비</td>
	        	<td>3000원</td>
	        </tr>
	        
	        <tr>
	        	<td>결제금액</td>
	        	<td></td>
	        </tr>
	        
		</table>	
	</form>
	
	<div class="imageBtn2">
      <input type="image" name="submit" value="submit" src="/img/member/btn_confirm.gif">
      <input type="image" name="historyback" onclick="history.back(-1)" src="/img/member/btn_cancel.gif" >
    </div>
	
</div>

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
