<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../common/userMenubar.jsp" %>
	
	<br><br><br>
	
	<h1 align="center"><%= request.getAttribute("errorMsg") %></h1>
</body>
</html>