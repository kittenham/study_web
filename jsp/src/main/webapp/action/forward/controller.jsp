<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달값을 이용하여 다른 JSP 문서로 포워드 이동하는 JSP 문서 --%>
<%
	//전달값을 반환받아 저장
	String pageName = request.getParameter("pageName");

	if(pageName==null){
		//클라이언트에게 URL 주소를 전달하여 응답처리한다.
		// => URL 주소를 응답받은 클라이언트는 브라우저의 요청 URL 주소를 변경하여
		//		서버에 JSP 문서를 다시 요청해 실형결과(웹문서)를 응답받아 출력한다. => 페이지 이동(리다이렉트 이동)
		response.sendRedirect("main.jsp"); //상대경로이기 때문에 서브디렉터리를 기준으로 주소 작성
		return;
	}
	
	String contextPath=pageName+".jsp";
%>

<%-- forward 태그 : 요청 JSP 문서에서 다른 JSP 문서로 스레드를 이동하여
		스레드가 이동된 JSP 문서로 응답처리하기 위한 기능을 제공하는 태그
		(요청 JSP문서로 가지않고 이동한 JSP 문서에서 바로 응답처리하는것) => "포워드 이동" --%>
<%-- => 서버에서 이동되었으므로 클라이언트의 URL 주소는 변경되지 않는다. --%>
<%-- => 스레드가 이동되는 JSP 문서에서는 request 내장객체에 저장된 속성값을 반환받아 사용가능하다. --%>
<%-- 형식) <jsp:forward page="스레드가 이동될 jSP 문서"></jsp:forward> --%>
<%-- => page 속성값으로 JSP 표현식(Expression) 사용 가능하다. --%>
<jsp:forward page="<%=contextPath %>"></jsp:forward>  <%-- 절대경로이기 때문에 루트 디렉터리를 기주능로 주소 작성 --%>
