package xyz.itwill.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import xyz.itwill.dto.StudentDTO;

public class StudentDAO extends JdbcDAO{
	private static StudentDAO _dao;
	
	private StudentDAO() {

	}

	static {
		_dao=new StudentDAO();
	}
	//정적영역에 객체 생성 저장(딱 한번만 가능)
	
	public static StudentDAO getDAO() {
		return _dao;
	}
	
	//학생정보를 전달받아 
	public int insertStudent(StudentDTO student) {
		Connection con=null;
		PreparedStatement pstmt = null;
		int rows=0;
		
		try {
			con=getConnection();
			
			String sql="insert into student values(?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, student.getNo());
			pstmt.setString(2, student.getName());
			pstmt.setString(3, student.getPhone());
			pstmt.setString(4, student.getAddress());
			pstmt.setString(5, student.getBirthday());
			
			rows=pstmt.executeUpdate();
		}catch (SQLException e) {
			System.out.println("[에러] insertStudent() 메소드의 SQL 오류 = "+e.getMessage());
		}finally {
			close(con, pstmt);
		}
		return rows;

	}

	public int updateStudent(StudentDTO student) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int rows=0;
		
		try {
			con=getConnection();
			
			String sql="update Student set name=?, phone=?, adress=?, birthday=? where no=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, student.getName());
			pstmt.setString(2, student.getPhone());
			pstmt.setString(3, student.getAddress());
			pstmt.setString(4, student.getBirthday());
			pstmt.setInt(5, student.getNo());
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[오류]");
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	

	//학번을 전달받아 STUDENT 테이블에 저장된 학생정보를 삭제하고 삭제행의 갯수를 반환하는 메소드
	public int deleteStudent(int no) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="delete from student where no=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, no);
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]deleteStudent() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	//학번을 전달받아 STUDENT 테이블에 저장된 학생정보를 검색하여 DTO 객체로 반환하는 메소드
	public StudentDTO selectStudent(int no) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		StudentDTO studnet=null;
		try {
			con=getConnection();
			
			String sql="select * from student where no=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, no);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				studnet=new StudentDTO();
				studnet.setNo(rs.getInt("no"));
				studnet.setName(rs.getString("name"));
				studnet.setPhone(rs.getString("phone"));
				studnet.setAddress(rs.getString("address"));
				studnet.setBirthday(rs.getString("birthday"));
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectStudent() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return studnet;
	}

	//STUDENT 테이블에 저장된 모든 학생정보를 검색하여 List 객체로 반환하는 메소드
	public List<StudentDTO> selectStudentList() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<StudentDTO> studnetList=new ArrayList<>();
		try {
			con=getConnection();
			
			String sql="select * from student order by no";
			pstmt=con.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				StudentDTO studnet=new StudentDTO();
				studnet.setNo(rs.getInt("no"));
				studnet.setName(rs.getString("name"));
				studnet.setPhone(rs.getString("phone"));
				studnet.setAddress(rs.getString("address"));
				studnet.setBirthday(rs.getString("birthday"));
				
				studnetList.add(studnet);
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectStudentList() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return studnetList;
	}
}
