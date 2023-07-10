<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 로그아웃 처리 후 [user_login.jsp] 문서를 요청하는 URL 주소를 클라이언트에게 전달하여 응답하는 JSP 문서 --%>  
<%
	//session.removeAttribute("loginUserinfo"); //얘를 써도됨. 여기는 얘가 맞긴함.
	session.invalidate(); //무효화처리
	
	response.sendRedirect("user_login.jsp");
%>