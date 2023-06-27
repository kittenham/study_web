<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 로그아웃 처리하고 [member/member_login.jsp] 문서를 요청하기 위한 URL 주소를 전달하여 응답 --%>
<%
	//바인딩된 세션에 권한 관련 정보의 속성값을 삭제 처리 - 로그아웃 처리
	session.removeAttribute("logoutMember");
	response.sendRedirect(request.getContextPath()+"/index.jsp?group=member&worker=member_login");
%>