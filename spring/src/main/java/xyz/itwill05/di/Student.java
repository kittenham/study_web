package xyz.itwill05.di;

//
public class Student {
	private int num;
	private String name;
	private String email;
	
	public Student() {
		System.out.println("### Student 클래스의 기본 생성자 호출 ###");
	}

	public Student(int num) {
		super();
		this.num = num;
		System.out.println("### Student 클래스의 매개변수(학번)이 선언된 생성자 호출 ###");
	}

	/*
	public Student(String name) {
		super();
		this.name = name;
	}
	*/

	public Student(int num, String name) {
		super();
		this.num = num;
		this.name = name;
		System.out.println("### Student 클래스의 매개변수(학번, 이름)이 선언된 생성자 호출 ###");
	}

	public Student(int num, String name, String email) {
		super();
		this.num = num;
		this.name = name;
		this.email = email;
		System.out.println("### Student 클래스의 매개변수(학번, 이름, 이메일)이 선언된 생성자 호출 ###");
	}
	
	
	
}
