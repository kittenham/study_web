<%@page import="xyz.itwill.dao.UserinfoModelOneDAO"%>
<%@page import="xyz.itwill.dto.UserinfoDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 회원정보를 전달받아 Userinfo 테이블의 회원정보로 삽입하고 [user_login.jsp] 문서로
	 이동하는 URL 주소를 클라이언트에게 전달하여 응답하는 JSP 문서이다. --%>
	 
<%
	if(request.getMethod().equals("GET")){
		response.sendRedirect("user_error.jsp");
		return;
	}

	request.setCharacterEncoding("utf-8"); 
	//영어와 숫자로만 이루어져있으면 캐릭터셋할 필요없지만 이름을 입력할 것이기 때문에 필요
	
	String userid=request.getParameter("userid");
	String password=request.getParameter("password");
	String name=request.getParameter("name");
	String email=request.getParameter("email");
	int status=Integer.parseInt(request.getParameter("status"));
	
	UserinfoDTO userinfo = new UserinfoDTO();
	userinfo.setUserid(userid);
	userinfo.setPassword(password);
	userinfo.setName(name);
	userinfo.setEmail(email);
	userinfo.setStatus(status);
	
	int rows = UserinfoModelOneDAO.getDAO().insertUserinfo(userinfo);
	
	if(rows>0){ //회원등록이 성공한 경우
		response.sendRedirect("user_login.jsp");
	} else { //회원등록에 실패한 경우 => 이유 : 전달받은 아이디에 대한 PK 제약조건 위반으로 인해 발생한다.
		session.setAttribute("message", "이미 사용중인 아이디를 입력 하였습니다.");
		session.setAttribute("userinfo", userinfo);
		response.sendRedirect("user_writer.jsp");
	}
%>
