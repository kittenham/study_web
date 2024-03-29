<%@page import="xyz.itwill.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 로그인 상태의 사용자정보(회원정보)를 클라이언트에게 전달하여 응답하는 JSP 문서 --%>
<%-- => 로그인 상태의 사용자만 요청 가능한 JSP 문서 --%>
<%--[회원정보변경] 태그를 클릭한 경우 [/shoppingmall/member/password_confirm.jsp] 문서 요청 -> 페이지 이동 요청--%>
<%-- *** 중요 ***
	//바인딩된 세션에서 권한 관련 정보의 속성값을 객체(로그인 상태의 사용자정보)로 반환받아 저장
	MemberDTO loginMember=(MemberDTO)session.getAttribute("loginMember");

	//비로그인 상태의 사용자가 JSP 문서를 요청한 경우 - 비정상적인 요청
	if(loginMember==null) {
		//템플릿 페이지 몸체부에 포함되는 JSP 문서에서는 에러코드 및 URL 주소로 응답 처리 불가능
		//response.sendRedirect(request.getContextPath()+"/index.jsp?group=error&worker=error_400");
		
		//따라서 템플릿 페이지 몸체부에서는 자바스트립트를 이용하여 Url 주소를 변경해서 응답 처리(location 객체를 사용해서)
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?group=error&worker=error_400'");
		out.println("</script>");
		return;
	}
	//많이 쓰는 코드이기 때문에 외부코드로 만들어 include 디렉티브(액션태그가 아님)로 사용할 수 있다.-권한관련 설정할때 특히.
	//include 액션태그로 사용하게 되면 html 부분에서 해당 코드를 한번 더 사용해야함.
--%>
<%@include file="/shoppingmall/security/login_check.jspf" %>
<style type="text/css">
#detail {
	width: 500px;
	margin: 0 auto;
	text-align: left;
}

#link {
	font-size: 1.1em;
}

#link a:hover {
	color: white;
	background: black;
}
</style>
<h1>내정보</h1>
<div id="detail">
	<p>아이디 = <%=loginMember.getId() %></p>
	<p>이름 = <%=loginMember.getName() %></p>
	<p>이메일 = <%=loginMember.getEmail() %></p>
	<p>전화번호 = <%=loginMember.getMobile() %></p>
	<p>주소 = [<%=loginMember.getZipcode() %>]<%=loginMember.getAddress1() %> <%=loginMember.getAddress2() %></p>
	<p>회원가입날짜 = <%=loginMember.getJoinDate() %></p>
	<p>마지막로그인 날짜 = <%=loginMember.getLastLogin() %></p>
</div>

<div id="link">
	<a href="<%=request.getContextPath() %>/shoppingmall/index.jsp?group=member&worker=password_confirm&action=modify">[회원정보변경]</a>&nbsp;&nbsp;
	<a href="<%=request.getContextPath() %>/shoppingmall/index.jsp?group=member&worker=password_confirm&action=renive">[회원탈퇴]</a>&nbsp;&nbsp;
	<a href="#">[회원??]</a>&nbsp;&nbsp;
</div>







