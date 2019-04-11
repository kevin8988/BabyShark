package br.com.babyshark.aspect;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class LogAspect {
	
	@Pointcut("execution(* br.com.babyshark.controller.*.*(..))")
	private void pointcutAllMethods() {}
	
	@Before("pointcutAllMethods()")
	public void beforeAllMethods(JoinPoint joinPoint) {
		
		System.out.println("Executando método:" + joinPoint.getSignature().getName());
		
	}
	

}
