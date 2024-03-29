package xyz.itwill05.di;

import java.util.List;

public class StudentMybatisDAO implements StudentDAO {
	public StudentMybatisDAO() {
		System.out.println("### StudentMybatisDAO 클래스의 기본 생성자 호출 ###");
	}
	
	@Override
	public int insertStudnet(Student student) {
		System.out.println("*** StudentMybatisDAO 클래스의 insertStudent(Student student) 메소드 호출 ***");
		return 0;
	}

	@Override
	public int updateStudnet(Student student) {
		System.out.println("*** StudentMybatisDAO 클래스의 updateStudent(Student student) 메소드 호출 ***");
		return 0;
	}

	@Override
	public int deleteStudnet(int num) {
		System.out.println("*** StudentMybatisDAO 클래스의 deleteStudent(int num) 메소드 호출 ***");
		return 0;
	}
	
	@Override
	public Student selectStudent(int num) {
		System.out.println("*** StudentMybatisDAO 클래스의 selectStudent(int num) 메소드 호출 ***");
		return null;
	}

	@Override
	public List<Student> selectStudentList() {
		System.out.println("*** StudentMybatisDAO 클래스의 selectStudentList() 메소드 호출 ***");
		return null;
	}


}