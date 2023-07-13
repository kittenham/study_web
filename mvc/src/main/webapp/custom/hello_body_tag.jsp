<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC</title>
</head>
<body>
	<h1>Custom Tag - AnyAttribute And AnyBody</h1>
	<hr>
	<simple:helloBody test="true">홍길동</simple:helloBody>
	<simple:helloBody test="false">임꺽정</simple:helloBody>
	<hr>
	<%
		String name="전우치";
		request.setAttribute("name", name);
	%>
	<simple:helloBody test="true"><%=name %></simple:helloBody> <%-- JSP Expression 사용 가능 --%>
	<simple:helloBody test="false">${name }</simple:helloBody>	<%-- EL 사용 가능--%>
	
	<hr>
	
	<%
		boolean result=true;
		request.setAttribute("result", false);
	%>
	
	<simple:helloBody test="<%=result %>">장길산</simple:helloBody>  <%--JSP Expression 사용 불가능--%>
	<simple:helloBody test="${name }">홍경래</simple:helloBody>  <%-- EL 사용 불가능--%>
	 
</body>
</html>