<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String category=request.getParameter("category");
	
	if(category==null){
		category="mail";
	}
	
	String headerPath="";
	if(category.equals("mail")){
		headerPath="header_mail.jsp";
	} else if(category.equals("blog")){
		headerPath="header_blog.jsp";		
	} else if(category.equals("cafe")){
		headerPath="header_cafe.jsp";				
	} else{
		response.sendError(HttpServletResponse.SC_BAD_REQUEST);
		return;
	}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
</head>
<body>
	
	<%-- Header 영역 --%>
	<%-- 
	<h1>메일페이지</h1>
	<a href="index.jsp">메일(Mail)</a>&nbsp;&nbsp;
	<a href="index.jsp">블로그(Blog)</a>&nbsp;&nbsp;
	<a href="index.jsp">카페(cafe)</a>&nbsp;&nbsp;
	 --%>
	<%@include file="header.jspf" %>
	<%@include file="<%=headerPath %>" %>
	
	

	<%-- Content 영역 --%>
	<p>메일 관련 정보가 출력됩니다.</p>
	<p>메일 관련 정보가 출력됩니다.</p>
	<p>메일 관련 정보가 출력됩니다.</p>
	<p>메일 관련 정보가 출력됩니다.</p>
	<p>메일 관련 정보가 출력됩니다.</p>
	
	<%-- Footer 영역 --%>
	<hr>
	<p>Copyright ⓒ Itwill Corp. All rights reserved.
	<p>관리자 : 홍길동(hong@itwill.xyz)
	
</body>
</html>