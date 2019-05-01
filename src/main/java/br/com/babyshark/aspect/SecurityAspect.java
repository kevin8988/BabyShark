package br.com.babyshark.aspect;

import java.util.Calendar;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

import br.com.babyshark.entity.User;
import br.com.babyshark.service.HomeService;
import br.com.babyshark.service.UserService;

@Aspect
@Component
public class SecurityAspect {

	@Autowired
	private HttpSession session;

	@Autowired
	private HomeService homeService;

	@Autowired
	private UserService userService;

	@Pointcut("execution(* br.com.babyshark.controller.*.*(..))")
	public void pointcutHomeMethod() {
	}

	@Before("pointcutHomeMethod()")
	public void beforeHomeMethod() {

		String email = SecurityContextHolder.getContext().getAuthentication().getName();
		User userS = (User) session.getAttribute("user");
		User user = null;

		if (!email.equals("anonymousUser")) {
			if (userS == null) {
				user = homeService.getUserByEmail(email);
			} else {
				user = userService.getUserById(userS.getId());
			}

			if (user.getUserDetail() != null && user.getUserDetail().getDayOfBirth() != null) {
				Calendar dayOfBirth = user.getUserDetail().getDayOfBirth();
				dayOfBirth.add(Calendar.DATE, 1);
				user.getUserDetail().setDayOfBirth(dayOfBirth);
			}
			session.setAttribute("user", user);
		}
	}

}
