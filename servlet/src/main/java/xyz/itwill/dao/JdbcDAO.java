package xyz.itwill.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import xyz.itwill.dto.GuestDTO;

//JDBC 기능을 제공하는 DAO 클래스가 상속받아 사용하기 위해 작성된 클래스 - 추상클래스
//상속만을 목적으로 만들어진 클래스이다.
// =>


public class JdbcDAO {
	private static DataSource dataSource;
	
	static {
		try {
			dataSource = (DataSource)new InitialContext().lookup("java:comp/env/jdbc/orcle");			
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	public Connection getConnection() throws SQLException{
		return dataSource.getConnection(); //datasource에서 getConnection객체를 반환받아오는
	}
	
	public void close(Connection con) {
		try {
			if(con!=null) con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}	
	}
	
	public void close(Connection con, PreparedStatement pstmt) {
		try {
			if(pstmt!=null) pstmt.close();
			if(con!=null) con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}	
	}
	
	public void close(Connection con, PreparedStatement pstmt, ResultSet rs) {
		try {
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(con!=null) con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}	
	}

	public int insertGuest(GuestDTO guest) {
		// TODO Auto-generated method stub
		return 0;
	}
}