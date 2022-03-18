<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>
<title>Genie's Lamp - 로그인</title>
</head>

<link rel="stylesheet" href="/css/member/login.css">

<!-- 로그인페이지 -->

<div class="wrap">
<div class="loginMain">
	<form action="loginAction">
		<table class="main1">
			<tr>
				<td>
					아이디<br>
					비밀번호
				</td>
				<td>
	            	<input type="text" name="member_id"> <br>
	            	<input type="password" name="member_pw">
	          	</td>
	         	<td>
	            	
	            	<input type="submit" name="submit" id="login_btn" value="로그인"/>
	          	</td>
			</tr>			
		</table>
		<div class="loginSection">
	     	<table class="main2">
	          <tr>
	            <td>
	            <img src="/img/dot.PNG">아이디를 잊으셨나요?</td>
	            <td>
	              <input type="button"
	              onclick="window.open('/idFind','아이디찾기', 'width=450,height=200,location=no,status=no,scrollbars=no')",
	              id="find_btn" value="아이디 찾기"/>
	            </td>
	          </tr>
	          <tr>
	            <td>
	            <img src="/img/dot.PNG">비밀번호를 잊으셨나요?</td>
	            <td>
	            	<input type="button" 
	            	onclick="window.open('/passwordFind','비밀번호찾기', 'width=450,height=250,location=no,status=no,scrollbars=no')",
			      	id="find_btn" value="비밀번호 찾기"/>
	            </td>
	          </tr>
	        </table>
	      </div>
	</form>
</div>
</div>