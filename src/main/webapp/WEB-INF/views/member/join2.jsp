<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>
	<title>Genie's Lamp - 회원가입</title>
</head>

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
				        <option value="4">가장 기억에 남는 선생님 성함은?</option>
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
		</table>
	</div>
</form>
