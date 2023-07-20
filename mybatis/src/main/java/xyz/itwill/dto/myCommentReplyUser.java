package xyz.itwill.dto;

import java.util.List;

//
public class myCommentReplyUser {
	//여기는 객체가 아니라 값을 저장하는 필드를 생성해보자(아이디를 작성해야하기 때문에)
	//
	private int commentNo;
	private String commentId;
	private String commentContent;
	private String commentDate;
	
	//여기는 객체를 필드에 저장
	//
	private MyUser user;
	
	//여기도 List 객체를 필드에 저장
	//
	private List<MyReplyUser> replyUserList;
	
	//테이블의 수는 3개지만 네 개의 검색결과를 출력하도록 만든 것이다~(테이블은 3개이지만 네번 조인하면 됨)
	
	public myCommentReplyUser() {
		// TODO Auto-generated constructor stub
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

	public MyUser getUser() {
		return user;
	}

	public void setUser(MyUser user) {
		this.user = user;
	}

	public List<MyReplyUser> getReplyUserList() {
		return replyUserList;
	}

	public void setReplyUserList(List<MyReplyUser> replyUserList) {
		this.replyUserList = replyUserList;
	}
	
	
	
	
}
