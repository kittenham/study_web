package xyz.itwill05.di;

import java.util.List;

import org.springframework.stereotype.Component;

@Component
public class AnnotationStudentMybatisDAO implements StudentDAO{
	public AnnotationStudentMybatisDAO() {
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

	@Override
	public int insertStudent(Student student) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateStudent(Student student) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteStudent(int num) {
		// TODO Auto-generated method stub
		return 0;
	}	

	
}
