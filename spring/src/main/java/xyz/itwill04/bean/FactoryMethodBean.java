package xyz.itwill04.bean;

//�̱��� ������ ������ �����Ͽ� �ۼ��� Ŭ���� - �̱��� Ŭ����(Singleton Class)
// => ���α׷��� �ʿ��� ��ü�� �ϳ��� �����ϱ� ���� ������ Ŭ������ �ۼ��� �� ����ϴ� ������ ����
public class FactoryMehodBean {
	private static FactoryMehodBean _bean;
	
	private FactoryMehodBean() {
		System.out.println("### FactoryMehodBean Ŭ������ �⺻ ������ ȣ�� ###");
	}
	
	static {
		_bean=new FactoryMehodBean();
	}
	
	public static FactoryMehodBean getFactoryMehodBean() {
		return _bean;
	}
}