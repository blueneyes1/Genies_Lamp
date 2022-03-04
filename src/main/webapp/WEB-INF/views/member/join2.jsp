<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>
	<title>Genie's Lamp - 회원가입</title>
</head>

<link rel="stylesheet" href="/css/member/join2.css">

<!-- 회원가입 -->

<!-- 입력폼 -->

<form action="/join2Actoin" method="post" name="userInfo" onsubmit="return checkValue();">
	<div class="information">
		<table>
			<tr>
				<td>아이디</td>
				<td>
					<input type="text" name="member_id" id="member_id" required>
					<img src="/img/member/btn_iddupl.gif" onclick="idCheck();">
		            (영문 소문자, 숫자로 4~16자)
		            <input type="hidden" name="member_id_check" id="member_id_check" value="no">
		       	</td>
			</tr>
			<tr>
				<td>비밀번호</td>
		        <td>
		        	<input type="password" name="member_pw" id="member_pw" required>
					영문/숫자/특수문자조합으로 8~16자리. 첫글자는 영문자로 사용
		        </td>
			</tr>
		    <tr>
		    	<td>비밀번호 확인</td>
		        <td><input type="password" id="member_pw_check"></td>
		    </tr>
		    <tr>
		        <td>이름</td>
		        <td><input type="text" name="member_name" id="member_name" required></td>
		    </tr>
		    <tr>
		        <td>이메일</td>
		        <td><input type="email" name="member_email" id="member_email"></td>
		    </tr>
		    <tr>
		        <td>이메일 수신여부</td>
		        <td>
		          	<input type="radio" name="member_email_receive" value=1>수신
		            <input type="radio" name="member_email_receive" value=0>수신안함</td>
		    </tr>
		    <tr>
		    	<td>비밀번호 확인시 질문</td>
				<td>
					<select class="size" name="member_pw_question" id="member_pw_question"> 
						<option value="0">========선택========</option>
				        <option value="1">기억에 남는 추억의 장소는?</option>
				        <option value="2">자신의 인생 좌우명은?</option>
				        <option value="3">자신의 보물 제1호는?</option>
				        <option value="4">가장 좋아하는 색은?</option>
				        <option value="5">내가 좋아하는 캐릭터는?</option>
				    </select>
				</td>
			</tr>
			<tr>
			  <td>비밀번호 확인시 답변</td>
			  <td>
			  	<input type="text" name="member_pw_answer" id="member_pw_answer" value="">
			  </td>
			</tr>
			<tr>
			  <td>전화번호</td>
			  <td>
			  	<input type="text" name="member_phone" id="member_phone" value="">
			  </td>
			</tr>
			<tr>
				<td>주소</td>
	            <td>
	            	<input type="text" style="margin-bottom:10px;" id="sample6_postcode" placeholder="우편번호">
	            	<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
	            	<input type="text" style="margin-bottom:10px;" class="inputStyle1" name="sample6_address" id="sample6_address" placeholder="주소"><br>
	            	<input type="text" class="inputStyle1" name="sample6_detailAddress" id="sample6_detailAddress" placeholder="상세주소">
	            	<input type="hidden" class="inputStyle1" id="sample6_extraAddress" placeholder="참고항목">
	            </td>
	        </tr>
		</table>
	</div>
	
	<div class="imageBtn2">
      <input type="image" name="submit" value="submit" src="/img/member/btn_confirm.gif">
      <a href="/" id="cancel">
      	<input type="image" src="/img/member/btn_cancel.gif">
      </a>
    </div>
    
</form>



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
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
	

