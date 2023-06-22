<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
<style type="text/css">
table{
	border: 1px solid black;
	border-collapse: collapse;
}

th, td{
	border: 1px solid black;
	text-align: center;
	width: 200px;
	padding: 2px;
}
</style>
</head>
<body>
	<h1>page Directive - contentType 속성</h1>
	<hr>
	<p>page Directive의 contentType 속성에는 JSP문서를 요청하여 응답받을 수 있는 파일형태(MimeType)와 
	파일의 문자형태(CharacterSet - Encoding)를 속성값으로 설정</p>
	<hr>
	<table>
		<tr>
			<th>학번</th><th>이름</th><th>주소</th>
		</tr>
		<tr>
			<th>1000</th><th>홍길동</th><th>서울시 강남구 역삼동</th>
		</tr>
		<tr>
			<th>2000</th><th>임꺽정</th><th>인천시 월미구 상당동</th>
		</tr>
		<tr>
			<th>3000</th><th>전우치</th><th></th>
		</tr>
	</table>

</body>
</html>