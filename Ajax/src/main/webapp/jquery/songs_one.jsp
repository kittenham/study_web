<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<h2>음원차트(<span id="now"></span>현재기준)</h2>
	<div id="songList"></div>
	
	<script type="text/javascript">
	$.ajax({
		type: "get",
		url: "songs_two.jsp",
		dataType: "json",
		success: function(obj){
			
			$("#now").html(obj.now);
			
			var html="<ol>";
			$(obj.songs).each(function() { //이때 each는 콜백함수
				html+="<li><b>"+this.title+"</b>["+this.singer+"]</li>";
			});
			html+="</ol>";
		}
		error: function(xhr){
			alert("에러코드 = "+xhr.status);
		}
	})
	</script>

</body>
</html>