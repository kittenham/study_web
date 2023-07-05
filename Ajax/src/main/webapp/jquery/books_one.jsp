<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- [books_two.jsp] 문서를 AJAX 기능으로 요청하여 실행결과를 XML 데이타로 응답받아 태그를  
변경하여 클라이언트에게 전달하는 JSP 문서 --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AJAX</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
</head>
<body>
	<h1>jQuery AJAX</h1>
	<hr>
	<div id="bookList"></div>
	
	<script type="text/javascript">
	$.ajax({
		type: "get",
		url: "books_two.jsp",
		dataType: "xml", //데이타타입에 주의해야함. xml을 json으로 받으면 안되고, json을 xml로 받으면 에러뜸.
		success: function(xmlDoc){
			//alert(xmlDoc); //[object XMLDocument]
			
			var count=$(xmlDoc).find("book").length; //book이라는 태그의 개수를 반환받을 수 있다.
			if(count==0){
				$("#bookList").html("<p>검색된 교재가 하나도 없습니다.");
				return;
			}
			var html="<p>검색된 교재가 "+count+"권 있습니다.";
			html+="<ol>";
			$(xmlDoc).find("book").each(function(){
				var title=$(this).find("title").text(); //book태그 안의 title 에 있는 내용을 반환
				var author=$(this).find("author").text(); //book태그 안의 author 에 있는 내용을 반환
				html+="<li><b>"+title+"</b>["+author+"]</li>";
			});
			html+="</ol>";
			
			$("#bookList").html(html);
		},
		error: function(xhr){
			alert("에러코드 = "+xhr.status);
		}
	})
	</script>

</body>
</html>