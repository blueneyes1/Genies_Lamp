<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head>
 <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	
	
   <!-- Bootstrap CSS -->
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">

<title>memberModify</title>
  
  <link rel="stylesheet" href="/css/admin/memberModify.css">
  
 
</head>
<body>

<div class="box">
      <div class="menu_box" >
        <div class="menu_btn">
          <button onclick="location.href='/admin/memberList' " id="btns">회원관리</button>
        </div>
        
        <div class="menu_btn">
          <button onclick="location.href='/admin/selectlist' " id="btns">주문관리</button>
        </div>

        <div class="menu_btn">
          <button onclick="location.href='/admin/product' " id="btns">상품관리</button>
        </div>
        
        <div class="menu_btn">
          <button onclick="location.href='/admin/reviewlist' " id="btns">상품평관리</button>
        </div>

        <div class="menu_btn">
          <button onclick="location.href='/admin/board' " id="btns">게시판관리</button>
        </div>
        
      </div>
      
      <div class="section_box" >
      <form method="post">
	
          <table class="table table-hover">
  
            <tr>
              <th>멤버 아이디</th>
              <td>
                <input type="text" value="${admin_member_dto.member_id}" name="member_id" readonly >
              </td>
            </tr>	
            <tr>
              <th>멤버 성명</th>
              <td>
                <input type="text" value="${admin_member_dto.member_name}" name="member_name">
              </td>
            </tr>
            <tr>
              <th>멤버 이메일</th>
              <td>
                <input type="text" value="${admin_member_dto.member_email}" name="member_email">
              </td>
            </tr>
            <tr>
              <th>멤버 전화번호</th>
              <td>
                <input type="text" value="${admin_member_dto.member_phone}" name="member_phone">
              </td>
            </tr>
            <tr>
              <th>멤버 주소</th>
              <td>
                <input type="text" style="margin-bottom:10px;" name="member_address1" id="member_address1" value="${admin_member_dto.member_address1}">
            	<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" id="find_address_btn"><br>
            	<input type="text" style="margin-bottom:10px;" class="inputStyle1" name="member_address2" id="member_address2" value="${admin_member_dto.member_address2}"><br>
            	<input type="text" class="inputStyle1" name="member_address3" id="member_address3" value="${admin_member_dto.member_address3}">
            	<input type="hidden" class="inputStyle1" id="sample6_extraAddress" placeholder="참고항목">
              </td>
            </tr>
            <tr>
              <th>멤버 등급</th>
              <td>
                <input type="text" value="${admin_member_dto.member_grade}" name="member_grade">
              </td>
            </tr>
            <tr>
              <th>멤버 가입날짜</th>
              <td>
                <fmt:formatDate value="${admin_member_dto.member_join_date}" pattern="yyyy-MM-dd" />
              </td>
            </tr>


          </table>
         

          <div class="modify_delete_btns">

            <input type="submit" formaction="/admin_member_update" value="수정" id="modify_delete_btn">
            <input type="submit" formaction="/admin_member_delete" value="삭제" id="modify_delete_btn">

          </div>

        
      </div>

    </form>
      
      <div class="blank_box"></div>
      
    </div>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('member_address1').value = data.zonecode;
                document.getElementById("member_address2").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("member_address3").focus();
            }
        }).open();
    }
</script>
	