<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%-- JSP 문서에서 page Directive의 errorPage 속성을 이용하여 JSP 문서 실행시
    예외가 발생되면 에러페이지로 응답되도록 설정 할 수 있지만 JSP 문서마다 errorPage 속성을
    설정해야 하는 문제점이 발생한다.--%>
    <%--  => WAS 프로그램에 의해 에러코드(4XX or 5XX)가 전달될 때 에러페이지로 응답되도록 설정 가능하다. --%>
    <%--  => [web.xml] 파일에 에러코드 대신 응답될 에러페이지의 URL 주소 설정 --%>
    <%--  => WAS 프로그램에 관리되는 모든 웹프로그램 실행시 발생되는 에러코드 대신 에러페이지로 응답처리한다. --%>
<%
	//String text="ABCDEFG";
	String text=null;
	
	//int su=10/0;
	
	/*
	if(request.getMethod().equals("GET")) {
		//클라이언트에게 400 에러코드를 전달하여 응답
		response.sendError(HttpServletResponse.SC_BAD_REQUEST);
		return;
	}
	*/
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
</head>
<body>
	<h1>page Directive - errorPage 속성</h1>
	<hr>
	<p>page Directive의 errorPage 속성에는 JSP 문서 실행시 에러(예외)가 발생될 경우,
		클라이언트에게 500 상태코드 대신 에러페이지로 응답하기 위한 웹문서의 URL 주소를 속성값으로 설정해야한다.
		-> 이때, 클라이언트의 URL 주소는 변경하지 않는다.
		단점 : 모든 페이지마다 다 설정해줘야함.</p>
	<hr>
	<p>문자열의 문자 갯수 = <%=text.length() %></p>

</body>
</html>