package br.com.babyshark.validation;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import br.com.babyshark.entity.User;

public class UserValidation implements Validator {

	private List<String> emails;
	
	private HttpSession session;

	public UserValidation(List<String> emails, HttpSession session) {
		this.emails = emails;
		this.session = session;
	}

	@Override
	public boolean supports(Class<?> clazz) {
		return User.class.isAssignableFrom(clazz);
	}
	
	@Override
	public void validate(Object target, Errors errors) {

		User user = (User) target;
		User userSession = (User) session.getAttribute("user");
		System.out.println(user);

		if (user.getPassword() != null) {
			if (user.getPassword().length() < 5) {
				errors.rejectValue("password", "field.minSize");
			} else if (user.getConfirmPassword() != null && !user.getPassword().equals(user.getConfirmPassword())) {
				errors.rejectValue("password", "field.notEqual");
			}

		}		
		
		if(user.getPassword() == null) {
			if(userSession.getPassword() == null) {
				errors.rejectValue("password", "field.notNullPassword");
			}			
		}
		
		if(user.getConfirmPassword() == null) {
			if(userSession.getConfirmPassword() == null) {
				errors.rejectValue("confirmPassword", "field.notNullConfirmPassword");
			}	
		}
		
		if (user.getEmail() != null) {
			if (emails.contains(user.getEmail()) && !userSession.getEmail().equals(user.getEmail())) {
				errors.rejectValue("email", "field.emailNotUnique");
			}
		}

	}

}
