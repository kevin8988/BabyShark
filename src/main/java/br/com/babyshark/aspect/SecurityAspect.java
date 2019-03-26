package br.com.babyshark.aspect;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class SecurityAspect {

	@Autowired
	private HttpSession session;

	@Pointcut("execution(* br.com.babyshark.controller.*.*(..))")
	public void pointcutHomeMethod() {
	}

	@Before("pointcutHomeMethod()")
	public void beforeHomeMethod() {
		System.out.println("=====> @Before");
		session.setAttribute("Dog", "dog");
	}

}
