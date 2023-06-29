<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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
	int totalReview=ReviewDAO.getDAO().selectReviewCount(search, keyword);
	
	
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
	List<ReviewDTO> reviewList = ReviewDAO.getDAO().selectReviewList(startRaw, endRaw, search, keyword);
	
	
	//세션에 저장된 권한 관련 속성값을 객체로 반환받아 저장한다.
	// => 필요이유 1) 로그인 상태의 사용자에게만 글쓰기 권한을 제공하기 위해서.
	// => 필요이유 2) 비밀글인 경우 로그인 상태의 사용자가 게시글 작성자이거나 관리인인 경우에만 사용권한을 제공하기 위해서
	MemberDTO loginMember=(MemberDTO)session.getAttribute("loginMember");

	
	//서버 시스템의 현재 날짜를 제공받아 저장한다.
	// => 필요이유) 게시글 작성 날짜와 현재 날짜를 비교하여 게시글의 작성날짜를 다르게 출력되도록 응답처리하기 위해여
	String currentDate = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
	
	
	//페이지에 출력될 게시글 일련번호 시작값을 계산하여 저장
	// => 검색 게시글의 개수 : ex. 총 91개 일때 >> [1page : 91~82], [2page : 81~72], [1page : 71~62], ...
	int printNum=totalReview-(pageNum-1)*pageSize;
	
%>

<style type="text/css">
#review_list {
	width: 1000px;
	margin: 0 auto;
	text-align: center;
}

#review_title {
	font-size: 1.2em;
	font-weight: bold;
}

table {
	margin: 5px auto;
	border: 1px solid black;
	border-collapse: collapse;
}

th {
	border: 1px solid black;
	background: black;
	color: white;
}

td {
	border: 1px solid black;
	text-align: center;	
}

.subject {
	text-align: left;
	padding: 5px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

#review_list a:hover {
	text-decoration: none; 
	color: blue;
	font-weight: bold;
}

.subject_hidden {
	background: black;
	color: white;
	font-size: 14px;
	border: 1px solid black;
	border-radius: 4px;
}

#page_list {
	font-size: 1.1em;
	margin-bottom: 10px;
}

#page_list a:hover {
	font-size: 1.3em;
}
</style>
<h1>제품후기</h1>
<div id="review_list">
	<div id="review_title">제품후기 목록(<%=totalReview %>)</div>
	
	<% if(loginMember!=null) { %>
	<div style="text-align: right;">
		<button type="button">글쓰기</button>
	</div>
	<% } %>
	
	<%-- 게시글 목록 출력 --%>
	<table>
		<tr>
			<td width="100">글번호</td>
			<td width="200">제목</td>
			<td width="300">작성자</td>
			<td width="400">조회수</td>
			<td width="500">작성일</td>
		</tr>
		
		<% if(totalReview==0) { %>
			<tr>
			<td colspan="5">검색된 게시글이 없습니다.</td>
			</tr>
		<% } else { %>
			<% for(ReviewDTO review:reviewList) { %>
			<tr>
				<%-- 게시글 일련번호 : review 테이블의 글번호가 아닌 게시글 일련번호로 응답 --%>
					<%-- 글번호는 식별자일 뿐 출력은 되지 않기 때문에 웹 페이지에서 일련번호를 부여해 출력해주는 것 --%>
				<td><%=printNum %></td>
				<% printNum--; %> <%-- 게시글 일련번호를 1씩 감소하여 전달 --%>
				
				<%-- 제목 --%>
				<td class="subject">
					<%-- 게시글이 답글인 경우에 대한 응답 처리 --%>
					<% if(review.getRestep()!=0) {//검색된 게시글이 답글인 경우 %>
						<%-- 게시글의 깊이를 제공받아 왼쪽 여백 설정 --%>
						<span style="margin-left: <%=review.getRelevel()*20%>px;">└[답글]</span>
					<% } %>
					<%-- 게시글의 상태를 비교하여 제목과 링크를 구분하여 응답 처리 --%>
					<% if(review.getStatus()==1) {//일반 게시글인 경우 %>
						<a href="#"><%=review.getSubject()%></a>					
					<% } else if(review.getStatus()==2) {//비밀 게시글인 경우 %>
						<span class="subject_hidden">비밀글</span>
						<%-- 로그인 상태의 사용자가 게시글 작성자이거나 관리자인 경우 --%>
						<% if(loginMember!=null && (loginMember.getId().equals(review.getId()) || loginMember.getMemberStatus()==9)) { %>)
							<a href="#"><%=review.getSubject()%></a>					
						<% } else { %>
							게시글 작성자 또는 관리자만 확인 가능합니다.
						<% } %>
					<% } else if(review.getStatus()==0) {//삭제 게시글인 경우 %>
						<span class="subject_hidden">삭제글</span>
						작성자 또는 관리자에 의해 삭제된 게시글입니다.
					<% } %>
				</td>
				
				<% if(review.getStatus()!=0) {//삭제 게시글이 아닌 경우 %>
				<%-- 작성자 --%>
				<td><%=review.getName() %></td>
				
				<%-- 조회수 --%>
				<td><%=review.getReadcount() %></td>
				
				<%-- 작성일 : 오늘 작성된 게시글은 시간만 출력하고 오늘 작성된 게시글이 아닌 경우 날짜와 시간 출력 --%>
				<td>
					<% if(currentDate.equals(review.getRegdate().substring(0, 10))) {//오늘 작성된 게시글인 경우 %>
						<%=review.getRegdate().substring(11) %>
					<% } else {//오늘 작성된 게시글이 아닌 경우 %>
						<%=review.getRegdate() %>
					<% } %>		
				</td>
				<% } else {//삭제 게시글인 경우 %>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<% } %>
			</tr>	
			<% } %>
		<% } %>
	</table>
	
	
	<%-- 페이지 번호 출력 및 링크 제공 (-> 블럭화 처리를 해 페이징처리처럼 해줄 것임) --%>
	<%
		//하나의 페이지 블록에 출력될 페이지 번호의 개수
		int blockSize = 5;
		
		//페이지 블록에 출력될 시작 페이지 번호를 계산하여 저장
		//ex) 1 Block 일때 : 1
		//	  2 Block 일때 : 6
		//	  3 Block 일때 : 11 , ...
		int startPage=(pageNum-1)/blockSize*blockSize+1;
		
		//페이지 블록에 출력될 종료 페이지 번호를 계산하여 저장
		//ex) 1 Block 일때 : 5
		//	  2 Block 일때 : 10
		//	  3 Block 일때 : 15 , ...
		int endPage=startPage+blockSize-1;
		if(endPage>totalPage) {
			endPage=totalPage;
		}
	%>
	<div id="page_list">
	<% if(startPage>blockSize) { %>
		<a href="<%=request.getContextPath()%>/shoppingmall/index.jsp?group=review&worker=review_list&pageNum=1&search=<%=search%>&keyword=<%=keyword%>">[처음]</a>
		<a href="<%=request.getContextPath()%>/shoppingmall/index.jsp?group=review&worker=review_list&pageNum=<%=startPage-blockSize%>&search=<%=search%>&keyword=<%=keyword%>">[이전]</a>
	<% } else { %>
		[처음][이전]
	<% } %>
	
	<% for(int i=startPage;i<=endPage;i++) { %>
		<% if(pageNum!=i) { %>
			<%-- 요청 페이지 번호와 이벤트가 발생된 페이지 번호가 다른 경우 링크 제공 --%>
			<a href="<%=request.getContextPath()%>/shoppingmall/index.jsp?group=review&worker=review_list&pageNum=<%=i%>&search=<%=search%>&keyword=<%=keyword%>">[<%=i %>]</a>
		<% } else { %>
			<%-- 요청 페이지 번호와 이벤트가 발생된 페이지 번호가 같은 경우 링크 미제공 --%>
			[<%=i %>]
		<% } %>
	<% } %>
	
	<% if(endPage!=totalPage) { %>
		<a href="<%=request.getContextPath()%>/shoppingmall/index.jsp?group=review&worker=review_list&pageNum=<%=startPage+blockSize%>&search=<%=search%>&keyword=<%=keyword%>">[다음]</a>
		<a href="<%=request.getContextPath()%>/shoppingmall/index.jsp?group=review&worker=review_list&pageNum=<%=totalPage%>&search=<%=search%>&keyword=<%=keyword%>">[마지막]</a>
	<% } else { %>
		[다음][마지막]
	<% } %>
	</div>
	
	<%-- 사용자로부터 검색어를 입력받아 게시글 검색 기능 구현 --%>
	<form action="<%=request.getContextPath()%>/shoppingmall/index.jsp?group=review&worker=review_list" method="post">
		<%-- select 태그를 사용하여 검색대상을 선택해 컬럼명을 전달 --%>
		<select name="search">
			<option value="name" selected="selected">&nbsp;작성자&nbsp;</option>
			<option value="subject">&nbsp;제목&nbsp;</option>
			<option value="content">&nbsp;내용&nbsp;</option>
		</select>
		<input type="text" name="keyword">
		<button type="submit">게시글 검색</button>
	</form>
</div>
