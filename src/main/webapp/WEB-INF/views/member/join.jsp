<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<head>
	<title>Genie's Lamp - 이용약관</title>
</head>

<link rel="stylesheet" href="/css/member/join.css">

 <!-- 이용약관 -->
 
<div class="term1">
  <div>이용약관</div>
  <div>
    <textarea name="" id="" cols="30" rows="10">
      이용약관
    </textarea>
    <div><input class="check" type="checkbox">위 약관에 동의합니다.</div>
  </div>
</div>
<!-- 개인정보보호정책 -->
<div class="term2">
  <div>개인정보보호정책</div>
  <div>
    <textarea name="" id="" cols="30" rows="10">
      개인정보보호정책
    </textarea>
    <div><input class="check" type="checkbox">위 개인정보취급방침에 동의합니다.</div>
  </div>
</div>

<!-- 개인정보의 수집 및 이용목적 -->

<div class="term3">
  <div>개인정보의 수집 및 이용목적</div>
  <div>
    <textarea name="" id="" cols="30" rows="10">
      개인정보의 수집 및 이용목적
    </textarea>
    <div><input class="check" type="checkbox">위 개인정보의 수집 및 이용목적에 동의합니다.</div>
  </div>
</div>

<div class="imageBtn">
  <input type="image" onclick="agree();" src="/img/member/btn_join.gif">
</div>


 <script>
   function agree() {
     //반복문전에 boolean변수에 초기값.
     var isAllCheck = true;
     var checkboxArray = document.getElementsByClassName('check');
     for(var cbx of checkboxArray) {
       if(cbx.checked == false){
         isAllCheck = false;
         break; //반복문을 탈출하는 키워드
         //continue; //반복문의 해당루프를 탈출하는 키워드
       }
     }
     if(isAllCheck == true){
       window.location.href = 'join2'
       
     }else{
       alert('이용약관에 모두 동의하셔야 회원으로 가입하실 수 있습니다.');
     }
   }
 </script>