<?xml version="1.0" encoding="utf-8"?>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 책정보를 XML 형식의 데이타로 제공하는 JSP 문서 --%>    
<%
	//response 메세지 헤더에서 [Access-control-Allow-origin] 속성값을 
	//HttpXMLRequest 객체로 접속 허용 가능한 서버를 속성값으로 변경하면 
	//AJAX 기능으로 요청 가능한 웹프로그램으로 사용할 수 있다.
	response.setHeader("Access-control-Allow-origin", "http://localhost:8000");
%>
<books>
	<book>
		<title>Java의 정석</title>
		<author>남궁성</author>
	</book>
	<book>
		<title>JSP 웹프로그래밍</title>
		<author>오정임</author>
	</book>
	<book>
		<title>스프링 입문</title>
		<author>유이치</author>
	</book>
</books>
