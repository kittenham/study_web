<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 템플릿 페이지를 구현한 JSP 문서 --%>
<%-- => 클라이언트의 모든 요청에 대한 응답 결과를 제공하는 JSP 문서 --%>
<%-- => 템플릿 페이지의 몸체부에는 클라이언트 요청에 의해 전달된 값을 이용하여 JSP 문서의 실행
결과를 제공받아 포함 --%>
<%
	String group=request.getParameter("group");
	if(group==null) group="main";
	
	String worker=request.getParameter("worker");
	if(worker==null) worker="main_page";
	
	String contentPath=group+"/"+worker+".jsp";
	
	/*
	header_main.jsp페이지에 작성된 링크와 연결되어 index.jsp를 호출했을때 group과 worker를 함께 호출하는 명령. 
	만약 둘다 값이 있을경우에는 header_main.jsp 페이지에 있는 링크대로 해당 페이지를 출력하지만,
	group과 worker가 null 값일때는 main_page를 출력한다.
	*/
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link href="css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="header">
		<jsp:include page="header_main.jsp"/>
	</div>
	
	<div id="content">
		<jsp:include page="<%=contentPath %>"/>
	</div>
	
	<div id="footer">
		<jsp:include page="footer.jsp"/>
	</div>
</body>
</html>