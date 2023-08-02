package xyz.itwill08.dao;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class StudentApp {
	public static void main(String[] args) {
		ApplicationContext context=new ClassPathXmlApplicationContext("08_dao.xml");
		StudentService service=context.getBean("studentService", StudentService.class);
		System.out.println("==========================================================");
		/*
		Student newStudent=new Student();
		newStudent.setNo(6000);
		newStudent.setName("ȫ�淡");
		newStudent.setPhone("010-3189-9622");
		newStudent.setAddress("����� ������");
		newStudent.setBirthday("1999-05-05");
		service.addStudent(newStudent);
		*/
		
		/*
		Student searchStudent=service.getStudent(6000);
		System.out.println(searchStudent);//toString() �޼ҵ带 ȣ���Ͽ� �ʵ尪�� ��ȯ�޾� ��� 
		searchStudent.setName("�κ���");
		searchStudent.setBirthday("1999-02-05");
		service.modifyStudent(searchStudent);
		*/
		
		service.removeStudent(6000);
		
		List<Student> studentList=service.getStudentList();
		for(Student student : studentList) {
			System.out.println("�й� = "+student.getNo()+", �̸� = "+student.getName()
					+", ��ȭ��ȣ = "+student.getPhone()+", �ּ� = "+student.getAddress()
					+", ������� = "+student.getBirthday().substring(0, 10));
		}
		System.out.println("==========================================================");
		((ClassPathXmlApplicationContext)context).close();
	}
}