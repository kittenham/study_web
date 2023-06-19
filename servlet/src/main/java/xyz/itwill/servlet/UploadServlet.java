package xyz.itwill.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

//[multipart/form-data]로 전달된 경우 request 객체로부터 입력스트림(ServletInputStream 객체)을
//제공받아 임시파일에 저장한 후 전달값과 전달파일을 구분하여 처리
// => [multipart/form-data]를 처리하는 클래스를 사용하여 처리하는 것을 권장한다. 

//[multipart/form-data]를 처리하는 클래스가 포함된 라이브러리가 2개 존재. -> 다운받아 프로젝트에 빌드업해야함.
//1. Apache 그룹에서 배포한 commos-fileupload 라이브러리의 클래스를 사용 -> (검증을 통과한)선택적 파일 업로드
//2. Oreilly 그룹에서 배포한 cos 라이브러리의 클래스를 사용 -> (검증이고뭐고)무조건 파일 업로드 
//	(하지만 입력값 검증은 자바스크립트에서도 할 수 있기 때문에 2번째 방법도 많이 사용함. 하지만 서버에서 검증하는 것이 더 안전함.)

//두가지 중 두번째 라이브러리를 사용해 보자.
//<Oreilly 그룹에서 배포한 cos 라이브러리를 다운로드 프로젝트 빌드 처리>
//1.http://www.servlets.com 사이트 접속 >> COS File Upload Library 메뉴 클릭 >> cos-22.05.zip 다운로드
//2.cos-22.05.zip 파일 압축 풀기 >> cos-22.05 폴더 이동 >> lib 폴더 이동 >> cos.jar 복사
//3.프로젝트 >> src/main/webapp >> WEB-INF >> lib >> cos.jar 붙여넣기
//=> /WEB-INF/lib 폴더에 라이브러리 파일(jar 파일)을 붙여넣기 하면 자동으로 라이브러리 빌드 처리


//입력페이지(fileupload.html)에서 전달된 값과 파일명을 클라이언트에게 전달하여 응답하는 서블릿
// => 전달파일은 서버 디렉토리에 저장 - 파일 업로드(Upload) 처리
@WebServlet("/upload.itwill")
public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8"); //html 문서로 응답할 것이다.
		PrintWriter out=response.getWriter();
		
		if(request.getMethod().equals("GET")) {
			response.sendRedirect("fileupload.html");
			return;
		}
		
		/*
		request.setCharacterEncoding("utf-8");
		
		//form 태그의 [multipart/form-data]로 전달된 입력값은 HttpServletRequest 객체의
		//getParameter() 메소드를 호출하여 반환 불가능
		String uploader=request.getParameter("uploader");
		*/
		
		//전달파일을 저장하기위한 서버 디렉토리의 시스템 파일 경로를 반환받아 저장
		//(*webapp 폴더 밑에 upload 폴더 만들기 (만약 클라이언트의 접근을 막으려면 더 하위 폴더인 WEB-INF 폴더에 넣어야함))
		// => 지금 우리가 작업하는 공간은 이클립스 작업디렉토리이지만, 클라이언트가 요청했을때 제공되는 자원의 파일경로는
		//	이클립스의 작업 디렉토리(WorkSpace)가 아닌, WAS 프로그램이 사용하는 웹디렉토리(WebApp) 파일 시스템 경로를 반환해준다.
		//주의) WAS 프로그램이 실행(Start) 될때 이클립스 작업 디렉토리의 파일을 이용하여 웹디렉토리의 자원으로 변환하여 저장 = 동기화 처리
		String saveDriectory = request.getServletContext().getRealPath("/upload");
		//System.out.println("saveDriectory = "+saveDriectory);
		
		//cos 라이브러리의 MultipartRequest 클래스로 객체 생성 
		// => 모든 전달파일을 제공받아 서버 디렉토리에 저장 - 자동 업로드 처리
		//MultipartRequest 객체 : [multipart/form-data]로 전달받은 값과 파일을 처리하기 위한 객체
		// => MultipartRequest(HttpServletRequest request, String saveDirectory[, int maxPostSize]
		//[, String encoding][, FileRenamePolicy policy]) 생성자를 이용하여 객체 생성
		// => request : 요청정보가 저장된 HttpServletRequest 객체 전달
		// => saveDirectory : 전달파일이 저장될 서버 디렉토리의 파일 시스템 경로 전달
		// => maxPostSize : 전달파일의 용량을 제한하기 위한 크기(Byte) 전달 - 생략시 무제한 기본값으로 사용 
		// => encoding : 전달값에 제공받기 위한 문자형태 전달 - 생략시 서유럽을 기본값으로 사용
		// => policy : FileRenamePolicy 객체 전달 - 생략시 전달파일로 기존파일 덮어씌우기
		//FileRenamePolicy 객체 : 업로드될 파일의 이름과 같은 이름의 파일이 서버 디렉토리에
		//이미 존재할 경우 업로드될 파일의 이름을 변경하는 기능을 제공하는 객체
		// => FileRenamePolicy 인터페이스를 상속받은 자식클래스로 객체 생성
		MultipartRequest mr=new MultipartRequest(request, saveDirectory, 20*1024*1024
				, "utf-8", new DefaultFileRenamePolicy());
		
		//MultipartRequest 객체를 이용하여 전달값을 반환받아 저장
		// => MultipartRequest.getParameter(String name) 또는 MultipartRequest.getParameterValues
		//(String name) 메소드 호출
		String uploader=mr.getParameter("uploader");
		
		//MultipartRequest 객체를 이용하여 전달파일명을 반환받아 저장
		//MultipartRequest.getOriginalFileName(String name) : 매개변수로 전달된 이름의 파일명
		//(입력된 원본파일명)을 반환하는 메소드
		//String fileone=mr.getOriginalFileName("fileone");
		//String filetwo=mr.getOriginalFileName("filetwo");
		
		//MultipartRequest.getFilesystemName(String name) : 매개변수로 전달된 이름의 파일명
		//(업로드된 처리된 파일명)을 반환하는 메소드
		// => FileRenamePolicy 객체를 사용한 경우 호출하는 메소드
		String fileone=mr.getFilesystemName("fileone");
		String filetwo=mr.getFilesystemName("filetwo");
  
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head>");
		out.println("<meta charset='UTF-8'>");
		out.println("<title>Servlet</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h1>파일업로드</h1>");
		out.println("<hr>");
		out.println("<p>올린이 = "+uploader+"</p>");
		out.println("<p>파일-1 = "+fileone+"</p>");
		out.println("<p>파일-2 = "+filetwo+"</p>");
		out.println("</body>");
		out.println("</html>");
	}
}