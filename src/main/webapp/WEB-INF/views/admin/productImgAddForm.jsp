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

<title>상품 이미지 업로드</title>
<style>

body {
      display : flex;
      flex-direction : column;
      align-items: center;
      text-align: center;
      font-size: 12px;
    }
    
 input[type=submit] {
	background-color: rgb(178, 178, 238);
	border: none;
	width: 100px;
	height: 25px;
	color: rgb(17, 17, 17);
	border-radius: 3px;
	font-size: 12px;
	}
	


</style>

</head>
<body>


	<form action="/uploadMultiFileOk" method="post" enctype="multipart/form-data">
	
	<table class="table table-hover">
	<tr>
	<th>썸네일용 이미지를 등록하세요</th>
	<td><input type="file" name="filename" /></td>
	</tr>
	<tr>
	<th>상세 페이지용 이미지를 등록하세요</th>
	<td><input type="file" name="filename" /></td>
	</tr>
	
	<tr>
	<td colspan="2">
		<input type="submit" value="이미지 업로드">
	</td>
	</tr>
	</table>
	
	</form>
	
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

		
</body>
</html>