<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>
<title>Genie's Lamp - 로그인</title>
</head>

<link rel="stylesheet" href="/css/member/login.css">

<!-- 로그인페이지 -->

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
	            	<input class="loginImg" type="image" name="submit" value="submit" src="/img/member/btn_login.gif">
	          	</td>
			</tr>			
		</table>
		<div class="loginSection">
	     	<table class="main2">
	          <tr>
	            <td>-아이디를 잊으셨나요?</td>
	            <td>
	              <input type="image"
	              onclick="window.open('/idFind','아이디찾기', 'width=470,height=320,location=no,status=no,scrollbars=no')",
	              src="img/member/btn_id_find.gif" />
	            </td>
	          </tr>
	          <tr>
	            <td>-비밀번호를 잊으셨나요?</td>
	            <td>
	            	<input type="image" 
	            	onclick="window.open('/passwordFind','비밀번호찾기', 'width=470,height=320,location=no,status=no,scrollbars=no')",
			      	src="img/member/btn_pw_find.gif" />
	            </td>
	          </tr>
	        </table>
	      </div>
	</form>
</div>