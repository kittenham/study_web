package xyz.itwill05.di;

import java.util.List;

public class AnnotationStudentJdbcDAO implements StudentDAO{

	public AnnotationStudentJdbcDAO() {
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public int insertStudnet(Student student) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateStudnet(Student student) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteStudnet(int num) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Student selectStudent(int num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Student> selectStudentList() {
		// TODO Auto-generated method stub
		return null;
	}

}
