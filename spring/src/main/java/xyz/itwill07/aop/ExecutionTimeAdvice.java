package xyz.itwill07.aop;

import org.aspectj.lang.ProceedingJoinPoint;

public class ExecutionTimeAdvice {
	//Ÿ�ٸ޼ҵ��� ����� ����Ǵ� ó���ð��� ����Ͽ� ����ϱ� ���� �޼ҵ�
	public Object timeWatchLog(ProceedingJoinPoint joinPoint) { //��ȯ���� Object
		
		//Ÿ�ٸ޼ҵ��� ��� �������� ���۵� ��� �ۼ�
		long startTime=System.currentTimeMillis();
		
		//Ÿ�ٸ޼ҵ��� ��� ���� - Ÿ�ٸ޼ҵ� ȣ��
		Object returnValue=joinPoint.proceed();
		
		//Ÿ�ٸ޼ҵ��� ��� �����Ŀ� ���۵� ��� �ۼ�
		long endTime=System.currentTimeMillis();
		
		String className=joinPoint.getTarget().getClass().getSimpleName();
		String methodName=joinPoint.getSignature().getName();
		
		
	}
}
