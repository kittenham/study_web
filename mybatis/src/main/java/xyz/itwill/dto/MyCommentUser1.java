package xyz.itwill.dto;

//MYCOMMENT 테이블(메인테이블)과 MYUSER 테이블(서브테이블)의 검색결과를 저장하기 위한 클래스
//=> 1:1 관계의 테이블 조인에 대한 검색결과를 저장하기 위한 클래스
//=> 메인테이블에 기반하여 만들어야한다.
public class MyCommentUser1 {
	//MYCOMMENT 테이블의 컬럼값을 저장하기 위한 필드 -> 검색행 1개
	private int commentNo;
	private String commentId;
	private String commentContent;
	private String commentDate;
		
	//MYUSER 테이블의 컬럼값을 저장하기 위한 필드 -> 검색행 1개
	private String userId;
	private String userName;
	
	public MyCommentUser1() {
		// TODO Auto-generated constructor stub
	}

	public MyCommentUser1(int commentNo, String commentId, String commentContent, String commentDate, String userId,
			String userName) {
		super();
		this.commentNo = commentNo;
		this.commentId = commentId;
		this.commentContent = commentContent;
		this.commentDate = commentDate;
		this.userId = userId;
		this.userName = userName;
	}

	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	public String getCommentId() {
		return commentId;
	}

	public void setCommentId(String commentId) {
		this.commentId = commentId;
	}

	public String getCommentContent() {
		return commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	public String getCommentDate() {
		return commentDate;
	}

	public void setCommentDate(String commentDate) {
		this.commentDate = commentDate;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	
	
	
}
