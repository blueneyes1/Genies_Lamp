<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지니의 램프</title>
</head>
<body>

<script>
    var msg = "<c:out value='${msg}'/>";
    
    alert(msg);
    history.back(-1);
</script>

</body>
</html>