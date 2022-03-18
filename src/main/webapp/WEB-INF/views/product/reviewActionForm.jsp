<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">


<!-- Bootstrap CSS -->
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">


<title>상품평 작성하기</title>

<link rel="stylesheet" href="/css/product/reviewActionForm.css">


  
</head>
<body>

	<div class="wrap">
	<form method="post" name="reviewAction" action="/reviewAction" enctype="multipart/form-data">
		<div class="review">

      <table class="table table-sm">
      <input type="hidden" name="review_product_idx" value="${review_product_idx}" />
      
      <tr>
          <th>작성자</th>
          <td><input type="text" name="review_member_id" /></td>
        </tr>
        
        <tr>
        <th>상품 이미지 업로드</th>
        <td>
        <input type="file" name="filename">
        </td>
        </tr>
      
        <tr>
          <th>제목</th>
          <td>
            <input type="text" name="review_title" />
          </td>
        </tr>

        <tr>
          <th>내용</th>
          <td>
            <textarea name="review_content" cols="70" rows="20"></textarea>
          </td>
        </tr>

        <tr id="review_btn">
          <td colspan="2">
            <input type="submit" value="작성" id="review_btns"/>
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