package br.com.babyshark.validations;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import br.com.babyshark.dao.UserDAO;
import br.com.babyshark.models.User;

public class UserValidation implements Validator {

	private UserDAO dao;

	public UserValidation(UserDAO dao) {
		this.dao = dao;
	}

	public boolean supports(Class<?> clazz) {
		return User.class.isAssignableFrom(clazz);
	}

	public void validate(Object target, Errors errors) {
		User user = (User) target;
		User userEmail = dao.getUserByEmail(user.getEmail());
		
		if(user.getPassword() != null) {
			if (!user.getPassword().equals(user.getConfirmPassword())) {
				errors.rejectValue("password", "field.notEqual");
			}
		}
		
		if(userEmail != null) {
			errors.rejectValue("email", "field.emailNotUnique");
		}

	}

}
