package xyz.itwill05.di;

import java.util.List;

//DAO Ŭ���� : �����ü(File, DBMS ��)�� ���� ����,����,����,�˻� ����� �����ϴ� Ŭ����
// => �����ü�� ���� �Ǵ� ����� ���� DAO Ŭ���� ���� ����
// => DAO Ŭ������ ����ŵ� DAO Ŭ������ ����ϴ� Ŭ����(Service Ŭ����)�� ������ �ּ�ȭ
//�ϱ� ���� �ݵ�� �������̽��� ��ӹ޾� �ۼ� - ���յ��� ���� ���������� ȿ���� ����
public class StudentJdbcDAO implements StudentDAO {
	
	public StudentJdbcDAO() {
		System.out.println("### StudentJdbcDAO Ŭ������ �⺻ ������ ȣ�� ###");
	}

	@Override
	public int insertStudnet(Student student) {
		System.out.println("*** StudentJdbcDAO Ŭ������ insertStudent(Student student) �޼ҵ� ȣ�� ***");
		return 0;
	}

	@Override
	public int updateStudnet(Student student) {
		System.out.println("*** StudentJdbcDAO Ŭ������ updateStudent(Student student) �޼ҵ� ȣ�� ***");
		return 0;
	}

	@Override
	public int deleteStudnet(int num) {
		System.out.println("*** StudentJdbcDAO Ŭ������ deleteStudent(int num) �޼ҵ� ȣ�� ***");
		return 0;
	}

	@Override
	public Student selectStudent(int num) {
		System.out.println("*** StudentJdbcDAO Ŭ������ selectStudent(int num) �޼ҵ� ȣ�� ***");
		return null;
	}

	@Override
	public List<Student> selectStudentList() {
		System.out.println("*** StudentJdbcDAO Ŭ������ selectStudentList() �޼ҵ� ȣ�� ***");
		return null;
	}


}