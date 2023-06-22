<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%
	//Java 명령 작성
	Date now=new Date();
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분 ss초");
	
			

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

</style>
</head>
<body>
	<h1>Hello, JSP!!!</h1>
	<hr>
	<p>JSP(Java Server Page) : 서블릿보다 쉽게 웹프로그램을 작성하기 위한 기술이다.</p>
	<hr>
	<div id="displayDiv"><%=displayNow %></div>
	
	<script type="text/javascript">
	setInterval(function() {
		location.reload();
	}, 1000);
	</script>
	
</body>
</html>