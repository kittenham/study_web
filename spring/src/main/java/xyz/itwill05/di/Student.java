package xyz.itwill05.di;

//
public class Student {
	private int num;
	private String name;
	private String email;
	
	public Student() {
		System.out.println("### Student Ŭ������ �⺻ ������ ȣ�� ###");
	}

	public Student(int num) {
		super();
		this.num = num;
		System.out.println("### Student Ŭ������ �Ű�����(�й�)�� ����� ������ ȣ�� ###");
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
		System.out.println("### Student Ŭ������ �Ű�����(�й�, �̸�)�� ����� ������ ȣ�� ###");
	}

	public Student(int num, String name, String email) {
		super();
		this.num = num;
		this.name = name;
		this.email = email;
		System.out.println("### Student Ŭ������ �Ű�����(�й�, �̸�, �̸���)�� ����� ������ ȣ�� ###");
	}
	
	
	
}
