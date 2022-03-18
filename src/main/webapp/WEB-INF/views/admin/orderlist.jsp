<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

   <!-- Bootstrap CSS -->
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">


  <title>orderlist</title>
  <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
  
  <link rel="stylesheet" href="/css/admin/orderlist.css">
  
 
  <body>
  
      <div class="wrap">
          <table class="table">
            <thead>
              <tr>	
              <input type="hidden" name="pay_delivery" value="${pay_delivery}" />
                        <td>고객 ID</td>
                        <td>고객 성명</td>
                        <td>고객 전화번호</td>
                        <td>고객 주소</td>
                        <td>총 주문 금액</td>
          </tr>
            </thead>
            <tbody>
             
             <c:forEach var="dto" items="${list}">
              <tr>
                        <td>${dto.pay_member_id}</td>
                        <td>${dto.pay_receiver}</td>
                        <td>${dto.pay_phone}</td>
                        <td>${dto.pay_address}</td>
                        <td>${dto.pay_total}</td>
              </tr>
              </c:forEach>
              
              <tr>
              <td colspan="6">
              <button onclick="self.close();">닫기</button>
              </td>
              </tr>
            </tbody>
          </table>
        </div>
  
  </body>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>


</html>