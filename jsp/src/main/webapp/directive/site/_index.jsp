<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
<%--
<style type="text/css">
div{
	margin: 5px;
	padding: 5px;
}

#header{
	height: 200px;
	border: 1px solid red;
}

#header h1{
	text-align: center;
}

#menu{
	font-size: 1.3em;
	text-align: right;
}

#menu a, #menu a:visited{
	text-decoration: none;
	color: black;
}

#menu a:hover{
	color: orange;
}

#content{
	min-height: 500px;
	border: 1px solid black;
	text-align: center;
}

#footer{
	height: 150px;
	border: 1px solid blue;
	text-align: left;
	font-size: 1.2em;
}
</style>
 --%>
 <link href="style.css" type="text/css" rel="stylesheet">
</head>
<body>
<%--header와 footer는 외부파일에 만들어서 소스코드를 가지고와 JSP파일에 포함시키는 것이 더 효율적이다. --%>
	<%-- Header 영역 : 페이지 머릿부 - 로고, 메뉴 등 => 클릭이벤트를 통해 다른 페이지로 가는 하이퍼링크多, 이미지 --%>
	<div id="header">
		<%--
		<h1><a href="_index.jsp">쇼핑몰</a></h1>
		<div id="menu">
			<a href="login.jsp">로그인</a>&nbsp;&nbsp;
			<a href="join.jsp">회원가입</a>&nbsp;&nbsp;
			<a href="cart.jsp">장바구니</a>&nbsp;&nbsp;
			<a href="review.jsp">리뷰</a>&nbsp;&nbsp;
		</div>
	 	--%>
	 	<%@include file="header.jspf" %>
	</div>
	
	<%-- Contents 영역 : 페이지 몸체부 - 요청에 의한 실행 결과를 출력한다. --%>
	<div id="content">
		<h2>메인페이지 - 제품목록</h2>
	
	</div>
	
	<%-- Footer 영역 : 페이지 꼬릿부 - 저작권, 약관, 개인정보 보호정책 등  --%>
	<div id="footer">
		<%--<p>Copyright ⓒitwill Corp. All rights reserved.</p> --%>
		<%@include file="footer.jspf"%>
	</div>

</body>
</html>