<%@page import="java.util.HashMap"%>
<%@page import="xyz.itwill.dto.MyHewon"%>
<%@page import="java.util.Map"%>
<%@page import="xyz.itwill.dao.MyHewonDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String name=request.getParameter("name");

	List<MyHewon> hewonList=null;
	
	if(name==null || name.equals("")) { //전달값이 없는경우
		hewonList=MyHewonDAO.getDAO().selectHewonList();//전체 검색
	} else {
		hewonList=MyHewonDAO.getDAO().selectNameHewonList(name);//조건 검색
	}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MYBATIS</title>
<style type="text/css">
table {
	border: 1px solid black;
	border-collapse: collapse;
}

td {
	border: 1px solid black;
	text-align: center;
	padding: 3px;
}

.id { width: 150px; }
.name { width: 150px; }
.phone { width: 200px; }
.email { width: 200px; }
.status { width: 100px; }
</style>
</head>
<body>
	<h1>회원목록</h1>
	<hr>
	<table>
		<tr>
			<td class="id">아이디</td>
			<td class="name">이름</td>
			<td class="phone">전화번호</td>
			<td class="email">이메일</td>
			<td class="status">공개범위</td>
		</tr>
		<% if(hewonList.isEmpty()) { %>
			<tr>
				<td colspan="5">검색된 회원정보가 없습니다.</td>
			</tr>
		<% } else { %>
			<% for(Map<String, Object> hewon : hewonList) { %>
			<tr>
				<td><%=hewon.get("HEWON_ID") %></td>
				<td><%=hewon.get("HEWON_NAME") %></td>
				<td><%=hewon.get("HEWON_PHONE") %></td>
				<td><%=hewon.get("HEWON_EMAIL") %></td>
				<td><%=hewon.get("HEWON_STATUS") %></td>
				<!-- => 이때 hewon.get("HEWON_ID") => 괄호 안의 값을 무조건 대문자로 나타내 줘야함.  -->
			</tr>
			<% } %>
		<% } %>
	</table>
</body>
</html>