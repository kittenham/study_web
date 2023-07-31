package xyz.itwill07.aop;

//Ⱦ�ܰ��ɸ��(CrossCutting Concern Module) : Ⱦ�ܰ����ڵ�� �ۼ��� �޼ҵ尡 ����� Ŭ���� - Advice Ŭ����
// => Ⱦ�ܰ����ڵ� : ����Ÿ ó�� ����� ������ �������� ����� �����ϴ� ���
// => �α� ó��, ����(����) ó��, Ʈ������ ó��, ���� ó�� ���� ���
public class HewonAdvice {
	//Ÿ�ٸ޼ҵ��� ��� �������� ���ԵǾ� ����� ����� �ۼ��� �޼ҵ� - Before Advice Method
	// => JoinPoint : �ٽɰ����ڵ带 �������� Ⱦ�ܰ����ڵ尡 ���ԵǾ� ���۵� ��ġ�� ǥ��
	//Ÿ�ٸ޼ҵ�(Target Method) : �ٽɰ��ɸ���� �޼ҵ� �� PiuntCut ǥ�������� �����Ǿ� 
	//Ⱦ�ܰ����ڵ尡 ���Ե� �޼ҵ�
	// => PiuntCut ǥ���� : �ٽɰ��ɸ���� �޼ҵ� �� Ư�� �޼ҵ常 �����ϱ� ���� ���
	public void beforeLog() {
		System.out.println("### [before]�ٽɰ����ڵ� ���� �� ���ԵǾ� ����� Ⱦ�ܰ����ڵ� ###");
	}

	public void afterLog() {
		System.out.println("### [after]�ٽɰ����ڵ� ���� �� ������ ���ԵǾ� ����� Ⱦ�ܰ����ڵ� ###");
	}
	
	public void afterReturningLog() {
		System.out.println("### [after-returning]�ٽɰ����ڵ� ���������� ���� �� ���ԵǾ� ����� Ⱦ�ܰ����ڵ� ###");
	}
}