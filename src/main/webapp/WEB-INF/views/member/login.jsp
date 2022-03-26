<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>
<title>Genie's Lamp - 로그인</title>
</head>

<link rel="stylesheet" href="/css/member/login.css">

<!-- 로그인페이지 -->

<div class="wrap">
	<!-- 로그인액션 폼 -->
	<form action="loginAction">
		<div class="loginMain">
			<div class="box"><h5>LOGIN</h5></div>
			<div>
			
			<img src="/img/Genie_lamp.png" id="login_img"/>
			
			</div>
			<div class="box">
				<input type="text" name="member_id" placeholder="아이디" id="login_text">
		    </div>
		    <div class="box">
				<input type="password" name="member_pw" placeholder="비밀번호" id="login_text">
		    </div>
		 	<div class="box">
				<input type="submit" name="submit" id="login_btn" value="로그인"/>
		    </div>
		 	  	
			<div class="box" id="btn_box">
				<!-- 아이디 찾기 -->
				<input type="button" onclick="window.open('/idFind','아이디찾기', 
					'width=450,height=200,location=no,status=no,scrollbars=no')" id="find_btn" value="아이디 찾기"/>
				<!-- 비밀번호 찾기 -->
				<input type="button" onclick="window.open('/passwordFind','비밀번호찾기', 
					'width=450,height=250,location=no,status=no,scrollbars=no')" id="find_btn" value="비밀번호 찾기"/>
		
		    </div>
		</div>
	</form>

</div>