package xyz.itwill05.di;

import java.util.List;

public class AnnotationStudentServiceImpl implements StudentService{
	
	private StudentDAO studentDAO;
	

	public AnnotationStudentServiceImpl() {
		// TODO Auto-generated constructor stub
	}
	
	public StudentDAO getStudentDAO() {
		return studentDAO;
	}
	
	public void setStudentDAO(StudentDAO studentDAO) {
		this.studentDAO = studentDAO;
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
