package xyz.itwill.guest;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import xyz.itwill.dao.GuestDAO;



@WebServlet("/guest/remove.itwill")
public class GuestDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//전달값이 없는 경우 -> 비정상적인 요청
		if(request.getParameter("num")==null) {
			response.sendError(HttpServletResponse.SC_BAD_REQUEST);
			return;
		}
		
		//전달값을 반환받아 정수값으로 변환하여 저장  
		int num=Integer.parseInt(request.getParameter("num"));
		
		//글번호를 전달받아 GUEST 테이블에 저장된 행을 삭제하는 DAO 클래스의 메소드 호출
		int rows = GuestDAO.getDao().deleteGuest(num);
		
		if(rows>0) { //삭제된 행이 있는 경우
			response.sendRedirect("list.itwill");
		} else { //삭제된 행이 없는 경우 -> 비정상적인 요청
			response.sendError(HttpServletResponse.SC_BAD_REQUEST);
		}
	}

}
