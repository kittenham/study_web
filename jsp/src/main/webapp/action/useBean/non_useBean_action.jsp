<%@page import="xyz.itwill.bean.Hewon"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 회원정보를 전달받아 내장객체의 속성값으로 저장하고 [non_useBean_display.jsp] 문서로
		포워드 이동하는 JSP 문서 -> 따라서 여기는 클라이언트 요청에 대한 처리만 제공하는 JSP 문서이다. --%>    

<%
	//JSP 문서를 GET 방식으로 요청한 경우 -비정상적인 요청
	if(request.getMethod().equals("GET")){
		response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
		return;
	}
	
	//POST 방식으로 요청하여 전달된 값에 대한 Charset 변경
	request.setCharacterEncoding("utf-8");
	
	//전달값(회원정보)을 반환받아 저장
	String name=request.getParameter("name");
	String phone=request.getParameter("phone");
	String address=request.getParameter("address");
	
	//JavaBean 클래스로 객체를 생성하여 전달값으로 필드값 변경
	Hewon hewon = new Hewon();
	hewon.setName(name);
	hewon.setPhone(phone);
	hewon.setAddress(address);
	
	/*
	//JavaBean(객체)를 session 내장객체의 속성값으로 저장
	// => 동일한 클라이언트에서 사용되는 모든 JSP 문서에게 속성값 제공
	session.setAttribute("hewon", hewon);
	
	//리다이렉트(Redirect) 이동 : 클라이언트에게 URL 주소를 전달하여 URL 주소의 JSP 문서를 요청하여
	//	실행결과를 응답받아 출력하는 것 (스레드가 이동하는 것이 아니기 때문에 request 사용못함.)
	// => 클라이언트의 요청 URL 주소가 변경된다. -> 클라이언트를 이용하여 페이지 이동한다.
	// => session 내장객체에 속성값을 저장하여 리다이렉트 이동되는 JSP 문서에서 반환받아 사용할 수 있다.
	// => 리다이렉트 이동되는 JSP 문서에서 session 내장객체에 속성값을 반환받은 후 제거한다.
	response.sendRedirect("non_useBean_display.jsp");
	*/
	
	//JavaBean(객체)를 request 내장객체의 속성값으로 저장
	// => 스레드가 이동되는 JSP 문서로만 속성값 제공
	request.setAttribute("hewon", hewon);
	
	//포워드 이동 : 요청 JSP 문서에서 응답 JSP 문서로 스레드를 이동하여 응답 처리하는 것(request 사용가능)
	// => 클라이언트의 요청 URL 주소 미변경 - 서버에서 JSP 문서 이동
	// => request 내장객체에 속성값을 저장하여 포워드 이동되는 JSP 문서에서 반환받아 사용
	// => 포워드 이동되는 JSP 문서가 실행종료되면 request 내장객체에 저장된 속성값은 자동 소멸된다.
	
	//** forward 태그 대신 Java 명령을 사용하여 포워드 이동이 가능하다.
	request.getRequestDispatcher("non_useBean_display.jsp").forward(request, response);
	
%>
<jsp:forward page="non_useBean_display.jsp"/>