<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- JSP 명령은 HTML명령보다 먼저 실행되므로 위에 작성하는 것을 권장한다. --%>
<%!
//선언문(Declaration) : 필드 또는 메소드를 선언하는 명령을 작성하는 영역 제공
// => 서블릿 클래스의 명령으로 해석

	//서블릿 객체에 필요한 값을 저장하기 위한 필드
	//=> 필드는 서블릿 객체에서 메모리에서 없어지면(=WAS가 없어지면) 자동 소멸된다.
	int count=0;
%>
<%
//스크립틀릿(Scriptlet) : 요청을 처리하기 위한 Java 명령을 작성하는 영역을 설정한다.
// => 요청 처리 메소드의 명령으로 해석한다.

	//요청 처리 메소드에서 생성되어 사용되는 지역변수
	// => 지역변수는 변수가 선언된 메소드 종료시 자동 소멸된다.
	//int count=0; => 따라서 여기(요청처리메소드)에 지역변수를 선언하기보다는 선언문에 작성하는 것이 좋다.

	count++;

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
</head>
<body>
	<h1>스크립트 요소(Script Element)</h1>
	<hr>
	<%-- out 객체 : JSP 문서에서 처리결과를 저장한 파일을 생성하기 위한 출력스트림 --%>
	<p>JSP 문서의 요청 횟수 = <% out.println(count); %></p>
	
	<%-- 표현식(Expression) : 변수값, 연산 결과값, 메소드 반환값을 제공받아 응답파일에 포함하기 위한 영역을 제공한다. --%>

</body>
</html>