package xyz.itwill05.di;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class StudentApp {
	public static void main(String[] args) {
		System.out.println("=============== Spring Container �ʱ�ȭ �� ===============");
		ApplicationContext context = new ClassPathXmlApplicationContext("05-1_di.xml");
		System.out.println("=============== Spring Container �ʱ�ȭ �� ===============");
		
		System.out.println("==========================================================");


	}
}
