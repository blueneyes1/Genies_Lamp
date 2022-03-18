<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>회원비밀번호 찾기</title>

  <link rel="stylesheet" href="/css/member/passwordFind.css">

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
  <!-- Bootstarp JS -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

</head>
<body>
  <div class="main">
  	<form action="/passwordFindAction" name="passwordFindForm">
      <table id="password_table">
      	<c:if test="${ not empty find_member_pw }">
      		<tr>
	          <td colspan="2">비밀번호 찾기</td>
	        </tr>
	        <tr>
	          <td colspan="2"></td>
	        </tr>
	        <tr>
	        	<td align="center">
	        		회원님의 암호는 ${ find_member_pw } 입니다. <br>
	        	</td>
	        </tr>
		</c:if>
		
      	<c:if test="${ empty find_member_pw }">
	        <tr>
	          <td colspan="2">비밀번호 찾기</td>
	        </tr>
	        <tr>
	          <td colspan="2">비밀번호를 잊어버리셨나요?
	            <br>회원님의 아이디와 성명,이메일을 입력하여 주세요.</td>
	        </tr>
	        <tr>
  <th>아이디</th>
  <td>
    <input type="text" name="member_id">
  </td>
</tr>

<tr>
  <th>이름</th>
  <td><input type="text" name="member_name"></td>
</tr>
<tr>
  <th>비밀번호힌트</th>
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
  <th>힌트답변</th>
  <td>
    <input type="text" name="member_pw_answer">
  </td>
</tr>
	     </c:if>
      </table>
      
      <c:if test="${ not empty find_member_pw }">
   		<div class="btn_box"><input type="button" value="확인" onclick="window.close()" id="password_btns">
 	  	<input type="button" value="닫기" onclick="window.close()" id="password_btns"></div>
      </c:if>
      
      <c:if test="${ empty find_member_pw }">     	  
  	 	<div class="btn_box"><input type="button" value="확인" onclick="submit()" id="password_btns">
  	 	<input type="button" value="닫기" onclick="window.close()" id="password_btns"></div>
  	  </c:if>
    </form>
  </div>
    
  <script>
    function submit() {
      var form = document.passwordFindForm;
    
      form.submit();
    }
  </script>
</body>
</html>