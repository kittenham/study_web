<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 로그인 상태의 사용자에게 환영메세지를 전달하여 응답하는 JSP 문서 --%>
<%-- => 비로그인 상태의 사용자인 경우 [login_form.jsp] 문서를 요청할 있는 URL 주소를 전달하여 응답--%>
<%-- => [로그아웃] 태그를 클릭한 경우 [login_action.jsp] 문서를 요청하여 페이지 이동--%>
<%-- => [메인으로] 태그를 클릭한 경우 [login_form.jsp] 문서를 요청하여 페이지 이동 --%>
<%
	//session.getAttribute(String attributeName) : 클라이언트의 정보(JSESSIONID 쿠키)로 
	//바인딩된 세션(session)에서 매개변수로 전달된 속성명의 속성값(객체)을 반환하는 메소드
	// => Object 객체로 반환되므로 반드시 명시적 객체 형변환 사용
	// => 속성명으로 저장된 속성값이 없는 경우 null 반환
	//바인딩된 세션에서 권한 관련 정보가 저장된 객체를 반환받아 저장
	String loginId=(String)session.getAttribute("loginId");

	if(loginId==null) {//반환받은 속성값(객체)가 없는 경우 - 비로그인 상태의 사용자
		session.setAttribute("message", "로그인 상태의 사용자만 접근 가능한 페이지입니다.");
		response.sendRedirect("login_form.jsp");
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
	<h1>로그인 사용자 전용 페이지</h1>
	<hr>
	<p>
		<%=loginId %>님, 환영합니다.&nbsp;&nbsp;
		<a href="logout_action.jsp">[로그아웃]</a>&nbsp;&nbsp;
		<a href="login_form.jsp">[메인으로]</a>
	<hr>
	<p>로그인 사용자만 확인 가능한 내용입니다.</p>
	<p>로그인 사용자만 확인 가능한 내용입니다.</p>
	<p>로그인 사용자만 확인 가능한 내용입니다.</p>
	<p>로그인 사용자만 확인 가능한 내용입니다.</p>
	<p>로그인 사용자만 확인 가능한 내용입니다.</p>
	<p>로그인 사용자만 확인 가능한 내용입니다.</p>
	<p>로그인 사용자만 확인 가능한 내용입니다.</p>
	<p>로그인 사용자만 확인 가능한 내용입니다.</p>
	<p>로그인 사용자만 확인 가능한 내용입니다.</p>
	<hr>
	<%--<img alt="코알라" src="Koala.jpg" width="200"> 
			=> 코알라 사진의 폴더가 이 페이지의 폴더와 다르기 때문에 출력시 웹페이지에 사진 나타나지 않음.--%>
	<%-- 상대경로(현재 요청 JSP 문서의 경로를 기준으로 한다.)를 이용하여 웹자원을 제공받아 사용한다.(크게 권장하지않음. 404에러 떨어질 일이 多 --%>
	<img alt="코알라" src="../images/Koala.jpg" width="200">
	
	<%-- 따라서, 웹자원의 경로를 잘못 표현한 경우 404 에러가 발생할 수 있으므로 절대경로(최상위 디렉토리를 기준으로 한다.)를 사용하는 것을 권장한다. --%>
	<%-- 절대경로 : 최상위 디렉토리를 기준으로 웹자원의 경로 표현 --%>
	<%-- => 문제점) 웹프로젝트의 파일이 저장된 컨텍스트(context) 루트 디렉토리의 경로가 변경될 수 있다. => 이러면 404 에러 발생 --%>
	<img alt="코알라" src="/jsp/images/Koala.jpg" width="200">
	
	<%-- 특히 절대경로에서 request.getContextPath() 메소드를 사용하면 경로가 바뀌어도 상관없이 결과 출력가능하다. --%>
	<%-- 절대경로에서 컨텍스트가 저장된 디렉토리 경로는 request 객체의 메소드를 호출하여 반환받아 사용한다. --%>
	<%-- request.getContextPath() : 컨텍스트 디렉토리 경로를 반환하는 메소드 --%>
	<img alt="코알라" src="<%=request.getContextPath()%>/images/Koala.jpg" width="200">
</body>
</html>