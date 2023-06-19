package xyz.itwill.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FristServelt
 */

//@ : 어노테이션(Annotation) : API 문서에 특별한 설명을 제공하기 위해 만들어진 기능이다. 

@WebServlet("/Frist.itwill")
public class FristServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;

	//클라이언트 요청에 의해 자동호출되는 메소드 => 요청 처리 메소드
	// => 클라이언트 요청에 대한 처리 명령과 실행결과를 저장한 파일을 생성하는 명령 작성
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//클라이언트에게 요청에 대한 실행결과를 저장하기 위한 파일형태 변경 및 응답파일을 
		//생성하기 위한 출력스트림을 반환받아 저장 
		//(=> 클라이언트 요청에 대한 실행결과를 파일로 제공하지 않을 경우, 이 단계는 생략가능하다.)
		//(클라이언트에게 URL 주소로 응답할 경우 응답파일로 제공하지 않으므로 아래 두 코드는 생략가능하다.)
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		//요청에 대한 처리 명령 및 처리결과를 저장할 응답파일 생성
		//=> 서블릿은 모든 클라이언트에게 "일관성있는 동일한 처리결과"를 "동적"으로 생성하여 제공(클라이언트가 어느나라에서 있던 상관X)
		Date now = new Date(); //서버 플랫폼의 현재 날짜와 시간이 저장된 Date 객체 생성
		
		//날짜와 시간에 대한 패턴 정보를 저장한 SimpleDateFormat 객체 생성
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분 ss초");
		
		//SimpleDateFormat 객체의 format() 메소드를 호출하여 매개변수로 전달받은 Date 객체를 
		//SimpleDateFormat 객체에 저장된 날짜와 시간 패턴의 문자열로 변환하여 반환
		String displayNow = dateFormat.format(now);
		
		//실행결과를 저장한 응답파일 생성
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head>");
		out.println("<meta charset='UTF-8'>");
		out.println("<title>Servlet</title>");
		out.println("<style type='text/css'>");
		out.println("p {");
		out.println("width: 600px;");
		out.println("margin: 0 auto;");
		out.println("padding: 30px 0;");
		out.println("font-size: 2em;");
		out.println("font-weight: bold;");
		out.println("text-align: center;");
		out.println("border: 2px solid black;");
		out.println("}");
		out.println("</style>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h1>서블릿 시계</h1>");
		out.println("<hr>");
		out.println("<p>"+displayNow+"</p>");
		out.println("<script type='text/javascript'>");
		out.println("setInterval(function() {");
		out.println("location.reload();");
		out.println("}, 1000);");
		out.println("</script>");
		out.println("</body>");
		out.println("</html>");
		
		//==>여기까지 실행했을때 초는 올라가지만 화면에 동적으로 보여지지 않는다. 
		//창을 새로고침하면 초의 숫자가 올라가는 것을 확인 할 수 있다.
		//동적으로 창을 만들려면 javascript를 이용하면 된다.
	}

}