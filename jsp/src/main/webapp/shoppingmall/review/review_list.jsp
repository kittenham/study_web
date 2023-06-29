<%@page import="xyz.itwill.dto.MemberDTO"%>
<%@page import="xyz.itwill.dto.ReviewDTO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.List"%>
<%@page import="xyz.itwill.dao.ReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- REVIEW 테이블에 저장된 게시글을 검색하여 게시글 목록을 클라이언트에게 전달하여 응답하는 jsp 문서이다. --%>
<%-- => 게시글을 페이지로 구분하여 검색처리한다. =>> 페이징 처리 --%>
<%
	//검색 처리에 필요한 전달값(검색대상과 검색단어)을 반환받아 저장
	String search=request.getParameter("search"); //요청되는 값 중 search라는 이름으로 반환받는 값을 search 변수에 저장
	if(search==null){
		search="";
	}
	String keyword=request.getParameter("keyword");
	if(keyword==null){
		keyword="";
	}

	//페이징 처리에 필요한 전달값(요청페이지 번호)을 반환받아 저장
	int pageNum = 1; 	// => 클라이언트가 페이지 목록을 전달하지 않았으면(=전달값이 없으면), 1번째 페이지의 게시글 목록을 검색하여 응답한다.
	if(request.getParameter("pageNum")!=null){ //페이지 처리 전달값이 있는 경우
		pageNum = Integer.parseInt(request.getParameter("pageNum"));
	}
	
	//하나의 페이지에 검색되어 출력될 게시글의 갯수 설정 - 전달값으로 반환받아 저장 가능
	int pageSize=10; //한 페이지당 게시글 10개만 출력하겠다.
	
	
	//REVIEW 테이블에 저장된 게시글 중 검색처리된 전체 게시글의 개수를 검색하여 반환하는 
	//DAO 클래스의 메소드를 호출
	// => 게시글 검색기능 미구현시 호출되는 메소드
	int totalReview=ReviewDAO.getDao().selectReviewCount(search, keyword);
	
	
	//전체 페이지의 개수를 계산하여 저장한다.
	//int totalPage=totalReview/pageSize; // 99/9=9(정수니까) 안됨. 왜냐면 90개인 경우 9페이지만 잇으면 되지만 91페이지의 경우에는 10페이지가 필요하기 때문.
	//따라서 사용할 수 있는 방법1.  삼항연산자 이용하기
	//int totalPage=totalReview/pageSize + totalReview%pageSize == 0 ? 0 : 1;
	//사용할 수 있는 방법2.  Math.ceil() 메소드 이용하기.
	int totalPage=(int)Math.ceil((double)totalReview/pageSize);
	
	
	//전달받은 페이지 번호가 비정상적인 경우
	if(pageNum<=0 || pageNum>totalPage){
		pageNum=1; //1번째 페이지의 게시글 목록을 검색처리 한다. 전달값이 잘못되었더라도 꼭 에러페이지를 띄울는 필요없음.(물론 에러띄워도됨.)
	}
	
	
	//요청한 페이지 번호에 대한 시작 게시글의 행번호를 계산하여 저장
	//ex) 클라이언트가 1page를 요청 했으면 : 1행부터 검색
	//	  클라이언트가 2page를 요청 했으면 : 11행부터 검색
	//	  클라이언트가 3page를 요청 했으면 : 21행부터 검색
	//	  클라이언트가 4page를 요청 했으면 : 31행부터 검색
	int startRaw=(pageNum-1)*pageSize+1; //시작행번호 변수 선언&초기화(간단한 공식으로 사용할 수 있음.)
	
	
	//요청한 페이지 번호에 대한 종료 게시글의 행번호를 계산하여 저장
	//ex) 클라이언트가 1page를 요청 했으면 : 10행부터 검색
	//	  클라이언트가 2page를 요청 했으면 : 20행부터 검색
	//	  클라이언트가 3page를 요청 했으면 : 30행부터 검색
	//	  클라이언트가 4page를 요청 했으면 : 40행부터 검색
	int endRaw=pageNum*pageSize;
	//하지만 마지막 페이지의 종료 행번호가 검색 게시글의 개수보다 많은 경우, 종료행번호를 전체게시글의 개수로 바꾼다.
	if(endRaw>totalReview){
		 endRaw=totalReview; 
	}
	
	
	//페이징 처리 관련 정보와 게시글 검색 기능 관련 정보를 전달하여 REVIEW 테이블에 저장된 
	//게시글 목록을 검색하여 List 객체로 반환하는 DAO 클래스의 메소드 호출
	List<ReviewDTO> reviewList = ReviewDAO.getDao().selectReviewList(startRaw, endRaw, search, keyword);
	
	
	//세션에 저장된 권한 관련 속성값을 객체로 반환받아 저장한다.
	// => 로그인 상태의 사용자에게만 글쓰기 권한을 제공하기 위해서.
	MemberDTO loginMember=(MemberDTO)session.getAttribute("loginMember");

%>
<h1>제품후기 목록</h1>