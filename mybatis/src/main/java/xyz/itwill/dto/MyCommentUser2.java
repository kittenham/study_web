package xyz.itwill.dto;

//MYCOMMENT 테이블(메인테이블)과 MYUSER 테이블(서브테이블)의 검색결과를 저장하기 위한 클래스
//=> 1:1 관계의 테이블 조인에 대한 검색결과를 저장하기 위한 클래스
//=> 메인테이블에 기반하여 만들어야한다.

//* 이 클래스는 포함관계를 이용하여 클래스를 작성했다.
//=> 좋은 이유 : 기존에 선언된 클래스를 재사용하여 새로운 클래스를 빠르게 작성할 수 있다.
//				 따라서 생산성 및 유지보수의 효율성이 증가한다.
//=> 이 방법은 무조건 <<수동매핑>>만 가능하다! (이유는 바로 밑에있음)
public class MyCommentUser2 {
	//MYCOMMENT 테이블(게시글 정보)의 검색행을 객체로 제공받아 저장하기 위한 필드 -> 검색행 1개
	//=> 필드에 반드시 객체를 저장해야만 포함관계가 성립한다. 
	//	 따라서 반드시 객체를 저장하기 위해 수동매핑을 이용해야한다.
	private MyComment1 comment;
		
	//MYUSER 테이블(회원정보)의 컬럼값을 저장하기 위한 필드 -> 검색행 1개
	private MyUser user;
	
	public MyCommentUser2() {
		// TODO Auto-generated constructor stub
	}

	public MyCommentUser2(MyComment1 comment, MyUser user) {
		super();
		this.comment = comment;
		this.user = user;
	}

	public MyComment1 getComment() {
		return comment;
	}

	public void setComment(MyComment1 comment) {
		this.comment = comment;
	}

	public MyUser getUser() {
		return user;
	}

	public void setUser(MyUser user) {
		this.user = user;
	}
	
	
}