package xyz.itwill.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import xyz.itwill.dto.ReviewDTO;

public class ReviewDAO extends JdbcDAO{
	private static ReviewDAO _dao;
	
	private ReviewDAO() {
		// TODO Auto-generated constructor stub
	}
	
	static{
		_dao=new ReviewDAO();
	}
	
	public static ReviewDAO getDao() {
		return _dao;
	}
	
	//검색관련 정보를 전달받아 REVIEW 테이블에 저장된 게시글 중 
	//검색처리된 전체 게시글의 개수를 검색하여 반환하는 메소드 호출
	public int selectReviewCount(String search, String keyword) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int count=0;
		
		try {
			con=getConnection();
			
			//매개변수에 저장된 값을 비교하여 DBMS 서버에 다른 SQL 명령을 전달하여 실행한다.
			// => 동적 SQL (=DynamicSQL) 기능
			if(keyword.equals("")) { //게시글 검색기능을 사용하지 않은경우(키워드 값이 nullString일 때).
				String sql = "select count(*) from review"; //review 테이블에 저장된 모든 count 값(전체 게시글의 개수)을 검색할 수 있다. - 삭제글도 출력가능
			} else { //게시글 검색기능을 사용한 경우.
				//검색대상(컬럼명)에 검색단어가 포함한 게시글의 갯수를 검색한다. - 삭제글 제외
				String sql="select coutn(*) from review where "+search+" like '%'||?||'%' and status<>0";
				//'%'||?||'%' => 글 속에 ?가 포함되는 문자열
				//status<>0 => 삭제글(0)을 제외한다는 뜻
				
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, keyword); //키워드가 포함된 값을 저장할 것이다.
			}
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				count=rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("[에러]");
		} finally {
			close(con, pstmt, rs);
		}
		
		return count;
	}
	
	//페이징 처리관련 정보와 게시글 검색 기능 관련 정보를 전달하여 REVIEW 테이블에 저장된
	//게시글 목록을 검색하여 List 객체로 반환하는 DAO 클래스의 메소드 호출
	public List<ReviewDTO> selectReviewList(int startRaw, int endRaw, String search, String keyword){ //매개변수 4개 전달받을 것
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ReviewDTO> reviewList=new ArrayList();
		
		try {
			con=getConnection();
			
			if(keyword.equals("")) { //게시글 검색 기능을 사용하지 않은 경우
				String sql="select * from (select rownum rn, temp.* from (select num, "
						+ "number, id, name, subject, content, regdate, readcount, ref, restep, relevel, ip, status "
						+ "from review join member on review.id=member.id "
						+ "order by ref desc, restep) temp) where rn between ? and ?";
				/* 행번호를 붙이는 rownum 키워드는 order by보다 먼저 실행되기 때문에 order by가 실행되면 정렬 순서 숫자가 뒤죽박죽 된다.
				 * 따라서 order by 부분을 괄호로 먼저 처리 후 rownum이 실행을 시켜야 한다.
				 * rn= rownum의 행번호
				 * temp 테이블에서 rownum의 모든 행을 검색
				 */

				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, startRaw);
				pstmt.setInt(2, endRaw);
			} else { //게시글 검색 기능을 사용한 경우
				String sql="select count(*) from reivew order by";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, keyword);
			}
			
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				ReviewDTO review = new ReviewDTO();
				review.setNum(rs.getInt("num"));
				review.setName(rs.getString("name"));
				review.setSubject(rs.getString("subject"));
				review.setContent(rs.getString("content"));
				review.setRegdate(rs.getString("regdate"));
				review.setReadcount(rs.getInt("readcount"));
				review.setRef(rs.getInt("ref"));
				review.setRestep(rs.getInt("restep"));
				review.setRelevel(rs.getInt("relevel"));
				review.setIp(rs.getString("ip"));
				review.setStatus(rs.getInt("status"));
				reviewList.add(review);
				
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectReviewList() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return reviewList;
	}
}


