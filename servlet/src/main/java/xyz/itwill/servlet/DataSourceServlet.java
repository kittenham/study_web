package xyz.itwill.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

//DBCP(DataBase Connection Pool) 객체 : 다수의 Connection 객체를 미리 생성하고 저장하여 제공하기 위한 객체
//=> 일반적으로 DataSource 인터페이스를 상속받은 자식클래스로 객체 생성
//WAS가 start할때 미리 만들어두고, WAS가 필요할때 제공한다. => 이런것을 JNDI라고 한다.

//Apache 그룹에서 제공하는 tomcat-dbcp.jar 라이브러리의 클래스를 이용하여(그래서 굳이 UCP라이브러리를 빌드할 필요가없다) DBCP 객체를 생성하여
//Connection 객체를 제공받아 Connection 객체의 정보를 클라이언트에게 전달하여 응답하는 서블릿
@WebServlet("/dbcp.itwill")
public class DataSourceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
	
		//BasicDataSource 객체(DataSource 객체) 생성
		BasicDataSource dataSource = new BasicDataSource();
		
		//BasicDataSource 객체(DataSource 객체)에 저장될 다수의 Connection 객체를 생성하기 
		//위한 정보를 메소드를 호출하여 변경 처리 - DataSource 객체의 필드값 변경
		dataSource.setDriverClassName("oracle.jdbc.driver.OracleDriver");
		dataSource.setUrl("jdbc:oracle:thin:@localhost:1521:xe");
		dataSource.setUsername("scott");
		dataSource.setPassword("tiger");
		//아래 3개는 필수는 아니지만 Connection 객체를 제한하기 위해 설정해놓은것.
		dataSource.setInitialSize(10); //최초 생성될 Connection 객체의 갯수 변경. but, 꼭 할 필요는 없다. 지정해주지 않으면 디폴트값이 20임. 
		dataSource.setMaxIdle(10); //대기상태의 Connection 객체의 갯수 변경
		dataSource.setMaxTotal(15); //생성가능한 최대 Connection 객체의 갯수 변경
		//따라서, 이 dataSource안에서 Connection 객체는 최초10개부터 최대 15개까지 만들 수 있다.
		
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head>");
		out.println("<meta charset='UTF-8'>");
		out.println("<title>Servlet</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h1>DBCP(DataBase Connection Pool)</h1>");
		out.println("<hr>");
		try {
			//DataSource.getConnection() : DataSource 객체에 저장된 다수의 Connection 객체중
			//하나를 제공받아 반환하는 메소드
			Connection con=dataSource.getConnection();
			out.println("<p>con = "+con+"</p>");
			out.println("<hr>");
			out.println("<h3>Connection 객체 제공 후</h3>");
			//DataSource.getNumIdle() : : DataSource 객체에 저장된 다수의 Connection 객체 중
			//대기상태의 Connection 객체의 갯수를 반환하는 메소드
			out.println("<p>Idle Connection Number = "+dataSource.getNumIdle()+"</p>");
			//DataSource.getNumActive() : : DataSource 객체에 저장된 다수의 Connection 객체 중
			//사용중인 Connection 객체의 갯수를 반환하는 메소드
			out.println("<p>Active Connection Number = "+dataSource.getNumActive()+"</p>");
			out.println("<hr>");
			con.close();//Connection 객체 제거 - DataSource 객체에서 Connection 객체를 대기상태로 변경
			out.println("<h3>Connection 객체 제거 후</h3>");
			out.println("<p>Idle Connection Number = "+dataSource.getNumIdle()+"</p>");
			out.println("<p>Active Connection Number = "+dataSource.getNumActive()+"</p>");
			
			dataSource.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		out.println("</body>");
		out.println("</html>");
	}
}
