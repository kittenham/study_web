package xyz.itwill04.bean;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
 
//Spring �����ӿ�ũ������ BeanFactory ��ü �Ǵ� ApplicationContext ��ü�� ������ �����̳�
//(Spring Container) ��� ����
// => ������ �����̳ʴ� ȯ�漳������(Spring Bean Configuration File - XML)�� Ŭ������ �����޾� 
//Spring Bean(��ü) ����
public class CreateBeanApp {
	public static void main(String[] args) {
		System.out.println("1.BeanFactory ��ü�� �����Ͽ� ������ �����̳ʷ� ����ϴ� ���");
		System.out.println("=============== Spring Container �ʱ�ȭ �� ===============");
		BeanFactory factory=new XmlBeanFactory(null);
		System.out.println("=============== Spring Container �ʱ�ȭ �� ===============");
	} 
}