<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">


<!-- Bootstrap CSS -->
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">


<title>비밀번호 변경하기</title>

<link rel="stylesheet" href="/css/mypage/passwordChange.css">


</head>
<body>

	<div class="wrap">
	<form method="post" action="/passwordChangeAction">
		<div class="password">

      <table class="table table-sm">
      <input type="hidden" name="member_id" value="${dto.member_id}" />
        <tr>
          <th>현재 비밀번호를 지우고 변경하고 싶은 새 비밀번호를 입력하세요</th>
          <td>
            <input type="text" name="member_pw" value="${dto.member_pw}" />
          </td>
        </tr>
        
        <tr id="password_btn">
          <td colspan="2">
            <input type="submit" value="비밀번호 변경" />
            <input type="button" value="닫기"  onclick="self.close();"/>
          </td>
        </tr>

      </table>


    </div>
	</form>
	
	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
	

</body>
</html>