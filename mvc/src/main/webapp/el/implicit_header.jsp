<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC</title>
</head>
<body>
	<h1>EL 내장객체 - Request Parameter</h1>
	<hr>
	<h2>EL 미사용</h2>
	<ul>
		<%-- request.getHeader(String name) : 리퀘스트 메세지의 머릿부에 저장된 값들중
			 매개변수로 전달받은 이름의 값을 반환하는 메소드 --%>
		<li>현재 접속중인 서버 = <%=request.getHeader("host") %></li>
		<li>클라이언트 브라우저의 종류 = <%=request.getHeader("user-Agent") %></li>
		<li>전달가능한 문서의 종류 = <%=request.getHeaders("accept") %></li>
	</ul>
	<h2>EL 사용</h2>
	<ul>
		<%-- EL 표현식에서 header 내장객체 또는 headerValues 내장객체를 사용하여 리퀘스트 
			 메세지의 머릿부에 저장된 값을 제공받아 출력 처리 가능 --%>
		<%-- => header 내장객체 또는 headerValues 내장객체는 Map 객체로 맵키 대신 헤더값을 
			 구분하는 이름을 사용하여 헤더값을 제공받아 출력 --%>
		<li>현재 접속중인 서버 = ${header.host }</li>
		<li>클라이언트 브라우저의 종류 = ${header["user-Agent"] }</li>
			<%-- "-"는 작대기가 아니라 빼기 이므로 map키로 쓸수 없는 문자이므로 [""]를 해줘야함. --%>
		<li>전달가능한 문서의 종류 = ${headerValues.accept[0] }</li>
	</ul>

</body>
</html>