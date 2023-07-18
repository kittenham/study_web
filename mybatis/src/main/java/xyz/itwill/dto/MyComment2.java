package xyz.itwill.dto;

//테이블의 컬럼명과 다른 이름으로 클래스의 필드명을 작성한 클래스 -> 수동 매핑처리할 수 있도록 만들어보자
public class MyComment2 {
	private int no;
	private String id;
	private String content;
	private String date;
	
	
	public MyComment2() {
		// TODO Auto-generated constructor stub
	}


	public MyComment2(int no, String id) {
		super();
		this.no = no;
		this.id = id;
	}


	public MyComment2(int no, String id, String content, String date) {
		super();
		this.no = no;
		this.id = id;
		this.content = content;
		this.date = date;
	}


	public int getNo() {
		return no;
	}


	public void setNo(int no) {
		this.no = no;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public String getDate() {
		return date;
	}


	public void setDate(String date) {
		this.date = date;
	}
	
	
	
	
}
