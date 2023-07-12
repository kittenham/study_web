<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//
	pageContext.setAttribute("pageName", "홍길동");    
	request.setAttribute("requestName", "임꺽정");    
	session.setAttribute("sessionName", "전우치");    
	application.setAttribute("applicationName", "일지매");    
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC</title>
</head>
<body>
	<h1>EL 내장객체 - Scope Attribute</h1>
	<hr>

</body>
</html>