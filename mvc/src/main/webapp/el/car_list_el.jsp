<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC</title>
</head>
<body>
	<h1>EL - List</h1>
	<hr>
	<%-- EL 표현식에서 List 객체의 요소를 표현하기 위한 첨자를 . 연산자로 사용하면 ELException이 발생된다. --%>
	<%-- <p>모델명=${carList.0.modelName }, 색상 = $(carList.0.carColor); --%>
	<%-- <p>모델명=${carList[0]["modelName"] }, 색상 = $(carList[0]["carColor"]); --%>
	<p>모델명=${carList[0].modelName }, 색상 = $(carList[0].carColor);
	<p>모델명=${carList[1].modelName }, 색상 = $(carList[1].carColor);
	<p>모델명=${carList[2].modelName }, 색상 = $(carList[2].carColor);
	<p>모델명=${carList[3].modelName }, 색상 = $(carList[3].carColor);
	<p>모델명=${carList[4].modelName }, 색상 = $(carList[4].carColor);

</body>
</html>