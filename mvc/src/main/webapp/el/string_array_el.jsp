<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC</title>
</head>
<body>
	<h1>El - Array</h1>
	<hr>
	<%-- <p>${nameArray } --%>
	<ul>
		<%-- 스코프 객체 속성값이 배열인 경우 배열 요소값을 제공받아 출력하기 위해 첨자를 사용해야한다. --%>
		<%-- => EL 표현식에서 . 연산자로 첨자를 사용하여 표현한 경우 ElException이 발생한다.(500에러발생) --%>
		<%-- 한마디로, EL 표현식에서 . 연산자 사용 불가능 -> 따라서, [] 연산자를 대신 사용 한다. --%>
		<%-- 첨자는 "" 기호 생략이 가능하다. --%>
		<%-- <li>${nameArray.0 }</li>  => 이렇게 쓰면 안됨.--%>
		<%-- <li>${nameArray["0"] }</li> => "" 생략가능 함--%>
		<li>${nameArray[0] }</li>
		<li>${nameArray[1] }</li>
		<li>${nameArray[2] }</li>
		<li>${nameArray[3] }</li>
		<li>${nameArray[4] }</li>
		<%-- El 표현식에서 배열의 첨자가 범위를 벗어난 경우 EL 미실행. --%>
		
	</ul>

</body>
</html>