package xyz.itwill.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.catalina.authenticator.DigestAuthenticator.AuthDigest;

import xyz.itwill.dto.GuestDTO;

//Guest 테이블에 행을 삽입, 변경, 삭제, 검색 하기위한 기능을 제공하는 클래스
public class GuestDAO extends JdbcDAO{
	private static GuestDAO _dao;
	
	public GuestDAO() {

	}
	
	static {
		_dao=new GuestDAO();
	}
	
	public static GuestDAO getDao() {
		return _dao;
	}
	

	//방명록 게시글 정보를 전달받아 GUEST 테이블에 삽입하고 삽입행의 갯수를 반환받는 메소드
	public int insertGuest(GuestDTO guest){
		Connection con = null;
		PreparedStatement pstmt = null;
		int rows=0;
		try{
			con=getConnection();

			String sql="insert into guest values(gest_sql.nextval,?,?,?,sysdate)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, guest.getWriter());
			pstmt.setString(2, guest.getSubject());
			pstmt.setString(3, guest.getContent());			

			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]insertGuest() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	
	//방명록 게시글 정보를 전달받아 GUEST 테이블에 변경하고 변경행의 갯수를 반환받는 메소드
	public int updateGuest(GuestDTO guest){
		Connection con = null;
		PreparedStatement pstmt = null;
		int rows=0;

		try{
			con=getConnection();
			
			String sql="update guest set writer=?, subject=?, content=? where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, guest.getWriter());
			pstmt.setString(2, guest.getSubject());
			pstmt.setString(3, guest.getContent());
			pstmt.setInt(4,guest.getNum());
		
			rows=pstmt.executeUpdate();
		} catch(SQLException e){
			System.out.println("[에러]updateGuest() 메소드의 SQL 오류 = "+e.getMessage());
		} finally{
			close(con,pstmt);
		}
		return rows;
	}
	
	//방명록 게시글 정보를 전달받아 GUEST 테이블에 삭제하고 삭제행의 갯수를 반환받는 메소드
	public int deleteGuest(int num){
		Connection con = null;
		PreparedStatement pstmt = null;
		int rows=0;
		try{
			con=getConnection();
			
			String sql="delete from guest where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);

			rows=pstmt.executeUpdate();
		} catch(SQLException e){
			System.out.println("[에러]deleteGuest() 메소드의 SQL 오류 = "+e.getMessage());
		} finally{
			close(con,pstmt);
		}
		return rows;
	}

	
	//방명록 게시글 정보를 전달받아 GUEST 테이블에 검색하고 검색행의 갯수를 반환받는 메소드
	//행하나만을 반환(DTO하나만을 반환)
	public GuestDTO selectGuest(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		GuestDTO guest = null;
		
		try {
			con = getConnection();
			
			String sql="select * from guest where num=?";
			pstmt.setInt(1, num);
			
			rs=pstmt.executeQuery(); //처리결과를 rs안에 저장.
			
			//rs안에 처리행이 있을때만 반환
			if(rs.next()){
				guest=new GuestDTO();
				guest.setNum(rs.getInt("num"));
				guest.setWriter(rs.getString("writer"));
				guest.setSubject(rs.getString("subject"));
				guest.setContent(rs.getString("content"));
				guest.setRegdate(rs.getString("regdate"));				
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectGuest() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return guest;
	}
	
	
	//GUEST 테이블에 저장된 모든 행을 검색하여 반환하는 메소드
	public List<GuestDTO> selectGuestList() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<GuestDTO> guestList=new ArrayList<>();
		try {
			con=getConnection();
			
			String sql="select * from guest order by num desc";
			pstmt=con.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				GuestDTO guest=new GuestDTO();
				guest.setNum(rs.getInt("num"));
				guest.setWriter(rs.getString("writer"));
				guest.setSubject(rs.getString("subject"));
				guest.setContent(rs.getString("content"));
				guest.setRegdate(rs.getString("regdate"));
				
				guestList.add(guest);
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectGuestList() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return guestList;
	}
	
}