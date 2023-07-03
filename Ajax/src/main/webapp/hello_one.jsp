<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ajax</title>
<style type="text/css">

</style>
</head>
<body>
	<h1>AJAX Programming</h1>
	<hr>
	<div id="display">Hello, AJAX!!!</div>
	<hr>
	<div>
		<button type="button" id="btn1">번역하기</button>
		<button type="button" id="btn1">배경색 변경</button>
	</div>
	
	<script type="text/javascript">
	/* 
	//검색된 태그의 Element 객체로 반환받아 Click 이벤트가 발생되면 호출되는 이벤트 처리 함수 등록
	document.getElementById("btn1").onclick=Function(){
		//페이지에서 검색된 태그를 Element 객체로 반환받아 태그의 내용을 변경 처리 - DHTML
		// => 현재 요청 웹프로그램의 실행결과를 이용하여 페이지의 태그 변경
		document.getElementById("display").innerHTML="안녕하세요. 에이젝스!!!";
	}
	*** 얘는 Ajax가 아님. 단순하게 비동기식 기능만 이용한 것임.
	*/
	
	
	// AJAX 프로그램 :  비동기식 통신기능을 이용하여 DHTML 기능을 구현한 프로그램
	// XMLHttpRequest객체를 저장하기 위한 전역변수 선언  or  XMLHttpRequest 객체를 생성하여 전역변수에 저장한다.
	// => XMLHttpRequest 객체 : 비동기식으로 웹프로그램을 요청하여 응답받아 처리하기 위한 객체
	var xhr = null;
	//var xhr = new XMLHttpRequest(); => 위의 코드가 아니라 이렇게 해도 되지만 아래애서 객체 생성을 하므로 일단 이건 생략
	
	//페이지에서 검색된 태그를 Element 객체로 반환받아 Click 이벤트가 발생될 경우호출될 이벤트
	document.getElementById("btn1").onclick=Function(){
		//AJAX 기능을 이용하여 응답결과를 제공받아 페이지의 태그변경
		// => XMLHttpRequest 객체를 사용하여 비동기식으로 웹프로그램을 요청하여 실행결과를
		//	  HTML 또는 XML로 응답받아 페이지의 태그를 변경 처리한다.
		
		
		//1. XMLHttpRequest 객체를 생성하여 전역변수에 저장한다.
		xhr=new XMLHttpRequest();
		
		//2. XMLHttpRequest 객체의 준비상태(ReadyState)가 변경될 경우 호출될 이벤트 처리 함수를 등록한다.
		//XMLHttpRequest.readystate : XMLHttpRequest 객체의 준비상태 정보를 저장한 프로퍼티
		// => XMLHttpRequest 객체의 준비상태는 순차적으로 자동 변경된다.
		// 		=> 0 : XMLHttpRequest 객체 생성
		// 		=> 1 : 요청 설정시. (Open 메소드 호출 할 때)
		// 		=> 2 : 웹프로그램 요청 (Send 메소드 호출 할 때)
		// 		=> 3 : 웹프로그램 실행 (응답 전일 때)
		//		=> 4 : 실행 결과를 응답 받았을 때
		xhr.onreadystatechange=changeHTML;
		
		//3. XMLHttpRequest 객체로 open() 메소드를 호출한다. -> 호출하면 준비상태가 [1]로 변경된다.
		//XMLHttpRequest.open(method, url[, async]) : XMLHttpRequest 객체로 웹프로그램을 요청하기 위한 정보를 설정하는 메소드
		// => method : 요청 방식 - GET(검색), POST(삽입), PUT(전체 변경), PATCH(부분 변경), DELETE(삭제)
		// => url : 요청 웹프로그램의 URL 주소 
		//			- 주의) 현재 서버에 존재하는 웹프로그램만 요청이 가능하다. 다른서버에 있는 웹프로그램을 요청하려면 다른 방법을 이용해야 한다.(ex. java이용)
		// => async : false 또는 true 중 하나를 전달
		xhr.open("get", "hello_two.jsp", "true"); //비동기식 통신(요청과 응답) : 요청에 대한 응답 기다림이 발생하지 않음.(다른작업이 가능하다.)
		xhr.open("get", "hello_two.jsp", "flase"); //동기식 통신(요청과 응답) : 요청에 대한 응답 기다림이 발생함.(다른 작업이 불가능하다. 응답기다림때문에 기다려야되니까.)
		
		//4. XMLHttpRequest 객체로 send() 메소드를 호출한다. -> 호출하면 준비상태가 [2]로 변경된다.
		//XMLHttpRequest.sned(data) : XMLHttpRequest 객체로 웹프로그램을 요청하기 위한 메소드
		// => data : 웹프로그램 요청시 전달값을 [이름=값&이름=값&...] 형식으로 전달한다.
		// => 리퀘스트 메세지 몸체부에 값을 저장하여 전달한다.
		// => 전달값이 없거나 GET 방식으로 요청한 경우 data 매개변수에는 null을 전달한다.
		xhr.send(null); //웹프로그램 요청 후 준비상태가 [3]과 [4]로 자동변경된다.
	}
	
	//XMLHttpRequest 객체의 준비상태가 변경될 때마다 호출되는 이벤트 처리 함수 -> 4번 호출
	function changeHTML() {
		/*
		if(xhr.readyState==1){
			alert("요청 설정 상태");
		} else if(xhr.readyState==2){
			alert("요청 상태");
		} else if (xhr.readyState==3) {
			alert("응답 대기 상태");
		} else if (xhr.readyState==4) {
			alert("응답 완료 상태");
		}
		*/
		//가장 중요한 것은 응답 완료 상태일때임.
		if(xhr.readyState==4){
			
		}
	}
	
	
	</script>
</body>
</html>