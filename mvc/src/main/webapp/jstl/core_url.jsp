<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC</title>
</head>
<body>
	<h1>Core - URL 관리 태그</h1>
	<hr>
	<%-- 웹자원의 경로를 상대경로로 표현하여 제공 --%>
	<%-- 상대경로 : 요청 웹프로그램의 경로를 기준으로 웹자원의 경로를 표현하는 방법 --%>
	<%-- 문제점) MVC 디자인 패턴을 이용한 JSP Model-2 방식의 웹프로그램 작성시
		 		 요청 웹 프로그램(컨트롤러)의 경로와 응답 웹프로그램(뷰)의 경로가 다른경우 
		 		 404 에러 발생할 수 있다. --%>
	<%-- 해결법) 웹자원의 경로를 절대경로로 표현하여 제공하면 된다. --%>
	<%-- 상대경로로 표현한 방법 --%>
	<img src="images/Koala.jpg" width="200">
	<%-- 절대경로로 표현한 방법 --%>
	<%-- 절대경로 : 최상위 디렉토리를 기준으로 웹자원의 경로를 표현하는 방법 --%>
	<%-- 문제점) 컨텍스트의 이름이 변경될 경우 컨텍스트 경로가 변경되어 404에러가 발생한다. --%>
	<%-- 해결법) 컨텍스트 경로를 제공받아 웹자원의 경로를 절대경로로 표현하여 제공하면 된다. --%>
	<img src="/mvc/jstl/images/Koala.jpg" width="200">
	
	
	<img src="<%=request.getContextPath() %>/jstl/imgaes/Koala.jpg" width="200">
	
	
	<img src="${pageContext.request.contextPath }/jstl/imgaes/Koala.jpg" width="200">
	
	
	<img src="<c:url value="/jstl/images/Koala.jpg"/>" width="200">
</body>
</html>