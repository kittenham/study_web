package xyz.itwill05.di;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component(value = "studentService")
public class AnnotationStudentServiceImpl implements StudentService{
	@Autowired   //자동으로 의존성을 주입하는 어노테이션
	private StudentDAO studentDAO;
	

	public AnnotationStudentServiceImpl() {
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public void addStudent(Student stduent) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void modifyStudent(Student stduent) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void removeStudent(int num) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Student getStudent(int num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Student> getStudentList() {
		// TODO Auto-generated method stub
		return null;
	}
	
	

}
