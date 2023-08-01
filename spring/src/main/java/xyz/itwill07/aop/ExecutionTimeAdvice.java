package xyz.itwill07.aop;

import org.aspectj.lang.ProceedingJoinPoint;

public class ExecutionTimeAdvice {
	//타겟메소드의 명령이 실행되는 처리시간을 계산하여 기록하기 위한 메소드
	public Object timeWatchLog(ProceedingJoinPoint joinPoint) { //반환형이 Object
		
		//타겟메소드의 명령 실행전에 동작될 명령 작성
		long startTime=System.currentTimeMillis();
		
		//타겟메소드의 명령 실행 - 타겟메소드 호출
		Object returnValue=joinPoint.proceed();
		
		//타겟메소드의 명령 실행후에 동작될 명령 작성
		long endTime=System.currentTimeMillis();
		
		String className=joinPoint.getTarget().getClass().getSimpleName();
		String methodName=joinPoint.getSignature().getName();
		
		
	}
}
