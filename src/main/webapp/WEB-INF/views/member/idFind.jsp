<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
  
	<title>아이디 찾기</title>

	<link rel="stylesheet" href="/css/member/idFind.css">

	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
	<!-- Bootstarp JS -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

</head>

<body>

<!-- 아이디찾기 페이지 -->

	<div class="main">
  <form action="/idFindAction" name="idFindAction">
    <table id="findid_table">
      <c:if test="${ not empty find_member_id }">
        <tr>
          <td colspan="2">아이디 찾기</td>
        </tr>
        <tr>
          <td colspan="2"></td>
        </tr>
        <tr>
          <td align="center">
            회원님의 아이디는 ${ find_member_id } 입니다. <br>
          </td>
        </tr>
      </c:if>
      
      <c:if test="${ empty find_member_id }">
        <tr>
          <td colspan="2">아이디 찾기</td>
        </tr>
        <tr>
          <td colspan="2">아이디를 잊어버리셨나요?<br>회원님의 성명과 이메일을 입력하여 주세요.</td>
        </tr>
        <tr>
          <th>성명</th>
          <td><input type="text" name="member_name"></td>
         </tr>
         <tr>
         <th>
         이메일
         </th>
         <td>
         <input type="text" class="emailText" name="member_email">
         </td>
         </tr>
      </c:if>
    </table>
    
    <c:if test="${ not empty find_member_id }">
      <div class="btn_box"><input type="button" value="확인" onclick="window.close()" id="idfind_btns">
      <input type="button" value="닫기" onclick="window.close()" id="idfind_btns"></div>
    </c:if>
    
    <c:if test="${ empty find_member_id }">
      <div class="btn_box"><input type="button" value="확인" onclick="submit()" id="idfind_btns">
      <input type="button" value="닫기" onclick="window.close()" id="idfind_btns"></div>
    </c:if>	
  </form>
</div>

	<script>
		function submit() {
			var form = document.idFindForm;
			form.submit();
			}
	</script>

</body>
</html>






















