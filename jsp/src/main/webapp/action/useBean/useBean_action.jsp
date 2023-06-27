<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%-- 회원정보를 전달받아 내장객체의 속성값으로 저장하고 [useBean_display.jsp] 문서로
		포워드 이동하는 JSP 문서 -> 따라서 여기는 클라이언트 요청에 대한 처리만 제공하는 JSP 문서이다. --%> 
<%
	//JSP 문서를 GET 방식으로 요청한 경우 -비정상적인 요청
	if(request.getMethod().equals("GET")){
		response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
		return;
	}
	
	//POST 방식으로 요청하여 전달된 값에 대한 Charset 변경
	request.setCharacterEncoding("utf-8");
%>

<%-- useBean Tag : JSP 문서에 JAVA 객체(JavaBean)를 제공하기 위한 태그
	 => 스크립틀릿을 사용하지 않고 java 객체를 제공할 수 있음. 더 코드가 깔끔해보이기 위함.  --%>
<%-- 형식) <jsp:useBean id="식별자" class="JavaBean 클래스 이름" scope="사용범위"/> --%>
<%-- => 내장객체에 저장된 속성값을 객체로 반환받아 제공하거나 속성값이 없는 경우에는 
		객체를 생성하여 내장객체의 속성값으로 저장하여 제공한다. --%>
<%-- id 속성 : useBean 태그로 제공되는 객체를 구분하기 위한 식별자를 속성값으로 설정한다. --%>
<%-- => 내장 객체에 저장된 속성값에 대한 속성명으로 사용될 수도 있다. --%>
<%-- class 속성 : useBean 태그로 제공되는 객체의 자료형을 속성값으로 설정한다. --%>
<%-- scope 속성 : useBean 태그로 제공되는 객체의 사용범위(scope)를 속성값으로 설정한다.
		=> page, request, session, application 중 하나를 속성값으로 설정한다.
		=> scope 속성을 생략한 경우 [page] 속성값을 기본값으로 설정해 사용한다. --%>

<jsp:useBean id="hewon" class="xyz.itwill.bean.Hewon" scope="request"/>
<%--
	//아래의 두문장 코드가 useBean 태그와 동일한 명령이다.
	//(useBean태그를 쓰든 아래 두 코드를 사용하든 둘 중하나를 사용하면됨.)
	Hewon hewon=new Hewon();
	request.setAttribute("hewon");
--%>


<%-- setproperty Tag : useBean 태그로 제공된 객체의 필드값을 변경하기 위한 태그 --%>
<%-- => 객체의 필드에 대한 Setter 메소드를 호출하여 객체의 필드값을 변경할 수 있다. --%>
<%-- 형식) <jsp:setproperty name="식별자" property="필드명" value="변경값"/> --%>
<%-- name 속성 : useBean 태그로 제공된 객체의 식별자(id 속성값)을 속성값으로 설정 --%>
<%-- property 속성 : 값을 변경할 필드명을 속성값으로 설정 --%>
<%-- => 필드명을 기반으로 작성된 Setter 메소드를 자동호출한다. 
		이때, 필드명으로 작성된 Setter 메소드가 없는 경우 에러가 발생한다.
		(Setter와 Getter는 반드시 필드명이 기반이 되어야함!) --%>
<%-- value 속성 : 필드에 저장될 변경값을 속성값으로 설정 (선택사항임. 생략가능) --%>
<%-- <jsp:setproperty name="hewon" property="name" value="홍길동"/> --%>
<%-- hewon.setName("홍길동"); --%>

<%-- value 속성을 생략하면 JSP 문서 요청시 전달된 값을 반환받아 필드값을 변경한다.
	 => 주의점) JSP 문서 요청시 전달된 값의 이름과 setProperty 태그의 property 속성값(객체 필드명)이
	 	반드시 동일해야만 전달값을 반환받아 객체 필드값으로 변경된다.--%>
<%--
<jsp:setproperty name="hewon" property="name"/>
<jsp:setproperty name="hewon" property="phone"/>
<jsp:setproperty name="hewon" property="address"/>
--%>
<%-- setProperty 태그의 property 속성값을 [*]로 설정한 경우 모든 전달값을 반환받아 필드값 변경할 수 있다. 
	 (자료형이 다른 경우 형변환도 해줌) => 간단하게 --%>
<jsp:setProperty name="hewon" property="*">
<%--
	hewon.setName(request.getParameter("name"));
	hewon.setPhone(request.getParameter("phone"));
	hewon.setAddress(request.getParameter("address"));
--%>


<jsp:forward page="useBean_display.jsp"/>
<%--
	request.getRequestDispatcher("useBean_display.jsp").forward(request, response);
--%>
