package xyz.itwill05.di;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class AnnotationStudentApp {
	public static void main(String[] args) {
		System.out.println("=============== Spring Container �ʱ�ȭ �� ===============");
		ApplicationContext context=new ClassPathXmlApplicationContext("05-2_collection.xml");
		System.out.println("=============== Spring Container �ʱ�ȭ �� ===============");
		CollectionBean bean=context.getBean("collectionBean", CollectionBean.class);
		//AnnotationStudentServiceImpl service = context.getBean("annotationStudentServiceImpl", StudentService.class);
		AnnotationStudentServiceImpl service = context.studentService
		System.out.println("==========================================================");
		((ClassPathXmlApplicationContext)context).close();		

	}
}
