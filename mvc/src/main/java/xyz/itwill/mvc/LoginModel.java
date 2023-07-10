package xyz.itwill.mvc;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import xyz.itwill.exception.AuthFailException;
import xyz.itwill.service.UserinfoService;

//클라이언트가 [/login.do]로 요청한 경우 객체로 생성될 모델 역할의 클래스
//=> 로그인 정보를 전달받아 USERINFO 테이블에 저장된 회원정보와 비교하여 인증 처리한 후
//	 인증 성공시, 세션에 권한 관련 객체를 속성값으로 저장하고 [/loginform.do] 페이지로 리다이렉트 이동하기 위한
//	 정보가 저장된 ActionForward 객체를 반환
//=> 인증 실패시, [user_login.jsp] 문서로 포워드 이동하기 위한 정보가 저장된 ActionForward 객체를 반환
//	 - 에러메세지와 아이디를 request 객체의 속성값으로 저장하여 JSP 문서에 제공한다.

public class LoginModel implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward actionForward = new ActionForward();
		//클라이언트 요청에 대한 명령을 실행하면서 발생되는 모든 예외를 처리하기 위한 기능 구현하기
		try {
			//[/login.do]페이지를 GET 방식으로 요청한 경우 -> 비정상적인 요청
			if(request.getMethod().equals("GET")) {
				throw new Exception(); //인위적인 예외를 발생시킨 것.
			}
			
			//서블릿(컨트롤러) 요청시 전달된 값읇 반환받아 저장
			//=> 서블릿(컨트롤러)의 request 객체를 요청 처리 메소드의 매개변수로 전달받아 사용할 수 있도록 만들어 줄 수 있음. 
			String userid=request.getParameter("userid");
			String password = request.getParameter("password");
			
			//모델 클래스의 요청 처리 메소드에서는 Service 클래스의 객체로 메소드를 호출하여 
			//데이타 처리 관련 기능이 실행되도록 작성(모델
			
			//UserinfoService 클래스의 auth() 메소드를 호출하여 인증 처리
			// => AuthFailException이 발생된 경우 인증 실패
			UserinfoService.getService().auth(userid, password);
		
			//인증에 성공한 경우 세션에 권한관련 객체를 속성값으로 저장하면 된다.
			HttpSession session = request.getSession();
			//Session scope : 동일한 세션을 바인딩하여 사용하는 모든 웹프로그램에서 속성값을 객체로 반환받아 사용 가능하다.
			session.setAttribute("loginUserinfo", UserinfoService.getService().getUserinfo(userid));
			
			actionForward.setForward(false);
			actionForward.setPath(request.getContextPath()+"/loginform.do");
		}catch (AuthFailException e) {
			//인증 실패시 발생되는 예외에 대한 명령 작성
			//Request Scope " 스레드가 이동된 웹프로그램(JSP)에서만 속성값을 개체로 반환받아 사용가능하다.
			request.setAttribute("message", e.getMessage());
			request.setAttribute("userid", request.getParameter("userid"));
			actionForward.setForward(true);
			actionForward.setPath("/model_two/user_login.jsp");
			
		}catch (Exception e) { //모든 예외를 전달받아 예외 처리하기 위한 명령을 작성한다. -> 처리하면 500, 404와 같은 에러메세지가 아닌 만들어준 에러페이지가 뜸.
			e.printStackTrace(); //서버 콘솔에 예외가 발생한 에러정보를 메세지형태로 출력
			//[error.do] 페이지로 리다이렉트 이동하기 위한 정보를 ActionForward 객체에 저장
			actionForward.setForward(false);
			actionForward.setPath(request.getContextPath()+"/error.do");
			
		}
		
		
		return actionForward;
	}

}
